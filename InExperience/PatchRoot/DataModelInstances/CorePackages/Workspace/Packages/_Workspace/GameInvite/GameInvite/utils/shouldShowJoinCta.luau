local GameInvite = script:FindFirstAncestor("GameInvite")
local _ = require(GameInvite.gameInviteModalType)
local config = {
	[require(GameInvite.GameInviteConstants).Triggers.GameMenu] = true
}

return function(p1): boolean --[[ Line: 10 | Named "shouldShowJoinCta" ]]
	-- upvalues: config (copy)
	return config[p1.trigger] == true
end