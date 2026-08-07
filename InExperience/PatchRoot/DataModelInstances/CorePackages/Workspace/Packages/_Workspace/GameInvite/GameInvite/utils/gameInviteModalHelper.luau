local gameInvite = script:FindFirstAncestor("GameInvite")
local gameInviteConstantsModule = require(gameInvite.GameInviteConstants)
local _ = require(gameInvite.gameInviteModalType)

function isTriggerDDI(p0) --[[ line: 5 ]]
	-- upvalues: gameInviteConstantsModule (ref)
	return if p0 ~= gameInviteConstantsModule.Triggers.DeveloperSingle then p0 == gameInviteConstantsModule.Triggers.DeveloperMultiple else true
end

function isTriggerGameMenu(p1) --[[ line: 9 ]]
	-- upvalues: gameInviteConstantsModule (ref)
	return p1 == gameInviteConstantsModule.Triggers.GameMenu
end

return {
	isTriggerDDI = isTriggerDDI,
	isTriggerGameMenu = isTriggerGameMenu
}