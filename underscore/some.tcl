namespace eval _ {
    
    
    #
    #  Make sure that at least one of the items adheres to the predicate
    #
    proc some {input_name predicate} {
        upvar 1 $input_name iteratable_map
                
        # iterate over all the items
        foreach {key val} [array get iteratable_map] {
    
            # make the predicate output a wrapped proc (in _ namespace)
            proc predicate_proc {key val} $predicate          
            
            # run proc
            set result [predicate_proc $key $val]
            
            # result is set to true
            if { $result == true } then {
                return true
            }
        }
        
        return false
    }
    
}