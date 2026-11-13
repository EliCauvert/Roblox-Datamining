local Patterns = {
	"^roblox://placeid=",
	"^robloxmobile://placeid=",
	"^roblox://experiences/start%?",
	"^robloxmobile://experiences/start%?"
}
local list = { "roblox.com", "robloxlabs.com" }

local function isRobloxWebHost(Text: string): boolean
	-- upvalues: list (copy)
	for _, value in list do
		if Text == value or string.sub(Text, -(#value + 1)) == "." .. value then
			return true
		end
	end
	return false
end

local function isGameLaunchUrl(Text: string)
	-- upvalues: Patterns (copy), isRobloxWebHost (copy)
	for _, pattern in Patterns do
		if string.find(Text, pattern) then
			return true
		end
	end
	local Match: string? = string.match(Text, "^https?://([^/]+)/games/start%?")
	
	return Match ~= nil and isRobloxWebHost(Match)
end

return function(Text: string)
	-- upvalues: isGameLaunchUrl (copy)
	local Lowered = string.lower(Text)
	
	if isGameLaunchUrl(Lowered) then
		local Match: string? = string.match(Lowered, "[/?&]placeid=(%d+)")
		
		return if Match then tonumber(Match) else nil
	else
		return nil
	end
end