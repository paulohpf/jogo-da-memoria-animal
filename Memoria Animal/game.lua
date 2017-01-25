-----------------------------------------------------------------------------------------
--
-- game.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

display.setStatusBar(display.HiddenStatusBar);

_W = display.contentWidth; -- Returns Screen Width
_H = display.contentHeight; -- Returns Screen Height
 
local totalButtons = 0 --Track total on screen buttons
 
local secondSelect = 0 -- Track if first or second button select
local checkForMatch = false --Let the app know when to check for matches
 
x = -20 --Set starting point for button grid
level = 1 --Set the starting game level
local bars = 4

local grupoCartas = display.newGroup()

--Declare button, buttonCover, and buttonImages table
local button = {}
local buttonCover = {}
local buttonImages = {1,1, 2,2, 3,3, 4,4, 5,5, 6,6, 7,7, 8,8, 9,9}

--Declare and prime a last button selected variable
local lastButton = display.newImageRect("1.png", 75,75)
lastButton.myName = 1;

--Set up simple off-white background
local background = display.newImage("fundo.png")
background.x = display.contentCenterX
background.y = display.contentCenterY

--Notify player if match is found or not

local matchText = display.newImage("errou.png");
matchText.x = display.contentCenterX
matchText.y = 30
matchText.isVisible = false;

--Set count number of card founded
local countFound = 0;

--Set up game function
function game(object, event)
    if(event.phase == "began") then
        if(checkForMatch == false and secondSelect == 0) then
            --Flip over first button
            buttonCover[object.number].isVisible = false;
            lastButton = object
            checkForMatch = true            
        elseif(checkForMatch == true) then
            if(secondSelect == 0) then
                --Flip over second button
                buttonCover[object.number].isVisible = false;
                secondSelect = 1;
                --If buttons do not match, flip buttons back over
                if(lastButton.myName ~= object.myName) then
--                    matchText.text = "Match Not Found!";
                    matchText = display.newImage("errou.png")
                    matchText.x = display.contentCenterX
                    matchText.y = 30
                    timer.performWithDelay(1250, function()                     
                        matchText.isVisible = false
                        checkForMatch = false;
                        secondSelect = 0;
                        buttonCover[lastButton.number].isVisible = true;
                        buttonCover[object.number].isVisible = true;
                    end, 1)                 
                --If buttons DO match, remove buttons
                elseif(lastButton.myName == object.myName) then
--                    matchText.text = "Match Found!";
                    matchText = display.newImage("encontrou.png")
                    matchText.x = display.contentCenterX
                    matchText.y = 30                    
                    timer.performWithDelay(1250, function()                     
--                        matchText.text = " ";
                        matchText.isVisible = false
                        checkForMatch = false;
                        secondSelect = 0;
                        lastButton:removeSelf();
                        object:removeSelf();
                        buttonCover[lastButton.number]:removeSelf();
                        buttonCover[object.number]:removeSelf();
                        countFound=countFound+1;
                        
                        print("Criei:" .. countFound);
                        
                        if(countFound == 9) then
                          print("Encontrei todas!!")
                          x = -20;
                          local buttonImages = {1,1, 2,2, 3,3, 4,4, 5,5, 6,6}
                          level = level+1;
                          criarCartas();
                        end
                    end, 1) 
                end             
            end         
        end
    end
end

--Place buttons on screen
function criarCartas()

  if (level > 1) then
  bars = bars + 1
  end

  for count = 1,3 do
      x = x + 90
      y = 15
       
      for insideCount = 1, 6 do
          y = y + 70
           
          --Assign each image a random location on grid
          temp = math.random(1, #buttonImages)
          button[count] = display.newImageRect(buttonImages[temp] .. ".png", 75, 75)
          ;             
          print("Criei o Botão ".. buttonImages[temp].. "")
          
          --Position the button
          button[count].x = x;
          button[count].y = y;
           
          --Give each a button a name
          button[count].myName = buttonImages[temp]
          button[count].number = totalButtons
           
          --Remove button from buttonImages table
          table.remove(buttonImages, temp)
           
  --Set a cover to hide the button image      
          buttonCover[totalButtons] = display.newImageRect("button.png", 75, 75);
          buttonCover[totalButtons].x = x; buttonCover[totalButtons].y = y;
          totalButtons = totalButtons + 1
           
          --Attach listener event to each button
          button[count].touch = game      
          button[count]:addEventListener( "touch", button[count] )
      end
  end
end