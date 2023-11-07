xx.[データベース][Level2] データベースを正規化できる
データベースを正規化できる
エンティティを定義した EC サイトの仕様をベースとして進みます。

1. 第一正規形
ECサイトを、第一正規形になるようテーブル設計してください。テーブル名と、テーブルに紐づくカラム名とプライマリーキーを記載してください。なお、テーブル名とカラム名は日本語で大丈夫です。

その際に、下記のポイントを抑えるようにしてください。

アプリケーションとして成立すること（プログラムを組んだ際に仕様を満たして動作すること）
テーブルごとにプライマリーキーが設定されていること
1つのセルに1つの値のみが含まれること
以下、回答例です。

[ユーザーテーブル]

ID
名前
プライマリーキー：ID


↓回答
[ユーザーテーブル]
ユーザーID
ユーザー名
プライマリーキー：ユーザーID

[購入履歴テーブル]
購入ID
ユーザーID
購入日付
プライマリーキー：購入ID

[商品テーブル]
商品ID
商品名
カテゴリー
値段
プライマリーキー：商品ID

2. 第二正規形
ECサイトの第一正規形の設計を、第二正規形になるようテーブル設計してください。テーブル名と、テーブルに紐づくカラム名とプライマリーキーを記載してください。なお、テーブル名とカラム名は日本語で大丈夫です。

その際に、下記のポイントを抑えるようにしてください。

アプリケーションとして成立すること（プログラムを組んだ際に仕様を満たして動作すること）
部分的関数従属性がないこと

↓回答
[ユーザーテーブル]
ユーザーID
ユーザー名
プライマリーキー：ユーザーID

[購入履歴テーブル]
購入ID
商品ID
購入日付
プライマリーキー：購入ID

[商品テーブル]
商品ID
商品名
カテゴリーID
値段
プライマリーキー：商品ID

[カテゴリーテーブル]
カテゴリーID
カテゴリー名
プライマリーキー：カテゴリーID

3. 第三正規形
ECサイトの第二正規形の設計を、第三正規形になるようテーブル設計してください。テーブル名と、テーブルに紐づくカラム名とプライマリーキーを記載してください。なお、テーブル名とカラム名は日本語で大丈夫です。

なお今回は、要件として「カテゴリーIDをキーとして、カテゴリーごとに商品を検索できる」が追加されたとします。

その際に、下記のポイントを抑えるようにしてください。

アプリケーションとして成立すること（プログラムを組んだ際に仕様を満たして動作すること）
推移的関数従属性がないこと

[ユーザーテーブル]
ユーザーID（プライマリーキー）
ユーザー名

[購入履歴テーブル]
購入ID（プライマリーキー）
ユーザーID（外部キー）
購入日付

[商品テーブル]
商品ID（プライマリーキー）
商品名
値段

[カテゴリーテーブル]
カテゴリーID（プライマリーキー）
カテゴリー名

[商品カテゴリーテーブル]
商品ID（外部キー）
カテゴリーID（外部キー）



4. ボイスコッド正規形
病院の管理システムのデータベースを設計してください。

要件は次の通りです。

患者と診療科が決まると担当医師も決まる(担当医師は一人のみ)
一人の医師は一つの診療科を担当する
一人の患者は複数の診療科を受診することがある
現在、次のテーブルが作成されています。

[担当医師テーブル]

患者
診療科
担当医師
プライマリーキー：患者,診療科

このテーブルはボイスコッド正規形になっていません。

このテーブルがボイスコッド正規形になるよう設計してください。テーブル名と、テーブルに紐づくカラム名とプライマリーキーを記載してください。なお、テーブル名とカラム名は日本語で大丈夫です。

[患者テーブル]
患者
診療科
プライマリーキー：患者

[診療科テーブル]
診療科ID
診療科名

[担当医師テーブル]
担当医師
プライマリーキー：診療科

[担当医療テーブル]
患者ID
診療科ID
担当医師ID