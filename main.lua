
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720


-- -- background image and starting scroll location (X axis)
local secretary = love.graphics.newImage('secretary.png')
local teacher = love.graphics.newImage('teacher.png')
local fairy = love.graphics.newImage('fairy-small.png')
local cat = love.graphics.newImage('cat.png')
local fairysetplay001 = love.graphics.newImage('fairy-setplay001.png')
local fairysetplay002 = love.graphics.newImage('fairy-setplay002.png')


-- local a = love.graphics.newImage('A.png')
-- local b = love.graphics.newImage('B.png')
-- local c = love.graphics.newImage('C.png')

local isASelected_freeplay = false
local isBSelected_freeplay = false

local isASelected_setplay = false
local isBSelected_setplay = false
local isCSelected_setplay = false
local isDSelected_setplay = false
local isESelected_setplay = false
local isFSelected_setplay = false
local isGSelected_setplay = false
local isHSelected_setplay = false
local isISelected_setplay = false

local ablockXfree = 100
local ablockYfree = 100
local bblockXfree = 300
local bblockYfree = 300


local ablockXset = 80
local ablockYset = 0
local bblockXset = 160
local bblockYset = 0
local cblockXset = 240
local cblockYset = 0
local dblockXset = 320
local dblockYset = 0
local eblockXset = 400
local eblockYset = 0
local fblockXset = 480
local fblockYset = 0
local gblockXset = 560
local gblockYset = 0
local hblockXset = 560
local hblockYset = 80
local iblockXset = 560
local iblockYset = 160


local target1 = {x = 160, y = 430}



local collision = false

mouse = {}

sound = love.audio.newSource("bird.mp3", "static") -- the "static" tells LÖVE to load the file into memory, good for short sound effects


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

  

    aBlock_setplay = 	{hover = false, text = "A", x = 200, y = 100, call = selectBlockASetPlay}
    bBlock_setplay = 	{hover = false, text = "B", x = 200, y = 100, call = selectBlockBSetPlay}
    cBlock_setplay = 	{hover = false, text = "C", x = 200, y = 100, call = selectBlockCSetPlay}
    dBlock_setplay = 	{hover = false, text = "D", x = 200, y = 100, call = selectBlockDSetPlay}
    eBlock_setplay = 	{hover = false, text = "E", x = 200, y = 100, call = selectBlockESetPlay}
    fBlock_setplay = 	{hover = false, text = "F", x = 200, y = 100, call = selectBlockFSetPlay}
    gBlock_setplay = 	{hover = false, text = "G", x = 200, y = 100, call = selectBlockGSetPlay}
    hBlock_setplay = 	{hover = false, text = "H", x = 200, y = 100, call = selectBlockHSetPlay}
    iBlock_setplay = 	{hover = false, text = "I", x = 200, y = 100, call = selectBlockISetPlay}

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


 
        local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
        love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum])
      

        love.graphics.draw(secretary, 440, 20, 0, 0.4, 0.4)
        love.graphics.printf('Oh wonderful, a new learner.', 0, 600, WINDOW_WIDTH, 'center')

    elseif gameState == 'screen2' then   
        love.graphics.draw(teacher, 440, 20, 0, 0.4, 0.4)
        love.graphics.printf('Hurry child, there is much to do. Do not tarry.', 0, 600, WINDOW_WIDTH, 'center')

    elseif gameState == 'freeplay' then

        -- draw stage
        love.graphics.rectangle('line', 20, 20, 900, 670)
        love.graphics.draw(fairy, 930, 150, 0, 1, 1)
        love.graphics.printf('Press "p" for', -50, 30, WINDOW_WIDTH, 'right')
        love.graphics.printf('setplay mode', -50, 70, WINDOW_WIDTH, 'right')

        -- draw block A
        love.graphics.printf(aBlock_freeplay.text, ablockXfree - 50, ablockYfree + 50 - 16, 200, "center")
        love.graphics.rectangle('line', ablockXfree, ablockYfree, 100, 100)
        
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

        -- draw block B
        love.graphics.printf(bBlock_freeplay.text, bblockXfree - 50, bblockYfree + 50 - 16, 200, "center")
        love.graphics.rectangle('line', bblockXfree, bblockYfree, 100, 100)

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

        love.graphics.rectangle('line', ablockXset, ablockYset, 80, 80)
        love.graphics.printf("A", ablockXset - 8, ablockYset + 24, 100, "center")

        love.graphics.rectangle('line', bblockXset, bblockYset, 80, 80)
        love.graphics.printf("B", bblockXset - 8, bblockYset + 24, 100, "center")

        love.graphics.rectangle('line', cblockXset, cblockYset, 80, 80)
        love.graphics.printf("C", cblockXset - 8, cblockYset + 24, 100, "center")

        love.graphics.rectangle('line', dblockXset, dblockYset, 80, 80)
        love.graphics.printf("D", dblockXset - 8, dblockYset + 24, 100, "center")

        love.graphics.rectangle('line', eblockXset, eblockYset, 80, 80)
        love.graphics.printf("E", eblockXset - 8, eblockYset + 24, 100, "center")

        love.graphics.rectangle('line', fblockXset, fblockYset, 80, 80)
        love.graphics.printf("F", fblockXset - 8, fblockYset + 24, 100, "center")

        love.graphics.rectangle('line', gblockXset, gblockYset, 80, 80)
        love.graphics.printf("G", gblockXset - 8, gblockYset + 24, 100, "center")

        love.graphics.rectangle('line', hblockXset, hblockYset, 80, 80)
        love.graphics.printf("H", hblockXset - 8, hblockYset + 24, 100, "center")

        love.graphics.rectangle('line', iblockXset, iblockYset, 80, 80)
        love.graphics.printf("I", iblockXset - 8, iblockYset + 24, 100, "center")






        -- for i = 1, 8 do
        --     love.graphics.rectangle("line", 80 * i - 80, 0, 80, 80)
        -- end
          
        -- -- G - M
        -- for i = 1, 7 do
        --     love.graphics.rectangle("line", 560, 80 + 80 * i - 80, 80, 80)
        --     love.graphics.printf("H", 560, 100, 80, "center")
        --     love.graphics.printf("I", 560, 180, 80, "center")
        --     love.graphics.printf("J", 560, 260, 80, "center")
        --     love.graphics.printf("K", 560, 340, 80, "center")
        --     love.graphics.printf("L", 560, 420, 80, "center")
        --     love.graphics.printf("M", 560, 500, 80, "center")
        --     love.graphics.printf("N", 560, 580, 80, "center")
        -- end

        -- -- N - T
        -- for i = 1, 7 do
        --     love.graphics.rectangle("line", 480 - 80 * i + 80, 560, 80, 80)
        --     love.graphics.printf("O", 480, 580, 80, "center")
        --     love.graphics.printf("P", 400, 580, 80, "center")
        --     love.graphics.printf("Q", 320, 580, 80, "center")
        --     love.graphics.printf("R", 240, 580, 80, "center")
        --     love.graphics.printf("S", 160, 580, 80, "center")
        --     love.graphics.printf("T", 80, 580, 80, "center")
        --     love.graphics.printf("U", 00, 580, 80, "center")
        -- end

        --  -- U - T
        --  for i = 1, 7 do
        --     love.graphics.rectangle("line", 00, 560 - 80 * i + 80, 80, 80)
        --     love.graphics.printf("V", 0, 500, 80, "center")
        --     love.graphics.printf("W", 0, 420, 80, "center")
        --     love.graphics.printf("X", 0, 340, 80, "center")
        --     love.graphics.printf("Y", 0, 260, 80, "center")
        --     love.graphics.printf("Z", 0, 180, 80, "center")
    
        -- end


        -- Block movement

        -- A block
        if isASelected_setplay == true then   
            if love.keyboard.isDown('w') then
                ablockYset = ablockYset - 1
            elseif love.keyboard.isDown('s') then
                ablockYset = ablockYset + 1
            elseif love.keyboard.isDown('a') then
                ablockXset = ablockXset - 1
            elseif love.keyboard.isDown('d') then
                ablockXset = ablockXset + 1
            end
        end

         -- B block
         if isBSelected_setplay == true then    
            if love.keyboard.isDown('w') then
                bblockYset = bblockYset - 1
            elseif love.keyboard.isDown('s') then
                bblockYset = bblockYset + 1
            elseif love.keyboard.isDown('a') then
                bblockXset = bblockXset - 1
            elseif love.keyboard.isDown('d') then
                bblockXset = bblockXset + 1
            end
        end

        -- C block
        if isCSelected_setplay == true then         
            if love.keyboard.isDown('w') then
                cblockYset = cblockYset - 1
            elseif love.keyboard.isDown('s') then
                cblockYset = cblockYset + 1
            elseif love.keyboard.isDown('a') then
                cblockXset = cblockXset - 1
            elseif love.keyboard.isDown('d') then
                cblockXset = cblockXset + 1
            end
        end

        -- D block
        if isDSelected_setplay == true then         
            if love.keyboard.isDown('w') then
                dblockYset = dblockYset - 1
            elseif love.keyboard.isDown('s') then
                dblockYset = dblockYset + 1
            elseif love.keyboard.isDown('a') then
                dblockXset = dblockXset - 1
            elseif love.keyboard.isDown('d') then
                dblockXset = dblockXset + 1
            end
        end

        -- E block
        if isESelected_setplay == true then         
            if love.keyboard.isDown('w') then
                eblockYset = eblockYset - 1
            elseif love.keyboard.isDown('s') then
                eblockYset = eblockYset + 1
            elseif love.keyboard.isDown('a') then
                eblockXset = eblockXset - 1
            elseif love.keyboard.isDown('d') then
                eblockXset = eblockXset + 1
            end
        end

        -- F block
        if isFSelected_setplay == true then         
            if love.keyboard.isDown('w') then
                fblockYset = fblockYset - 1
            elseif love.keyboard.isDown('s') then
                fblockYset = fblockYset + 1
            elseif love.keyboard.isDown('a') then
                fblockXset = fblockXset - 1
            elseif love.keyboard.isDown('d') then
                fblockXset = fblockXset + 1
            end
        end

          -- G block
        if isGSelected_setplay == true then         
            if love.keyboard.isDown('w') then
                gblockYset = gblockYset - 1
            elseif love.keyboard.isDown('s') then
                gblockYset = gblockYset + 1
            elseif love.keyboard.isDown('a') then
                gblockXset = gblockXset - 1
            elseif love.keyboard.isDown('d') then
                gblockXset = gblockXset + 1
            end
        end

        -- H block
        if isHSelected_setplay == true then         
            if love.keyboard.isDown('w') then
                hblockYset = hblockYset - 1
            elseif love.keyboard.isDown('s') then
                hblockYset = hblockYset + 1
            elseif love.keyboard.isDown('a') then
                hblockXset = hblockXset - 1
            elseif love.keyboard.isDown('d') then
                hblockXset = hblockXset + 1
            end
        end

        -- G block
        if isISelected_setplay == true then         
            if love.keyboard.isDown('w') then
                iblockYset = iblockYset - 1
            elseif love.keyboard.isDown('s') then
                iblockYset = iblockYset + 1
            elseif love.keyboard.isDown('a') then
                iblockXset = iblockXset - 1
            elseif love.keyboard.isDown('d') then
                iblockXset = iblockXset + 1
            end
        end

        -- draw subject
        love.graphics.draw(cat, 200, 100, 0, 1, 1)
        love.graphics.rectangle('line', target1.x, target1.y, 80, 80)
        love.graphics.rectangle('line', 260, 430, 80, 80)
        love.graphics.rectangle('line', 360, 430, 80, 80)
    end

     -- for correct letter placement
    if (cblockXset == target1.x and cblockYset == target1.y) then
        love.graphics.printf("match", 100, 100, 100, "center")
        fairysprite = fairysetplay002
        isCSelected_setplay = false
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
end


function menu_mousehandling_freeplay(mx, my, down)

-- Selecting

-- free play mode

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



-- set play mode
function menu_mousehandling_setplay(mx, my, down)

    -- A block
    if mx > ablockXset and mx < ablockXset + 80 and my > ablockYset and my < ablockYset + 80 then
        aBlock_setplay.hover=true
        if down == true then aBlock_setplay.call() end
    else
        aBlock_setplay.hover=false
        if down == true then isASelected_setplay = false end
    end   
 
    -- B block
    if mx > bblockXset and mx < bblockXset + 80 and my > bblockYset and my < bblockYset + 80 then
        bBlock_setplay.hover=true
        if down == true then bBlock_setplay.call() end
    else
        bBlock_setplay.hover=false
        if down == true then isBSelected_setplay = false end
    end 

    -- C block
    if mx > cblockXset and mx < cblockXset + 80 and my > cblockYset and my < cblockYset + 80 then
    	cBlock_setplay.hover=true
    	if down == true then cBlock_setplay.call() end
    else
        cBlock_setplay.hover=false
        if down == true then isCSelected_setplay = false end
    end 

    -- D block
    if mx > dblockXset and mx < dblockXset + 80 and my > dblockYset and my < dblockYset + 80 then
        dBlock_setplay.hover=true
        if down == true then dBlock_setplay.call() end
    else
        dBlock_setplay.hover=false
        if down == true then isDSelected_setplay = false end
    end 

    -- E block
    if mx > eblockXset and mx < eblockXset + 80 and my > eblockYset and my < eblockYset + 80 then
    	eBlock_setplay.hover=true
    	if down == true then eBlock_setplay.call() end
    else
        eBlock_setplay.hover=false
        if down == true then isESelected_setplay = false end
    end 

    -- F block
    if mx > fblockXset and mx < fblockXset + 80 and my > fblockYset and my < fblockYset + 80 then
        fBlock_setplay.hover=true
        if down == true then fBlock_setplay.call() end
    else
        fBlock_setplay.hover=false
        if down == true then isFSelected_setplay = false end
    end 

     -- G block
     if mx > gblockXset and mx < gblockXset + 80 and my > gblockYset and my < gblockYset + 80 then
        gBlock_setplay.hover=true
        if down == true then gBlock_setplay.call() end
    else
        gBlock_setplay.hover=false
        if down == true then isGSelected_setplay = false end
    end 

    -- H block
    if mx > hblockXset and mx < hblockXset + 80 and my > hblockYset and my < hblockYset + 80 then
    	hBlock_setplay.hover=true
    	if down == true then hBlock_setplay.call() end
    else
        hBlock_setplay.hover=false
        if down == true then isHSelected_setplay = false end
    end 

    -- I block
    if mx > iblockXset and mx < iblockXset + 80 and my > iblockYset and my < iblockYset + 80 then
        iBlock_setplay.hover=true
        if down == true then iBlock_setplay.call() end
    else
        iBlock_setplay.hover=false
        if down == true then isISelected_setplay = false end
    end 



    -- audio
    if mx > 600 and mx < 950 and my > 600 and my < 700 and down == true then
     
        sound:play()     
    end 
end


-- Free play mode

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


-- Set play mode

function selectBlockASetPlay()  
    isASelected_setplay = true        
end

function selectBlockBSetPlay()  
    isBSelected_setplay = true   
end

function selectBlockCSetPlay()  
    isCSelected_setplay = true         
end

function selectBlockDSetPlay()  
    isDSelected_setplay = true        
end

function selectBlockESetPlay()  
    isESelected_setplay = true   
end

function selectBlockFSetPlay()  
    isFSelected_setplay = true         
end

function selectBlockGSetPlay()  
    isGSelected_setplay = true        
end

function selectBlockHSetPlay()  
    isHSelected_setplay = true   
end

function selectBlockISetPlay()  
    isISelected_setplay = true         
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