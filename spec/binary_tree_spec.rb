require "rspec"
require_relative "../lib/linked_list.rb"

describe "Tree" do
	it "defaults to a root value of nil " do
		tree = Tree.new
		expect(tree.root).to eq(nil)
	end
end