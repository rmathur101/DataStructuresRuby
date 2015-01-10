class TreeNode
	attr_accessor :data, :right, :left

	def initialize(data, left_node = nil, right_node=nil)
		@data = data
		@right = right_node
		@left = left_node
	end
end

class Tree
	include Enumerable

	attr_accessor :root

	def initialize
		@root = nil
	end

	def insert(value)
		return self.root = insert_node(root, value)
	end

	def find_value(value)
		return find_value_node(self.root, value)
	end

	private

	def find_value_node(node, value)
		if node == nil || node.data == value
			return node
		end
		if node.data > value
			return find_value_node(node.left, value)
		elsif node.data <= value
			return find_value_node(node.right, value)
		end
	end

	def insert_node(node, value)
		return TreeNode.new(value) if node == nil
		if node.data > value
			node.left = insert_node(node.left, value)
		elsif node.data <= value
			node.right = insert_node(node.right, value)
		end
		return node
	end
end

#NOTES
# Balanced binary trees have logarathimc search time. That is why binary trees are often useful for searching for data.