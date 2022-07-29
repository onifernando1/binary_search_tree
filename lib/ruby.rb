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
        root_node 
        #why does it not work with @ but it works without 
        

    end 

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

    def insert(value)
        if @sorted_array.include?(value)
            puts "Value #{value} already in array"
        else 
        insert_rec(@root, value)
        end 
    end 
    
    def insert_rec(root, value)

        if root == nil 
            root = Node.new(value) 
            root 
        else 
            if value > root.data
                root.right = insert_rec(root.right, value) 
                root 
            elsif value < root.data 
                root.left = insert_rec(root.left, value)
                root 
            end 
        end 

    end 

    def delete_node(root, value)

        if root = nil
            return root 
        elsif value < root.value 
            # go left
            root.left = delete_node(root.left, value)
        elsif value > root.value
            # go right 
            root.right = delete_node(root.right, value)
        else #root == value, delete
            #node with only right child or no child 
            if node.left == nil 



            #node with only left child 
            #node with two children 
        end 

        return root 



    end 

  

end 

array = [6,212,23,2,3,4,5,6,7,8,9,9,7,5,3123,12]
tree = Tree.new(array)
tree.build_tree(array)
# tree.pretty_print()
tree.insert(989898)
tree.insert(6)
tree.pretty_print()
