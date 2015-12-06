# packer_scripts

## 何？

- CentOS6.4に色んなアプリやツールを入れるシェルスクリプトを走らせて、VagrantのBOXを作成するもの。

## 大まかな流れ

1. [Packer] CentOSをCDからインストール。
2. [Packer] OS再起動して、指定したインストールスクリプトを全部流す。(JavaとかMySQLとかインストールされる)。
3. [Packer] 出来上がった環境をVagrant用のイメージ(Boxファイル)として出力。
4. [人間] 出来上がったBOXをローカルに登録する(vagrant addコマンド)。
5. [Vagrant] 登録したイメージを起動(vagrant up)。

## 必要なソフトのインストール(この順番で)

- [Oracle Virtual Box](http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html?ssSourceSiteId=otnjp)
 - ダウンロードしてインストール。
- [Vagrant](https://www.vagrantup.com/downloads.html)
 - ダウンロードしてインストール。
- [Packer](https://www.packer.io/downloads.html) 
 1. zipをダウンロードして解凍。
 2. C:\HashiCorp\Packer に*.exe群を全部格納。
 3. 環境変数PATHに`C:\HashiCorp\Packer`を追加。

## リリース物のビルド

- CDからOSインストール、全スクリプトを流してVagrantのBoxを出力、ローカルに登録までを行う。

```shell
cd dev-env-centos64
build.bat
```

## 開発・テストビルド
