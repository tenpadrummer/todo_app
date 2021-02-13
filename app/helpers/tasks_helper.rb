module TasksHelper
  def task_unfinished?
    @task.finished
  end

  def new_record?
    @task.new_record?
  end

  def categorize?(project, task)
    project.id == task.project_id
  end
end
