require 'will_paginate/array'

class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all
		@categories = Category.all
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
		@posts = @board.posts.order("updated_at DESC")
		@current_label = params[:label]
		@posts = @posts.select do |p|
			p.label.id.to_s == @current_label
		end	if @current_label
    @labels_map = Array.new
    @board.labels.each do |l|
      count = l.posts.select do |p|
        p.board.id == @board.id
      end.count
      @labels_map << [ count, l ]
    end
    @labels_map.sort! do |a,b|
      b[0] <=> a[0]
    end
		@posts = @posts.paginate(:page => params[:page], :per_page => 20)
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render action: 'show', status: :created, location: @board }
      else
        format.html { render action: 'new' }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:name)
    end
end
