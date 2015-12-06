# packer_scripts

## 目的

- 各種ミドルやソフトをインストールするスクリプトを作成。
- スクリプトを検証出来る環境を用意。

## 仕組み

1. [Packer] CentOSをCDからインストール。
2. [Packer] OS再起動して、指定したインストールスクリプトを全部流す。(JavaとかMySQLとかインストールされる)。
3. [Packer] 出来上がった環境をVagrant用のイメージ(Boxファイル)として出力。
4. [人間] 出来上がったBOXをローカルに登録する(vagrant addコマンド)。
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

## リリース物のビルド

```shell
cd centos64
build.bat
```

## 開発・テストビルド

```shell
cd centos64
test_base.bat
```
