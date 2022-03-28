# Webhook

支払い状況をリアルタイムに通知するために使用します。[STORES 請求書決済 - 開発者用設定](http://app.coiney.com/#/merchants/payge/developer)にてWebhook URLを設定することができます。決済ごとにURLを設定したい場合は、`POST /payments`時に指定することもできます。レスポンスのステータスコードが`200`以外を返した場合は、失敗とみなしリトライ処理をします。

## リクエスト

指定されたURLに`POST`でイベントを送ります。形式は、`application/json`です。

送信内容例：
```
{
  "id": "tr_e04g0x0re3jglekjlge", // 対象オブジェクトのID
  "object": "payment",            // 対象オブジェクトの型
  "type": "payment.succeeded"     // イベントの種類
}
```

## イベント一覧

|イベント名|発生のタイミング|
|:----:|:----:|
|`payment.succeeded`|支払い完了|
