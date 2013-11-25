require 'erb'

class Template
  def self.index
    <<-HEREDOC
      <html>
        <body> 
          <span> User: <%= @user.name %> </span>
          <span> Email: <%= @user.email %> </span> 
          <%=partial Template.index_partial %>
        </body>
      </html>
    HEREDOC
  end

  def self.index_partial
    <<-HEREDOC
    <span>Company: Linkedcare </span>
    HEREDOC
  end
end

class ApplicationController
  def render(template)
    ERB.new(template).result(binding)
  end

  def partial(template)
    ERB.new(template).result
  end
end

class User
  attr_accessor :name, :email
  def initialize(name, email)
    @name = name
    @email = email
  end
end

class UsersController < ApplicationController
  def index
    @user = User.new('Thiago Dantas', 'thiago.chapa@gmail.com')
    render Template.index
  end
end

controller = UsersController.new
puts controller.index