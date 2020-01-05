
-- variables
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
local isASelected_freeplay = false
local isBSelected_freeplay = false
local collision = false
mouse = {}

-- images

-- characters
local secretary = love.graphics.newImage('secretary.png')
local teacher = love.graphics.newImage('teacher.png')
local bird = love.graphics.newImage('bird.png')
local fairy = love.graphics.newImage('fairy-small.png')
local fairyWave = love.graphics.newImage('fairy-wave.png')
local fairysetplay001 = love.graphics.newImage('fairy-setplay001.png')
local fairysetplay002 = love.graphics.newImage('fairy-setplay002.png')
local fairysetplay003 = love.graphics.newImage('fairy-setplay003.png')
local artemisIntro = love.graphics.newImage('artemis-001.png')
local artemis = love.graphics.newImage('artemis.png')
local artemisColour = love.graphics.newImage('artemis-colour.png')


--map
local map = love.graphics.newImage('map2.png')
local map2 = love.graphics.newImage('map3.png')
local globe = love.graphics.newImage('globe.jpg')

--animals
local cat = love.graphics.newImage('cat-3.png')
local horse = love.graphics.newImage('horse.png')
local bear = love.graphics.newImage('bear.png')
local lion = love.graphics.newImage('lion.png')
local dog = love.graphics.newImage('dog.png')
local alligator = love.graphics.newImage('alligator.png')
local wolf = love.graphics.newImage('wolf.png')
local zebra = love.graphics.newImage('zebra.png')
local monkey = love.graphics.newImage('monkey.png')

--set initial animal
local artemisAnimal = cat
local artemisAnimalx = 520
local artemisAnimaly = 100
local artemisAnimalBgColourR = 0.5
local artemisAnimalBgColourG = 0
local artemisAnimalBgColourB = 0
local artemisAnimalTargetColourR = 0.8 
local artemisAnimalTargetColourG = 0.3
local artemisAnimalTargetColourB = 0.3
local targetBlocks = {
    A = {x=490, y=430}, 
    B = {x=600, y=430}, 
    C = {x=710, y=430}
}
local artemisSpeech = "I'm thinking of calling it a 'dog'"
local fairySpeech = "Oi, what's this then?"


--blocks
local blockTemplate = love.graphics.newImage('template.png')
local oneDotBlock = love.graphics.newImage('one-dot.png')
local twoDotBlock = love.graphics.newImage('two-dot.png')
local threeDotBlock = love.graphics.newImage('three-dot.png')
local fourDotBlock = love.graphics.newImage('four-dot.png')
local duckBlock = love.graphics.newImage('duck-block.png')

local academy_location_x = 655
local academy_location_y = 80

-- sounds
sound = love.audio.newSource("bird.mp3", "static") -- the "static" tells LÖVE to load the file into memory, good for short sound effects
woodblock = love.audio.newSource("woodblock.wav", "static")

-- freeplay mode variables (not used currently)
local ablockXfree = 100
local ablockYfree = 100
local bblockXfree = 300
local bblockYfree = 300

local mouseMode = start

-- letter blocks
local letters = {
    A = {char="A", isSelected = false, x=400, y=0, placed = false}, 
    B = {char="B", isSelected = false, x=480, y=0, placed = false}, 
    C = {char="C", isSelected = false, x=560, y=0, placed = false}, 
    D = {char="D", isSelected = false, x=640, y=0, placed = false}, 
    E = {char="E", isSelected = false, x=720, y=0, placed = false}, 
    F = {char="F", isSelected = false, x=800, y=0, placed = false}, 
    G = {char="G", isSelected = false, x=880, y=0, placed = false}, 
    H = {char="H", isSelected = false, x=880, y=80, placed = false}, 
    I = {char="I", isSelected = false, x=880, y=160, placed = false}, 
    J = {char="J", isSelected = false, x=880, y=240, placed = false}, 
    K = {char="K", isSelected = false, x=880, y=320, placed = false},
    L = {char="L", isSelected = false, x=880, y=400, placed = false}, 
    M = {char="M", isSelected = false, x=880, y=480, placed = false}, 
    N = {char="N", isSelected = false, x=880, y=560, placed = false}, 
    O = {char="O", isSelected = false, x=800, y=560, placed = false}, 
    P = {char="P", isSelected = false, x=720, y=560, placed = false}, 
    Q = {char="Q", isSelected = false, x=640, y=560, placed = false}, 
    R = {char="R", isSelected = false, x=560, y=560, placed = false}, 
    S = {char="S", isSelected = false, x=480, y=560, placed = false}, 
    T = {char="T", isSelected = false, x=400, y=560, placed = false}, 
    U = {char="U", isSelected = false, x=320, y=560, placed = false}, 
    V = {char="V", isSelected = false, x=320, y=480, placed = false}, 
    W = {char="W", isSelected = false, x=320, y=400, placed = false}, 
    X = {char="X", isSelected = false, x=320, y=320, placed = false}, 
    Y = {char="Y", isSelected = false, x=320, y=240, placed = false}, 
    Z = {char="Z", isSelected = false, x=320, y=160, placed = false}
}

local numbersAndSymbolBlocks = {
    A = {char="0", isSelected = false, x=400, y=0, placed = false}, 
    B = {char="1", isSelected = false, x=480, y=0, placed = false}, 
    C = {char="2", isSelected = false, x=560, y=0, placed = false}, 
    D = {char="3", isSelected = false, x=640, y=0, placed = false}, 
    E = {char="4", isSelected = false, x=720, y=0, placed = false}, 
    F = {char="5", isSelected = false, x=800, y=0, placed = false}, 
    G = {char="6", isSelected = false, x=880, y=0, placed = false}, 
    H = {char="7", isSelected = false, x=880, y=80, placed = false}, 
    I = {char="8", isSelected = false, x=880, y=160, placed = false}, 
    J = {char="9", isSelected = false, x=880, y=240, placed = false}, 
    K = {char="-", isSelected = false, x=880, y=320, placed = false},
    L = {char="+", isSelected = false, x=880, y=400, placed = false}, 
    M = {char="=", isSelected = false, x=880, y=480, placed = false}, 
    N = {char="", picture=oneDotBlock, isSelected = false, x=880, y=560, placed = false}, 
    O = {char="", picture=twoDotBlock, isSelected = false, x=800, y=560, placed = false}, 
    P = {char="", picture=threeDotBlock, isSelected = false, x=720, y=560, placed = false}, 
    Q = {char="", picture=fourDotBlock, isSelected = false, x=640, y=560, placed = false}, 
    R = {char="", isSelected = false, x=560, y=560, placed = false}, 
    S = {char="", isSelected = false, x=480, y=560, placed = false}, 
    T = {char="", isSelected = false, x=400, y=560, placed = false}, 
    U = {char="", isSelected = false, x=320, y=560, placed = false}, 
    V = {char="", isSelected = false, x=320, y=480, placed = false}, 
    W = {char="", isSelected = false, x=320, y=400, placed = false}, 
    X = {char="", isSelected = false, x=320, y=320, placed = false}, 
    Y = {char="", isSelected = false, x=320, y=240, placed = false}, 
    Z = {char="", isSelected = false, x=320, y=160, placed = false}
}

local pictureBlocks = {
    A = {picture=duckBlock, isSelected = false, x=400, y=0, placed = false}, 
    B = {picture=blockTemplate, isSelected = false, x=480, y=0, placed = false}, 
    C = {picture=blockTemplate, isSelected = false, x=560, y=0, placed = false}, 
    D = {picture=blockTemplate, isSelected = false, x=640, y=0, placed = false}, 
    E = {picture=blockTemplate, isSelected = false, x=720, y=0, placed = false}, 
    F = {picture=blockTemplate, isSelected = false, x=800, y=0, placed = false}, 
    G = {picture=blockTemplate, isSelected = false, x=880, y=0, placed = false}, 
    H = {picture=blockTemplate, isSelected = false, x=880, y=80, placed = false}, 
    I = {picture=blockTemplate, isSelected = false, x=880, y=160, placed = false}, 
    J = {picture=blockTemplate, isSelected = false, x=880, y=240, placed = false}, 
    K = {picture=blockTemplate, isSelected = false, x=880, y=320, placed = false},
    L = {picture=blockTemplate, isSelected = false, x=880, y=400, placed = false}, 
    M = {picture=blockTemplate, isSelected = false, x=880, y=480, placed = false}, 
    N = {picture=blockTemplate, isSelected = false, x=880, y=560, placed = false}, 
    O = {picture=blockTemplate, isSelected = false, x=800, y=560, placed = false}, 
    P = {picture=blockTemplate, isSelected = false, x=720, y=560, placed = false}, 
    Q = {picture=blockTemplate, isSelected = false, x=640, y=560, placed = false}, 
    R = {picture=blockTemplate, isSelected = false, x=560, y=560, placed = false}, 
    S = {picture=blockTemplate, isSelected = false, x=480, y=560, placed = false}, 
    T = {picture=blockTemplate, isSelected = false, x=400, y=560, placed = false}, 
    U = {picture=blockTemplate, isSelected = false, x=320, y=560, placed = false}, 
    V = {picture=blockTemplate, isSelected = false, x=320, y=480, placed = false}, 
    W = {picture=blockTemplate, isSelected = false, x=320, y=400, placed = false}, 
    X = {picture=blockTemplate, isSelected = false, x=320, y=320, placed = false}, 
    Y = {picture=blockTemplate, isSelected = false, x=320, y=240, placed = false}, 
    Z = {picture=blockTemplate, isSelected = false, x=320, y=160, placed = false}
}

--switching blocks
local switchingBlocks = {
    letters = {char="letters", isSelected = false, x=240, y=0, placed = false},
    numbersAndSymbols = {char="num & sym", isSelected = false, x=320, y=0, placed = false},
    pictures = {char="pictures", isSelected = false, x=320, y=80, placed = false}
}
      
local switchingBlocksOption = 1

function love.load()

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true
    })
    tinyFont = love.graphics.newFont('Solway.ttf', 16)
    smallFont = love.graphics.newFont('Solway.ttf', 32)
    largeFont = love.graphics.newFont('Solway.ttf', 70)
    gameState = 'screen1'

    -- for selecting
    aBlock_freeplay = 	{hover = false, text = "A", x = 520, y = 100, call = selectBlockAFreePlay}
    bBlock_freeplay = 	{hover = false, text = "B", x = 520, y = 100, call = selectBlockBFreePlay}

    fairysprite = fairysetplay001

    -- animation
    animation = newAnimation(love.graphics.newImage("fairy-wave-spritesheet-small.png"), 320, 480, 2)

end


function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()

    elseif key == 'enter' or key == 'return' then
        if gameState == 'screen1' then
            gameState = 'screen2'
        elseif gameState == 'screen2' then
            gameState = 'intro1'    
        elseif gameState == 'intro1' then  
            gameState = 'intro2'    
        elseif gameState == 'intro2' then  
            gameState = 'intro3'
        elseif gameState == 'intro3' then    
            gameState = 'map'    
        elseif gameState == 'map' then           
            gameState = 'artemisIntro'    
        elseif gameState == 'artemisIntro' then                      
            gameState = 'artemisExercise'
        elseif gameState == 'artemisExercise' then
            gameState = 'horse'             
        elseif gameState == 'horse' then
            gameState = 'wolf'
        elseif gameState == 'wolf' then   

        end
    end
end

function love.draw()
             
    love.graphics.setFont(smallFont)
    love.graphics.clear(0, 0, 0, 255)

    if gameState == 'screen1' then
      
        love.graphics.draw(secretary, 440, 20, 0, 0.4, 0.4)

        love.graphics.setColor(1, 1, 1)
        love.graphics.printf('Oh wonderful, a new learner.', 0, 600, WINDOW_WIDTH, 'center')
        timePassed = 0

    elseif gameState == 'screen2' then
        love.graphics.draw(teacher, 440, 20, 0, 0.4, 0.4)
        love.graphics.printf('Hurry child, there is much to do. Do not tarry.', 0, 600, WINDOW_WIDTH, 'center')


    elseif gameState == 'intro1' then

        -- draw stage
        love.graphics.rectangle('line', 00, 00, 960, 640)

        love.graphics.rectangle('line', 0, 00, 320, 640)

        love.graphics.printf("Welcome", 0, 50, 320, "center")
        love.graphics.printf("We have been waiting for you", 0, 100, 320, "center")

        -- map
        love.graphics.draw(globe, 320, 0, 0, 1, 1)
        love.graphics.setColor(100, 100, 100)

        -- menu block
       love.graphics.setColor(100, 100, 100)
       love.graphics.rectangle('line', 960, 00, 320, 80)
       love.graphics.printf("menu", 960, 0, 100, "center")

       -- Fairy block
       love.graphics.rectangle('line', 960, 80, 320, 560)
       local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
       love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], 960, 160, 0, 1)

       -- audio block    
       love.graphics.rectangle('line', 0, 640, 1280, 80)
       love.graphics.setColor(100, 100, 100)

    elseif gameState == 'intro2' then

        -- draw stage
        love.graphics.rectangle('line', 00, 00, 960, 640)

        love.graphics.rectangle('line', 0, 00, 320, 640)

        love.graphics.printf("Welcome", 0, 50, 320, "center")
        love.graphics.printf("We have been waiting for you", 0, 100, 320, "center")

        love.graphics.printf("This is Wild World", 0, 250, 320, "center")
        love.graphics.printf("All knowledge has been lost", 0, 300, 320, "center")

        -- map
        love.graphics.draw(map2, 320, 0, 0, 1, 1)
        love.graphics.setColor(100, 100, 100)

        -- menu block
       love.graphics.setColor(100, 100, 100)
       love.graphics.rectangle('line', 960, 00, 320, 80)
       love.graphics.printf("menu", 960, 0, 100, "center")

       -- Fairy block
       love.graphics.rectangle('line', 960, 80, 320, 560)
       local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
       love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], 960, 160, 0, 1)

       -- audio block    
       love.graphics.rectangle('line', 0, 640, 1280, 80)
       love.graphics.setColor(100, 100, 100)
    
    elseif gameState == 'intro3' then

        -- the screen
        love.graphics.rectangle('line', 00, 00, 1280, 720)

        love.graphics.printf("Welcome", 0, 50, 320, "center")
        love.graphics.printf("We have been waiting for you", 0, 100, 320, "center")
        love.graphics.printf("This is Wild World", 0, 250, 320, "center")
        love.graphics.printf("All knowledge has been lost", 0, 300, 320, "center")
        love.graphics.printf("There are many people that need your help", 0, 450, 320, "center")
        
        -- draw stage
        love.graphics.rectangle('line', 00, 00, 930, 640)

        -- the exercise block
        love.graphics.rectangle('line', 320, 00, 640, 640)

        -- map
        love.graphics.draw(map, 320, 0, 0, 1, 1)
        love.graphics.setColor(100, 100, 100)
      
        -- menu block
        love.graphics.setColor(100, 100, 100)
        love.graphics.rectangle('line', 960, 00, 320, 80)
        love.graphics.printf("menu", 960, 0, 100, "center")
 
       -- Fairy block
       love.graphics.rectangle('line', 960, 80, 320, 560)
       local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
       love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], 960, 160, 0, 1)   
             
       -- audio block    
       love.graphics.rectangle('line', 0, 640, 1280, 80)
  
       love.graphics.setColor(1, 1, 1)

    
    elseif gameState == 'map' then

        love.graphics.draw(bird, 10, 10, 0, 1, 1)
        love.graphics.printf("Fairy, Artemis is asking for help.", 0, 350, 320, "center")

        -- the exercise block
        love.graphics.rectangle('line', 320, 00, 640, 640)

        -- map
        love.graphics.draw(map, 320, 0, 0, 1, 1)
        love.graphics.setColor(100, 100, 100)

        -- menu block
        love.graphics.setColor(100, 100, 100)
        love.graphics.rectangle('line', 960, 00, 320, 80)
        love.graphics.printf("menu", 960, 0, 100, "center")

        -- Fairy block
        love.graphics.rectangle('line', 960, 80, 320, 560)
        love.graphics.draw(fairyWave, 960, 120, 0, 1, 1) 

        -- audio block    
        love.graphics.rectangle('line', 0, 640, 1280, 80)
        love.graphics.setColor(100, 100, 100)

        -- left block
        love.graphics.rectangle('line', 00, 00, 320, 640)


    elseif gameState == 'artemisIntro' then

        -- the exercise block
        love.graphics.rectangle('line', 320, 00, 640, 640)

        -- map
        love.graphics.draw(map, 320, 0, 0, 1, 1)
        love.graphics.setColor(100, 100, 100)

        -- stage character
        --love.graphics.draw(artemis, 0, 140, 0, 1, 1)
        love.graphics.draw(artemisColour, 0, 140, 0, 1, 1)

        love.graphics.printf("I need your help to name these animals please", 320, 640, 640, "center")

        -- menu block
        love.graphics.setColor(100, 100, 100)
        love.graphics.rectangle('line', 960, 00, 320, 80)
        love.graphics.printf("menu", 960, 0, 100, "center")

        -- Fairy block
        love.graphics.rectangle('line', 960, 80, 320, 560)
        love.graphics.draw(fairyWave, 960, 120, 0, 1, 1) 

        -- audio block    
        love.graphics.rectangle('line', 0, 640, 1280, 80)
        love.graphics.setColor(100, 100, 100)

        -- left block
        love.graphics.rectangle('line', 00, 00, 320, 640)
        

    elseif gameState == 'storyMode' then

        -- the screen
        love.graphics.rectangle('line', 00, 00, 1280, 720)

        love.graphics.draw(dragonStory01, 320, 0, 0, 0.5, 0.5)

        -- the exercise block
        love.graphics.rectangle('line', 320, 00, 640, 640)

        love.graphics.setColor(0, 0, 0)

        -- menu block
        love.graphics.setColor(100, 100, 100)
        love.graphics.rectangle('line', 960, 00, 320, 80)
        love.graphics.printf("menu", 960, 0, 100, "center")
  
        -- Fairy block
        love.graphics.rectangle('line', 960, 80, 320, 560)
        love.graphics.draw(fairysprite, 960, 120, 0, 1, 1) 
 
        -- audio block    
        love.graphics.rectangle('line', 0, 640, 1280, 80)
        love.graphics.setColor(100, 100, 100)


    elseif gameState == 'artemisExercise' then
   
        -- The UI-------------------------------------------------------

        -- the screen
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle('fill', 00, 00, 1280, 720)

        -- draw stage
        love.graphics.rectangle('fill', 320, 00, 640, 640)
        
        -- left block
        love.graphics.rectangle('line', 00, 00, 320, 640)

        -- right block
        love.graphics.rectangle('line', 960, 80, 320, 560)

        -- menu block
        love.graphics.setColor(100, 100, 100)
        love.graphics.rectangle('line', 960, 00, 320, 80)
        love.graphics.printf("menu", 960, 0, 100, "center")
 
        -- bottom area    
        love.graphics.rectangle('line', 0, 640, 1280, 80)
        -- buttons to go to next question
        love.graphics.rectangle('line', 480, 640, 80, 80)
        love.graphics.polygon( 'fill', 480, 680, 560, 640, 560, 720)
        love.graphics.rectangle('line', 720, 640, 80, 80)
        love.graphics.polygon( 'fill', 800, 680, 720, 640, 720, 720)  
 

        -- variable area ---------------------------------------------------------------

        -- background
        love.graphics.setColor(artemisAnimalBgColourR, artemisAnimalBgColourG, artemisAnimalBgColourB)
        love.graphics.rectangle('fill', 400, 80, 480, 480)
      
        -- subject
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(artemisAnimal, artemisAnimalx, artemisAnimaly, 0, 1, 1)
        love.graphics.setColor(artemisAnimalBgColourR, artemisAnimalBgColourG, artemisAnimalBgColourB)
        
        -- target blocks
        for i, targetBlock in pairs(targetBlocks) do
            love.graphics.setColor(artemisAnimalTargetColourR, artemisAnimalTargetColourG, artemisAnimalTargetColourB)
            love.graphics.rectangle('fill', targetBlock.x, targetBlock.y, 80, 80)
            love.graphics.setColor(0, 0, 0)
            love.graphics.rectangle('line', targetBlock.x, targetBlock.y, 80, 80)
        end    
        
        -- artemis
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(artemis, 0, 140, 0, 1, 1)
        love.graphics.printf(artemisSpeech, 0, 640, 320, "center")

        -- Fairy
        love.graphics.draw(fairysprite, 960, 120, 0, 1, 1)
        love.graphics.printf(fairySpeech, 960, 640, 320, "center")

        local counter = 1

        ---------------------------------------------------------------------------

        -- draw blocks   

        -- draw switching blocks   

        -- draw letter blocks   
        love.graphics.setFont(largeFont)

        if switchingBlocksOption == 1 then
            -- draw switching block button
            love.graphics.setColor(1, 1, 1)
            love.graphics.rectangle('fill', switchingBlocks.numbersAndSymbols.x, switchingBlocks.numbersAndSymbols.y, 80, 80)
            love.graphics.rectangle('fill', switchingBlocks.pictures.x, switchingBlocks.pictures.y, 80, 80)
            love.graphics.setColor(0, 0, 0)
            love.graphics.setFont(tinyFont)
            love.graphics.rectangle('line', switchingBlocks.numbersAndSymbols.x, switchingBlocks.numbersAndSymbols.y, 80, 80)
            love.graphics.rectangle('line', switchingBlocks.pictures.x, switchingBlocks.pictures.y, 80, 80)
            love.graphics.printf(switchingBlocks.numbersAndSymbols.char, switchingBlocks.numbersAndSymbols.x, switchingBlocks.numbersAndSymbols.y, 80, "center")
            love.graphics.printf(switchingBlocks.pictures.char, switchingBlocks.pictures.x, switchingBlocks.pictures.y, 80, "center")

            love.graphics.setFont(largeFont)

            for i, letter in pairs(letters) do

                -- love.graphics.setColor(0.1, 0.7, 0.6)

                if letter.char == "A" or letter.char == "E" or letter.char == "I" or letter.char == "M" or letter.char == "Q" or letter.char == "U" or letter.char == "Y" then
                    love.graphics.setColor(0, 1, 0)
                    love.graphics.rectangle('fill', letter.x, letter.y, 80, 80)
                end

                if letter.char == "B" or letter.char == "F" or letter.char == "J" or letter.char == "N" or letter.char == "R" or letter.char == "V" or letter.char == "Z" then
                    love.graphics.setColor(0.9, 0.9, 0)
                    love.graphics.rectangle('fill', letter.x, letter.y, 80, 80)
                end

                if letter.char == "C" or letter.char == "G" or letter.char == "K" or letter.char == "O" or letter.char == "S" or letter.char == "W" then
                    love.graphics.setColor(1, 0, 0)
                    love.graphics.rectangle('fill', letter.x, letter.y, 80, 80)
                end

                if letter.char == "D" or letter.char == "H" or letter.char == "L" or letter.char == "P" or letter.char == "T" or letter.char == "X" then
                    love.graphics.setColor(0, 0, 1)
                    love.graphics.rectangle('fill', letter.x, letter.y, 80, 80)
                end

                love.graphics.setColor(0, 0, 0)
                love.graphics.rectangle('line', letter.x, letter.y, 80, 80)
                
                love.graphics.setColor(1, 1, 1)
                love.graphics.printf(letter.char, letter.x, letter.y, 80, "center")
                -- love.graphics.draw(letter.image, letter.x, letter.y, 0, 1, 1)
            end  
        end
            
        if switchingBlocksOption == 2 then
             -- draw switching block buttons
             love.graphics.setColor(1, 1, 1)
            --  switchingBlocks.letters.x = 320
            --  switchingBlocks.letters.y = 0
             love.graphics.rectangle('fill', switchingBlocks.letters.x, switchingBlocks.letters.y, 80, 80)
             love.graphics.rectangle('fill', switchingBlocks.pictures.x, switchingBlocks.pictures.y, 80, 80)
             love.graphics.setColor(0, 0, 0)
             love.graphics.rectangle('line', switchingBlocks.letters.x, switchingBlocks.letters.y, 80, 80)
             love.graphics.rectangle('line', switchingBlocks.pictures.x, switchingBlocks.pictures.y, 80, 80)
             love.graphics.setFont(tinyFont)
             love.graphics.printf(switchingBlocks.letters.char, switchingBlocks.letters.x, switchingBlocks.letters.y, 80, "center")
             love.graphics.printf(switchingBlocks.pictures.char, switchingBlocks.pictures.x, switchingBlocks.pictures.y, 80, "center")
             love.graphics.setFont(largeFont)

            for i, block in pairs(numbersAndSymbolBlocks) do

                love.graphics.setColor(0.1, 0.7, 0.6)
                love.graphics.rectangle('fill', block.x, block.y, 80, 80)

                love.graphics.setColor(0, 0, 0)
                love.graphics.rectangle('line', block.x, block.y, 80, 80)
                
                love.graphics.setColor(1, 1, 1)
                love.graphics.printf(block.char, block.x, block.y, 80, "center")
                
                if block.picture then                   
                    love.graphics.draw(block.picture, block.x, block.y, 0, 1, 1)
                end                
            end  
        end  

        if switchingBlocksOption == 3 then
            -- draw switching block buttons
            love.graphics.setColor(1, 1, 1)
            -- switchingBlocks.letters.x = 320
            -- switchingBlocks.letters.y = 80
            love.graphics.rectangle('fill', switchingBlocks.letters.x, switchingBlocks.letters.y, 80, 80)
            love.graphics.rectangle('fill', switchingBlocks.numbersAndSymbols.x, switchingBlocks.numbersAndSymbols.y, 80, 80)
            love.graphics.setColor(0, 0, 0)
            love.graphics.rectangle('line', switchingBlocks.letters.x, switchingBlocks.letters.y, 80, 80)
            love.graphics.rectangle('line', switchingBlocks.numbersAndSymbols.x, switchingBlocks.numbersAndSymbols.y, 80, 80)
            love.graphics.setFont(tinyFont)
            love.graphics.printf(switchingBlocks.letters.char, switchingBlocks.letters.x, switchingBlocks.letters.y, 80, "center")
            love.graphics.printf(switchingBlocks.numbersAndSymbols.char, switchingBlocks.numbersAndSymbols.x, switchingBlocks.numbersAndSymbols.y, 80, "center")
            love.graphics.setFont(largeFont)   

            for i, block in pairs(pictureBlocks) do

                love.graphics.setColor(0.1, 0.7, 0.6)
                love.graphics.rectangle('fill', block.x, block.y, 80, 80)

                love.graphics.setColor(0, 0, 0)
                love.graphics.rectangle('line', block.x, block.y, 80, 80)
                
                love.graphics.setColor(1, 1, 1)
                love.graphics.setColor(1, 1, 0)
                love.graphics.draw(block.picture, block.x, block.y, 0, 1, 1)                
            end  
        end

        love.graphics.setFont(smallFont)

        -- Block movement
        for i, letter in pairs(letters) do
            if letter.isSelected == true then
                if love.keyboard.isDown('w') then
                    letter.y = letter.y - 2
                elseif love.keyboard.isDown('s') then
                    letter.y = letter.y + 2
                elseif love.keyboard.isDown('a') then
                    letter.x = letter.x - 2
                elseif love.keyboard.isDown('d') then
                    letter.x = letter.x + 2
                end
            end
        end

        -- -- for correct letter placement
        -- if letters.C.placed == false then
        --     if (letters.C.x == target1.x and letters.C.y == target1.y) then
        --         letters.C.placed = true
        --         fairysprite = fairysetplay003
        --         fairySpeech = "So gifted"
        --         letters.C.isSelected = false
        --     end
        -- end

        -- if letters.A.placed == false then
        --     if (letters.A.x == target2.x and letters.A.y == target2.y) then
        --         letters.A.placed = true
        --         fairysprite = fairysetplay003
        --         fairySpeech = "So gifted"
        --         letters.A.isSelected = false
        --     end
        -- end

        -- if letters.T.placed == false then
        --     if (letters.T.x == target3.x and letters.T.y == target3.y) then
        --         letters.T.placed = true
        --         fairysprite = fairysetplay003
        --         fairySpeech = "So gifted"
        --         letters.T.isSelected = false
        --     end
        -- end

        if (letters.C.placed == true and letters.A.placed == true and letters.T.placed == true) then
            fairySpeech = "Shazam!"            
        end

        -- mouse handling
        mouseMode = mouseModeArtemis


    elseif gameState == 'victory' then
        local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
        love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum])
    end
end

function love.update(dt)
	local  	down = love.mouse.isDown(1)
	local 	mx = love.mouse.getX()
	local	my = love.mouse.getY()
    menu_mousehandling_freeplay(mx, my, down)
    menu_mousehandling(mx, my, down)
    collision = CheckCollision(ablockXfree, ablockYfree, bblockXfree, bblockYfree, cblockX, cblockY)
    print(collision)


    ----------------------- Freeplay Collision Detection-------------------------
 
    if love.keyboard.isDown('w') then
        for i, letter in pairs(letters) do
            for i, currentLetter in pairs(letters) do
                if letter ~= currentLetter then
                    if currentLetter.x < letter.x + 80 and letter.x < currentLetter.x + 80 and currentLetter.y < letter.y + 80 and letter.y < currentLetter.y + 80 then
                        currentLetter.y = currentLetter.y + 5 
                    end
                end
            end
        end  
    end

    if love.keyboard.isDown('s') then
        for i, letter in pairs(letters) do
            for i, currentLetter in pairs(letters) do
                if letter ~= currentLetter then
                    if currentLetter.x < letter.x + 80 and letter.x < currentLetter.x + 80 and currentLetter.y < letter.y + 80 and letter.y < currentLetter.y + 80 then
                        currentLetter.y = currentLetter.y - 5 
                    end
                end
            end
        end  
    end

    if love.keyboard.isDown('a') then
        for i, letter in pairs(letters) do
            for i, currentLetter in pairs(letters) do
                if letter ~= currentLetter then
                    if currentLetter.x < letter.x + 80 and letter.x < currentLetter.x + 80 and currentLetter.y < letter.y + 80 and letter.y < currentLetter.y + 80 then
                        currentLetter.x = currentLetter.x + 5 
                    end
                end
            end
        end  
    end

    if love.keyboard.isDown('d') then
        for i, letter in pairs(letters) do
            for i, currentLetter in pairs(letters) do
                if letter ~= currentLetter then
                    if currentLetter.x < letter.x + 80 and letter.x < currentLetter.x + 80 and currentLetter.y < letter.y + 80 and letter.y < currentLetter.y + 80 then
                        currentLetter.x = currentLetter.x - 5 
                    end
                end
            end
        end  
    end

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

function menu_mousehandling(mx, my, down)   
    
    if mouseMode == mouseModeArtemis then
        -- use switching blocks
        if mx > switchingBlocks.letters.x and mx < switchingBlocks.letters.x + 80 and my > switchingBlocks.letters.y and my < switchingBlocks.letters.y + 80 and down == true then
            switchingBlocksOption = 1
        end

        if mx > switchingBlocks.numbersAndSymbols.x and mx < switchingBlocks.numbersAndSymbols.x + 80 and my > switchingBlocks.numbersAndSymbols.y and my < switchingBlocks.numbersAndSymbols.y + 80 and down == true then
            switchingBlocksOption = 2
        end

        if mx > switchingBlocks.pictures.x and mx < switchingBlocks.pictures.x + 80 and my > switchingBlocks.pictures.y and my < switchingBlocks.pictures.y + 80 and down == true then
            switchingBlocksOption = 3
        end


        -- move blocks
        for i, letter in pairs(letters) do
            if mx > letter.x and mx < letter.x + 80 and my > letter.y and my < letter.y + 80 then
                letter.hover=true
                if down == true then letter.isSelected = true
                    fairysprite = fairysetplay002
                    fairySpeech = "Go on then"
                    woodblock:play()
                end
            else
                letter.hover=false
                if down == true then letter.isSelected = false end
            end            
        end

        -- going through exercises
        if mx > 480 and mx < 560 and my > 640 and my < 720 and down == true then
            artemisAnimal = cat
            artemisAnimalx = 520
            artemisAnimaly = 100
            artemisAnimalBgColourR = 0.5
            artemisAnimalBgColourG = 0
            artemisAnimalBgColourB = 0
            artemisAnimalTargetColourR = 0.8
            artemisAnimalTargetColourG = 0.3
            artemisAnimalTargetColourB = 0.3
            targetBlocks = {
                A = {x=490, y=430}, 
                B = {x=600, y=430}, 
                C = {x=710, y=430}
            }  
            artemisSpeech = "I'm thinking of calling it a 'dog'"
            fairySpeech = "Oi, what's this then?"
        end

        if mx > 720 and mx < 800 and my > 640 and my < 720 and down == true then
            artemisAnimal = horse
            artemisAnimalx = 400
            artemisAnimaly = 80
            artemisAnimalBgColourR = 0.5
            artemisAnimalBgColourG = 0.5
            artemisAnimalBgColourB = 1
            artemisAnimalTargetColourR = 0.5
            artemisAnimalTargetColourG = 0.5
            artemisAnimalTargetColourB = 0.8
            targetBlocks = {
                A = {x=420, y=430}, 
                B = {x=510, y=430},   
                C = {x=600, y=430}, 
                D = {x=690, y=430}, 
                E = {x=780, y=430}
            }        
            artemisSpeech = "horse text"  
            fairySpeech = "Ever seen one of these before?"               
        end  
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

    animation.duration = 3
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


-- Free Play Collision detection function;
-- Returns true if two boxes overlap, false if they don't;
-- x1,y1 are the top-left coords of the first box, while w1,h1 are its width and height;
-- x2,y2,w2 & h2 are the same, but for the second box.
function CheckCollision(ablockX, ablockY, bblockX, bblockY)
    return  ablockX < bblockX+100 and
            bblockX < ablockX+100 and
            ablockY < bblockY+100 and
            bblockY < ablockY+100
end




-- elseif gameState == 'freeplay' then

--     -- draw stage
--     love.graphics.rectangle('line', 20, 20, 900, 670)
--     love.graphics.draw(fairy, 930, 150, 0, 1, 1)
--     love.graphics.printf('Press "p" for', -50, 30, WINDOW_WIDTH, 'right')
--     love.graphics.printf('setplay mode', -50, 70, WINDOW_WIDTH, 'right')

--     -- draw block A
--     love.graphics.printf(aBlock_freeplay.text, ablockXfree - 50, ablockYfree + 50 - 16, 200, "center")
--     love.graphics.rectangle('line', ablockXfree, ablockYfree, 100, 100)

--     -- draw block B
--     love.graphics.printf(bBlock_freeplay.text, bblockXfree - 50, bblockYfree + 50 - 16, 200, "center")
--     love.graphics.rectangle('line', bblockXfree, bblockYfree, 100, 100)

--     -- A block movement
--     if isASelected_freeplay == false then
--     elseif isASelected_freeplay == true then
--         if collision == false then
--             if love.keyboard.isDown('w') then
--                 ablockYfree = ablockYfree - 3
--             elseif love.keyboard.isDown('s') then
--                 ablockYfree = ablockYfree + 3
--             elseif love.keyboard.isDown('a') then
--                 ablockXfree = ablockXfree - 3
--             elseif love.keyboard.isDown('d') then
--                 ablockXfree = ablockXfree + 3
--             end
--         elseif collision == true then
--             if love.keyboard.isDown('w') then
--                 ablockYfree = ablockYfree + 10
--             elseif love.keyboard.isDown('s') then
--                 ablockYfree = ablockYfree - 10
--             elseif love.keyboard.isDown('a') then
--                 ablockXfree = ablockXfree + 10
--             elseif love.keyboard.isDown('d') then
--                 ablockXfree = ablockXfree - 10
--             end
--          end
--     end

--     -- B block movement
--     if isBSelected_freeplay == false then
--     elseif isBSelected_freeplay == true then
--         if collision == false then
--             if love.keyboard.isDown('w') then
--                 bblockYfree = bblockYfree - 3
--             elseif love.keyboard.isDown('s') then
--                 bblockYfree = bblockYfree + 3
--             elseif love.keyboard.isDown('a') then
--                 bblockXfree = bblockXfree - 3
--             elseif love.keyboard.isDown('d') then
--                 bblockXfree = bblockXfree + 3
--             end
--         elseif collision == true then
--             if love.keyboard.isDown('w') then
--                 bblockYfree = bblockYfree + 10
--             elseif love.keyboard.isDown('s') then
--                 bblockYfree = bblockYfree - 10
--             elseif love.keyboard.isDown('a') then
--                 bblockXfree = bblockXfree + 10
--             elseif love.keyboard.isDown('d') then
--                 bblockXfree = bblockXfree - 10
--             end
--         end
--     end