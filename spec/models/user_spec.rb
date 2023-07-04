# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'constants' do
    let(:regex) { /\A((\s*)([\p{L}|a-z|A-Z]+))+(([',. -]((\s*)([\p{L}|a-z|A-Z]+))+)?((\s*)([\p{L}|a-z|A-Z]+))*)*\z/ }

    it { expect(described_class::NAME_REGEX).to eq(regex) }
  end

  describe 'validation' do
    context 'when params valid' do
      let(:first_name) { Faker::Name.first_name }
      let(:last_name) { Faker::Name.last_name }

      it do
        expect(subject).to allow_values(first_name).for(:first_name)
        expect(subject).to allow_values(last_name).for(:last_name)
      end
    end

    context 'when first name invalid' do
      let(:first_name) { 'In - va & li # d' }

      it { is_expected.not_to allow_values(first_name).for(:first_name) }
    end

    context 'when last name invalid' do
      let(:last_name) { 'In - va & li # d' }

      it { is_expected.not_to allow_values(last_name).for(:last_name) }
    end

    it do
      expect(subject).to validate_presence_of(:first_name)
      expect(subject).to validate_presence_of(:last_name)
    end
  end
end
