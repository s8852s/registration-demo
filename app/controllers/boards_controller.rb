class BoardsController < ApplicationController
		def index
		  @boards = Board.all
		end

		def new
		  @board = Board.new
		end

		def create
			@board = Board.new(params_board)
			
			if @board.save
			  redirect_to boards_path, notice: "新增看板成功"
			else
				render :new
			end
		end

		def edit
		  @board = Board.find_by(id: params[:id])
		end

		def update
			@board = Board.find_by(id: params[:id])
			
			if @board.update(params_board)
			  redirect_to boards_path, notice: "修改看板成功"
			else
				render :edit
			end
		end

		def destroy
			@board = Board.find_by(id: params[:id])
			
			@board.destroy if @board
			redirect_to boards_path ,notice: "刪除看板成功"
		end


		private
		def params_board
		  params.require(:board).permit(:title)
		end
end
