# 艦これランチャー

## なにこれ

* 艦これを専用ウィンドウで立ち上げるだけのデスクトップアプリ
* ログイン自動化（IDとPWはプレーンテキストなので自己責任で）
* TideSDKで試しに作ってみた


## 使い方

1. `bundle install`
2. TideSDK-Developerでビルド
3. App(*1)フォルダにconfigファイルを作って、IDとPWを記載(*2)

  (*1) 実行OSごとに生成されるフォルダが異なる

  	osx -> `dist/osx/KancolleLauncher.app/Contents/config`  
    win -> `dist/win32/KancelleLauncher/config`

  (*2) 1行目: ID, 2行目: PW

    hoge@fugafuga
    piyopiyo
