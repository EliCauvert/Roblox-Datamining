local gameInvite = script:FindFirstAncestor("GameInvite")
local gameInviteConstantsModule = require(gameInvite.GameInviteConstants)
local _ = require(gameInvite.gameInviteModalType)

function isTriggerDDI(p1)
	-- upvalues: gameInviteConstantsModule (ref)
	return if p1 ~= gameInviteConstantsModule.Triggers.DeveloperSingle then p1 == gameInviteConstantsModule.Triggers.DeveloperMultiple else true
end

function isTriggerGameMenu(p1)
	-- upvalues: gameInviteConstantsModule (ref)
	return p1 == gameInviteConstantsModule.Triggers.GameMenu
end

return {
	isTriggerDDI = isTriggerDDI,
	isTriggerGameMenu = isTriggerGameMenu
}