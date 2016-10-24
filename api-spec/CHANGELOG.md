# Version 1

## 2016-10-25

:globe_with_meridians: Coineyペイジが多言語化対応しました。

### 機能追加

- Payment API
  - `POST /payments`時の`locale`フィールドの設定値が増えました。詳しくは[こちら](/user-guides/locale.md)。
  - `POST`, `GET`, `PATCH`の返り値に`locale`フィールドを追加しました。

## 2016-09-27

### 機能変更

- Payment API
  - `POST /payments`の`receiptEmail`フィールドを指定することができなくなりました。

### 機能追加

- Payment API
  - [メタデータ](/api-spec/metadata.md)機能の追加
  - remarks, descriptionフィールドの追加

### 互換性に影響する変更

カード会員は支払い画面からレシートを受け取るメールアドレスを任意で指定することができるようになりました。
この変更により、
- 支払い画面でメールアドレスが指定された場合、`2016-08-31`で作られた支払いオブジェクトの`receiptEmail`ではなく、指定されたメールアドレスにレシートが送信されます。
- `2016-09-27`では`POST /payments`の`receiptEmail`フィールドを指定することができなくなりました。

なお、`2016-08-31`で作られた支払いオブジェクトの`receiptEmail`が指定されていて、支払い画面でメールアドレスが指定されなかった場合は、`receiptEmail`にレシートが送信されます。

## 2016-08-31

### 機能

- Payment API
  - 支払いの作成
  - 支払い情報の取得
  - 支払い情報の更新
  - 支払い一覧の取得
