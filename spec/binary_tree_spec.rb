require "rspec"
require_relative "../lib/binary_tree.rb"

describe "Tree" do
	it "defaults to a root value of nil " do
		tree = Tree.new
		expect(tree.root).to eq(nil)
	end

	describe "#insert" do
		it "inserts a node to the right" do
			tree = Tree.new
			node = TreeNode.new(20, TreeNode.new(10), TreeNode.new(30))
			tree.root = node
			tree.insert(40)

			expect(tree.root.data).to eq(20)
			expect(tree.root.left.data).to eq(10)
			expect(tree.root.right.data).to eq(30)

			expect(tree.root.right.right.data).to eq(40)
			expect(tree.root.right.right.right).to eq(nil)
		end

		it "inserts a node to the left" do
		  tree = Tree.new
		  node = TreeNode.new(20, TreeNode.new(10), TreeNode.new(30))
			tree.root = node
			tree.insert(1)

			expect(tree.root.data).to eq(20)
			expect(tree.root.left.data).to eq(10)
			expect(tree.root.right.data).to eq(30)

			expect(tree.root.left.left.data).to eq(1)
			expect(tree.root.left.left.left).to eq(nil)
		end
	end

	describe "#find_value" do
		it "returns the node with the value that is passed in" do
			tree = Tree.new
			node1 = TreeNode.new(1)
			node2 = TreeNode.new(15)
			node = TreeNode.new(20, TreeNode.new(10, node1, node2), TreeNode.new(30))
			tree.root = node
			expect(tree.find_value(1)).to eq(node1)
			expect(tree.find_value(15)).to eq(node2)
		end

		it "returns nil if the value does not exist" do
			tree = Tree.new
			node1 = TreeNode.new(1)
			node2 = TreeNode.new(15)
			node = TreeNode.new(20, TreeNode.new(10, node1, node2), TreeNode.new(30))
			tree.root = node
			expect(tree.find_value(2)).to eq(nil)
		end

		it "returns the root node if the value matches" do
			tree = Tree.new
			node1 = TreeNode.new(1)
			node2 = TreeNode.new(15)
			node = TreeNode.new(20, TreeNode.new(10, node1, node2), TreeNode.new(30))
			tree.root = node
			expect(tree.find_value(20)).to eq(node)
		end
	end

	describe "#find_parent" do
		it "returns nil if the target node is the root" do
			tree = Tree.new
			node1 = TreeNode.new(1)
			node2 = TreeNode.new(15)
			node = TreeNode.new(20, TreeNode.new(10, node1, node2), TreeNode.new(30))
			tree.root = node
			expect(tree.find_parent(node)).to eq(nil)
		end

		it "returns the parent node of the node that is passed in" do
			tree = Tree.new
			node1 = TreeNode.new(1)
			node2 = TreeNode.new(15)
			node = TreeNode.new(20, TreeNode.new(10, node1, node2), TreeNode.new(30))
			tree.root = node
		end
	end


end