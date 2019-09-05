set ns [ new Simulator ]

$ns color 1 Blue
$ns color 2 Red

set nf [open ques2.nam w]
$ns namtrace-all $nf
set tf [open ques2.tr w ]
$ns trace-all $tf

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]

set queuesize1 10
set queuesize2 10
set queuesize3 10
set queuesize4 30
set queuesize5 20

$ns duplex-link $n0 $n2 10Mb 1ms DropTail
$ns queue-limit $n0 $n2 $queuesize1
$ns duplex-link $n1 $n2 512Kb 1ms DropTail
$ns queue-limit $n1 $n2 $queuesize2
$ns duplex-link $n2 $n3 512kb 1ms DropTail
$ns queue-limit $n2 $n3 $queuesize3
$ns duplex-link $n3 $n4 512kb 1ms DropTail
$ns queue-limit $n3 $n4 $queuesize4
$ns duplex-link $n3 $n5 10Mb 1ms DropTail
$ns queue-limit $n3 $n5 $queuesize5

set p1 [new Agent/Ping] 
$ns attach-agent $n0 $p1
$p1 set packetSize_ 50000
$p1 set interval_ 0.005
$p1 set fid_ 1

set p2 [new Agent/Ping] 
$ns attach-agent $n1 $p2

set p3 [new Agent/Ping] 
$ns attach-agent $n2 $p3

set p4 [new Agent/Ping] 
$ns attach-agent $n3 $p4

set p6 [new Agent/Ping]
$ns attach-agent $n4 $p6

set p5 [new Agent/Ping] 
$ns attach-agent $n5 $p5
$p5 set packetSize_ 50000
$p5 set interval_ 0.0001
$p5 set fid_ 2

Agent/Ping instproc recv {from rtt} {
$self instvar node_
puts "node [$node_ id]received answer from $from with round trip time $rtt msec"
}

$ns connect $p6 $p1
$ns connect $p2 $p5

proc finish { } {
global ns nf tf
$ns flush-trace
close $nf
close $tf
exec nam ques2.nam &
exit 0
}

$ns at 0.1 "$p1 send"
$ns at 0.2 "$p1 send"
$ns at 0.3 "$p1 send"
$ns at 0.4 "$p1 send"
$ns at 0.5 "$p1 send"
$ns at 0.6 "$p1 send"
$ns at 0.7 "$p1 send"
$ns at 0.8 "$p1 send"
$ns at 0.9 "$p1 send"
$ns at 1.0 "$p1 send"
$ns at 1.1 "$p1 send"
$ns at 1.2 "$p1 send"
$ns at 1.3 "$p1 send"
$ns at 1.4 "$p1 send"
$ns at 1.5 "$p1 send"
$ns at 1.6 "$p1 send"
$ns at 1.7 "$p1 send"
$ns at 1.8 "$p1 send"
$ns at 1.9 "$p1 send"
$ns at 2.0 "$p1 send"
$ns at 2.1 "$p1 send"
$ns at 2.2 "$p1 send"
$ns at 2.3 "$p1 send"
$ns at 2.4 "$p1 send"
$ns at 2.5 "$p1 send"
$ns at 2.6 "$p1 send"
$ns at 2.7 "$p1 send"
$ns at 2.8 "$p1 send"
$ns at 2.9 "$p1 send"
$ns at 0.1 "$p5 send"
$ns at 0.2 "$p5 send"
$ns at 0.3 "$p5 send"
$ns at 0.4 "$p5 send"
$ns at 0.5 "$p5 send"
$ns at 0.6 "$p5 send"
$ns at 0.7 "$p5 send"
$ns at 0.8 "$p5 send"
$ns at 0.9 "$p5 send"
$ns at 1.0 "$p5 send"
$ns at 1.1 "$p5 send"
$ns at 1.2 "$p5 send"
$ns at 1.3 "$p5 send"
$ns at 1.4 "$p5 send"
$ns at 1.5 "$p5 send"
$ns at 1.6 "$p5 send"
$ns at 1.7 "$p5 send"
$ns at 1.8 "$p5 send"
$ns at 1.9 "$p5 send"
$ns at 2.0 "$p5 send"
$ns at 2.1 "$p5 send"
$ns at 2.2 "$p5 send"
$ns at 2.3 "$p5 send"
$ns at 2.4 "$p5 send"
$ns at 2.5 "$p5 send"
$ns at 2.6 "$p5 send"
$ns at 2.7 "$p5 send"
$ns at 2.8 "$p5 send"
$ns at 2.9 "$p5 send"
$ns at 3.0 "finish"
$ns run
