class ApplicationController < ActionController::Base
  def run(command, prefix='')
    output = command.run
    output.each do |k, v|
      instance_variable_set('@' + prefix + k.to_s, v)
    end
  end

end
