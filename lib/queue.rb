require_relative "doubly_linked_list.rb"

class Queue
	attr_accessor :head, :tail

	def initialize
		@head = nil
		@tail = nil
	end

	def push(data)
		if self.tail != nil
			self.tail.next = DoublyLinkedNode.new(data)
			self.tail = self.tail.next
		else
			self.head = self.tail = DoublyLinkedNode.new(data)
		end
	end

	def pop
		if self.head == self.tail
			self.head = self.tail = nil
		else
			self.head = self.head.next
		end
	end

end