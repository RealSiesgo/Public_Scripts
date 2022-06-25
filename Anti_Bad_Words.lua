--wrote this script in case yall get banned everytime for saying bad words like me too lmao
words={"fu.k","n.gger","n.gga","faggot","nier","niger","suck my","retard","blowjob","bitch","hoe","cock","dick","osama","shit","anal","rape","fack","daddy","f.ck","ass"}
repeat wait(.5) until game:IsLoaded()
if (not game.ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")) or (not game.ReplicatedStorage.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")) then
	warn("This game doesnt have roblox's chatting System.")
	warn("Stopping script.")
	return
end

function _f(txt)
	for i,v in next, words do
		if txt:lower():match(v:lower()) then
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
	if Self==game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest and ncm:lower()=="fireserver" and _f(args[1]) then
		local text=args[1]
		for i,v in next, words do text=text:gsub(v,tagtext) end
		return Self:FireServer(text,args[2])
	end

	return hm(Self,...)
end)
