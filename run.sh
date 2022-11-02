#!/usr/bin/expect -f
spawn ./copy.sh

expect {
	"*fingerprint*" { send -- "yes\r" }
	"*password*" { send -- "qwer\r" }
}

expect EOF


spawn ./move.sh

expect {
	"*password*" { send -- "qwer\r" }
}

expect EOF


spawn ./move2.sh

expect {
	"*password*" { send -- "qwer\r" }
}

expect EOF