# 認証

## シークレットAPIキー

APIリクエスト時に`RFC 7235`の`Authorization`ヘッダを用い、`RFC 6750`の`Bearer`スキームを使用します。

### 取得方法

1. [こちら](https://dashboard.stores.app/sign_up?service=payments)からSTORES 決済 加盟店登録をします。
2. [ウェブ管理画面](https://app.coiney.com/#/login)にオーナーとしてログインします。
3. [STORES 請求書決済 - 開発者用設定](http://app.coiney.com/#/merchants/payge/developer)から取得することができます。

### リクエスト例

```
curl "https://api.coiney.io/api/v1/payments" \
  -H "Authorization: Bearer sk_live_hogehogehogehogehogehogehogehoge"
```
