RestfulApi::App.controllers :projects do

  # TODO
  # add :accepts => :json to all methods

  get '/', provides: :json do
    @projects = Project.all

    @projects.to_json
  end

  delete '/', provides: :json do
    Project.delete_all

    status 204
  end

  post '/', provides: :json do
    @project = Project.new(@request_body)

    if @project.save
      status 201
      { id: @project.id }.to_json
    else
      status 422
      render_errors @project
    end
  end

  get '/:id', provides: :json do
    @project = Project.find_by_id(params[:id])

    if !@project.blank?
      @project.to_json
    else
      status 404
    end
  end

  patch '/:id', provides: :json do
    begin
      @project = Project.update(params[:id], @request_body.as_json)

      if @project.valid?
        status 204
      else
        status 422
        render_errors @project
      end

    rescue ActiveRecord::RecordNotFound
      status 404
    end
  end

  delete '/:id', provides: :json do
    number_affected_rows = Project.delete(params[:id])

    if number_affected_rows == 1
      status 204
    else
      status 404
    end
  end
end
