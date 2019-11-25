class ManagersController < ApplicationController
  before_action :find_manager
  
  def index
    @actors = Actor.all
    @table_classes = { confirmed: "success", confirming: "warning", unconfirmed: "danger" }
    @icon_classes = { confirmed: "ok", confirming: "refresh", unconfirmed: "remove" }
    @icon_colors = { confirmed: "#22b934", confirming: "#ffc107", unconfirmed: "#fd0000" }
  end

  private
  def find_manager
    @manager = @user.manager unless @manager
  end
end
