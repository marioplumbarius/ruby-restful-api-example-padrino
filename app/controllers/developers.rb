RestfulApi::App.controllers :developers do

  # TODO
  # add :accepts => :json to all methods

  get '/', provides: :json do
    @developers = Developer.page(params[:page]).per(params[:per_page])

    Paginator.paginate_relation(@developers, params).to_json
  end

  delete '/', provides: :json do
    Developer.delete_all

    status 204
  end

  post '/', provides: :json do

    @developer = Developer.new(@request_body)

    if @developer.save
      status 201
      { id: @developer.id }.to_json
    else
      status 422
      render_errors @developer
    end
  end

  get '/:id', provides: :json do
    @developer = Developer.find_by_id(params[:id])

    if @developer.blank?
      status 404
    else
      DeveloperSerializer.new(@developer).render
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
