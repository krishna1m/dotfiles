function mkcd 
  set num_args (count $argv)
  if test $num_args -ne 1
    echo 'usage: mkcd directory_name(only one)'
  else
    set dir $argv
    mkdir $dir
    cd $dir
  end
end
