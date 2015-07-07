class TodosController < ApplicationController
  def index
  	@todos = Todo.where("state = 'Pending'")
  end

  def new
  	@todo = Todo.new
  end

  def create
  	@todo = Todo.new(todo_params)

  	if @todo.save
        redirect_to todos_path
	 else
	    render 'new'	   
	 end
  end

  def update
    @todo = Todo.find_by(id: params[:id])
  	
  	if @todo.update_attributes(todo_params)
        redirect_to todos_path
        flash[:success]='Task marked as done'
  	else
  	    redirect_to todos_path	   
  	end
  end



  private

  def todo_params
  	params.require(:todo).permit(:description, :state)
  end
end
