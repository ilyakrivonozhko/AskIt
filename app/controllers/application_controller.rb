class ApplicationController < ActionController::Base
  include ErrorHandling
  include Pagy::Backend
  include UserSignedIn
end
