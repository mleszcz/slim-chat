require './lib/tutoria_chat/server'

server = TutoriaChat::Server.new
server.start

p "Chat server has been started"
server.join
p "Chat server has been stopped"
