# frozen_string_literal: true

RSpec.describe Rubocop::Env do
  it 'has a version number' do
    expect(Rubocop::Env::VERSION).not_to be nil
  end
end
