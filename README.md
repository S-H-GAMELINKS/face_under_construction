# Face under Construction
Mastodonなどのハッシュタグ #顔面工事 をブーストするだけのBotです 
AWS lambdaを使用して運用しています 

# デプロイ方法

まず、`git clone`でソースコードをダウンロードします 

```shell
git clone https://github.com/S-H-GAMELINKS/face_under_construction.git
```

次に、`face_under_construction`ディレクトリへと移動し、`bundle install`を実行します 

```shell
cd face_under_construction
bundle install --deployment
```

次に、取得したアクセストークンなどを`.env.sample`を参考に`.env`に記入します

```shell
# Using Mastodon API
MASTODON_ACCESS_TOKEN=
MASTODON_URL=
```

あとは、`face_under_construction`ディレクトリをzip形式で圧縮してAWS lambdaへとアップロードします

# ライセンス
[MIT](./LISENCE)



