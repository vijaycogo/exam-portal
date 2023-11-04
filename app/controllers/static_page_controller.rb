class StaticPageController < ApplicationController
  def home
    @user = User.new
    @colleges = College.all
  end
end
