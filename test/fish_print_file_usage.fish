set path $DIRNAME/$TESTNAME
set filename $path/biscuits.fish

set expected "biscuits: a function" "" "  usage: biscuits <thing>"

function setup
  mkdir -p $path
  echo "function biscuits" >> $filename
  echo "" >> $filename
  echo "end" >> $filename
  echo "" >> $filename
  echo "### usage" >> $filename
  echo "# biscuits: a function" >> $filename
  echo "#" >> $filename
  echo "#   usage: biscuits <thing>" >> $filename
  echo "#" >> $filename
  echo "###" >> $filename
  pushd $path
end

function teardown
  popd
  rm -rf $path
end

test "$TESTNAME - it works when a usage block is present"
  $expected = (fish_print_file_usage $filename)
end
