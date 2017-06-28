# 支払い一覧の取得

<table>
  <tr>
    <td>メソッド</td>
    <td>GET</td>
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

ページングを設定することが出来ます。詳しくは[こちら](../../api-spec/pagination.md)。

## レスポンス

|パラメータ名|説明|型|例|
|:----:|:----:|:----:|:----:|
|`object`|オブジェクト|`string`|`list`|
|`hasMore`|次のページがあるかどうか|`boolean`|`true`|
|`totalCount`|全ての支払い数|`int`|`10`|
|`data`|支払いオブジェクトの配列|`array`||

### リクエスト例

```
curl -X "GET" "https://api.coiney.io/api/v1/payments?limit=3" \
  -H "Authorization: Bearer sk_live_hogehogehogehogehogehogehogehoge" \
  -H "X-CoineyPayge-Version: 2016-10-25" \
  -H "Accept: application/json"
```
