Rails.application.routes.draw do

  #we set up the resources :pieces route so that Rails knows we are going to follow RESTful conventions for the model named pieces
  #now we can use the path http://localhost:3000/pieces/ and the router will understand we want a list of all the pieces
  root to: 'pieces#index'



  resources :pieces do
    resources :sections do
      resources :subsections do 
        resources :subsubsections
      end
    end
    resources :links
  end

  resources :pieces, :sections, :subsections, :subsubsections do
    resources :connections, only: [:index, :new, :edit, :update, :destroy, :create]
    resources :key_concepts
  end
    
end
