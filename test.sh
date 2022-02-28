COVERAGE=true parallel_rspec spec -n 4
firefox ./coverage/index.html &
