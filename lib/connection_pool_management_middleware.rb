# Used by padrino to create a connection pool for ActiveRecord
class ConnectionPoolManagement
  def initialize(app)
    @app = app
  end

  def call(env)
    ActiveRecord::Base.connection_pool.with_connection { @app.call(env) }
  end
end
