# frozen_string_literal: true

RSpec.describe Rubocop::Env do
  it "has a version number" do
    expect(Rubocop::Env::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
