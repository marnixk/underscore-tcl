namespace eval _ {
    
    proc first {list} {
        return [lindex $list 0]
    }
    
    proc last {list} {
        return [lindex $list end]
    }
    
    proc initial {list} {
        return [lrange $list 0 end-1]
    }
    
    proc rest {list} {
        return [lrange $list 1 end]        
    }

}