class TreeNode
	attr_accessor :data, :right_node, :left_node
	def initialize(data, right_node=nil, left_node = nil)
		@data = data
		@right = right_node
		@left = left_node
	end
end

class Tree
	attr_accessor :root
end