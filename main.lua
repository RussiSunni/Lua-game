
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
    cBlock_setplay = 	{hover = false, text = "C", x = 0, y = 0, call = selectBlockCSetPlay}

    fairysprite = fairysetplay001

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
        love.graphics.rectangle('line', 00, 00, 950, 700)
        love.graphics.rectangle('line', 00, 00, 600, 600)
        love.graphics.rectangle('line', 80, 80, 440, 440)
        love.graphics.rectangle('line', 600, 00, 350, 80)
        love.graphics.rectangle('line', 600, 80, 350, 520)
        love.graphics.draw(fairysprite, 600, 80, 0, 1, 1)
        love.graphics.rectangle('line', 600, 600, 350, 100)
        love.graphics.printf("audio", 600, 600, 100, "center")





        -- draw blocks

        love.graphics.rectangle('line', ablockXset, ablockYset, 80, 80)
        love.graphics.printf("A", ablockXset - 8, ablockYset + 24, 100, "center")

        love.graphics.rectangle('line', bblockXset, bblockYset, 80, 80)
        love.graphics.printf("B", bblockXset - 8, bblockYset + 24, 100, "center")

        love.graphics.rectangle('line', cblockXset, cblockYset, 80, 80)
        love.graphics.printf("C", cblockXset - 8, cblockYset + 24, 100, "center")




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

--  -- A block
    if mx > ablockXset and mx < ablockXset + 80 and my > ablockYset and my < ablockYset + 80 then
        aBlock_setplay.hover=true
        if down == true then aBlock_setplay.call() end
    else
        aBlock_setplay.hover=false
        if down == true then isASelected_setplay = false end
    end 
  
 

--     -- B block
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

    -- audio
    if mx > 600 and mx < 950 and my > 600 and my < 700 and down == true then
     
        sound:play()        

    end 
   

end


-- Free play mode

function selectBlockAFreePlay()  
    isASelected_freeplay = true      
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