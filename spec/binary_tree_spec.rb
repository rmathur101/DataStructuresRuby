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
			expect(tree.send(:find_parent, node)).to eq(nil)
		end

		it "returns the parent node of the node that is passed in" do
			tree = Tree.new
			node2 = TreeNode.new(1)
			node3 = TreeNode.new(15)
			node1 = TreeNode.new(10, node2, node3)
			node = TreeNode.new(20, node1, TreeNode.new(30))
			tree.root = node

			expect(tree.send(:find_parent, node2)).to eq(node1)
			expect(tree.send(:find_parent, node3)).to eq(node1)
		end
	end

	describe "#find_successor" do # (if all nodes where ordered by increasing value then it would be the node following the target)
		it "returns the successor of the target node when there is a right child of the target" do
			tree = Tree.new
			node5 = TreeNode.new(5, TreeNode.new(4), TreeNode.new(8, TreeNode.new(6), TreeNode.new(9)))
			node12 = TreeNode.new(12)
			node15 = TreeNode.new(15, node12, TreeNode.new(17))
			node10 = TreeNode.new(10, node5, node15)
			node20 = TreeNode.new(20, node10, TreeNode.new(30))
			tree.root = node20

			expect(tree.send(:find_successor, node10)).to eq(node12)
		end

		it "returns the sucessor of the arget node when there is no right child of the target" do
			tree = Tree.new
			node9 = TreeNode.new(9)
			node5 = TreeNode.new(5, TreeNode.new(4), TreeNode.new(8, TreeNode.new(6), node9))
			node10 = TreeNode.new(10, node5)
			node20 = TreeNode.new(20, node10, TreeNode.new(30))
			tree.root = node20

			expect(tree.send(:find_successor, node10)).to eq(node20)
		end
	end

	describe "#remove" do
	  it "removes the target node when it has left and right child" do
			tree = Tree.new
			node5 = TreeNode.new(5, TreeNode.new(4), TreeNode.new(8, TreeNode.new(6), TreeNode.new(9)))
			node12 = TreeNode.new(12)
			node15 = TreeNode.new(15, node12, TreeNode.new(17))
			node10 = TreeNode.new(10, node5, node15)
			node20 = TreeNode.new(20, node10, TreeNode.new(30))
			tree.root = node20
			tree.remove(node10)

			expect(tree.root.left.data).to eq(12)
			expect(tree.root.left.left.data).to eq(5)
			expect(tree.root.left.right.data).to eq(15)
			expect(tree.root.left.right.left).to eq(nil)
			expect(tree.root.left.right.right.data).to eq(17)
	  end

	  it "removes the target node when it has only one child" do
			tree = Tree.new
			node8 = TreeNode.new(8, TreeNode.new(6))
			node5 = TreeNode.new(5, TreeNode.new(4), node8)
			tree.root = node5
			tree.remove(node8)
			expect(tree.root.right.data).to eq(6)
	  end
	end
end