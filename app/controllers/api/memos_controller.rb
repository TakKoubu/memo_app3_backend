module Api
  class MemosController < ApplicationController
    def index
      render json: Memo.all
    end
  end
end
