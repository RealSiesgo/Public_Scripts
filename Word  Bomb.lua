--WARNING: YOU MUST EXECUTE EVERYTIME ITS YOUR TURN
string_len_max=5
--the script may increase max length 1 by 1 if theres no words for the hint matching the max length

math.randomseed(os.time())

local MATH_RANDOM_MIN,MATH_RANDOM_MAX=5,25

-- /Settings\ --
warn("MADE BY Siesgo#8832")
print("MADE BY Siesgo#8832")
-- -- -- -- --

loadstring(game:HttpGet("https://raw.githubusercontent.com/angeld23/raw-text-host/master/condensed_english_words"))()
table.insert(ENGLISH_WORDS,"arab")
table.insert(ENGLISH_WORDS,"nigger") --game accepts n word ¯\_(ツ)_/¯
table.insert(ENGLISH_WORDS,"pes")table.insert(ENGLISH_WORDS,"des")

HINT=""
tfrm=game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Container.GameSpace.DefaultUI.GameContainer.DesktopContainer.InfoFrameContainer.InfoFrame.TextFrame
TEXTBOX=game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Container.GameSpace.DefaultUI.GameContainer.DesktopContainer.Typebar.Typebox
for i,v in next,tfrm:GetChildren() do
    --FIND HINTS
    if v.Name=="LetterFrame" and v.Visible then
        --IF HINTLETTERFRAME AND HINTLETTERFRAME VISIBLE THEN
        HINT=HINT..v.Letter.TextLabel.Text
        --GET THE HINT MSG
    end
end

if alreadyguessedtable==nil then
    getgenv().alreadyguessedtable={}
end

function trytofind(length)
    for i,v in next, ENGLISH_WORDS do
        if TEXTBOX.Visible==false then break end
        if v:lower():match(HINT:lower()) and string.len(v)<length and (not table.find(alreadyguessedtable,v)) then
            table.insert(alreadyguessedtable,v)
            for i=1,v:len() do
                wait(math.random(MATH_RANDOM_MIN,MATH_RANDOM_MAX)*10^-2)
                TEXTBOX.Text=v:sub(1,i)
            end
            wait(.25)
            firesignal(TEXTBOX.FocusLost, {true})
            FOUNDTEXT=true
            break
        end
    end
    
    return (FOUNDTEXT or false)
end
if trytofind(string_len_max)==false then
    for i=string_len_max,30 do
        if trytofind(i) then break end
    end
end
