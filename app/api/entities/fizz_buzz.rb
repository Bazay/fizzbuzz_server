class Entities::FizzBuzz < Grape::Entity
  expose :number
  expose :classification
  expose :favourite

  private

    def classification
      object.classification
    end
end
