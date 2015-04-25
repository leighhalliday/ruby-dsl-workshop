class Router
  attr_accessor :routes

  def initialize
    self.routes = []
  end

  def route(&block)
    instance_eval(&block)
  end

  def get(path, to)
    self.routes << {http_method: :get, path: path, to: to}
  end

  def post(path, to)
    self.routes << {http_method: :post, path: path, to: to}
  end

  def put(path, to)
    self.routes << {http_method: :put, path: path, to: to}
  end

  def delete(path, to)
    self.routes << {http_method: :delete, path: path, to: to}
  end

  def resources(resource)
    get    "/#{resource}",          "#{resource}#index"
    get    "/#{resource}/new",      "#{resource}#new"
    post   "/#{resource}",          "#{resource}#create"
    get    "/#{resource}/:id/edit", "#{resource}#edit"
    put    "/#{resource}/:id",      "#{resource}#update"
    get    "/#{resource}/:id",      "#{resource}#show"
    delete "/#{resource}/:id",      "#{resource}#destroy"
  end
end

router = Router.new
router.route do
  get "/", "pages#home"
  resources :users
end

p router.routes