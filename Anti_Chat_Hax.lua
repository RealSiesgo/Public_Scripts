--[[
getgenv().SETTINGS={
	["Notifications_Enabled"]  = true;
	["Notifications_Duration"] = 8;
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/RealSiesgo/Public_Scripts/main/Anti_Chat_Hax.lua"))()
]]
repeat wait() until game:IsLoaded()
local chatbx = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui",9e9).Chat.Frame.ChatBarParentFrame.Frame.BoxFrame:WaitForChild("Frame",9e9):FindFirstChildWhichIsA("TextBox")
local blacklisted = {}
local notify_me = false
local duration = 8
if SETTINGS then
	if SETTINGS["Notifications_Enabled"] then
		notify_me = true
		if SETTINGS["Notifications_Duration"] then
			duration = SETTINGS["Notifications_Duration"]
			if duration < 0 then
				duration=3
			end
		end
	end
end
local hatext
if not notify_me then
	hatext="Notifications Enabled: false"
else
	hatext="Notifications Enabled: true\nNotifications Duration: "..tostring(duration)
end
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Anti-ChatHax Running.";
	Text = hatext;
	Duration = 6;
})

warn("MADE BY Siesgo#8832")

function notify(txt)
	if not notify_me then return end
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Anti-ChatHax (BLOCKED MSG)";
		Text = txt;
		Duration = duration;
	})
end
mehook1=hookmetamethod(game,"__namecall",function(...)
	local Self,arg=...
	local ncm=getnamecallmethod()
	local scr=getcallingscript()
	if not checkcaller() and Self==chatbx and scr.Parent.Name~="PlayerScripts"and scr.Name~="ChatScript"and #scr:GetDescendants()~=16 then
		if ncm=="CaptureFocus" then
			table.insert(blacklisted,scr)
			--print("stopped",scr,"from capturing focus")
			return
		elseif ncm=="ReleaseFocus" then
			--> Extra protection maybe??
			--print("stopped",scr,"from releasing focus")
			return
		end
	end
	if not checkcaller() and ncm=="FireServer"and Self.Name=="SayMessageRequest" and (scr==nil or scr.ClassName~="ModuleScript"or scr.Parent.Name~="ChatScript"or scr.Parent.Parent.Name~="PlayerScripts") then
		notify(arg)
		return
	end
	return mehook1(...)
end)
mehook2=hookmetamethod(game:GetService("Players"),"__newindex",newcclosure(function(...)
	local Self,property,msg=...
	if not checkcaller() and table.find(blacklisted,getcallingscript()) and property=="Text" and typeof(msg)=="string" and Self==chatbx then
		--print("Blocked ChatHax.")
		notify(msg)
		return
	end
	return mehook2(...)
end))
