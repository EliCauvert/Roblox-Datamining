return function(p1)
	return if p1 == nil or p1 == "" then false elseif string.sub(p1, 1, 18) ~= "Roblox.ChatEnabled" then if string.sub(p1, 1, 14) ~= "Roblox.Welcome" then string.sub(p1, 1, 14) == "Roblox.Summary" else true else true
end