-----------------------------------------------------------------------------------------
--
-- voices.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local function narrationFinished( event )
    print( "Narration Finished on channel", event.channel )
    if ( event.completed ) then
        print( "Narration completed playback naturally" )
    else
        print( "Narration was stopped before completion" )
    end
end

--local cachorro = audio.loadSound("voices/cachorro.wav")
audio.setVolume( 0.5 )
local cachorro = audio.loadStream( "voices/cachorro.wav" )
local cavalo = audio.loadStream("voices/cavalo.wav")
local cobra = audio.loadStream("voices/cobra.wav")
local coelho = audio.loadStream("voices/coelho.wav")
local galinha = audio.loadStream("voices/galinha.wav")
local golfinho = audio.loadStream("voices/golfinho.wav")
local leao = audio.loadStream("voices/leao.wav")
local lobo = audio.loadStream("voices/lobo.wav")
local macaco = audio.loadStream("voices/macaco.wav")
local porco = audio.loadStream("voices/porco.wav")
local urso = audio.loadStream("voices/urso.wav")
local vaca = audio.loadStream("voices/vaca.wav")

function playSound (id)

if(id==1) then
audio.play( cachorro )
elseif (id==2) then
audio.play( cavalo )
elseif (id==3) then
audio.play( coelho )
elseif (id==4) then
audio.play( cobra )
elseif (id==5) then
audio.play( galinha )
elseif (id==6) then
audio.play( golfinho )
elseif (id==7) then
audio.play( leao )
elseif (id==8) then
audio.play( lobo )
elseif (id==9) then
audio.play( macaco )
elseif (id==10) then
audio.play( porco )
elseif (id==11) then
audio.play( urso )
elseif (id==12) then
audio.play( vaca )
end

end