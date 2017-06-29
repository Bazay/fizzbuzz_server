module ResponseApiHelper
  def say_unprocessable_entity
    status 422
  end

  def say_created
    status 201
  end

  def say_completed
    status 204
  end

  def say_uncompleted
    status 500
  end
end
