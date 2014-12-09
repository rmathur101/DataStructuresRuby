require "rspec"
require_relative "../lib/doubly_linked_list.rb"

describe "CircularDoublyLinkedList" do
	it "defined by nodes that point to next and previous nodes" do
			list = CircularDoublyLinkedList.new
			node1 = DoublyLinkedNode.new(1)
			node2 = DoublyLinkedNode.new(2)
			node3 = DoublyLinkedNode.new(3)
			node1.next = node2
			node1.prev = node3
			node2.next = node3
			node2.prev = node1
			node3.next = node1
			node3.prev = node2
			list.head = node1

			expect(list.head.data).to eq(1)
			expect(list.head.next.data).to eq(2)
			expect(list.head.next.next.data).to eq(3)
			expect(list.head.next.next.next.data).to eq(1)
			expect(list.head.prev.data).to eq(3)
			expect(list.head.prev.prev.data).to eq(2)
			expect(list.head.prev.prev.prev.data).to eq(1)
			expect(list.head.prev.prev.prev.prev.data).to eq(3)
	end
	describe "#insert" do
		context "when the list contains multiple nodes" do
			it "inserts a new node at the head of the list" do
				list = CircularDoublyLinkedList.new
				node1 = DoublyLinkedNode.new(1)
				node2 = DoublyLinkedNode.new(2)
				node3 = DoublyLinkedNode.new(3)
				node1.next = node2
				node1.prev = node3
				node2.next = node3
				node2.prev = node1
				node3.next = node1
				node3.prev = node2
				list.head = node1

				list.insert(100)

				expect(list.head.data).to eq(100)
				expect(list.head.next.data).to eq(1)
				expect(list.head.next.prev.data).to eq(100)
				expect(list.head.prev.data).to eq(3)
				expect(list.head.prev.next.data).to eq(100)
			end
		end

		context "when the list contains one node" do
			it "inserts a new node at the head of the list" do
				list = CircularDoublyLinkedList.new
				node = DoublyLinkedNode.new(1)
				node.next = node
				node.prev = node
				list.head = node

				list.insert(2)

				expect(list.head.data).to eq(2)
				expect(list.head.next.data).to eq(1)
				expect(list.head.prev.data).to eq(1)
				expect(list.head.next.prev.data).to eq(2)
				expect(list.head.prev.next.data).to eq(2)
			end
		end

		context "when the list contains no nodes" do
			it "inserts a new node at the head of the list" do
				list = CircularDoublyLinkedList.new

				list.insert(1)

				expect(list.head.data).to eq(1)
				expect(list.head.next).to eq(list.head)
				expect(list.head.prev).to eq(list.head)
			end
		end
	end

	describe "#remove" do
		context "when the list contains a a single head node" do
			it "removes the head" do
				list = CircularDoublyLinkedList.new
				node = DoublyLinkedNode.new(1)
				node.next = node
				node.prev = node
				list.head = node

				list.remove(node)

				expect(list.head).to eq(nil)
			end
		end

		context "when the list contains multiple nodes" do
			it "removes the target node while preserving linked structure" do
				list = CircularDoublyLinkedList.new
				node1 = DoublyLinkedNode.new(1)
				node2 = DoublyLinkedNode.new(2)
				node3 = DoublyLinkedNode.new(3)
				node1.next = node2
				node1.prev = node3
				node2.next = node3
				node2.prev = node1
				node3.next = node1
				node3.prev = node2
				list.head = node1

				list.remove(node2)

				expect(list.head.next).to eq(node3)
				expect(list.head.prev).to eq(node3)
				expect(list.head.next.prev).to eq(list.head)
				expect(list.head.prev.next).to eq(list.head)
			end
		end

	end

end