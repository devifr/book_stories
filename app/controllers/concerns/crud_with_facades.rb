module CrudWithFacades
  extend ActiveSupport::Concern

  included do
    before_action :set_facade
    before_action :run_facade
  end

  def index;  end
  def new;  end
  def edit;  end

  def create
    set_flash

    respond_to do |format|
      format.html { redirect_after_create }
      format.js
      format.json
    end
  end

  def update
    set_flash

    respond_to do |format|
      format.html { redirect_after_update }
      format.js
      format.json
    end
  end

  def destroy
    set_flash

    respond_to do |format|
      format.html { redirect_after_destroy }
      format.js
      format.json
    end
  end

  private

  def run_facade
    run @facade_instance.new(params)
  end

  def set_facade
    @facade_instance = "#{facade_module_name}::#{action_name.camelcase}Facade".constantize
  end

  def facade_module_name
    @facade_module_name ||= self.class.name.gsub('Controller', '')
  end

  def set_flash
    if @form.present? && @form.try(:errors).present?
      flash[:error] = @form.errors.full_messages.join(', ')
    elsif @errors.present?
      flash[:error] = @errors.join(', ')
    else
      if action_name == 'destroy'
        flash[:success] = "#{object_name.split('/').last} deleted successfully!"
      else
        flash[:success] = "#{action_name.titleize}d #{object_name.split('/').last} successfully!"
      end
    end
  end

  def object_name
    @object_name ||= self.class.name.gsub('Controller', '').singularize.titleize
  end

  def redirect_to_index
    redirect_to action: 'index'
  end

  alias redirect_after_create redirect_to_index
  alias redirect_after_update redirect_to_index
  alias redirect_after_destroy redirect_to_index
end