# Update the /usr/info/dir info-database, so that we will see the new
# "octave" item in info root structure, if we type "info".
ErrCount=0

function echo_exit {
  ((ErrCount += $1))
  if [ $1 -eq 0 ]; then
    echo -n "$2 "
  else
    echo -n $3
  fi
}

if [ -x /usr/bin/install-info ] ; then
  echo -n "Installing info pages... "
  install-info --info-dir=/usr/info /usr/info/octave.info.gz   2>/dev/null
  echo_exit $? 0 
  install-info --info-dir=/usr/info /usr/info/octave.info-1.gz 2>/dev/null
  echo_exit $? 1
  install-info --info-dir=/usr/info /usr/info/octave.info-2.gz 2>/dev/null
  echo_exit $? 2
  install-info --info-dir=/usr/info /usr/info/octave.info-3.gz 2>/dev/null
  echo_exit $? 3
  install-info --info-dir=/usr/info /usr/info/octave.info-4.gz 2>/dev/null
  echo_exit $? 4
  install-info --info-dir=/usr/info /usr/info/octave.info-5.gz 2>/dev/null
  echo_exit $? 5
  install-info --info-dir=/usr/info /usr/info/octave.info-6.gz 2>/dev/null
  echo_exit $? 6
  echo_exit $ErrCount "DONE" "FAILURE"
  echo
else
  echo "WARNING: Info pages cannot be installed!"
fi
