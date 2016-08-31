# エラー

## エラーレスポンスの構造

```
{
  "type": <string>, // 必ず入ります
  "code": <string>,
  "message": <string>,
  "params": {
    "foo": bar,
    "bar": baz
  }
}
```

## タイプ

|type|説明|status|
|:----:|:----:|:----:|
|`authentication_error`|認証/認可周りのエラーです|`401`|
|`invalid_request_error`|クライアントからのリクエストに関するエラーです|`400`|
|`api_error`|サーバー側の問題によるエラーです|`500`, `502`, `503`, `504`|

## コード

|code|説明|status|response header|
|:----:|:----:|:----:|:----:|
|`no_api_key`|`Authorization`ヘッダがない|`401`|`WWW-Authenticate: Bearer realm="no_api_key"`|
|`invalid_api_key`|API Keyが失効しているか、その他の理由で不正|`401`|`WWW-Authenticate: Bearer error="invalid_api_key"`|
|`already_processed`|処理済みの支払いを操作した|`400`||
|`invalid_parameter`|パラメータに関するバリデーションエラー|`400`||
|`merchant_not_allowed`|マーチャントに許可されていない操作をした|`400`||
|`payment_not_found`|存在しない支払いが指定された|`400`||
