class RecordsController < ApplicationController
  def index
  end

  def new
    @record_address = RecordAddress.new
  end

  def create
  end
end
