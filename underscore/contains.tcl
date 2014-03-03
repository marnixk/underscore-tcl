namespace eval _ {
    
    #
    #  Returns true if the list contains `needle`
    #
    proc lcontains {haystack needle} {
        foreach element $haystack {
            if { $needle == $element } then {
                return true
            }
        }
        return false
    }
    
    #
    #  Returns true if the array in input_name actually contains `needle`
    #
    proc contains {input_name needle} {
        upvar 1 $input_name iterable_map

        set result [_::some iterable_map {
            upvar 2 needle up_needle
            if {$val == $up_needle} then {
                return true
            }
        }]
        
        return $result
    }
    
}