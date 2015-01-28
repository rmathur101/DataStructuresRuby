require "rspec"
require_relative "../lib/binary_search.rb"

describe "#binary_search" do
  it "returns true if the value exists in the array when it is the first term" do
    array = [1, 4, 6, 7, 8, 10, 100, 124]
    expect(binary_search(array, 8)).to eq(true)
  end

  it "returns true if the value exists in the array when it is the last term" do
    array = [1, 4, 6, 7, 8, 10, 100, 124]
    expect(binary_search(array, 124)).to eq(true)
  end

  it "returns true if the value exists in the array as neither the first term or the last term" do
    array = [1, 4, 6, 7, 8, 10, 100, 124]
    expect(binary_search(array, 10)).to eq(true)
  end

  it "returns false if the value does not exist in the array" do
    array = [1, 4, 6, 7, 8, 10, 100, 124]
    expect(binary_search(array, 1000)).to eq(false)
  end

end