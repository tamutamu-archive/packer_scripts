packer build template.json > build.log 2>&1

@if not "%ERRORLEVEL%"  == "0" (
  echo "ÉGÉâÅ[ÅI"
) else (
  vagrant box add --force dev_centos64 dev_centos64.box
  rm dev_centos64.box
)