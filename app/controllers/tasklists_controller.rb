class TasklistsController < ApplicationController
	def index
		@tasklist = Tasklist.all
		@pending_task = Task.where("due_date BETWEEN ? AND ?", Date.today, Date.today.advance(:days => +7))
		@overdue_task = Task.where("due_date < ?", Date.today)

	end

	def new
		@tasklist = Tasklist.new
	end

	def create
		post_params = params[:tasklist].permit(:category, :description)
		@tasklist = Tasklist.new(post_params)
		if @tasklist.save
			flash[:success] = "Tasklist created successfully"
			redirect_to tasklist_path(id: @tasklist.id)
		else
			flash.now[:danger] = "Tasklist was invalid"
			render :new
			# need to understand render
		end
	end

	def show
		@tasklist = Tasklist.find(params[:id])
	end

	def edit
		@tasklist = Tasklist.find(params[:id])
	end

	def update
		post_params = params[:tasklist].permit(:category, :description)
		@tasklist = Tasklist.find(params[:id])
		if @tasklist.update(post_params)
			flash[:success] = "Tasklist updated successfully"
			redirect_to tasklist_path(id: @tasklist.id)			
		else 
			flash.now[:danger] = "Tasklist was invalid"
			render :edit
		end
	end 

	def destroy
		Tasklist.destroy(params[:id])
		redirect_to root_path
	end

end 