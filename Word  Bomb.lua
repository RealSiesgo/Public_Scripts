math.randomseed(tick())

-- \Settings/ --
string_len_max=3
--the script may increase max len if theres no words matching the hint
math_random_value=math.random(8,15)
-- /Settings\ --

HINT=""
TEXTBOX=game:GetService("Players")["Real_Siesgo"].PlayerGui.GameUI.Container.GameSpace.DefaultUI.GameContainer.DesktopContainer.Typebar.Typebox
for i,v in next,game:GetService("Players")["Real_Siesgo"].PlayerGui.GameUI.Container.GameSpace.DefaultUI.GameContainer.DesktopContainer.InfoFrameContainer.InfoFrame.TextFrame:GetChildren() do
    if v.Name=="LetterFrame" and v.Visible then
        HINT=HINT..v.Letter.TextLabel.Text
    end
end

if alreadyguessedtable==nil then
    getgenv().alreadyguessedtable={}
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/angeld23/raw-text-host/master/condensed_english_words"))()
table.insert(ENGLISH_WORDS,"damp")
table.insert(ENGLISH_WORDS,"racism")
function trytofind(lenght)
    for i,v in next, ENGLISH_WORDS do
        if v:lower():match(HINT:lower()) and string.len(v)<lenght and (not table.find(alreadyguessedtable,v)) then
            
            table.insert(alreadyguessedtable,v)
            
            for i=1,v:len() do
                task.wait(math_random_value*10^-2)
                TEXTBOX.Text=v:sub(1,i)
            end
            
            wait(.3)
            
            coroutine.wrap(function()
                OLDFOCUSEDTEXTBOX=game:GetService("UserInputService"):GetFocusedTextBox()
                TEXTBOX:CaptureFocus()
                firesignal(TEXTBOX.FocusLost, {true})
                if OLDFOCUSEDTEXTBOX then
                    --So we dont annoy the script user with unfocusing textboxes they focused
                    OLDFOCUSEDTEXTBOX:CaptureFocus()
                end
            end)()
            
            FOUNDTEXT=true
            break
        end
    end
    
    return (FOUNDTEXT or false)
end


if not trytofind(string_len_max) then
    --INCREASE THE MAX LENGHT IF NO WORDS MATCHING
    for i=string_len_max,30 do
        if trytofind(i) then break end
    end
end
