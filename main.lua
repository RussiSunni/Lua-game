
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720


-- -- background image and starting scroll location (X axis)
local secretary = love.graphics.newImage('secretary.png')
local teacher = love.graphics.newImage('teacher.png')
local fairy = love.graphics.newImage('fairy-small.png')
local cat = love.graphics.newImage('cat.png')
local fairysetplay001 = love.graphics.newImage('fairy-setplay001.png')
local fairysetplay002 = love.graphics.newImage('fairy-setplay002.png')


local isASelected_freeplay = false
local isBSelected_freeplay = false

local ablockXfree = 100
local ablockYfree = 100
local bblockXfree = 300
local bblockYfree = 300

local letters = {
                    A = {char="A", isSelected = false, x=80, y=0}, 
                    B = {char="B", isSelected = false, x=160, y=0}, 
                    C = {char="C", isSelected = false, x=240, y=0}, 
                    D = {char="D", isSelected = false, x=320, y=0}, 
                    E = {char="E", isSelected = false, x=400, y=0}, 
                    F = {char="F", isSelected = false, x=480, y=0}, 
                    G = {char="G", isSelected = false, x=560, y=0}, 
                    H = {char="H", isSelected = false, x=560, y=80}, 
                    I = {char="I", isSelected = false, x=560, y=160}, 
                    J = {char="J", isSelected = false, x=560, y=240}, 
                    K = {char="K", isSelected = false, x=560, y=320},
                    L = {char="L", isSelected = false, x=560, y=400}, 
                    M = {char="M", isSelected = false, x=560, y=480}, 
                    N = {char="N", isSelected = false, x=560, y=560}, 
                    O = {char="O", isSelected = false, x=480, y=560}, 
                    P = {char="P", isSelected = false, x=400, y=560}, 
                    Q = {char="Q", isSelected = false, x=320, y=560}, 
                    R = {char="R", isSelected = false, x=240, y=560}, 
                    S = {char="S", isSelected = false, x=160, y=560}, 
                    T = {char="T", isSelected = false, x=80, y=560}, 
                    U = {char="U", isSelected = false, x=0, y=560}, 
                    V = {char="V", isSelected = false, x=0, y=480}, 
                    W = {char="W", isSelected = false, x=0, y=400}, 
                    X = {char="X", isSelected = false, x=0, y=320}, 
                    Y = {char="Y", isSelected = false, x=0, y=240}, 
                    Z = {char="Z", isSelected = false, x=0, y=160}
                }
      

-- local isSelected = {A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z}


-- local block = {
--     AX = 80, 
--     AY = 0, 
--     BX = 160, 
--     BY = 0, 
--     CX = 320, 
--     CY = 0, 
--     DX = 400, 
--     DY = 0, 
--     EX = 480, 
--     EY = 0, 
--     FX = 560, 
--     FY = 0, 
--     GX = 560, 
--     GY = 80, 
--     HX = 560, 
--     HY = 160, 
--     IX = 560, 
--     IY = 240, 
--     JX = 560, 
--     JY = 320, 
--     KX = 560, 
--     KY = 400, 
--     LX = 560, 
--     LY = 480, 
--     MX = 560, 
--     MY = 560, 
--     NX = 480, 
--     NY = 560, 
--     OX = 400, 
--     OY = 560, 
--     PX = 320, 
--     PY = 560, 
--     QX = 240, 
--     QY = 560, 
--     RX = 160, 
--     RY = 560, 
--     SX = 80, 
--     SY = 560, 
--     TX = 0, 
--     TY = 560, 
--     UX = 0, 
--     UY = 480, 
--     VX = 0, 
--     VY = 400, 
--     WX = 0, 
--     WY = 320, 
--     XX = 0, 
--     XY = 240, 
--     ZX = 0, 
--     ZY = 160, 
-- } 



-- local bblockXset = 160
-- local bblockYset = 0
-- local cblockXset = 240
-- local cblockYset = 0
-- local dblockXset = 320
-- local dblockYset = 0
-- local eblockXset = 400
-- local eblockYset = 0
-- local fblockXset = 480
-- local fblockYset = 0
-- local gblockXset = 560
-- local gblockYset = 0
-- local hblockXset = 560
-- local hblockYset = 80
-- local iblockXset = 560
-- local iblockYset = 160
-- local jblockXset = 560
-- local jblockYset = 240
-- local kblockXset = 560
-- local kblockYset = 320
-- local lblockXset = 560
-- local lblockYset = 400
-- local mblockXset = 560
-- local mblockYset = 480
-- local nblockXset = 560
-- local nblockYset = 560
-- local oblockXset = 480
-- local oblockYset = 560




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
    jBlock_setplay = 	{hover = false, text = "J", x = 200, y = 100, call = selectBlockJSetPlay}
    kBlock_setplay = 	{hover = false, text = "K", x = 200, y = 100, call = selectBlockKSetPlay}
    lBlock_setplay = 	{hover = false, text = "L", x = 200, y = 100, call = selectBlockLSetPlay}
    mBlock_setplay = 	{hover = false, text = "M", x = 200, y = 100, call = selectBlockMSetPlay}
    nBlock_setplay = 	{hover = false, text = "N", x = 200, y = 100, call = selectBlockNSetPlay}
    oBlock_setplay = 	{hover = false, text = "O", x = 200, y = 100, call = selectBlockOSetPlay}



    sBlock_setplay = 	{hover = false, text = "s", x = 200, y = 100, call = selectBlockSSetPlay}


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

        -- animation
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

      
        for i, letter in pairs(letters) do
            print(letter.x)
            love.graphics.rectangle('line', letter.x, letter.y, 80, 80)
            love.graphics.printf(letter.char, letter.x - 8, letter.y + 24, 100, "center")
        end
    
        -- love.graphics.rectangle('line', letters.A.x, letters.A.y, 80, 80)
        -- love.graphics.printf("A", letters.A.x - 8, letters.A.y + 24, 100, "center")

        -- love.graphics.rectangle('line', letters.B.x, letters.B.y, 80, 80)
        -- love.graphics.printf("B", letters.B.x - 8, letters.B.y + 24, 100, "center")

        -- love.graphics.rectangle('line', letters.C.x, letters.C.y, 80, 80)
        -- love.graphics.printf("C", letters.C.x - 8, letters.C.y + 24, 100, "center")

        -- love.graphics.rectangle('line', dblockXset, dblockYset, 80, 80)
        -- love.graphics.printf("D", dblockXset - 8, dblockYset + 24, 100, "center")

        -- love.graphics.rectangle('line', eblockXset, eblockYset, 80, 80)
        -- love.graphics.printf("E", eblockXset - 8, eblockYset + 24, 100, "center")

        -- love.graphics.rectangle('line', fblockXset, fblockYset, 80, 80)
        -- love.graphics.printf("F", fblockXset - 8, fblockYset + 24, 100, "center")

        -- love.graphics.rectangle('line', gblockXset, gblockYset, 80, 80)
        -- love.graphics.printf("G", gblockXset - 8, gblockYset + 24, 100, "center")

        -- love.graphics.rectangle('line', hblockXset, hblockYset, 80, 80)
        -- love.graphics.printf("H", hblockXset - 8, hblockYset + 24, 100, "center")

        -- love.graphics.rectangle('line', iblockXset, iblockYset, 80, 80)
        -- love.graphics.printf("I", iblockXset - 8, iblockYset + 24, 100, "center")

        -- love.graphics.rectangle('line', jblockXset, jblockYset, 80, 80)
        -- love.graphics.printf("J", jblockXset - 8, jblockYset + 24, 100, "center")

        -- love.graphics.rectangle('line', kblockXset, kblockYset, 80, 80)
        -- love.graphics.printf("K", kblockXset - 8, kblockYset + 24, 100, "center")

        -- love.graphics.rectangle('line', lblockXset, lblockYset, 80, 80)
        -- love.graphics.printf("L", lblockXset - 8, lblockYset + 24, 100, "center")

        -- love.graphics.rectangle('line', mblockXset, mblockYset, 80, 80)
        -- love.graphics.printf("M", mblockXset - 8, mblockYset + 24, 100, "center")

        -- love.graphics.rectangle('line', nblockXset, nblockYset, 80, 80)
        -- love.graphics.printf("N", nblockXset - 8, nblockYset + 24, 100, "center")

        -- love.graphics.rectangle('line', oblockXset, oblockYset, 80, 80)
        -- love.graphics.printf("O", oblockXset - 8, oblockYset + 24, 100, "center")


    
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


        -- -- A block
        -- if letters.A.isSelected == true then
        --     if love.keyboard.isDown('w') then
        --         letters.A.y = letters.A.y - 1
        --     elseif love.keyboard.isDown('s') then
        --         letters.A.y = letters.A.y + 1
        --     elseif love.keyboard.isDown('a') then
        --         letters.A.x = letters.A.x - 1
        --     elseif love.keyboard.isDown('d') then
        --         letters.A.x = letters.A.x + 1
        --     end
        -- end

        --  -- B block
        --  if letters.B.isSelected == true then
        --     if love.keyboard.isDown('w') then
        --         letters.B.y = letters.B.y - 1
        --     elseif love.keyboard.isDown('s') then
        --         letters.B.y = letters.B.y + 1
        --     elseif love.keyboard.isDown('a') then
        --         letters.B.x = letters.B.x - 1
        --     elseif love.keyboard.isDown('d') then
        --         letters.B.x = letters.B.x + 1
        --     end
        -- end

        -- -- C block
        -- if letters.C.isSelected == true then
        --     if love.keyboard.isDown('w') then
        --         letters.C.y = letters.C.y - 1
        --     elseif love.keyboard.isDown('s') then
        --         letters.C.y = letters.C.y + 1
        --     elseif love.keyboard.isDown('a') then
        --         letters.C.x = letters.C.x - 1
        --     elseif love.keyboard.isDown('d') then
        --         letters.C.x = letters.C.x + 1
        --     end
        -- end

        -- -- D block
        -- if isSelected.D == true then
        --     if love.keyboard.isDown('w') then
        --         dblockYset = dblockYset - 1
        --     elseif love.keyboard.isDown('s') then
        --         dblockYset = dblockYset + 1
        --     elseif love.keyboard.isDown('a') then
        --         dblockXset = dblockXset - 1
        --     elseif love.keyboard.isDown('d') then
        --         dblockXset = dblockXset + 1
        --     end
        -- end

        -- -- E block
        -- if isSelected.E == true then
        --     if love.keyboard.isDown('w') then
        --         eblockYset = eblockYset - 1
        --     elseif love.keyboard.isDown('s') then
        --         eblockYset = eblockYset + 1
        --     elseif love.keyboard.isDown('a') then
        --         eblockXset = eblockXset - 1
        --     elseif love.keyboard.isDown('d') then
        --         eblockXset = eblockXset + 1
        --     end
        -- end

        -- -- F block
        -- if isSelected.F == true then
        --     if love.keyboard.isDown('w') then
        --         fblockYset = fblockYset - 1
        --     elseif love.keyboard.isDown('s') then
        --         fblockYset = fblockYset + 1
        --     elseif love.keyboard.isDown('a') then
        --         fblockXset = fblockXset - 1
        --     elseif love.keyboard.isDown('d') then
        --         fblockXset = fblockXset + 1
        --     end
        -- end

        -- -- G block
        -- if isSelected.G == true then
        --     if love.keyboard.isDown('w') then
        --         gblockYset = gblockYset - 1
        --     elseif love.keyboard.isDown('s') then
        --         gblockYset = gblockYset + 1
        --     elseif love.keyboard.isDown('a') then
        --         gblockXset = gblockXset - 1
        --     elseif love.keyboard.isDown('d') then
        --         gblockXset = gblockXset + 1
        --     end
        -- end

        -- -- H block
        -- if isSelected.H == true then
        --     if love.keyboard.isDown('w') then
        --         hblockYset = hblockYset - 1
        --     elseif love.keyboard.isDown('s') then
        --         hblockYset = hblockYset + 1
        --     elseif love.keyboard.isDown('a') then
        --         hblockXset = hblockXset - 1
        --     elseif love.keyboard.isDown('d') then
        --         hblockXset = hblockXset + 1
        --     end
        -- end

        -- -- I block
        -- if isSelected.I == true then
        --     if love.keyboard.isDown('w') then
        --         iblockYset = iblockYset - 1
        --     elseif love.keyboard.isDown('s') then
        --         iblockYset = iblockYset + 1
        --     elseif love.keyboard.isDown('a') then
        --         iblockXset = iblockXset - 1
        --     elseif love.keyboard.isDown('d') then
        --         iblockXset = iblockXset + 1
        --     end
        -- end

        -- -- J block
        -- if isSelected.J == true then
        --     if love.keyboard.isDown('w') then
        --         jblockYset = jblockYset - 1
        --     elseif love.keyboard.isDown('s') then
        --         jblockYset = jblockYset + 1
        --     elseif love.keyboard.isDown('a') then
        --         jblockXset = jblockXset - 1
        --     elseif love.keyboard.isDown('d') then
        --         jblockXset = jblockXset + 1
        --     end
        -- end

        -- -- K block
        -- if isSelected.K == true then
        --     if love.keyboard.isDown('w') then
        --         kblockYset = kblockYset - 1
        --     elseif love.keyboard.isDown('s') then
        --         kblockYset = kblockYset + 1
        --     elseif love.keyboard.isDown('a') then
        --         kblockXset = kblockXset - 1
        --     elseif love.keyboard.isDown('d') then
        --         kblockXset = kblockXset + 1
        --     end
        -- end

        -- -- L block
        -- if isSelected.L == true then
        --     if love.keyboard.isDown('w') then
        --         lblockYset = lblockYset - 1
        --     elseif love.keyboard.isDown('s') then
        --         lblockYset = lblockYset + 1
        --     elseif love.keyboard.isDown('a') then
        --         lblockXset = lblockXset - 1
        --     elseif love.keyboard.isDown('d') then
        --         lblockXset = lblockXset + 1
        --     end
        -- end

        -- -- M block
        -- if isSelected.M == true then
        --     if love.keyboard.isDown('w') then
        --         mblockYset = mblockYset - 1
        --     elseif love.keyboard.isDown('s') then
        --         mblockYset = mblockYset + 1
        --     elseif love.keyboard.isDown('a') then
        --         mblockXset = mblockXset - 1
        --     elseif love.keyboard.isDown('d') then
        --         mblockXset = mblockXset + 1
        --     end
        -- end

        -- -- N block
        -- if isSelected.N == true then
        --     if love.keyboard.isDown('w') then
        --         nblockYset = nblockYset - 1
        --     elseif love.keyboard.isDown('s') then
        --         nblockYset = nblockYset + 1
        --     elseif love.keyboard.isDown('a') then
        --         nblockXset = nblockXset - 1
        --     elseif love.keyboard.isDown('d') then
        --         nblockXset = nblockXset + 1
        --     end
        -- end

        -- -- O block
        -- if isSelected.O == true then
        --     if love.keyboard.isDown('w') then
        --         oblockYset = oblockYset - 1
        --     elseif love.keyboard.isDown('s') then
        --         oblockYset = oblockYset + 1
        --     elseif love.keyboard.isDown('a') then
        --         oblockXset = oblockXset - 1
        --     elseif love.keyboard.isDown('d') then
        --         oblockXset = oblockXset + 1
        --     end
        -- end



        -- S block
        -- if isSSelected_setplay == true then
        --     if love.keyboard.isDown('w') then
        --         oblockYset = oblockYset - 1
        --     elseif love.keyboard.isDown('s') then
        --         oblockYset = oblockYset + 1
        --     elseif love.keyboard.isDown('a') then
        --         oblockXset = oblockXset - 1
        --     elseif love.keyboard.isDown('d') then
        --         oblockXset = oblockXset + 1
        --     end
        -- end




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

    for i, letter in pairs(letters) do
        if mx > letter.x and mx < letter.x + 80 and my > letter.y and my < letter.y + 80 then
            aBlock_setplay.hover=true
            if down == true then aBlock_setplay.call() end
        else
            aBlock_setplay.hover=false
            if down == true then letter.isSelected = false end
        end
    end

    -- -- A block
    -- if mx > letters.A.x and mx < letters.A.x + 80 and my > letters.A.y and my < letters.A.y + 80 then
    --     aBlock_setplay.hover=true
    --     if down == true then aBlock_setplay.call() end
    -- else
    --     aBlock_setplay.hover=false
    --     if down == true then letters.A.isSelected = false end
    -- end



    -- -- B block
    -- if mx > letters.B.x and mx < letters.B.x + 80 and my > letters.B.y and my < letters.B.y + 80 then
    --     bBlock_setplay.hover=true
    --     if down == true then bBlock_setplay.call() end
    -- else
    --     bBlock_setplay.hover=false
    --     if down == true then letters.B.isSelected = false end
    -- end


    -- -- C block
    -- if mx > letters.C.x and mx < letters.C.x + 80 and my > letters.C.y and my < letters.C.y + 80 then
    -- 	cBlock_setplay.hover=true
    -- 	if down == true then cBlock_setplay.call() end
    -- else
    --     cBlock_setplay.hover=false
    --     if down == true then letters.C.isSelected = false end
    -- end

    -- -- D block
    -- if mx > letters.D.x and mx < letters.D.x + 80 and my > letters.D.y and my < letters.D.y + 80 then
    --     dBlock_setplay.hover=true
    --     if down == true then dBlock_setplay.call() end
    -- else
    --     dBlock_setplay.hover=false
    --     if down == true then letters.D.isSelected = false end
    -- end

    -- -- E block
    -- if mx > eblockXset and mx < eblockXset + 80 and my > eblockYset and my < eblockYset + 80 then
    -- 	eBlock_setplay.hover=true
    -- 	if down == true then eBlock_setplay.call() end
    -- else
    --     eBlock_setplay.hover=false
    --     if down == true then isSelected.E = false end
    -- end

    -- -- F block
    -- if mx > fblockXset and mx < fblockXset + 80 and my > fblockYset and my < fblockYset + 80 then
    --     fBlock_setplay.hover=true
    --     if down == true then fBlock_setplay.call() end
    -- else
    --     fBlock_setplay.hover=false
    --     if down == true then isSelected.F = false end
    -- end

    -- -- G block
    -- if mx > gblockXset and mx < gblockXset + 80 and my > gblockYset and my < gblockYset + 80 then
    --     gBlock_setplay.hover=true
    --     if down == true then gBlock_setplay.call() end
    -- else
    --     gBlock_setplay.hover=false
    --     if down == true then isSelected.G = false end
    -- end
   

    -- -- H block
    -- if mx > hblockXset and mx < hblockXset + 80 and my > hblockYset and my < hblockYset + 80 then
    -- 	hBlock_setplay.hover=true
    -- 	if down == true then hBlock_setplay.call() end
    -- else
    --     hBlock_setplay.hover=false
    --     if down == true then isSelected.H = false end
    -- end

    -- -- I block
    -- if mx > iblockXset and mx < iblockXset + 80 and my > iblockYset and my < iblockYset + 80 then
    --     iBlock_setplay.hover=true
    --     if down == true then iBlock_setplay.call() end
    -- else
    --     iBlock_setplay.hover=false
    --     if down == true then isSelected.I = false end
    -- end

    -- -- J block
    -- if mx > jblockXset and mx < jblockXset + 80 and my > jblockYset and my < jblockYset + 80 then
    --     jBlock_setplay.hover=true
    --     if down == true then jBlock_setplay.call() end
    -- else
    --     jBlock_setplay.hover=false
    --     if down == true then isSelected.J = false end
    -- end

    -- -- K block
    -- if mx > kblockXset and mx < kblockXset + 80 and my > kblockYset and my < kblockYset + 80 then
    -- 	kBlock_setplay.hover=true
    -- 	if down == true then kBlock_setplay.call() end
    -- else
    --     kBlock_setplay.hover=false
    --     if down == true then isSelected.K = false end
    -- end

    -- -- L block
    -- if mx > lblockXset and mx < lblockXset + 80 and my > lblockYset and my < lblockYset + 80 then
    --     lBlock_setplay.hover=true
    --     if down == true then lBlock_setplay.call() end
    -- else
    --     lBlock_setplay.hover=false
    --     if down == true then isSelected.L = false end
    -- end

    --  -- M block
    --  if mx > mblockXset and mx < mblockXset + 80 and my > mblockYset and my < mblockYset + 80 then
    --     mBlock_setplay.hover=true
    --     if down == true then mBlock_setplay.call() end
    -- else
    --     mBlock_setplay.hover=false
    --     if down == true then isSelected.M = false end
    -- end

    -- -- N block
    -- if mx > nblockXset and mx < nblockXset + 80 and my > nblockYset and my < nblockYset + 80 then
    -- 	nBlock_setplay.hover=true
    -- 	if down == true then nBlock_setplay.call() end
    -- else
    --     nBlock_setplay.hover=false
    --     if down == true then isSelected.N = false end
    -- end

    -- -- O block
    -- if mx > oblockXset and mx < oblockXset + 80 and my > oblockYset and my < oblockYset + 80 then
    --     oBlock_setplay.hover=true
    --     if down == true then oBlock_setplay.call() end
    -- else
    --     oBlock_setplay.hover=false
    --     if down == true then isSelected.O = false end
    -- end




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
    letters.A.isSelected = true
end

function selectBlockBSetPlay()
    letters.B.isSelected = true
end

function selectBlockCSetPlay()
    letters.C.isSelected = true
end

function selectBlockDSetPlay()
    isSelected.D = true
end

function selectBlockESetPlay()
    isSelected.E = true
end

function selectBlockFSetPlay()
    isSelected.F = true
end

function selectBlockGSetPlay()
    isSelected.G = true
end

function selectBlockHSetPlay()
    isSelected.H = true
end

function selectBlockISetPlay()
    isSelected.I = true
end

function selectBlockJSetPlay()
    isSelected.J = true
end

function selectBlockKSetPlay()
    isSelected.K = true
end

function selectBlockLSetPlay()
    isSelected.L = true
end

function selectBlockMSetPlay()
    isSelected.M = true
end

function selectBlockNSetPlay()
    isSelected.N = true
end

function selectBlockOSetPlay()
    isSelected.O = true
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