local GameSocialLinkModule = {
	new = function()
		return {}
	end
}

function GameSocialLinkModule.mockDiscord()
	-- upvalues: GameSocialLinkModule (copy)
	local NewGameSocialLink = GameSocialLinkModule.new()
	NewGameSocialLink.url = "https://discord.gg/f2vDJse"
	NewGameSocialLink.title = "Join the discord, to chat with players, and receive updates!"
	NewGameSocialLink.type = "Discord"
	
	return NewGameSocialLink
end

function GameSocialLinkModule.mockRobloxGroup()
	-- upvalues: GameSocialLinkModule (copy)
	local NewGameSocialLink = GameSocialLinkModule.new()
	NewGameSocialLink.url = "https://www.roblox.com/groups/2757866"
	NewGameSocialLink.title = "Join Flamin' Studios to instantly unlock pushups in-game!"
	NewGameSocialLink.type = "RobloxGroup"
	
	return NewGameSocialLink
end

function GameSocialLinkModule.mockTwitter()
	-- upvalues: GameSocialLinkModule (copy)
	local NewGameSocialLink = GameSocialLinkModule.new()
	NewGameSocialLink.url = "https://twitter.com/HiddoYT"
	NewGameSocialLink.title = "Follow Hiddo on Twitter for Codes!"
	NewGameSocialLink.type = "Twitter"
	
	return NewGameSocialLink
end

function GameSocialLinkModule.mockAmazon()
	-- upvalues: GameSocialLinkModule (copy)
	local NewGameSocialLink = GameSocialLinkModule.new()
	NewGameSocialLink.url = "https://amazon.com/roblox"
	NewGameSocialLink.title = "Check out official Roblox merch!"
	NewGameSocialLink.type = "Amazon"
	
	return NewGameSocialLink
end

function GameSocialLinkModule.fromJsonData(p1)
	-- upvalues: GameSocialLinkModule (copy)
	local NewGameSocialLink = GameSocialLinkModule.new()
	NewGameSocialLink.url = p1.url
	NewGameSocialLink.title = p1.title
	NewGameSocialLink.type = p1.type
	
	return NewGameSocialLink
end

return GameSocialLinkModule