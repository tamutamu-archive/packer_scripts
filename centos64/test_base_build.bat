packer build test_base.json > testbase.log

@if not "%ERRORLEVEL%"  == "0" (
  echo "ƒGƒ‰[I"
) else (
  vagrant box add --force test_base test_base.box
  rm test_base.box
)
