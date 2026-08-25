return function(p0)
	return if p0 == nil or p0 == "" then false elseif string.sub(p0, 1, 18) ~= "Roblox.ChatEnabled" then if string.sub(p0, 1, 14) ~= "Roblox.Welcome" then string.sub(p0, 1, 14) == "Roblox.Summary" else true else true
end