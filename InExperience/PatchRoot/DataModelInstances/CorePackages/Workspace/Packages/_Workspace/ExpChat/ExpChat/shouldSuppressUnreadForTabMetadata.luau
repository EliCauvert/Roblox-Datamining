return function(Text: string): boolean
	return Text ~= nil and Text ~= "" and (string.sub(Text, 1, 18) == "Roblox.ChatEnabled" or (string.sub(Text, 1, 14) == "Roblox.Welcome" or (string.sub(Text, 1, 14) == "Roblox.Summary" or string.sub(Text, 1, 22) == "Roblox.Whisper.Welcome")))
end