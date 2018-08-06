require "stringio"

RSpec.describe Spp do
  it "has a version number" do
    expect(Spp::VERSION).not_to be nil
  end

  describe ".spp" do
    before { $stdout = StringIO.new }
    context 'nothing argument' do
      it 'output with default decoration' do
        Spp::spp('hoge')
        text = <<~EOS
          ========== START ==========
          "hoge"
          ========== E N D ==========
        EOS
        expect($stdout.string).to eq text
      end
    end

    context 'with argument' do
      it 'output with argumrnt decoration' do
        Spp::spp('hoge', 'start', 'end', '⚡' * 3)
        text = <<~EOS
          ⚡⚡⚡ start ⚡⚡⚡
          "hoge"
          ⚡⚡⚡ end ⚡⚡⚡
        EOS
        expect($stdout.string).to eq text
      end
    end
  end
end
