--game ID = 6584731191
if debounceVAL==nil or debounceVAL==false then
    getgenv().debounceVAL=true
    for i,v in next, game.Players:GetPlayers() do
        if v.Name~=game.Players.LocalPlayer.Name then
            plr=v
            plname=plr.Name
            coroutine.resume(coroutine.create(function()
            for i=1,150 do task.wait()
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    game.ReplicatedStorage.events.push:FireServer(plr,plr.Character.HumanoidRootPart)
                end
            game:GetService("ReplicatedStorage").events.PushRE:FireServer(plr)
            end
            wait(1)
            getgenv().debounceVAL=false
            end))
            wait()
        end
    end
else
    game.StarterGui:SetCore("SendNotification", {Title = "Siesgo's Weird shit";Text = "You are on cooldown cuz executing this too much might get you remoteEvent banned for about 4-5 minutes";Duration = 6;})
    -- Getting RemoteEvent banned doesnt let you fire remote events for a lil
end
