namespace eval _ {
    
    
    #
    #  Return true if every element in the list `collection` returns true for
    #  `predicate`.
    #
    proc levery {collection predicate} {

        # iterate over all the items
        foreach val $collection {
    
            # make the predicate output a wrapped proc (in _ namespace)
            proc predicate_proc {val} $predicate 
            
            # run proc
            set result [predicate_proc $val]
            
            # result is set to true
            if { $result != true } then {
                return false
            }
        }
        
        return true
    
    }
    
    #
    # Make sure all the items in input_name adhere to predicate returning true
    #
    proc every {input_name predicate} {
        upvar 1 $input_name iteratable_map
                

        # iterate over all the items
        foreach {key val} [array get iteratable_map] {
    
            # make the predicate output a wrapped proc (in _ namespace)
            proc predicate_proc {key val} $predicate          
            
            # run proc
            set result [predicate_proc $key $val]
            
            # result is set to true
            if { $result != true } then {
                return false
            }
        }
        
        return true
    }
    
}