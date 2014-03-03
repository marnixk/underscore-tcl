namespace eval _ {
    
    
    #
    #  Looks through the input_name variable and returns all key/value mappings that
    #  adhere to the predicate returning true.
    #
    proc lfilter {collection predicate} {

        lappend output
    
        # iterate over all the items
        foreach val $collection {
    
            # make the predicate output a wrapped proc (in _ namespace)
            proc predicate_proc {val} $predicate          
            
            # run proc
            set result [predicate_proc $val]
            
            # result is set to true
            if { $result == true } then {
                lappend output $val
            }
        }
        
        return $output
    }
    
    
    #
    #  Looks through the input_name variable and returns all key/value mappings that
    #  adhere to the predicate returning true.
    #
    proc filter {input_name predicate} {
        upvar 1 $input_name iteratable_map
                

        # iterate over all the items
        foreach {key val} [array get iteratable_map] {
    
            # make the predicate output a wrapped proc (in _ namespace)
            proc predicate_proc {key val} $predicate          
            
            # run proc
            set result [predicate_proc $key $val]
            
            # result is set to true
            if { $result == true } then {
                set output($key) $val
            }
        }
        
        return [array get output]
    }
    
       
}