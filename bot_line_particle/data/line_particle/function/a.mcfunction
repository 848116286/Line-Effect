#各座標のscore化
execute store result score #mx botlp.a store result score #rx botlp.a store result score #lx botlp.a run data get entity @n[type=marker,tag=bot_pa] Pos[0] 1000
execute store result score #my botlp.a store result score #ry botlp.a store result score #ly botlp.a run data get entity @n[type=marker,tag=bot_pa] Pos[1] 1000
execute store result score #mz botlp.a store result score #rz botlp.a store result score #lz botlp.a run data get entity @n[type=marker,tag=bot_pa] Pos[2] 1000
execute store result score #mx botlp.b store result score #rx botlp.b store result score #lx botlp.b run data get entity @n[type=marker,tag=bot_pb] Pos[0] 1000
execute store result score #my botlp.b store result score #ry botlp.b store result score #ly botlp.b run data get entity @n[type=marker,tag=bot_pb] Pos[1] 1000
execute store result score #mz botlp.b store result score #rz botlp.b store result score #lz botlp.b run data get entity @n[type=marker,tag=bot_pb] Pos[2] 1000
#2markerの中点(#m?のbotlp.aに)
scoreboard players operation #mx botlp.a += #mx botlp.b
scoreboard players operation #mx botlp.a /= #2 botlp.a
scoreboard players operation #my botlp.a += #my botlp.b
scoreboard players operation #my botlp.a /= #2 botlp.a
scoreboard players operation #mz botlp.a += #mz botlp.b
scoreboard players operation #mz botlp.a /= #2 botlp.a
execute store result storage bot:lp macro.px float 0.001 run scoreboard players get #mx botlp.a
execute store result storage bot:lp macro.py float 0.001 run scoreboard players get #my botlp.a
execute store result storage bot:lp macro.pz float 0.001 run scoreboard players get #mz botlp.a
#2点の距離を求める(#l?のbotlp.aに差の2乗、和の根号#lのbotlp.aに)
scoreboard players operation #lx botlp.a -= #lx botlp.b
scoreboard players operation #lx botlp.a *= #lx botlp.a
scoreboard players operation #ly botlp.a -= #ly botlp.b
scoreboard players operation #ly botlp.a *= #ly botlp.a
scoreboard players operation #lz botlp.a -= #lz botlp.b
scoreboard players operation #lz botlp.a *= #lz botlp.a
scoreboard players operation #lx botlp.a += #ly botlp.a
scoreboard players operation #lx botlp.a += #lz botlp.a
function line_particle:square
execute store result storage bot:lp macro.l float 0.001 run scoreboard players get #l botlp.a
#回転決める
scoreboard players operation #dd botlp.a = #l botlp.a
scoreboard players operation #dd botlp.a += #rz botlp.b
scoreboard players operation #dd botlp.a -= #rz botlp.a
scoreboard players operation #dd botlp.a *= #l botlp.a
scoreboard players operation #dd botlp.a *= #2 botlp.a
function line_particle:square_d
scoreboard players operation #ry botlp.a -= #ry botlp.b
scoreboard players operation #ry botlp.a *= #1000 botlp.a
scoreboard players operation #ry botlp.a /= #d botlp.a
scoreboard players operation #rx botlp.b -= #rx botlp.a
scoreboard players operation #rx botlp.b *= #1000 botlp.a
scoreboard players operation #rx botlp.b /= #d botlp.a
scoreboard players operation #rz botlp.b -= #rz botlp.a
scoreboard players operation #rz botlp.b += #l botlp.a
scoreboard players operation #rz botlp.b *= #1000 botlp.a
scoreboard players operation #rz botlp.b /= #d botlp.a
execute store result storage bot:lp macro.lr0 float 0.001 run scoreboard players get #ry botlp.a
execute store result storage bot:lp macro.lr1 float 0.001 run scoreboard players get #rx botlp.b
execute store result storage bot:lp macro.lr3 float 0.001 run scoreboard players get #rz botlp.b

function line_particle:s with storage bot:lp macro