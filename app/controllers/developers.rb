RestfulApi::App.controllers :developers do

  # TODO
  # add :accepts => :json to all methods

  get '/', provides: :json do
    @developers = Developer.all

    @developers.to_json
  end

  delete '/', provides: :json do
    Developer.delete_all

    status 204
  end

  post '/', provides: :json do

    @developer = Developer.new(@request_body)

    if @developer.save
      status 201
    else
      status 422
      render_errors @developer
    end
  end

  get '/:id', provides: :json do
    @developer = Developer.find_by_id(params[:id])

    if !@developer.blank?
      @developer.to_json
    else
      status 404
    end
  end

  patch '/:id', provides: :json do

    begin
      @developer = Developer.update(params[:id], @request_body.as_json)

      if @developer.valid?
        status 204
      else
        status 422
        render_errors @developer
      end

    rescue ActiveRecord::RecordNotFound
      status 404
    end
  end

  delete '/:id', provides: :json do
    number_affected_rows = Developer.delete(params[:id])

    if number_affected_rows == 1
      status 204
    else
      status 404
    end
  end

end
