local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local ConstantsModule = require(InExperienceSideSheet.Common.Constants)
local FFlagPioneerLeaveLogsOut = require(InExperienceSideSheet.Parent.SharedFlags).FFlagPioneerLeaveLogsOut
local FFlagPioneerLogoutButtonLabel = require(InExperienceSideSheet.Flags).FFlagPioneerLogoutButtonLabel

return {
	getPioneerLeaveButtonKey = function(p1)
		-- upvalues: FFlagPioneerLeaveLogsOut (copy), ConstantsModule (copy), FFlagPioneerLogoutButtonLabel (copy)
		return if p1 and not FFlagPioneerLeaveLogsOut then ConstantsModule.LocalizationKeys.QuitButton elseif FFlagPioneerLogoutButtonLabel and p1 and FFlagPioneerLeaveLogsOut then ConstantsModule.LocalizationKeys.LogoutButton else "CoreScripts.InGameMenu.LeaveGame"
	end,
	getPioneerLeaveConfirmationKey = function(p1)
		-- upvalues: FFlagPioneerLeaveLogsOut (copy), ConstantsModule (copy), FFlagPioneerLogoutButtonLabel (copy)
		return if p1 and not FFlagPioneerLeaveLogsOut then ConstantsModule.LocalizationKeys.QuitConfirmation elseif FFlagPioneerLogoutButtonLabel and p1 and FFlagPioneerLeaveLogsOut then ConstantsModule.LocalizationKeys.LogoutConfirmation else "CoreScripts.InGameMenu.Prompt.ConfirmLeaveGame"
	end
}