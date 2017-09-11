class TasksController < ApplicationController
	def new
		@tasklist = Tasklist.find(params[:tasklist_id])
		@task = Task.new
	end

	def create
		post_params = params[:task].permit(:action, :due_date, :status, :priority)
		@tasklist = Tasklist.find(params[:tasklist_id])
		@task = Task.new(post_params)
		@task.tasklist_id = params[:tasklist_id]

		if @task.save
			flash[:success] = "Task created successfully"
			redirect_to tasklist_path(id: @tasklist.id)
		else
			flash.now[:danger] = "Task was invalid"
			render :new
			# need to understand render
		end
	end

	def edit
		@task = Task.find(params[:id])
		@tasklist = Tasklist.find(params[:tasklist_id])
	end

	def destroy
		@task = Task.find(params[:id])
		@tasklist = Tasklist.find(params[:tasklist_id])
		@task.destroy

		flash[:success] = "Task destroyed successfully"
		redirect_to tasklist_path(@tasklist.id)
	end

	def update
		post_params = params[:task].permit(:action, :due_date, :status, :priority)
		@task = Task.find(params[:id])
		@tasklist = Tasklist.find(params[:tasklist_id])

		if @task.update(post_params)
			flash[:success] = "Task updated successfully"
			redirect_to tasklist_path(id: @tasklist.id)			
		else 
			flash.now[:danger] = "Task was invalid"
			render :edit
		end

	end
end