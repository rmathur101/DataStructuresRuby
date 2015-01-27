require "rspec"
require_relative "../lib/queue.rb"

describe "Queue" do
	describe "#push" do
		it "pushes data such that the data becomes the tail node of the queue if data already exists in the queue" do
			q = Queue.new
			q.head = DoublyLinkedNode.new(1)
			q.tail = q.head
			q.push(2)

			expect(q.head.data).to eq(1)
			expect(q.tail.data).to eq(2)
		end

		it "pushes data such that data becomes tail and head if there is nothing in the queue" do
			q = Queue.new
			q.push(1)

			expect(q.head.data).to eq(1)
		  expect(q.tail.data).to eq(1)
		end
	end
end

