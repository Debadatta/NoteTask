Rails.application.routes.draw do
  	resources :notes do
  	 	resources :versions, only: [:destroy] do
	    	member do	      		
	      		patch :rollback, to: 'versions#rollback'
	    	end
	  	end
  	end
  
end
