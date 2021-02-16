# アプリケーション名
- choice-style

# アプリケーションの概要
- 事前に洋服を登録しておくと、『どの洋服を身につけていこう』などと迷った時にトップページからすぐに条件にあう洋服の中からランダムに１つ表示して選んでくれます。

# URL
- https://choice-style.herokuapp.com/

# テスト用アカウント
- アドレス:test@test
- パスワード:aaa111

# 利用方法
1. まず右のメニューからスタイルを登録をクリックします。
2. 登録したい洋服の`画像`、`種類（帽子、トップスなど１１種類）`、`身につけたい季節`、`ジャンル`を選択します。その下のメモは任意です。  
空欄でも構いません。購入した日にち、値段などお好きに入力してください。
3. 『送信する』ボタンをクリックします。  
これで登録完了となります。
4. 登録したい分の洋服を登録し終わったら、トップページから条件を入力します。  
種類は必須となり、その他２つは任意となります。  
任意のものは入力しなければ全ての中から抽選となります。  

（例）ジャンルにて 
レディースなど、選択すればその中からヒットしたものを抽選対象とし、  
レディース、メンズ、ユニセックス、どれも選ばなければ３つ全てを抽選対象とします。   
5. 検索にヒットしたものからランダムで１つ表示されます。  
ヒットするものがない場合は表示されません。

# 目指した課題の解決
- 朝、着るものに迷ってしまい、時間を使ってしまう方に向けて作成しました。

# 要件定義

|機能|目的|詳細|ストーリーやユースケース|
|:--|:--|:--|:--|
|ユーザー認証機能|ユーザーごとに登録し、スタイルの管理をしやすくするため|・ニックネーム<br />・Eメールアドレス<br />・パスワード<br />・パスワード確認<br />・生年月日<br />を入力すればユーザー登録ができる|・ユーザー登録方法は手打ちのみです|
|投稿機能|投稿することで登録が完了し、出力されるようにするため|・画像<br />・種類<br />・季節<br />・ジャンル<br />が選択されていれば登録できる<br />※メモは任意のため空でも可能です|・１つのアカウントで、夫婦やカップルなど、複数人での使用も考慮しています|
|検索機能|ランダムで１つ表示させる、を実現するため|条件を入力することでマッチしたものからランダムに１つ表示します<br />また、編集、削除、詳細への遷移も検索で行います|・最低でも１つは登録されていることが前提となります。<br />・表示された画像をクリックすると詳細画面に飛べます|
|編集機能|登録時の入力ミスや、季節などを変更したい時に変更できるようにするため|編集画面で登録データを変更できます|・編集画面は右メニューから検索するか詳細画面から遷移できます<br />・登録されていることが前提です<br />・画像は再入力する必要はないです<br />|
|削除機能|売却や捨ててしまった時などに削除できるようにするため|右メニューの検索結果から直接削除するか、詳細画面の削除ボタンを押すと削除できます|・登録されていることが前提です<br />・右メニューからの検索結果で直接削除できます（アラート有）<br />・詳細画面からも削除が可能です（アラート無）|
|詳細表示機能|登録時のデータを確認できるようにするため|詳細画面に遷移すると編集、削除、登録時のデータの確認を行えます|・登録されていることが前提です<br />・右メニューから検索で遷移できます<br />・トップページのランダム結果からも遷移できます|
|AWSの実装|リンク切れを起こされると困るアプリケーションのため必須|リンク切れ対策です|なし|
|エラー出力機能|何に対してエラーが出ているのか可視化するため|入力した情報が正常でない場合、エラー文が出力されます|・ユーザー新規登録ではリアルタイムでチェックされます（フォーカスが外れた時）<br />・他に関しては、ドロップダウン式の選択が多数のため、出力タイミングが図れないので実装していません。<br />入力漏れがあればエラーが出ている画面に遷移します。|
|プレビュー機能|登録時に画像をその場に出した方がわかりやすいため|非同期通信を使って横に画像を出力しています|・画像をその場で変更すれば、変更した画像が表示されます|
|複数投稿機能|服を１０００枚など所持していた場合、１枚ずつ投稿では時間がかかるため|複数枚の情報を入力し、１つのフォームから投稿できます|未実装|
|ランダム出力時に複数の種類表示機能|靴と靴下など、２種類以上出したい時にその回数分だけ検索しないといけないため|１つのフォームから出力したい種類を複数選択すれば、選択したものの中から１つずつ表示してくれます|未実装|
|ajaxを利用して検索結果をその場に出す機能|詳細などの検索結果を横に出せれば、画面遷移の必要がなくなるため|検索結果をすぐ横に出してくれます|未実装|

# 実装予定の機能

|機能|目的|実装できなかった理由|課題|
|:--|:--|:--|:--|
|複数投稿機能|服を１０００枚など所持していた場合、１枚ずつ投稿では時間がかかるため|例えば、３つの情報を入力した場合、３つのレコードにそれぞれ保存されれば良いのだが、<br />１つのレコードに３つの情報が入ってしまい、編集や削除を行うと３つ全てに作用してしまう|１つのフォームから複数のレコードに保存する方法の勉強が必要<br />おそらくフォームオブジェクトを使用すれば可能かもしれない|
|ランダム出力時に複数の種類表示機能|靴と靴下など、２種類以上出したい時にその回数分だけ検索しないといけないため|検索結果からidの異なる複数種類出力させる方法がわからなかった|ransackの更なる理解が必要|
|ajaxを利用して検索結果をその場に出す機能|詳細などの検索結果を横に出せれば、画面遷移の必要がなくなるため|jsonでの通信がうまくいかず|javascriptの更なる理解が必要<br />ユーザー詳細を触っている時に、before_action :authenticate_user!をコントローラーに定義しているとrender json:が変な挙動をすることを確認。<br />authenticate_user!を外せば何か変わるかもしれない。要検証|

# 機能のgif
- ランダムで出力される様子
[![Image from Gyazo](https://i.gyazo.com/7542c4e9c93fd92e1411a9ea08d39bfa.gif)](https://gyazo.com/7542c4e9c93fd92e1411a9ea08d39bfa)

# ER図
[![Image from Gyazo](https://i.gyazo.com/4b002fe187443cd225e4e8583cb72a6d.png)](https://gyazo.com/4b002fe187443cd225e4e8583cb72a6d)

# テーブル設計

## users テーブル

|column            |Type   |Options                  |
|------------------|-------|-------------------------|
|nickname          |string |null: false              |
|email             |string |null: false, unique: true|
|encrypted_password|string |null: false              |
|date              |date   |null: false              |

### Association
- has_many :posts

## posts テーブル

|column            |Type      |Options                  |
|------------------|----------|-------------------------|
|memo              |text      |                         |
|user_id           |references|null: false              |
|season            |integer   |null: false,ActiveHash   |
|gender            |integer   |null: false,ActiveHash   |
|clothes           |integer   |null: false,ActiveHash   |

### Association
- belongs_to :user

# ローカル環境
- rails 6.0.0

## git clone
% cd
% git clone https://github.com/takashi-marumori/choice-style.git
% bundle install
% yarn install
% rails db:create
% rails db:migrate