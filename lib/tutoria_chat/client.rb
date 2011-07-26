require 'socket'

module TutoriaChat
  class Client
    def initialize
      @socket = TCPSocket.open('127.0.0.1', 10001)
    end

    def start
      p "Welcome! Start you chat now: "

      # print messages from the server
      Thread.new do
        while @socket.closed? == false
          socket_message = @socket.gets.chop
          p socket_message if socket_message.size > 0
          sleep 1
        end
      end

      # read client's until "bye" command
      while (msg = gets.chop) do
        @socket.puts msg
        break if msg == "bye"
      end

      # hasta la vista, socket :)
      @socket.close
    end
  end
end
