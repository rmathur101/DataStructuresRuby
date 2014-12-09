#Data Structure: Linked-List
#Definition: instance of Linked-List is a list node which is defined by data and a reference to the next node in the list
#Notes:
# - insert is a constant time operation
# - find is a linear time operation

class Node
	attr_accessor :data
	attr_accessor :next

	def initialize(data, next_node=nil)
		@data = data
		@next = next_node
	end
end

class List
	include Enumerable

	attr_accessor :head

	def each()
		item = head
		while item
			yield item
			item = item.next
		end
	end

	def find_value(value)
		return find() do |item|
			item.data == value
		end
	end

	def insert(data)
		self.head = Node.new(data, head)
	end

	def insert_sorted(data)
		if head == nil || head.data > data
			return insert(data)
		end
		current = head
		while current.next != nil && current.next.data < data
			current = current.next
		end
		current.next = Node.new(data, current.next)
	end

	def remove(target)
		if head.data == target
			self.head = head.next
		end
		prev = find() do |item|
			item.next.data == target if item.next
		end
		if prev
			prev.next = prev.next.next
		end
	end
end

#Data Structure: Circular Linked-List
#Definition: instance of Circular Linked-List is a list node which is defined by data and a reference to the next node in the list; the tail node references the head node
#Notes:
# - when creating 'move_node' inside of #insert_sorted cannot set 'move_node' equal to the current state of 'current_node' if 'current_node' will change so will 'move_node'; new instance with data must be made for 'move_node'
# - remove methods in both List and CircularList have type integer for target parameter; should be refactored so that the parameter is an instance of Node

class CircularList
	include Enumerable

	attr_accessor :head

	def each()
		item = head
		while item
			yield item
			item = item.next
			break if item == head
		end
	end

	def find_value(value)
		return find() do |item|
			item.data == value
		end
	end

	def insert(data)
		if head == nil
			self.head = Node.new(data)
			self.head.next = head
		else
			second_node = Node.new(head.data, head.next)
			self.head.data = data
			self.head.next = second_node
		end
	end

	def insert_sorted(data)
		if head == nil
			self.head = Node.new(data)
			self.head.next = head
		end
		current_node = head
		while data > current_node.data
			if current_node.next == head
				tail_node = true
				break
			end
			current_node = current_node.next
		end
		if tail_node == true
			current_node.next = Node.new(data, head)
		else
			move_node = Node.new(current_node.data, current_node.next)
			current_node.data = data
			current_node.next = move_node
		end
	end

	def remove(target)
		if head != nil
			if head.data == target && head.next == head
				self.head = nil
			elsif head.data == target && head.next != head
				head.data = head.next.data
				head.next = head.next.next
			else
				prev = find do |item|
					item.next.data == target
				end
				prev.next = prev.next.next if prev
			end
		end
	end
end




