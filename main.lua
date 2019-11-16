
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720


-- -- background image and starting scroll location (X axis)
local secretary = love.graphics.newImage('secretary.png')
local teacher = love.graphics.newImage('teacher.png')
local fairy = love.graphics.newImage('fairy.png')
local a = love.graphics.newImage('A.png')
local b = love.graphics.newImage('B.png')
local c = love.graphics.newImage('C.png')
local isSelected = false
local ablockX = 100
local ablockY = 100

mouse = {}




function love.load()

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,   
        vsync = true
    })
    largeFont = love.graphics.newFont('font.ttf', 32)
    gameState = 'start'

    aBlock = 	{hover = false, text = "A", x = 200, y = 100, call = selectBlockA}
end


function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'serve'
        elseif gameState == 'serve' then
            gameState = 'play'
        elseif gameState == 'done' then
            -- game is simply in a restart phase here, but will set the serving
            -- player to the opponent of whomever won for fairness!
            gameState = 'serve'
        end
    end
end


function love.draw() 
  
    love.graphics.setFont(largeFont)
    love.graphics.clear(0.4, 0.4, 0.8, 255)   

    if gameState == 'start' then
        love.graphics.draw(secretary, 440, 20, 0, 0.4, 0.4)
        love.graphics.printf('Oh wonderful, a new learner.', 0, 600, WINDOW_WIDTH, 'center')

    elseif gameState == 'serve' then   
        love.graphics.draw(teacher, 440, 20, 0, 0.4, 0.4)
        love.graphics.printf('Hurry child, there is much to do. Do not tarry.', 0, 600, WINDOW_WIDTH, 'center')

    elseif gameState == 'play' then

      
        love.graphics.rectangle('line', 20, 20, 900, 670)
        love.graphics.draw(fairy, 900, 300, 0, 0.3, 0.3)


        love.graphics.printf(aBlock.text, ablockX, ablockY + 50, 200, "center")
        love.graphics.rectangle('line', ablockX, ablockY, 200, 200)
           
        if isSelected == false then
          
        elseif isSelected == true then
         

            -- A block movement
            if love.keyboard.isDown('w') then
                ablockY = ablockY - 3
            elseif love.keyboard.isDown('s') then
                ablockY = ablockY + 3
            elseif love.keyboard.isDown('a') then
                ablockX = ablockX - 3
            elseif love.keyboard.isDown('d') then
                ablockX = ablockX + 3
            end

        end

    elseif gameState == 'done' then
  
    end

end


  
function love.update(dt)
	local  	down = love.mouse.isDown(1)
	local 	mx = love.mouse.getX()	
	local	my = love.mouse.getY()
    menu_mousehandling(mx, my, down)
      

end


function menu_mousehandling(mx, my, down)

    if mx > aBlock.x and mx < aBlock.x + 200 and my > aBlock.y and my < aBlock.y + 200 then
    	aBlock.hover=true
    	if down == true then aBlock.call() end
    else
    	aBlock.hover=false
    end
   


end

function selectBlockA()
  
    if isSelected == false then
        isSelected = true

      
    end
    print(isSelected)

end



