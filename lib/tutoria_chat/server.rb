require 'gserver'

module TutoriaChat
  class Server < GServer
    attr_accessor :clients

    def initialize port=10001
      super(port)
      @clients = []
    end

    def serve client
      @clients << client
      server_clients_status
      while msg = client.readline.chop
        log "Message received(#{msg})"
        broadcast_message(msg, client)
        if msg == "bye"
          log "Client has closed a connection."
          break
        end
        self.stop if msg == "server.stop"
      end
      @clients.delete(client)
      server_clients_status
    end

    def log msg
      p msg
    end

    def send_message(client, msg)
      client.puts Time.now.to_s + " ==> #{msg}"
    end

    def server_clients_status
      broadcast_message("Server status: #{@clients.size} user(s) on board!")
    end

    def broadcast_message msg, sender=nil
      return if @clients.empty?
      sent_counter = 0
      @clients.each do |client|
        if sender == nil or client != sender
          send_message(client, msg)
          sent_counter += 1
        end
      end
      log("Broadcasted a message(#{msg}) to #{sent_counter} clients") if sent_counter > 0
    end
  end
end
