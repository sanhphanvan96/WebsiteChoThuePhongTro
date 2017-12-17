RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  # Config navigation icon
  config.model 'Post' do
    navigation_icon 'icon-home'
  end

  config.model 'PostCategory' do
    navigation_icon 'icon-list'
  end

  config.model 'ToiletType' do
    navigation_icon 'icon-trash'
  end

  config.model 'User' do
    navigation_icon 'icon-user'
  end

  # Config field
  config.model 'Post' do
    list do
      field :title
      field :acreage
      field :address
      field :phone_contact
      field :price
      field :image
    end
  end

  config.model 'User' do
    list do
      field :name
      field :address
      field :phone
      field :email
      field :status
      field :is_admin
    end
  end
end
