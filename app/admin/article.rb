ActiveAdmin.register Article do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  menu parent: '用户发布管理'
  permit_params do
    Article.column_names + [{tag_ids: []}]
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :text
      f.input :main_photo
      f.input :tags
    end

    f.actions
  end

end
