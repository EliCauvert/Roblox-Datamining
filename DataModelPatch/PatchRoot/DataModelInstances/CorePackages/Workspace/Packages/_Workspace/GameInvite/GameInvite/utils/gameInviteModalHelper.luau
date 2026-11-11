local GameInvite = script:FindFirstAncestor("GameInvite")
local GameInviteConstantsModule = require(GameInvite.GameInviteConstants)
local _ = require(GameInvite.gameInviteModalType)

function isTriggerDDI(DeveloperMultiple): boolean
	-- upvalues: GameInviteConstantsModule (copy)
	return DeveloperMultiple == GameInviteConstantsModule.Triggers.DeveloperSingle or DeveloperMultiple == GameInviteConstantsModule.Triggers.DeveloperMultiple
end

function isTriggerGameMenu(GameMenu): boolean
	-- upvalues: GameInviteConstantsModule (copy)
	return GameMenu == GameInviteConstantsModule.Triggers.GameMenu
end

return {
	isTriggerDDI = isTriggerDDI,
	isTriggerGameMenu = isTriggerGameMenu
}