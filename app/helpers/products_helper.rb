module ProductsHelper

  def selected_value(params, searchable_characteristic)
    params["#{searchable_characteristic.id.to_s}"] if params.present?
  end

end
