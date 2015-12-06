packer build test_base.json > testbase.log 2>&1

@if not "%ERRORLEVEL%"  == "0" (
  echo "ƒGƒ‰[I"
) else (
  vagrant box add --force test_base test_base.box
  rm test_base.box
)
