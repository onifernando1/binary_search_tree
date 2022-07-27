class Node


    attr_accessor :left_children, :right_children, :data

    def initialize(data)
        @data = data
        @left_children = nil 
        @right_children = nil
    end 


end 


class Tree

    attr_accessor :sorted_array
    
    def initialize(array)
        @sorted_array = array.uniq.sort()
        @root = build_tree(@sorted_array, 0, @sorted_array.length - 1)

    end 


    def build_tree(array, start, ending)

        #base case 
        if start > ending
            return nil 
        else
    
        #get middle of array and make it the root 
        middle = (start + ending) / 2
        @root_node = Node.new(array[middle])

        #construct left subtree recursively and make it the left child of original root 
        @root_node.left_children = build_tree(array, start, middle - 1 )
        @root_node.right_children = build_tree(array, middle + 1, ending)
        @root_node 
        end 

    end 

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right_children, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_children
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left_children, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_children
    end
    

  

end 

a = [8, 6, 1, 1, 2, 3, 4, 5, 6, 3]
tree = Tree.new(a)
p tree.sorted_array
# sorted_array = tree.sorted_array
# length = sorted_array.length
# tree.build_tree(sorted_array, 0, length - 1)
# tree.pretty_print

