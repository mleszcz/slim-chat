require 'spec_helper'

module TutoriaChat
  describe Server do
    let(:server) { TutoriaChat::Server.new }
    let(:client_1) { TutoriaChat::Client.new }
    let(:client_2) { TutoriaChat::Client.new }

    describe "#serve" do
      it "stores client's sockets" do
        server.should have(0).clients
        expect {
          client_1.start
        }.to change{ server.clients.count }.to(1)
      end
    end
  end
end