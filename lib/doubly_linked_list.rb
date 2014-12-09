class DoublyLinkedNode
	attr_accessor :next
	attr_accessor :prev
	attr_accessor :data

	def initialize(data, next_node=nil, prev_node=nil)
		@next = next_node
		@prev = prev_node
		@data = data
	end
end

class CircularDoublyLinkedList
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
		if !head
			self.head = DoublyLinkedNode.new(data)
			self.head.next = head
			self.head.prev = head
		else
			self.head = DoublyLinkedNode.new(data, head, head.prev)
			head.next.prev = head
			head.prev.next = head
		end
	end

	def remove(target)
		if target == head && target == head.prev && target == head.next
			self.head = nil
		else
			node = find() do |item|
				item == target
			end
			if node
				node.prev.next = node.next
				node.next.prev = node.prev
				self.head = head.next if node == head
			end
		end
	end
end