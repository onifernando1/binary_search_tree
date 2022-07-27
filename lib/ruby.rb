class Node


    attr_accessor :left, :right, :data

    def initialize(data)
        @data = data
        @left = nil
        @right = nil
    end 


end 


class Tree

    attr_accessor :sorted_array, :root, :left_children, :right_children
    
    def initialize(array)
        @sorted_array = array.uniq.sort()
        @root = build_tree(@sorted_array)

    end 


    def build_tree(array)

        #base case 
        return nil if array.empty?
    
        #get middle of array and make it the root 
        middle = (array.length - 1) / 2
        root_node = Node.new(array[middle])

        #construct left subtree recursively and make it the left child of original root 
        root_node.left = build_tree(array[0...middle])
        root_node.right = build_tree(array[(middle+1)..-1])
        p root_node.data
        p root_node
        root_node 
        #why does it not work with @ but it works without 
        

    end 

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end
    
    def insert 

    end 


    def delete 

    end 

  

end 

array = [6,212,23,2,3,4,5,6,7,8,9,0,9,7,5,3123,12]
tree = Tree.new(array)
tree.build_tree(array)
tree.pretty_print()