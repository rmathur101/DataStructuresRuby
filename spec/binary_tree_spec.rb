require "rspec"
require_relative "../lib/binary_tree.rb"

describe "Tree" do
	it "defaults to a root value of nil " do
		tree = Tree.new
		expect(tree.root).to eq(nil)
	end

	it "is defined such that each node has a value less than the left node and greater than or equal to the right node" do
		tree = Tree.new
		node = TreeNode.new(20, TreeNode.new(10), TreeNode.new(30))
		tree.root = node

		expect(tree.root.data).to eq(20)
		expect(tree.root.left.data).to eq(10)
		expect(tree.root.right.data).to eq(30)
	end

	describe "#insert" do
		context "when value indicates a left node" do

		end
		it "inserts a node with data that equals such that it is an appropriate left node" do
			tree = Tree.new
			node = TreeNode.new(20, TreeNode.new(10), TreeNode.new(30))
			tree.root = node
			tree.insert(5)

			expect(tree.root.data).to eq(20)
			expect(tree.root.left.data).to eq(10)
			expect(tree.root.right.data).to eq(30)

			expect(tree.root.left.left.data).to eq(5)
			expect(tree.root.left.right).to eq(nil)

		end

	end
end