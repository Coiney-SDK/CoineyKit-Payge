# Rubyサンプルコード

シークレットAPIキーについては [こちら](https://github.com/Coiney-SDK/CoineyKit-Payge/blob/master/api-spec/authentication.md)、
バージョンについては [こちら](https://github.com/Coiney-SDK/CoineyKit-Payge/blob/master/api-spec/versioning.md) を参照ください。

### 利用例

```
payge = Payge.new("sk_live_hogehogehogehogehogehogehogehoge", "v1", "2016-10-25")

payge.list

payge.get("pm_hogehogehogehogehogehogehogehoge")

payge.create({
  amount: 128.00,
  currency: "jpy",
  locale: "ja_JP",
  redirectUrl: "https://coiney.com/redirect",
  cancelUrl: "https://coiney.com/cancel",
  webhookUrl: "https://coiney.com/webhook",
  method: "creditcard",
  subject: "スタンダードプラン",
  description: "ウェブサイトからの支払い",
  remarks: "お支払い期日を過ぎますと自動的にキャンセルとなります。あらかじめご了承ください。",
  metadata: {
    orderId: "1234"
  },
  expiredOn: "2016-10-25"
})

payge.update("pm_hogehogehogehogehogehogehogehoge", {
  expiredOn: "2016-10-26",
  description: "ウェブサイトからの支払い",
  metadata: {
    orderId: "1234"
  }
})
```
