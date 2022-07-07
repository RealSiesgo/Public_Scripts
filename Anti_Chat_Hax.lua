repeat wait() until game:IsLoaded()
local blacklisted = {}
local chatbx = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar

mehook1=hookmetamethod(game:GetService("Players"),"__namecall",function(...)
	local Self=...
	if not checkcaller() and Self==chatbx and getnamecallmethod()=="CaptureFocus" then
		table.insert(blacklisted,getcallingscript())
	end
	return mehook1(...)
end)
mehook2=hookmetamethod(game:GetService("Players"),"__newindex",function(...)
	local Self=...
	if not checkcaller() and Self==chatbx and table.find(blacklisted,getcallingscript()) then
		print("Blocked ChatHax.")
		chatbx:ReleaseFocus()
		return wait(9e9)
	end
	return mehook2(...)
end)
