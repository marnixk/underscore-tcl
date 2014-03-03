namespace eval _ {
    
    proc max {list {comparator null}} {
        
        if { $comparator == "null" } then {
            proc checker {var} {
                return $var
            }
        } else {
            proc checker {var} $comparator
        }
        
        foreach element $list {
            set el_value [checker $element]
            
            if {! [info exists max_value] } then {
                # doesn't exist? just set it.
                set max_value $el_value
                set return_value $element
            } elseif {$max_value < $el_value} {
                # set if higher value than current value
                set max_value $el_value
                set return_value $element
            }
        }
        
        return $return_value
    }
    
}