class Node

    def initialize
        @data = nil 
        @left_children = nil 
        @right_children = nil
    end 


end 


class Tree
    
    def initialize

    end 

    def sort_and_remove_duplicates(array)
        unsorted_array = array
        new_array = []
        unsorted_array.each do |item|
            if new_array.include?(item) == false 
                new_array << item
            end 
        end 
        
        new_array = new_array.sort()
        
    
    end 

    def build_tree(array)
        new_array = sort_and_remove_duplicates(array)
    end 


    

  

end 

tree = Tree.new()
a = [8, 6, 1, 1, 2, 3, 4, 5, 6, 3]
tree.build_tree(a)