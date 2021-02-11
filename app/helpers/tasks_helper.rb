module TasksHelper
  def task_unfinished?
    @task.finished
  end

  def new_record?
    @task.new_record?
  end
end
