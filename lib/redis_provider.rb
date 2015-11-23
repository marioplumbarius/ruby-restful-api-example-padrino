class RedisProvider

  REDIS = Redis.new

  def self.get(key)
    REDIS.get key
  rescue Redis::CannotConnectError => e
    # TODO
    # add logging
  end

  def self.set(key, value, ex)
    REDIS.set key, value, ex: ex
  rescue Redis::CannotConnectError => e
    # TODO
    # add logging
  end

  def self.del(key)
    REDIS.del key
  rescue Redis::CannotConnectError => e
    # TODO
    # add logging
  end
end
