class WelcomeController < ApplicationController
  def index
    unless current_user.nil?
      flash.each { |key, value| flash[key] = "欢迎成为一名IPAer！" if value.include? "欢迎" }
    end
  end

  def photo
  end

  def post
  end

  def hp
  end

  def pub
  end

  def mfilm
  end
end
