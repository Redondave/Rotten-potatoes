module MoviesHelper
end

def active_class(column)
  class_names('col -8', 'col -2', 'sorted' => params[:sort] == column)
end
