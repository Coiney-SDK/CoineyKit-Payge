# 支払いの作成

<table>
  <tr>
    <td>メソッド</td>
    <td>POST</td>
  </tr>
  <tr>
    <td>認証</td>
    <td>:white_check_mark:</td>
  </tr>
</table>

## URL

```
https://api.coiney.io/api/v1/payments
```

## リクエスト

|パラメータ名|説明|型|例|必須|備考|
|:----:|:----:|:----:|:----:|:----:|:----:|
|`amount`|支払い金額|`number`|`100`|:white_check_mark:|100円以上|
|`currency`|通貨|`string`|`jpy`|:white_check_mark:|支払いに使う通貨を指定します。`ISO 4217`に基づいた 3桁の通貨コードを使います。現在は`JPY`のみ有効です。|
|`locale`|表示言語|`string`|`ja_JP`||表示言語を指定します。現在は`ja_JP`のみ有効です。|
|`redirectUrl`|リダイレクトURL|`string`|`https://coiney.com/redirect`||支払い処理が完了した後に遷移する画面のURLを指定します。指定がない場合は、Coineyペイジ標準の完了画面に遷移します。|
|`cancelUrl`|キャンセルURL|`string`|`https://coiney.com/cancel`||支払い処理をキャンセルした際に遷移する画面のURLを指定します。指定がない場合は、支払い画面からキャンセルができません。|
|`webhookUrl`|Webhook URL|`string`|`https://coiney.com/webhook`||Webhook URLを指定します。指定しない場合は、ウェブ管理画面で設定されたURLが使用されます。Webhookに関して、詳しくは[こちら](/user-guides/webhook.md)。|
|`receiptEmail`|レシート用メールアドレス|`string`|`test@coiney.com`||支払い完了後、レシートメールを送信する場合に設定します。|
|`method`|支払い方法|`string`|`creditcard`|:white_check_mark:|支払い方法を指定します。現在は`creditcard`のみ有効です。|
|`subject`|支払いのタイトル|`string`|`スタンダードプラン`||支払いのタイトルです。|
|`expiredOn`|支払い期限|`date`|`2016-08-01`||`ISO 8601`フォーマット。指定がない場合は、デフォルトで3ヶ月が設定されます。|

## レスポンス

|パラメータ名|説明|型|例|備考|
|:----:|:----:|:----:|:----:|:----:|
|`id`|支払いID|`string`|`pm_hogehogehogehogehogehogehogehoge`||
|`object`|オブジェクト|`string`|`payment`||
|`mode`|モード|`string`|`live`|本番環境: `live`、テスト環境: `test`|
|`createdAt`|支払い作成日|`dateTime`|`2016-08-14T21:57:20+09:00`|`ISO 8601`フォーマット。|
|`amount`|支払い金額|`number`|`100`||
|`currency`|通貨|`string`|`jpy`||
|`paidAt`|支払い日|`dateTime`|`2016-08-14T21:57:20+09:00`|`ISO 8601`フォーマット。|
|`refundedAt`|売上取消・返品した日|`dateTime`|`2016-08-14T21:57:20+09:00`|`ISO 8601`フォーマット。|
|`validUntil`|支払い期限|`dateTime`|`2016-08-14T21:57:20+09:00`|`ISO 8601`フォーマット。|
|`status`|支払いステータス|`string`|`open`|支払いステータスに関して、詳しくは[こちら](/user-guides/status.md)。|
|`subject`|支払いのタイトル|`string`|`スタンダードプラン`||
|`links.paymentUrl`|支払いページURL|`string`|`https://payge.co/co_hogehogehogehogehogehogehogehoge`||
|`links.redirectUrl`|リダイレクトURL|`string`|`https://coiney.com/redirect`||
|`links.cancelUrl`|キャンセルURL|`string`|`https://coiney.com/cancel`||
|`links.webhookUrl`|Webhook URL|`string`|`https://coiney.com/webhook`||

### リクエスト例

```
curl -X POST https://api.coiney.io/api/v1/payments \
  -H "Authorization: sk_live_hogehogehogehogehogehogehogehoge" \
  -H "X−CoineyPayge−Version: 2016-08-31" \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d "amount=100" \
  -d "currency=jpy" \
  -d "locale=ja_JP" \
  -d "redirectUrl=https://coiney.com/redirect" \
  -d "cancelUrl=https://coiney.com/cancel" \
  -d "webhookUrl=https://coiney.com/webhook" \
  -d "receiptEmail=test@coiney.com" \
  -d "method=creditcard" \
  -d "subject=スタンダードプラン" \
  -d "expiredOn=2016-08-01"
```
