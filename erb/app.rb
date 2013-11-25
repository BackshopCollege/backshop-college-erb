require 'erb'

class Template
  def self.index
    <<-HEREDOC
      <html>
        <body> 
          <span> User: <%= @user.name %> </span>
          <span> Email: <%= @user.email %> </span> 
          <%= partial Template.index_partial, { company: @user.company } %>
        </body>
      </html>
    HEREDOC
  end

  def self.index_partial
    <<-HEREDOC
    <span>Company: <%= company %> </span>
    HEREDOC
  end
end

require 'ostruct'
class ApplicationController
  def render(template)
    ERB.new(template).result(binding)
  end

  def partial(template, locals = {})
    ERB.new(template).result(build_context(locals).get_binding)
  end

  private
  def build_context(locals)
    context = OpenStruct.new(locals)
    def context.get_binding
      binding
    end
    context
  end
end

class User
  attr_accessor :name, :email, :company
  def initialize(name, email, company)
    @name = name
    @email = email
    @company = company
  end
end

class UsersController < ApplicationController
  def index
    @user = User.new('Thiago Dantas', 'thiago.chapa@gmail.com', 'linkedcare')
    render Template.index
  end
end

controller = UsersController.new
puts controller.index