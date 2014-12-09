require "rspec"
require_relative "../lib/linked_list.rb"

describe "Linked List" do
	describe "#find_value" do
		context "when the argument matches a node in the list" do
			it "returns the node with data that matches the argument" do
				list = List.new
				node = Node.new(3, Node.new(1))
				list.head = node
				expect(list.find_value(3)).to eq(node)
			end
		end

		context "when argument does not match a node" do
			it "returns nil" do
				list = List.new
			  node = Node.new(3)
			  list.head = node
			  expect(list.find_value(1)).to eq(nil)
			end
		end

		context "when there are no nodes in the list" do
			it "returns nil" do
				list = List.new
				expect(list.find_value(3)).to eq(nil)
			end
		end
	end

	describe "#insert" do
		context "when the list does not contain any nodes" do
			it "inserts new node as the head" do
				list = List.new
				list.insert(10)
				expect(list.head.data).to eq(10)
				expect(list.head.next).to eq(nil)
			end
		end

		context "when the list already contains nodes " do
			it "inserts new node as the head" do
				list = List.new
				node = Node.new(1)
				list.head = node
				list.insert(2)
				expect(list.head.data).to eq(2)
				expect(list.head.next.data).to eq(1)
				expect(list.head.next.next).to eq(nil)
			end
		end
	end

	describe "#insert_sorted" do
		context "when the list contains no nodes" do
			it "inserts new node as the head" do
				list = List.new
				list.insert_sorted(1)
				expect(list.head.data).to eq(1)
				expect(list.head.next).to eq(nil)
			end
		end

		context "when the head node has a value greater than new node" do
			it "inserts new node as the head" do
				list = List.new
				node = Node.new(5)
				list.head = node
				list.insert_sorted(4)
				expect(list.head.data).to eq(4)
				expect(list.head.next).to eq(node)
			end
		end

		context "when the new node has a value that is greater than the previous node and less than the next node" do
			it "inserts a new node" do
			  list = List.new
			  node3 = Node.new(6)
			  node2 = Node.new(4, node3)
			  node1 = Node.new(2, node2)
			  list.head = node1
			  list.insert_sorted(5)
			  expect(list.find_value(5).next).to eq(node3)
			  expect(list.find_value(4).next.data).to eq(5)
			end
		end
	end

	describe "#remove" do
		context "when target is the head of the list" do
			it "takes the node with the target data out of the list and makes the next node the head" do
				list = List.new
				node3 = Node.new(6)
			  node2 = Node.new(4, node3)
			  node1 = Node.new(2, node2)
			  list.head = node1
			  list.remove(2)
			  expect(list.head).to eq(node2)
			end
		end
		context "when target is not the head of the list" do
		  it "takes the node with the target data out of the list" do
				list = List.new
				node3 = Node.new(6)
			  node2 = Node.new(4, node3)
			  node1 = Node.new(2, node2)
			  list.head = node1
			  list.remove(4)
			  expect(list.head.next).to eq(node3)
		  end
		end
		context "when target is not in the list" do
			it "makes no changes to the list" do
				list = List.new
				node3 = Node.new(6)
			  node2 = Node.new(4, node3)
			  node1 = Node.new(2, node2)
			  list.head = node1
			  list.remove(10)
			  expect(list.head).to eq(node1)
			  expect(list.head.next).to eq(node2)
			  expect(list.head.next.next).to eq(node3)
			  expect(list.head.next.next.next).to eq(nil)
			end
		end
	end
end

describe "Circular Linked List" do
	describe "#find_value" do
		context "when the argument matches a node in the list" do
			it "returns the node with data that matches the argument" do
				circle_list = CircularList.new
				node = Node.new(3, Node.new(1))
				circle_list.head = node
				expect(circle_list.find_value(3)).to eq(node)
			end
		end

		context "when argument does not match a node" do
			it "returns nil" do
				circle_list = CircularList.new
			  node = Node.new(3)
			  circle_list.head = node
			  expect(circle_list.find_value(1)).to eq(nil)
			end
		end

		context "when there are no nodes in the list" do
			it "returns nil" do
				circle_list = CircularList.new
				expect(circle_list.find_value(3)).to eq(nil)
			end
		end
	end

	describe "#insert" do
	  context "when the list does not contain any nodes" do
	  	it "inserts the new node as the head and sets the next node as itself" do
	  		circle_list = CircularList.new
	  		circle_list.insert(50)
	  		expect(circle_list.head.data).to eq(50)
	  		expect(circle_list.head.next.data).to eq(50)
	  		expect(circle_list.head.next.next.data).to eq(50)
	  	end
	  end
	  context "when the list already contains nodes" do
	  	it "inserts the new node as the head and sets the next node of the tail to the new node" do
	  		circle_list = CircularList.new
	  		node3 = Node.new(10)
	  		node2 = Node.new(9, node3)
	  		node1 = Node.new(8, node2)
	  		circle_list.head = node1
	  		node3.next = circle_list.head
	  		circle_list.insert(7)
	  		expect(circle_list.head.data).to eq(7)
	  		expect(circle_list.head.next.data).to eq(8)
	  		expect(circle_list.head.next.next.data).to eq(9)
	  		expect(circle_list.head.next.next.next.data).to eq(10)
	  		expect(circle_list.head.next.next.next.next.data).to eq(7)
	  	end
	  end
	end

	describe "#insert_sorted" do
		context "when the list does not contain any nodes" do
			it "inserts the new node as the head and sets the next node as itself" do
				circle_list = CircularList.new
				circle_list.insert_sorted(1)
				expect(circle_list.head.data).to eq(1)
				expect(circle_list.head.next.data).to eq(1)
			end
		end

		context "when the list already contains nodes and the new node has the smallest value" do
			it "inserts the new node as the head and make it the next node of the tail" do
				circle_list = CircularList.new
	  		node3 = Node.new(10)
	  		node2 = Node.new(9, node3)
	  		node1 = Node.new(8, node2)
	  		circle_list.head = node1
	  		node3.next = circle_list.head
	  		circle_list.insert_sorted(7)
	  		expect(circle_list.head.data).to eq(7)
	  		expect(circle_list.head.next.next.next.next.data).to eq(7)
			end
		end

		context "when the list already contains nodes and the new node has the largets value" do
			it "insert the new node as the tail and makes the the next node the head " do
				circle_list = CircularList.new
	  		node3 = Node.new(10)
	  		node2 = Node.new(9, node3)
	  		node1 = Node.new(8, node2)
	  		circle_list.head = node1
	  		node3.next = circle_list.head
	  		circle_list.insert_sorted(11)
	  		expect(circle_list.head.data).to eq(8)
	  		expect(circle_list.head.next.data).to eq(9)
	  		expect(circle_list.head.next.next.data).to eq(10)
	  		expect(circle_list.head.next.next.next.data).to eq(11)
	  		expect(circle_list.head.next.next.next.next.data).to eq(8)
			end
		end

		context "when the list already contains nodes and the new node has a value that is neither the smallest value or the largest value" do
			it "inserts the new node such that the previous node has a value less than the new node and the nextn ode has a value that is greater than" do
				circle_list = CircularList.new
	  		node3 = Node.new(20)
	  		node2 = Node.new(10, node3)
	  		node1 = Node.new(1, node2)
	  		circle_list.head = node1
	  		node3.next = circle_list.head
	  		circle_list.insert_sorted(15)
	  		expect(circle_list.head.data).to eq(1)
	  		expect(circle_list.head.next.data).to eq(10)
	  		expect(circle_list.head.next.next.data).to eq(15)
	  		expect(circle_list.head.next.next.next.data).to eq(20)
	  		expect(circle_list.head.next.next.next.next.data).to eq(1)
			end
		end
	end

	describe "#remove" do
		context "when the target does not exist in the list" do
			it "changes nothing about the list" do
				circle_list = CircularList.new
	  		node3 = Node.new(20)
	  		node2 = Node.new(15, node3)
	  		node1 = Node.new(10, node2)
	  		circle_list.head = node1
	  		node3.next = circle_list.head
		  	circle_list.remove(5)
	  		expect(circle_list.head.data).to eq(10)
	  		expect(circle_list.head.next.data).to eq(15)
	  		expect(circle_list.head.next.next.data).to eq(20)
	  		expect(circle_list.head.next.next.next.data).to eq(10)
			end
		end

		context "when there is one node in the list" do
		  it "removes the node by setting the head to nil" do
				circle_list = CircularList.new
				node = Node.new(10)
				node.next = node
	  		circle_list.head = node
	  		circle_list.remove(10)
	  		expect(circle_list.head).to eq(nil)
		  end
		end

		context "when the list contains multiple nodes and the target is the head" do
			it "removes the current head, makes the next node the new head, and connects the tail" do
				circle_list = CircularList.new
	  		node3 = Node.new(20)
	  		node2 = Node.new(15, node3)
	  		node1 = Node.new(10, node2)
	  		circle_list.head = node1
	  		node3.next = circle_list.head
	  		circle_list.remove(10)
	  		expect(circle_list.head.data).to eq(15)
	  		expect(circle_list.head.next.data).to eq(20)
	  		expect(circle_list.head.next.next.data).to eq(15)
			end
		end

		context "when the list contains multiple nodes and the target is the tail" do
			it "removes the tail and makes the previous node connect to the head" do
				circle_list = CircularList.new
	  		node3 = Node.new(20)
	  		node2 = Node.new(15, node3)
	  		node1 = Node.new(10, node2)
	  		circle_list.head = node1
	  		node3.next = circle_list.head
	  		circle_list.remove(20)
	  		expect(circle_list.head.data).to eq(10)
	  		expect(circle_list.head.next.data).to eq(15)
	  		expect(circle_list.head.next.next.data).to eq(10)
			end
		end

		context "when the list contains multiple nodes and the target is neither the head or the tail" do
			it "removes the node from the list while preserving linked structure" do
				circle_list = CircularList.new
	  		node3 = Node.new(20)
	  		node2 = Node.new(15, node3)
	  		node1 = Node.new(10, node2)
	  		circle_list.head = node1
	  		node3.next = circle_list.head
			  circle_list.remove(15)
	  		expect(circle_list.head.data).to eq(10)
	  		expect(circle_list.head.next.data).to eq(20)
	  		expect(circle_list.head.next.next.data).to eq(10)
			end
		end
	end
end











