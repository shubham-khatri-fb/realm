class PushJobInRedisService
    def push_job(*args)
        worker_class = "Realm::Pull::VoucherWorker"
        queue = "pull_vouchers"
        add_queue_in_redis(queue)
        jid = SecureRandom.hex(12)
        msg = {
          "class" => worker_class,
          "queue" => queue,
          "args" => args,
          'retry' => true,
          'jid' => jid,
          'created_at' => Time.now.to_f,
          'enqueued_at' => Time.now.to_f
        }
        REALM_REDIS.lpush("queue:#{queue}", JSON.dump(msg))
        jid
      end

      private

      def add_queue_in_redis(queue)
        REALM_REDIS.sadd('queues', queue) if !REALM_REDIS.smembers("queues").include?(queue)
      end
end
            