# osrb03-hotwire-sandbox

[大阪Ruby会議03](https://regional.rubykaigi.org/osaka03/)の登壇で使用するデモアプリです。

このアプリには以下の機能があります。

- Hotwireを使ったモーダル形式のブログ編集画面
- Hotwireを使ったフラッシュメッセージのトースト表示
- HotwireとWebsocket（Action Cable）を使ったブログのリアルタイム更新

Demo application for the presentation at [Osaka Ruby Conference 03](https://regional.rubykaigi.org/osaka03/).

This application has the following features:

- Modal-style blog editing screen using Hotwire.
- Toast display of flash messages using Hotwire.
- Real-time updates of the blog using Hotwire and WebSockets (Action Cable).

## Screenshots

<img width="1002" alt="Screenshot 2023-08-20 at 11 56 39" src="https://github.com/JunichiIto/modal-blog-form-sandbox/assets/1148320/1c1ebbf3-ce40-4162-a04d-3c7303e1ed6c">
<img width="999" alt="Screenshot 2023-08-20 at 11 56 51" src="https://github.com/JunichiIto/modal-blog-form-sandbox/assets/1148320/3d75bf31-ae1a-4b35-bffd-4c2e790d4f05">

![9uCr0TEmZ0](https://github.com/JunichiIto/modal-blog-form-sandbox/assets/1148320/5d6d91bb-70c4-43c0-8513-8f405dc05299)

## Setup

```
bin/setup 
bin/dev
open http://localhost:3000
```

## Test 

```
rails test:all
```

## Sample codes

以下のリンクから機能追加時の差分を見ることができます。

- [登録画面のモーダル化](https://github.com/JunichiIto/osrb03-hotwire-sandbox/pull/1)
- [編集と削除のモーダル化](https://github.com/JunichiIto/osrb03-hotwire-sandbox/pull/2)
- [フラッシュメッセージのトースト表示](https://github.com/JunichiIto/osrb03-hotwire-sandbox/pull/3)
- [ブログのリアルタイム更新](https://github.com/JunichiIto/osrb03-hotwire-sandbox/pull/4)

You can view the differences when adding features from the following link:

- [Modalization of the registration screen](https://github.com/JunichiIto/osrb03-hotwire-sandbox/pull/1)
- [Modalization of editing and deletion](https://github.com/JunichiIto/osrb03-hotwire-sandbox/pull/2)
- [Toast display of flash messages](https://github.com/JunichiIto/osrb03-hotwire-sandbox/pull/3)
- [Real-time updates of the blog](https://github.com/JunichiIto/osrb03-hotwire-sandbox/pull/4)

## License 

MIT License.
