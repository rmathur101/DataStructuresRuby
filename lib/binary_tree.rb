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

	def remove(target)
		#case where target has two children
		if target.right && target.left
			successor = find_successor(target)
			remove(successor)
			target.data = successor.data
			return
		end
		#case where target has one child
		if target.left != nil || target.right != nil
			if target.left != nil
				temp = target.left
			elsif target.right != nil
				temp = target.right
			end
			target.data = temp.data
			target.left = temp.left
			target.right = temp.right
			return
		end
		#case where target has no children
		parent = find_parent(target)
		if parent.right == target
			parent.right = nil
		elsif parent.left == target
			parent.left = nil
		end
		return
	end

	def size
		return size_node(self.root)
	end

	def depth
		return depth_node(self.root)
	end

	private

	def size_node(node)
		if node == nil
			return 0
		else
			return 1 + size_node(node.left) + size_node(node.right)
		end
	end

	def depth_node(node)
		if node == nil
			return 0
		else
			return 1 + [depth_node(node.left), depth_node(node.right)].max
		end
	end

	def find_parent(target)
		if target == self.root
			return nil
		end
		node = self.root
		while(node.left != target && node.right != target)
			if node.data > target.data
				node = node.left
			elsif node.data <= target.data
				node = node.right
			end
		end
		return node
	end

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

	def find_successor(target)
		successor = target.right
		if successor
			while successor.left
				successor = successor.left
			end
			return successor
		end
		begin
			if successor
				target = successor
			end
			successor = find_parent(target)
		end while (successor && successor.right == target)
		return successor
	end
end

#NOTES
# Balanced binary trees have logarathimc search time. That is why binary trees are often useful for searching for data.