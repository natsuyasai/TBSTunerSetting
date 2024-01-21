# TBSのチューナーを使用してチャンネル設定

## 利用したチューナー

TBS 6281SE DVB-T2/T/C TV デュアルテレストリアル HD ロープロファイル PCIe TV チューナーカード
[https://www.amazon.co.jp/gp/product/B01B7TDIKQ/ref=ppx_yo_dt_b_asin_title_o00?ie=UTF8&psc=1](https://www.amazon.co.jp/gp/product/B01B7TDIKQ/ref=ppx_yo_dt_b_asin_title_o00?ie=UTF8&psc=1)

## 環境

Ubuntu 22.04.3 LTS
kernel 5.15.0-91-generic

## ドライバのインストール

以下の公式サイトの「Open Source Linux Driver」のDownloadに移動するとGithubに移動する  
[https://www.tbsdtv.com/download/index.html?keyword=tbs6281se](https://www.tbsdtv.com/download/index.html?keyword=tbs6281se)  

あとは記載されている通りに実施  
(gccとg++のインストールのみ、そのままコピペではなく8以上のバージョンを選択するように環境に応じてインストール)
[https://github.com/tbsdtv/linux_media/wiki](https://github.com/tbsdtv/linux_media/wiki)

## 動作モードの変更

dvb-toolsをインストールし、環境に応じた動作モードを設定  

```sh
sudo apt-get install -y dvb-tools
dvb-fe-tool -a0 # 確認
dvb-fe-tool -a0 -d ISDBT # 変更
```

## チャンネル設定  

以下サイトで公開されている設定ファイルを用意し、問題なく受信できるチャンネルがあるかを確認  
[https://tetsu31415.hatenablog.com/entry/2023/11/06/001832](https://tetsu31415.hatenablog.com/entry/2023/11/06/001832)  

```sh
# 全取得用例
for ch in `seq 13 63`; do
 dvbv5-zap -C JP -a 0 -c ./dvbv5_channels_all.conf -r -P C${ch} -t 10 -o C${ch}.ts
done
```

受信できたチャンネルをもとにmirakurun用のチャンネルファイルを作成  

```yaml
- name: C13
  type: GR
  channel: 'C13'
- name: C14
  type: GR
  channel: 'C14'
- name: C15
  type: GR
  channel: 'C15'
- name: C16
  type: GR
  channel: 'C16'
- name: C17
  type: GR
  channel: 'C17'
- name: C18
  type: GR
  channel: 'C18'
- name: C19
  type: GR
  channel: 'C19'
- name: C20
  type: GR
  channel: 'C20'
- name: C21
  type: GR
  channel: 'C21'
```

## チャンネルスキャン

チャンネル設定で使用したdvbv5の設定ファイルをmirakurunのコンテナ内で参照できるようにする  
mirakurunのチューナーの設定のコマンドにて、使用するコンフィグを参照できるようにしたコンフィグファイルを指定するように変更  
以上ができればチャンネルスキャンを実行すると視聴可能なチャンネルが取得できるはず

## 参考

[https://tetsu31415.hatenablog.com/entry/2023/11/06/001832](https://tetsu31415.hatenablog.com/entry/2023/11/06/001832)
[https://www.thun-techblog.com/index.php/blog/t230c-linux-jcom/](https://www.thun-techblog.com/index.php/blog/t230c-linux-jcom/)
