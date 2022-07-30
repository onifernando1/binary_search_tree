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
        @level_order_array = []
        @inorder_array = []


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

    def delete(value)
        delete_node(@root, value)
        
    end 

    def delete_node(root, value)

        if root == nil
            return root 
        elsif value < root.data 
            # go left
            root.left = delete_node(root.left, value)
        elsif value > root.data
            # go right 
            root.right = delete_node(root.right, value)
        else #root == value, delete
            #node with only right child or no child 
            if root.left == nil 
                return root.right 
            #node with only left child 
            elsif root.right == nil 
                return root.left
            else 
            #node with two children 
                temp = min_node(root.right)
                root.data = temp
                delete_node(root.right, temp)
            end 
        end 

        return root 



    end 

    def min_node(root)

        min_value = root.data

        until root.left == nil 
            min_value = root.left.data
            root = root.left
        end 

        min_value

    end 


    def find(root=@root, value) 
        
        @found_node = nil

        if root == nil 
            return root 
        elsif value < root.data 
            root.left = find(root.left, value)
        elsif value > root.data 
            root.right = find(root.right, value)
        else #root.value == value 
            @found_node = root
            puts "Found Node #{@found_node}"
            puts "Found Node value: #{@found_node.data}"
            root
        end 

    end 

    def my_block 
        yield 
    end 

    def level_order(root=@root, queue=[])
        #unshift = add item to beginning of array (to end of queue)
        #pop = removes last element (from front of queue)

        
        if root == nil 
            p @level_order_array
            return 
        else
            @level_order_array << root.data
            queue.unshift(root.left) if root.left != nil 
            queue.unshift(root.right) if root.right != nil 
            kicked = queue.pop()
            if block_given?
                yield(kicked)
            end 
            level_order(kicked, queue)
        end 

       
        
    end 

    def inorder
    end 

    def preorder(root=@root)
        # root, left subtree, right subtree
        if root == nil
            return 
        else 
            @inorder_array << root.value
            preorder(root.left)
            preorder(root.right)
            




        end 
    end 

    def postorder
    end 











end 

array = [50, 40, 60, 70, 80, 30]
tree = Tree.new(array)
tree.build_tree(array)
tree.pretty_print()
tree.level_order(tree.root)
tree.level_order do
      |node| puts node.data
end 
