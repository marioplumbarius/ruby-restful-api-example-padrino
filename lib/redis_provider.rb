class RedisProvider

  REDIS = Redis.new

  def self.get(key, silent = true)
    REDIS.get key
  rescue Redis::CannotConnectError => e
    # TODO
    # add logging
    raise e unless silent
  end

  def self.set(key, value, ex, silent = true)
    REDIS.set key, value, ex: ex
  rescue Redis::CannotConnectError => e
    # TODO
    # add logging
    raise e unless silent
  end

  def self.del(key, silent = true)
    REDIS.del key
  rescue Redis::CannotConnectError => e
    # TODO
    # add logging
    raise e unless silent
  end
end
