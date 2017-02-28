packer build -var-file=common_var.conf base_build.json > base_build.log 2>&1

@if not "%ERRORLEVEL%"  == "0" (
  echo "�G���[�I"
) else (
  vagrant box add --force base_centos7 base_centos7.box
  rm base_centos7.box
)
