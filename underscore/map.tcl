namespace eval _ {
    
    
    #
    #  Map the transform function over all elements in list `collection`
    #
    proc lmap {collection transform} {
        
        lappend result_list
        
        # iterate over all the items
        foreach val $collection {
            proc transform_proc {val} $transform
            set result [transform_proc $val]
            lappend result_list $result
        }
        
        return $result_list
    }
    
    #
    #  Map the transform function over all elements in `input_name`
    #
    proc map {input_name transform} {
        upvar 1 $input_name iteratable_map
        
        lappend result_list
        
        # iterate over all the items
        foreach {key val} [array get iteratable_map] {
            proc transform_proc {val} $transform
            set result [transform_proc $val]
            lappend result_list $result
        }
        
        return $result_list
    }
    
}