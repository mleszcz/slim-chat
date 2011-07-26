require 'socket'

module TutoriaChat
  class Client
    def initialize
      @socket = TCPSocket.open('127.0.0.1', 10001)
    end

    def start
      p "Welcome! Start you chat now: "

      Thread.new do
        socket_message = @socket.gets.chop
        p socket_message if socket_message.size > 0
        sleep 1
      end

      Thread.new do
        while (msg = gets.chop) != "bye"
          @socket.puts msg
        end
        @socket.close
      end
    end
  end
end
