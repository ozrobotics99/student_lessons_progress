module ProgressesHelper

  def progress_text(student)
    if !student.progress.nil?
      student.progress.lesson.name
    else
      "No progress yet!"
    end
  end

end
