words={"fuck","nigger","faggot","nier","senpai","niger","suck my"}
function _f(txt)
	for i,v in next, words do
		if txt:lower():match(v:lower()) then
			return true
		end
	end
	return false
end
hm=hookmetamethod(game,"__namecall",function(Self,...)
	local args={...}
	local ncm = getnamecallmethod()
	if Self==game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest and ncm:lower()=="fireserver" and _f(args[1]) then
		local text=args[1]
		for i,v in next, words do text=text:gsub(v,"###") end
		return Self:FireServer(text,args[2])
	end

	return hm(Self,...)
end)
