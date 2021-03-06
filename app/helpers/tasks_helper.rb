module TasksHelper
  def task_unfinished?
    @task.finished
  end

  def new_record?
    @task.new_record?
  end

  def is_categorize(project, task)
    project.id == task.project_id
  end

  def is_projects
    Project.all.present?
  end
end
