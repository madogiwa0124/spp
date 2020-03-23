# frozen_string_literal: true

require 'stringio'
require 'timecop'

RSpec.describe Spp do
  it 'has a version number' do
    expect(Spp::VERSION).not_to be nil
  end

  describe '.spp' do
    before { $stdout = StringIO.new }
    context 'nothing argument' do
      it 'output with default decoration' do
        Spp.spp('hoge')
        text = <<~MSG
          ========== START ==========
          "hoge"
          ========== E N D ==========
        MSG
        expect($stdout.string).to eq text
      end
    end

    context 'with argument' do
      it 'output with argumrnt decoration' do
        Spp.spp('hoge', 'start', 'end', '⚡' * 3)
        text = <<~MSG
          ⚡⚡⚡ start ⚡⚡⚡
          "hoge"
          ⚡⚡⚡ end ⚡⚡⚡
        MSG
        expect($stdout.string).to eq text
      end
    end
  end

  describe '.spp_bench' do
    before do
      $stdout = StringIO.new
      Timecop.freeze(Time.now)
    end

    context 'nothing argument' do
      it 'output with default decoration' do
        Spp.spp_bench do
          'hoge'
        end
        text = <<~MSG
          ========== START(#{Time.now.iso8601(3)}) ==========
          "hoge"
          ========== E N D(#{Time.now.iso8601(3)}) ==========
        MSG
        expect($stdout.string).to eq text
      end
    end

    context 'with argument' do
      it 'output with argumrnt decoration' do
        Spp.spp_bench('start', 'end', '⚡' * 3) do
          'hoge'
        end
        text = <<~MSG
          ⚡⚡⚡ start(#{Time.now.iso8601(3)}) ⚡⚡⚡
          "hoge"
          ⚡⚡⚡ end(#{Time.now.iso8601(3)}) ⚡⚡⚡
        MSG
        expect($stdout.string).to eq text
      end
    end

    context 'nothing block' do
      it 'output error message' do
        Spp.spp_bench
        text = 'No processing is given. Please give block argument.'
        expect($stdout.string).to be_include(text)
      end
    end
  end
end
