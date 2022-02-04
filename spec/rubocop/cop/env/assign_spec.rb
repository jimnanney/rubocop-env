# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Env::Assign, :config do
  let(:config) { RuboCop::Config.new }

  it 'registers an offense when assigning to an index of ENV' do
    expect_offense(<<~RUBY)
      describe "Class" do
        before do
          ENV["MY_ENV"] = "test"
          ^^^^^^^^^^^^^^^^^^^^^^ Mock the return value of an ENV variable instead of assigning to it directly.
        end
      end
    RUBY
  end

  it 'does not register an offense when mocking the return value of an ENV index' do
    expect_no_offenses(<<~RUBY)
      describe "Class" do
        before do
          allow(ENV).to receive(:[]).and_call_original
          allow(ENV).to receive(:[]).with("MY_ENV").and_return("test")
        end
      end
    RUBY
  end
end
