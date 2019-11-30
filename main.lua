
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720


-- -- background image and starting scroll location (X axis)
local secretary = love.graphics.newImage('secretary.png')
local teacher = love.graphics.newImage('teacher.png')
local fairy = love.graphics.newImage('fairy-small.png')
local cat = love.graphics.newImage('cat.png')
local fairysetplay001 = love.graphics.newImage('fairy-setplay001.png')
local fairysetplay002 = love.graphics.newImage('fairy-setplay002.png')
local fairysetplay003 = love.graphics.newImage('fairy-setplay003.png')

local ablock = love.graphics.newImage('a-block.jpg')
local bblock = love.graphics.newImage('b-block.jpg')
local cblock = love.graphics.newImage('c-block.jpg')
local dblock = love.graphics.newImage('d-block.jpg')
local eblock = love.graphics.newImage('e-block.jpg')
local fblock = love.graphics.newImage('f-block.jpg')
local gblock = love.graphics.newImage('g-block.jpg')
local hblock = love.graphics.newImage('h-block.jpg')
local iblock = love.graphics.newImage('i-block.jpg')
local jblock = love.graphics.newImage('j-block.jpg')
local kblock = love.graphics.newImage('k-block.jpg')
local lblock = love.graphics.newImage('l-block.jpg')
local mblock = love.graphics.newImage('m-block.jpg')
local nblock = love.graphics.newImage('n-block.jpg')
local oblock = love.graphics.newImage('o-block.jpg')
local pblock = love.graphics.newImage('p-block.jpg')
local qblock = love.graphics.newImage('q-block.jpg')
local rblock = love.graphics.newImage('r-block.jpg')
local sblock = love.graphics.newImage('s-block.jpg')
local tblock = love.graphics.newImage('t-block.jpg')
local ublock = love.graphics.newImage('u-block.jpg')
local vblock = love.graphics.newImage('v-block.jpg')
local wblock = love.graphics.newImage('w-block.jpg')
local xblock = love.graphics.newImage('x-block.jpg')
local yblock = love.graphics.newImage('y-block.jpg')
local zblock = love.graphics.newImage('z-block.jpg')


local isASelected_freeplay = false
local isBSelected_freeplay = false

local ablockXfree = 100
local ablockYfree = 100
local bblockXfree = 300
local bblockYfree = 300


local letters = {
                    A = {char="A", isSelected = false, x=80, y=0, placed = false, image=ablock}, 
                    B = {char="B", isSelected = false, x=160, y=0, placed = false, image=bblock}, 
                    C = {char="C", isSelected = false, x=240, y=0, placed = false, image=cblock}, 
                    D = {char="D", isSelected = false, x=320, y=0, placed = false, image=dblock}, 
                    E = {char="E", isSelected = false, x=400, y=0, placed = false, image=eblock}, 
                    F = {char="F", isSelected = false, x=480, y=0, placed = false, image=fblock}, 
                    G = {char="G", isSelected = false, x=560, y=0, placed = false, image=gblock}, 
                    H = {char="H", isSelected = false, x=560, y=80, placed = false, image=hblock}, 
                    I = {char="I", isSelected = false, x=560, y=160, placed = false, image=iblock}, 
                    J = {char="J", isSelected = false, x=560, y=240, placed = false, image=jblock}, 
                    K = {char="K", isSelected = false, x=560, y=320, placed = false, image=kblock},
                    L = {char="L", isSelected = false, x=560, y=400, placed = false, image=lblock}, 
                    M = {char="M", isSelected = false, x=560, y=480, placed = false, image=mblock}, 
                    N = {char="N", isSelected = false, x=560, y=560, placed = false, image=nblock}, 
                    O = {char="O", isSelected = false, x=480, y=560, placed = false, image=oblock}, 
                    P = {char="P", isSelected = false, x=400, y=560, placed = false, image=pblock}, 
                    Q = {char="Q", isSelected = false, x=320, y=560, placed = false, image=qblock}, 
                    R = {char="R", isSelected = false, x=240, y=560, placed = false, image=rblock}, 
                    S = {char="S", isSelected = false, x=160, y=560, placed = false, image=sblock}, 
                    T = {char="T", isSelected = false, x=80, y=560, placed = false, image=tblock}, 
                    U = {char="U", isSelected = false, x=0, y=560, placed = false, image=ublock}, 
                    V = {char="V", isSelected = false, x=0, y=480, placed = false, image=vblock}, 
                    W = {char="W", isSelected = false, x=0, y=400, placed = false, image=wblock}, 
                    X = {char="X", isSelected = false, x=0, y=320, placed = false, image=xblock}, 
                    Y = {char="Y", isSelected = false, x=0, y=240, placed = false, image=yblock}, 
                    Z = {char="Z", isSelected = false, x=0, y=160, placed = false, image=zblock}
                }
      
local target1 = {x = 160, y = 430}
local target2 = {x = 260, y = 430}
local target3 = {x = 360, y = 430}

local collision = false

mouse = {}

sound = love.audio.newSource("bird.mp3", "static") -- the "static" tells LÖVE to load the file into memory, good for short sound effects
woodblock = love.audio.newSource("woodblock.wav", "static")


function love.load()

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true
    })
    largeFont = love.graphics.newFont('font.ttf', 32)
    gameState = 'start'

    -- for selecting
    aBlock_freeplay = 	{hover = false, text = "A", x = 200, y = 100, call = selectBlockAFreePlay}
    bBlock_freeplay = 	{hover = false, text = "B", x = 200, y = 100, call = selectBlockBFreePlay}

    fairysprite = fairysetplay001

    -- animation
    animation = newAnimation(love.graphics.newImage("fairy-spritesheet.png"), 400, 400, 1.5)

end


function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'screen2'
        elseif gameState == 'screen2' then
            gameState = 'menu'
        elseif gameState == 'menu' then
            gameState = 'freeplay'
        elseif gameState == 'done' then
            -- game is simply in a restart phase here, but will set the serving
            -- player to the opponent of whomever won for fairness!
            gameState = 'serve'
        end
    elseif key == 'p' then
        gameState = 'setplay'

    end
end


function love.draw()
             
    love.graphics.setFont(largeFont)
    love.graphics.clear(0.4, 0.4, 0.8, 255)

    if gameState == 'start' then
        love.graphics.draw(secretary, 440, 20, 0, 0.4, 0.4)
        love.graphics.printf('Oh wonderful, a new learner.', 0, 600, WINDOW_WIDTH, 'center')

    elseif gameState == 'screen2' then
        love.graphics.draw(teacher, 440, 20, 0, 0.4, 0.4)
        love.graphics.printf('Hurry child, there is much to do. Do not tarry.', 0, 600, WINDOW_WIDTH, 'center')


    elseif gameState == 'menu' then
        love.graphics.rectangle('line', 640-200, 20, 400, 670)
        love.graphics.printf('MENU', 0, 30, WINDOW_WIDTH, 'center')

        love.graphics.printf('SETPLAY MODE', 0, 100, WINDOW_WIDTH, 'center')
        love.graphics.printf('FREEPLAY MODE', 0, 140, WINDOW_WIDTH, 'center')

    elseif gameState == 'freeplay' then

        -- draw stage
        love.graphics.rectangle('line', 20, 20, 900, 670)
        love.graphics.draw(fairy, 930, 150, 0, 1, 1)
        love.graphics.printf('Press "p" for', -50, 30, WINDOW_WIDTH, 'right')
        love.graphics.printf('setplay mode', -50, 70, WINDOW_WIDTH, 'right')

        -- draw block A
        love.graphics.printf(aBlock_freeplay.text, ablockXfree - 50, ablockYfree + 50 - 16, 200, "center")
        love.graphics.rectangle('line', ablockXfree, ablockYfree, 100, 100)

        -- draw block B
        love.graphics.printf(bBlock_freeplay.text, bblockXfree - 50, bblockYfree + 50 - 16, 200, "center")
        love.graphics.rectangle('line', bblockXfree, bblockYfree, 100, 100)

        -- A block movement
        if isASelected_freeplay == false then
        elseif isASelected_freeplay == true then
            if collision == false then
                if love.keyboard.isDown('w') then
                    ablockYfree = ablockYfree - 3
                elseif love.keyboard.isDown('s') then
                    ablockYfree = ablockYfree + 3
                elseif love.keyboard.isDown('a') then
                    ablockXfree = ablockXfree - 3
                elseif love.keyboard.isDown('d') then
                    ablockXfree = ablockXfree + 3
                end
            elseif collision == true then
                if love.keyboard.isDown('w') then
                    ablockYfree = ablockYfree + 10
                elseif love.keyboard.isDown('s') then
                    ablockYfree = ablockYfree - 10
                elseif love.keyboard.isDown('a') then
                    ablockXfree = ablockXfree + 10
                elseif love.keyboard.isDown('d') then
                    ablockXfree = ablockXfree - 10
                end
             end
        end

        

        -- B block movement
        if isBSelected_freeplay == false then
        elseif isBSelected_freeplay == true then
            if collision == false then
                if love.keyboard.isDown('w') then
                    bblockYfree = bblockYfree - 3
                elseif love.keyboard.isDown('s') then
                    bblockYfree = bblockYfree + 3
                elseif love.keyboard.isDown('a') then
                    bblockXfree = bblockXfree - 3
                elseif love.keyboard.isDown('d') then
                    bblockXfree = bblockXfree + 3
                end
            elseif collision == true then
                if love.keyboard.isDown('w') then
                    bblockYfree = bblockYfree + 10
                elseif love.keyboard.isDown('s') then
                    bblockYfree = bblockYfree - 10
                elseif love.keyboard.isDown('a') then
                    bblockXfree = bblockXfree + 10
                elseif love.keyboard.isDown('d') then
                    bblockXfree = bblockXfree - 10
                end
            end
        end

    elseif gameState == 'setplay' then

         -- draw stage
        love.graphics.rectangle('line', 00, 00, 990, 720)
        love.graphics.rectangle('line', 00, 00, 640, 640)
        love.graphics.rectangle('line', 80, 80, 480, 480)

        love.graphics.rectangle('line', 640, 00, 350, 80)
        love.graphics.rectangle('line', 640, 80, 350, 520)

        love.graphics.draw(fairysprite, 640, 80, 0, 1, 1)
        love.graphics.rectangle('line', 640, 640, 350, 80)
        love.graphics.printf("audio", 640, 640, 100, "center")


        -- draw blocks      
        for i, letter in pairs(letters) do
            love.graphics.rectangle('line', letter.x, letter.y, 80, 80)
            love.graphics.printf(letter.char, letter.x - 8, letter.y + 24, 100, "center")
            love.graphics.draw(letter.image, letter.x, letter.y, 0, 0.7, 0.7)
        end    
    
        -- Block movement
        for i, letter in pairs(letters) do
            if letter.isSelected == true then
                if love.keyboard.isDown('w') then
                    letter.y = letter.y - 1
                elseif love.keyboard.isDown('s') then
                    letter.y = letter.y + 1
                elseif love.keyboard.isDown('a') then
                    letter.x = letter.x - 1
                elseif love.keyboard.isDown('d') then
                    letter.x = letter.x + 1
                end
            end
        end

        -- draw subject
        love.graphics.draw(cat, 200, 100, 0, 1, 1)
        love.graphics.rectangle('line', target1.x, target1.y, 80, 80)
        love.graphics.rectangle('line', target2.x, target2.y, 80, 80)
        love.graphics.rectangle('line', target3.x, target3.y, 80, 80)
    end

     -- for correct letter placement
    if letters.C.placed == false then
        if (letters.C.x == target1.x and letters.C.y == target1.y) then
            letters.C.placed = true
            fairysprite = fairysetplay003
            letters.C.isSelected = false
        end
    end

    if letters.A.placed == false then
        if (letters.A.x == target2.x and letters.A.y == target2.y) then
            letters.A.placed = true
            fairysprite = fairysetplay003
            letters.A.isSelected = false
        end
    end

    if letters.T.placed == false then
        if (letters.T.x == target3.x and letters.T.y == target3.y) then
            letters.T.placed = true
            fairysprite = fairysetplay003
            letters.T.isSelected = false
        end
    end

    if (letters.C.placed == true and letters.A.placed == true and letters.T.placed == true) then
        local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
        love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum])
    end
end


function love.update(dt)
	local  	down = love.mouse.isDown(1)
	local 	mx = love.mouse.getX()
	local	my = love.mouse.getY()
    menu_mousehandling_freeplay(mx, my, down)
    menu_mousehandling_setplay(mx, my, down)
    collision = CheckCollision(ablockXfree, ablockYfree, bblockXfree, bblockYfree, cblockX, cblockY)
    print(collision)


    -- animation
    animation.currentTime = animation.currentTime + dt
    if animation.currentTime >= animation.duration then
        animation.currentTime = animation.currentTime - animation.duration
    end

    if (letters.C.placed == true and down == true) then
        fairysprite = fairysetplay001
    end
end




-- mouse
function menu_mousehandling_setplay(mx, my, down)
    for i, letter in pairs(letters) do
        if mx > letter.x and mx < letter.x + 80 and my > letter.y and my < letter.y + 80 then
            letter.hover=true
            if down == true then letter.isSelected = true
                fairysprite = fairysetplay002
                woodblock:play()
        end
        else
            letter.hover=false
            if down == true then letter.isSelected = false end
        end
    end

    -- audio
    if mx > 600 and mx < 950 and my > 600 and my < 700 and down == true then
        sound:play()
    end
end



-- Animation

function newAnimation(image, width, height, duration)
    local animation = {}
    animation.spriteSheet = image;
    animation.quads = {};

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    animation.duration = duration or 1
    animation.currentTime = 0
    return animation
end


-- free play mode

function menu_mousehandling_freeplay(mx, my, down)

    -- Selecting
    
        -- A block
        if mx > ablockXfree and mx < ablockXfree + 100 and my > ablockYfree and my < ablockYfree + 100 then
            aBlock_freeplay.hover=true
            if down == true then aBlock_freeplay.call() end
        else
            aBlock_freeplay.hover=false
            if down == true then isASelected_freeplay = false end
        end
    
         -- B block
        if mx > bblockXfree and mx < bblockXfree + 100 and my > bblockYfree and my < bblockYfree + 100 then
            bBlock_freeplay.hover=true
            if down == true then bBlock_freeplay.call() end
        else
            bBlock_freeplay.hover=false
            if down == true then isBSelected_freeplay = false end
        end
    end


function selectBlockAFreePlay()
    isASelected_freeplay = true      function newAnimation(image, width, height, duration)
        local animation = {}
        animation.spriteSheet = image;
        return animation
    end
end

function selectBlockBFreePlay()
    isBSelected_freeplay = true
end

-- Collision detection function;
-- Returns true if two boxes overlap, false if they don't;
-- x1,y1 are the top-left coords of the first box, while w1,h1 are its width and height;
-- x2,y2,w2 & h2 are the same, but for the second box.
function CheckCollision(ablockX, ablockY, bblockX, bblockY)
    return  ablockX < bblockX+100 and
            bblockX < ablockX+100 and
            ablockY < bblockY+100 and
            bblockY < ablockY+100
end