local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local fFlagEnablePlatformProfileContextualMenuOption = require(parent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption
local fFlagPPVEnabledOnConsole = require(parent.SharedFlags).FFlagPPVEnabledOnConsole
local getPlatformFriendsServiceModule = require(profilePlatform.Utils.getPlatformFriendsService)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes

return {
	[enumsModule.ProfileActions.ViewPlatformProfile] = if fFlagEnablePlatformProfileContextualMenuOption then function(p1)
		-- upvalues: fFlagPPVEnabledOnConsole (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), getPlatformFriendsServiceModule (ref)
		if fFlagPPVEnabledOnConsole then
			local profilePlatformId = p1.profileWrapperContext.profilePlatformId
			
			return if profilePlatformId and profilePlatformId ~= "" then {
				text = p1.localized[enumsModule.ProfileActions.ViewPlatformProfile],
				onActivated = {
					[profileTypes.User] = function()
						-- upvalues: p1 (ref), eventNamesModule (copy), getPlatformFriendsServiceModule (copy)
						p1.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonViewPlatformProfile, { buttonSurface = p1.buttonSurface })
						getPlatformFriendsServiceModule:ShowProfile(p1.profileWrapperContext.profilePlatformId)
					end
				}
			} else nil
		end
	end else nil
}