-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local game = require("game")

local background = display.newImage("fundo.png")
background.x = display.contentCenterX
background.y = display.contentCenterY

local memoriaAnimalImagem = display.newImage("memoriaanimal.png")
memoriaAnimalImagem.x = display.contentCenterX
memoriaAnimalImagem.y = 140

local telaInicial = display.newGroup()

local widget = require ("widget")

local function handleButtonEvent(event)
  if("ended" == event.phase) then
    
    telaInicial.isVisible = false
    telaInicial:removeSelf()
    telaInicial = nil
    criarCartas()
    
  end
end
  
local novoJogoButton = widget.newButton(
  {
    defaultFile="jogar2.png",
    overFile="jogar1.png",
    label="",
    onEvent = handleButtonEvent
  }
)

novoJogoButton.x = display.contentCenterX
novoJogoButton.y = 280

telaInicial:insert(novoJogoButton)
telaInicial:insert(memoriaAnimalImagem)
