--wrote this script in case yall get banned everytime for saying bad words like me too lmao
local words={"fu.k","suck my c.ck","n.gger","n.gga","faggot","nier","niger","su.k my","blowjob","b.tch","hoe","cock","d.ck","osama","shit","anal","rape","f.ck","w.at t.e f.c.","h.ck","exploit","gay","hacke.r","daddy","daddies","daddys","mommy","mommies","mommys"}
local mfstopthatshit = false
repeat wait(.5) until game:IsLoaded()
if (not game.ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")) or (not game.ReplicatedStorage.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")) then
	warn("This game doesnt have roblox's chatting System.")
	warn("Stopping script.")
	return
end

function _f(txt)
	for i,v in next, words do
		if txt:lower():match(v) then
			return true
		end
	end
	return false
end
function tagtext(text)
	local TAGTEXT=""
	text=text:len()
	for i=1,text do TAGTEXT=TAGTEXT.."#"end
	return TAGTEXT
end
hm=hookmetamethod(game,"__namecall",function(Self,...)
	local args={...}
	local ncm = getnamecallmethod()
	if Self==game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest and ncm:lower()=="fireserver" and _f(args[1]) and (not mfstopthatshit) then
		local text=args[1]
		for i,v in next, words do text=text:gsub(v,tagtext) end
		return Self:FireServer(text,args[2])
	end

	return hm(Self,...)
end)
game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
	if msg:match("^/e stopword") then
		mfstopthatshit = true
	end
end)
