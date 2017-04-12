i = 10
j = 10
s = 20
d = 0
body = []
total = 10
ci = 15
cj = 15

setup = ->
	createCanvas 400,400
	frameRate 5
	rectMode CENTER

pickCherry = ->
	if dist(i,j,ci,cj) == 0
		total++
		ci = int random 20
		cj = int random 20

draw = ->
	head = [i,j]
	bg 0.5
	fc 0
	text "score:",20,20
	text total-10,55,20
	fc 1
	for [x,y] in body
		if dist(x,y,i,j)==0
			bg 0
			return

	fc 1

	pickCherry()

	rect s*i,s*j,s,s

	for [x,y] in body
		fc 0,1,0
		rect s*x,s*y,s,s 
	fc 1,0,0
	circle s*ci,s*cj,s,s

	fc 1

	if total < body.length
		body.shift()
	body.push [i,j]

	if d == 0 then i = (i+1) %% 20
	if d == 1 then j = (j-1) %% 20
	if d == 2 then i = (i-1) %% 20
	if d == 3 then j = (j+1) %% 20
keyPressed = ->
	if keyCode == LEFT_ARROW then d = (d+1)%4
	if keyCode == RIGHT_ARROW then d = [3,0,1,2][d]

mousePressed = ->total++
