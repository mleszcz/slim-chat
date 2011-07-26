require 'spec_helper'

module TutoriaChat
  describe Server do
    let(:server) { TutoriaChat::Server.new }
    let(:client_1) { TutoriaChat::Client.new }
    let(:client_1) { TutoriaChat::Client.new }

    before(:each) do
      server.start
    end

    after(:each) do
      server.stop
    end

    describe "#serve" do
      it "stores client's sockets" do
        server.should have(0).clients
        client_1.stub(:get_line).and_return('hi there!','bye')

        # expectations
#        server.should_receive(:log).with("Message received(hi there)").once

        # lunch
        client_1.start
      end
    end
  end
end