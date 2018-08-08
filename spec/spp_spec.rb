require "stringio"
require "timecop"

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

  describe ".spp_bench" do
    before do 
      $stdout = StringIO.new
      Timecop.freeze(Time.now)
    end

    context 'nothing argument' do
      it 'output with default decoration' do
        Spp::spp_bench do
          'hoge'
        end
        text = <<~EOS
          ========== START(#{Time.now}) ==========
          "hoge"
          ========== E N D(#{Time.now}) ==========
        EOS
        expect($stdout.string).to eq text
      end
    end

    context 'with argument' do
      it 'output with argumrnt decoration' do
        Spp::spp_bench('start', 'end', '⚡' * 3) do
          'hoge'
        end
        text = <<~EOS
          ⚡⚡⚡ start(#{Time.now}) ⚡⚡⚡
          "hoge"
          ⚡⚡⚡ end(#{Time.now}) ⚡⚡⚡
        EOS
        expect($stdout.string).to eq text
      end
    end

    context 'nothing block' do
      it 'output error message' do
        Spp::spp_bench
        text = "No processing is given. Please give block argument."
        expect($stdout.string).to be_include(text)
      end
    end
  end
end
