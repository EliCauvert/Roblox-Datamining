local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CheckEmailVerificationModule = require(Modules.LuaApp.Thunks.Authentication.EmailVerification.CheckEmailVerification)
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local LuaLogoutReasonNamesModule = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local FFlagEnableUpdatedLogoutUpsellModal = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagEnableUpdatedLogoutUpsellModal

return function(p1, p2, p3)
	-- upvalues: EventStreamConstantsModule (copy), LogoutModule (copy), LuaLogoutReasonNamesModule (copy), FFlagEnableUpdatedLogoutUpsellModal (copy), CheckEmailVerificationModule (copy)
	return function(p4)
		-- upvalues: p3 (copy), EventStreamConstantsModule (upval), LogoutModule (upval), p1 (copy), p2 (copy), LuaLogoutReasonNamesModule (upval), FFlagEnableUpdatedLogoutUpsellModal (upval), CheckEmailVerificationModule (upval)
		local config = {
			addEmailOver13TextKey = "Feature.VerificationUpsell.Description.LogoutAddEmailTextOver13",
			addEmailTitleKey = "Feature.VerificationUpsell.Heading.VerifyOnLogout",
			updateEmailSecondaryButtonText = "Feature.VerificationUpsell.Action.Logout",
			origin = "logout",
			addEmailUnder13TextKey = if p3.getRenameParentEmailForVerificationUpsell() then "Feature.VerificationUpsell.Description.LogoutAddEmailTextUnder13V2" else "Feature.VerificationUpsell.Description.LogoutAddEmailTextUnder13",
			onUpdateEmailSecondaryButtonPressedEvent = EventStreamConstantsModule.Button.SkipLogOutAnyway,
			onUpdateEmailSecondaryButtonPressed = function()
				-- upvalues: p4 (copy), LogoutModule (upval), p1 (upval), p2 (upval), LuaLogoutReasonNamesModule (upval)
				p4:dispatch(LogoutModule(p1, p2, LuaLogoutReasonNamesModule.EmailUpsellLogOut))
			end,
			emailUpsellLockedIsLocalUserUnder13 = p4:getState().IsLocalUserUnder13
		}
		
		if FFlagEnableUpdatedLogoutUpsellModal then
			config.addEmailTitleKey = "Feature.VerificationUpsell.Heading.FinishAccountSetup"
			config.addEmailUnder13TextKey = "Feature.VerificationUpsell.Description.AddParentalEmail"
			config.updateEmailPrimaryButtonText = "Feature.VerificationUpsell.Action.Logout"
			config.useUpdatedModalDesign = true
		end
		return p4:dispatch(CheckEmailVerificationModule(p1, true, config))
	end
end