
# https://github.com/openresty/openresty-gdb-utils.git
directory /opt/openresty-gdb-utils

py import sys
py sys.path.append("/opt/openresty-gdb-utils")

source luajit20.gdb
source ngx-lua.gdb
source luajit21.py
source ngx-raw-req.py

set python print-stack full


# custom gdb script

# save history command
set history filename ./.gdb.history
set history save on

# record gdb events
set logging file ./.gdb.log
set logging on

# print array index
set print array-indexes on

# print all item of struct
set print pretty on

# save breakpoint when exit
define qbp
save breakpoints ./.gdb.bp
quit
end
document qbp
Exit and save the breakpoint
end

# save history breakpoint
define downbp
save breakpoints ./.gdb.bp
end
document downbp
Save the historical work breakpoint
end

# load history breakpoint
define loadbp
source ./.gdb.bp
end
document loadbp
Load the historical work breakpoint
end
