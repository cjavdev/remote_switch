class DevicesController < ApplicationController
  before_action :require_user!

  def index
    @devices = current_user.devices
  end
end
