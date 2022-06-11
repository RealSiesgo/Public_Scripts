-- /*WARNING*\: THIS SCRIPT GOES ON UNTIL THE CURRENT ROUND ENDS OR THE WINDOW SCALE CHANGES
-- and im too lazy to fix that :D

-- \Settings/ --

string_len_max=5 --> the script may increase max length 1 by 1 if there are no words for the hint matching the max length

local MATH_RANDOM_MIN,MATH_RANDOM_MAX=5,17

-- /Settings\ --

math.randomseed(os.time())
alreadyguessedtable={}
loadstring(game:HttpGet("https://raw.githubusercontent.com/angeld23/raw-text-host/master/condensed_english_words"))()
table.insert(ENGLISH_WORDS,"pes")table.insert(ENGLISH_WORDS,"des")
while task.wait() do
    center=game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Container.GameSpace.DefaultUI.GameContainer.DesktopContainer.Typebar.Center
    if center.BackgroundTransparency==1 then
        repeat
            center:GetPropertyChangedSignal("BackgroundTransparency"):Wait()
            wait()
        until center.BackgroundTransparency~=1
    end
    HINT=""
    tfrm=game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Container.GameSpace.DefaultUI.GameContainer.DesktopContainer.InfoFrameContainer.InfoFrame.TextFrame
    TEXTBOX=game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Container.GameSpace.DefaultUI.GameContainer.DesktopContainer.Typebar.Typebox

    if TEXTBOX.Visible==false then
        repeat
            task.wait()
        until TEXTBOX.Visible
    end
    
    for i,v in next,tfrm:GetChildren() do
        --FIND HINTS
        if v.Name=="LetterFrame" and v.Visible then
            --IF HINTLETTERFRAME AND HINTLETTERFRAME VISIBLE THEN
            HINT=HINT..v.Letter.TextLabel.Text
            --GET THE HINT MSG
        end
    end
    --wait(1.5)
    function trytofind(length)
        for i,v in next, ENGLISH_WORDS do
            if v:lower():match(HINT:lower()) and string.len(v)<length and (not table.find(alreadyguessedtable,v)) then
                table.insert(alreadyguessedtable,v)
                for i=1,v:len() do
                    --wait(math.random(MATH_RANDOM_MIN,MATH_RANDOM_MAX)*10^-2)
                    TEXTBOX.Text=v:sub(1,i)
                end
                task.wait()
                oldtb=game:GetService("UserInputService"):GetFocusedTextBox()
                firesignal(TEXTBOX.FocusLost, true)
                if oldtb then oldtb:CaptureFocus() end
                return true
            end
        end
        
        return false
    end
    if trytofind(string_len_max)==false then
        for i=string_len_max,30 do
            if trytofind(i) then break end
        end
    end
    wait(.75)
end
