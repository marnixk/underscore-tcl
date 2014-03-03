namespace eval _ {
    
    #
    #  Find the first element that makes predicate return true in list $collection
    #
    proc lfind {collection predicate} {
                
        # iterate over all the items
        foreach val $collection {
    
            # make the predicate output a wrapped proc (in _ namespace)
            proc predicate_proc {val} $predicate          
            
            # run proc
            set result [predicate_proc $val]
            
            # result is set to true
            if { $result == true } then {
                return $val
            }
        }
        
    }
    
    #
    #  Find the first element that makes predicate return true in array of `input_name`
    #
    proc find {input_name predicate} {
        upvar 1 $input_name iteratable_map
                
        # iterate over all the items
        foreach {key val} [array get iteratable_map] {
    
            # make the predicate output a wrapped proc (in _ namespace)
            proc predicate_proc {key val} $predicate          
            
            # run proc
            set result [predicate_proc $key $val]
            
            # result is set to true
            if { $result == true } then {
                return $val
            }
        }
    }
    
}