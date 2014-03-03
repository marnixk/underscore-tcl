source "underscore/all.tcl"

puts -nonewline "All larger than 9? "
puts [_::levery [list 10 20 30 40] {
    if {$val > 9} then {
        return true
    }
}]

puts [_::lcontains [list 10 20 30 40] 40]
puts [_::lfilter [list 10 20 30 40] { if {$val > 10} { return true } }]
puts [_::lreject [list 10 20 30 40] { if {$val > 10} { return true } }]
puts [_::lmap [list 10 20 30 40] { return [expr {$val * 40}] } ]

set a(key) 1
set a(key2) 5
set a(key3) 10
set a(key4) 20

puts [_::first [list 10 20 30 40]]
puts [_::last [list 10 20 30 40]]
puts [_::initial [list 10 20 30 40]]

set mylist [list 10 20 30 1000 50]
set max_element [_::max $mylist]
puts "max element: $max_element"

set myarray [list \
                { name "Person 1" age 29 } \
                { name "Person 2" age 34 } \
                { name "Person 3" age 36 }]

array set oldest [_::max $myarray {
    array set local_array $var
    return $local_array(age)
}]

puts "oldest '$oldest(name)'"

array set youngest [_::min $myarray {
    array set local_array $var
    return $local_array(age)
}]

puts "youngest '$youngest(name)'"

set smallest [_::min [list 10 20 304 -100]]
puts "Smallest: $smallest"


set predicate {
    if {$val > 5} then {
        return true
    }
}

puts "Full set"
parray a
puts ""

puts "Filter > 5";
array unset result
array set result [_::filter a $predicate]
parray result
puts ""

puts "Reject > 5";
array unset result
array set result [_::reject a $predicate]
parray result
puts ""

puts -nonewline "First larger than 5: "
puts [_::find a $predicate]

if { [_::every a { if {$val < 100} { return true } } ] } {
    puts "Everything is smaller than 100"
}

array set b {a 110 b 90}

if { [_::some b { if {$val < 100} { return true } } ] } {
    puts "Some are smaller than 100"
}

if { [_::contains b 100] } then {
    puts "110 is in b"
}

set mapped_list [ _::map a { return [expr {$val * 10}] } ]
puts $mapped_list

