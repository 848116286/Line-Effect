# Line-Effect
特定のtagを持つ2つのmarkerをアイテムディスプレイで繋ぐことで、滑らかな線のビジュアルエフェクトを再現します
## 対応バージョン
Minecraft JE 26.2
## 使い方
線で結びたい点に`marker[tag=bot_pa]`,`marker[tag=bot_pb]`を置く
~~~
function line_particle:a
~~~
を実行すると、2つのmarkerを繋ぐようにアイテムディスプレイ`[tag=bot_line_particle_display]`が出現します。  
**注意：markerを消す処理、アイテムディスプレイを消す処理はありません。**

## 使用例
**視点の先の軌跡を描く**  
load時
```
scoreboard objectives add linetime dummy
```

毎tick
```
execute as @a at @s anchored eyes positioned ^ ^ ^4 run summon marker ~ ~ ~ {Tags:["bot_pa"]}
function line_particle:a
kill @e[type=marker,tag=bot_pa]
kill @e[type=marker,tag=bot_pb]
execute as @a at @s anchored eyes positioned ^ ^ ^4 run summon marker ~ ~ ~ {Tags:["bot_pb"]}
scoreboard players add @e[type=item_display,tag=bot_line_particle_display] linetime 1
kill @e[type=item_display,tag=bot_line_particle_display,scores={linetime=32..}]
```
[実行結果動画](https://x.com/qy_qns/status/2092860674259271732 "作成者のxの投稿")

## 注意
- markerを消す処理、アイテムディスプレイを消す処理はありません。
- markerとmarkerの間が約23ブロックを超えるとオーバーフローしてバグが発生します。
- markerが絶対座標約100万を超えるとオーバーフローしてバグが発生します。

# 伝えておくこと
- `s.mcfunction`内の`{id:"light_blue_concrete"}`を変更することで、設置するアイテムディスプレイのアイテムを変更可能。ここをリソースパックで追加したアイテムにすれば、固有のラインエフェクトを実装することができる。
- `s.mcfunction`内の`[0.0625,0.0625,$(l)]`の、0.0625を変更することで、線の形状を変えることも可能。
- 基本的に、`a.mcfunction`,`square.mcfunction`,`square_d.mcfunction`は変更しない方がいいです。
