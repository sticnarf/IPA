class WelcomeController < ApplicationController
  def index
    unless current_user.nil?
      flash.each { |key, value| flash[key] = "欢迎加入IPA！请加社团QQ群：346676750，附上班级姓名。" if value.include? "欢迎" }
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
