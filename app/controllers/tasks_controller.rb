class TasksController < ApplicationController
  def index
    @tasks = TaskChecker.results
    @completed = TaskChecker.completed_count
    @total = TaskChecker::TASKS.size
  end
end
