class BaseForm < Struct.new(:model, :params)
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :form_attributes

  def initialize model, params
    super model, params
    self.form_attributes = whitelist_params(params).with_indifferent_access
    extract_attributes! form_attributes
  end

  def persisted?
    false
  end

  def save
    assign_model_attributes
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

    def persist!
      model.save!
    end

    def whitelist_params params
      params.slice *params.keys.select { |key| respond_to? "#{key}=" }
    end

    def extract_attributes! attributes
      attributes.each_pair { |key, value| public_send "#{key}=", value }
    end

    def assign_model_attributes
      model.attributes = form_attributes
    end
end
