# packer_scripts

## 目的

- 各種ミドルやソフトをインストールするスクリプトを作成。
- スクリプトを検証出来る環境を用意。

## 仕組み

1. [Packer] CentOSをCDからインストール。
2. [Packer] OS再起動して、指定したインストールスクリプトを全部流す。(JavaとかMySQLとかインストールされる)。
3. [Packer] 出来上がった環境をVagrant用のイメージ(Boxファイル)として出力。
4. [Vagrant] 出来上がったBOXをローカルに登録する(vagrant addコマンド)。
5. [Vagrant] 登録したイメージを起動(vagrant up)。

## 必要なソフトのインストール

- [Oracle Virtual Box](http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html?ssSourceSiteId=otnjp)
 - ダウンロードしてインストール。
- [Vagrant](https://www.vagrantup.com/downloads.html)
 - ダウンロードしてインストール。
- [Packer](https://www.packer.io/downloads.html) 
 1. zipをダウンロードして解凍。
 2. C:\HashiCorp\Packer に*.exe群を全部格納。
 3. 環境変数PATHに`C:\HashiCorp\Packer`を追加。

## プロキシ環境化の設定
- ホストＯＳの環境変数に「http_proxy」環境変数を設定。
 - set http_proxy=http://[プロキシホスト]:[ポート]
- centos64/template.json, centos64/test_base.jsonの「##★追加」を追記。
```json
{
  "provisioners": [
    {
      "type": "file",
      "source": "packer_build",
      "destination": "/tmp"
    },
    {
      "type": "shell",
      "execute_command": "echo 'vagrant'|sudo -S sh '{{.Path}}'",
      "override": {
        "virtualbox-iso": {
          "scripts": [
            "scripts/proxy.sh", ##★追加
            "scripts/base1_provision.sh",
            "scripts/base2_provision.sh"
          ]
        }

```
 - centos64/scripts/proxy.sh を編集。プロキシの設定をする。
```json
 # export http_proxy=http://[proxyhost]:[port]
 export http_proxy=http://myproxy:8080
```

## リリース用ビルド

```shell
cd centos64

# dev_centos64.box ファイルの生成。
packer build template.json

# Boxファイルをローカルに登録
vagrant box add dev_centos64 dev_centos64.box

# releaseフォルダで動作確認
cd release
vagrant init dev_centos64
vagrant up
```

## 検証Try&Error用ビルド

```shell
cd centos64

# test_base.box ファイルの生成。
packer build test_base.json

# Boxファイルをローカルに登録
vagrant box add test_base test_base.box

# debugフォルダで動作確認
cd debug
vagrant init test_base
vagrant up
```
