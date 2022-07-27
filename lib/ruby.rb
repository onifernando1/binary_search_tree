class Node


    attr_accessor :left_children, :right_children

    def initialize(data)
        @data = data
        @left_children = nil 
        @right_children = nil
    end 


end 


class Tree

    attr_accessor :sorted_array
    
    def initialize(array)
        @root = nil #change
        @sorted_array = sort_and_remove_duplicates(array)

    end 

    def sort_and_remove_duplicates(array)
        unsorted_array = array
        new_array = []
        unsorted_array.each do |item|
            if new_array.include?(item) == false 
                new_array << item
            end 
        end 
        
        @sorted_array = new_array.sort()
        @sorted_array
    
    end 

    def build_tree(array, start, ending)

        #base case 
        if start > ending
            return nil 
        else
    
        #get middle of array and make it the root 
        middle = (start + ending) / 2
        root = Node.new(array[middle])

        #construct left subtree recursively and make it the left child of original root 
        root.left_children = build_tree(array, start, middle - 1 )
        root.right_children = build_tree(array, middle + 1, ending)
        root 
        end 

    end 


    

  

end 

a = [8, 6, 1, 1, 2, 3, 4, 5, 6, 3]
tree = Tree.new(a)
sorted_array = tree.sorted_array
length = sorted_array.length
tree.build_tree(sorted_array, 0, length - 1)

