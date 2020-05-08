ActiveAdmin.register Store do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :summary, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :summary, :seller_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs "Store Details" do
      f.input :name
      f.input :summary
      #THIS LINE NEEDS TO BE CHANGED
      f.input :user_id, :as => :select, :collection => User.where(role: '1').all.map{|u| [u.username, u.id]}
    end
    f.actions
  end
  
end