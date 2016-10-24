# 支払い情報の更新

<table>
  <tr>
    <td>メソッド</td>
    <td>PATCH</td>
  </tr>
  <tr>
    <td>認証</td>
    <td>:white_check_mark:</td>
  </tr>
</table>

## URL

```
https://api.coiney.io/api/v1/payments/:PAYMENT_ID
```

## リクエスト

|パラメータ名|説明|型|例|備考|
|:----:|:----:|:----:|:----:|:----:|
|`expiredOn`|支払い期日|`date`|`2016-08-01`|`ISO 8601`フォーマット。支払いステータスが`open`または`expired`の時に指定可能です。|
|`description`|支払いに関する内部的なメモ|`string`|`ウェブサイトからの支払い`|支払い画面には表示されないので内部的な用途でお使いください。|
|`metadata`|支払いに関するシステム連携のためのデータ|`object`|`{"orderId": "1234"}`|メタデータに関して、詳しくは[こちら](/api-spec/metadata.md)。|

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
|`status`|支払いステータス|`string`|`open`|支払いステータスに関して、詳しくは[こちら](/user-guides/status.md)|
|`subject`|支払いの件名|`string`|`スタンダードプラン`|支払い画面に表示されます。|
|`description`|支払いに関する内部的なメモ|`string`|`ウェブサイトからの支払い`|支払い画面には表示されないので内部的な用途でお使いください。|
|`remarks`|支払いの備考|`string`|`お支払い期日を過ぎますと自動的にキャンセルとなります。あらかじめご了承ください。`|支払い画面に表示されます。|
|`metadata`|支払いに関するシステム連携のためのデータ|`object`|`{"orderId": "1234"}`|メタデータに関して、詳しくは[こちら](/api-spec/metadata.md)。|
|`links.paymentUrl`|支払いページURL|`string`|`https://payge.co/co_hogehogehogehogehogehogehogehoge`||
|`links.redirectUrl`|リダイレクトURL|`string`|`https://coiney.com/redirect	`||
|`links.cancelUrl`|キャンセルURL|`string`|`https://coiney.com/cancel	`||
|`links.webhookUrl`|Webhook URL|`string`|`https://coiney.com/webhook	`||
|`locale`|表示言語|`string`|`ja_JP`|Coineyペイジの表示言語。言語設定に関して詳しくは[こちら](/user-guides/locale.md)。|


### リクエスト例

```
curl -X PATCH https://api.coiney.io/api/v1/payments/pm_hogehogehogehogehogehogehogehoge \
  -H "Authorization: Bearer sk_live_hogehogehogehogehogehogehogehoge" \
  -H "X-CoineyPayge-Version: 2016-09-27" \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d $'{
  "expiredOn": "2016-09-25",
  "description": "ウェブサイトからの支払い",
  "metadata": {
    "orderId": "1234"
  }'
```
