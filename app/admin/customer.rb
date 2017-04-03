ActiveAdmin.register Customer do
  permit_params :full_name, :email, :phone, :image, :province_id
end
