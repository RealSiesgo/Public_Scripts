string_len_max=5
--the script may increase max len 1 by 1 if theres no words for the hint

math.randomseed(os.time())


math_random_value=math.random(5,25)

-- -- -- -- --
HINT=""
tfrm=game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Container.GameSpace.DefaultUI.GameContainer.DesktopContainer.InfoFrameContainer.InfoFrame.TextFrame
TEXTBOX=game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Container.GameSpace.DefaultUI.GameContainer.DesktopContainer.Typebar.Typebox
for i,v in next,tfrm:GetChildren() do
    if v.Name=="LetterFrame" and v.Visible then
        HINT=HINT..v.Letter.TextLabel.Text
    end
end

if alreadyguessedtable==nil then
    getgenv().alreadyguessedtable={}
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/angeld23/raw-text-host/master/condensed_english_words"))()
function trytofind(lenght)
    for i,v in next, ENGLISH_WORDS do
        if v:lower():match(HINT:lower()) and string.len(v)<lenght and (not table.find(alreadyguessedtable,v)) then
            table.insert(alreadyguessedtable,v)
            for i=1,v:len() do
                wait(math_random_value*10^-2)
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
