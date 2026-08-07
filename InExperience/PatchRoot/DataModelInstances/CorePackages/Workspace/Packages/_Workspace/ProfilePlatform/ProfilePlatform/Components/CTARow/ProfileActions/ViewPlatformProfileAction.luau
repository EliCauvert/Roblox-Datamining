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
	[enumsModule.ProfileActions.ViewPlatformProfile] = if fFlagEnablePlatformProfileContextualMenuOption then function(p0) --[[ line: 16 ]]
		-- upvalues: fFlagPPVEnabledOnConsole (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), getPlatformFriendsServiceModule (ref)
		if fFlagPPVEnabledOnConsole then
			local profilePlatformId = p0.profileWrapperContext.profilePlatformId
			
			return if profilePlatformId and profilePlatformId ~= "" then {
				text = p0.localized[enumsModule.ProfileActions.ViewPlatformProfile],
				onActivated = {
					[profileTypes.User] = function() --[[ line: 27 ]]
						-- upvalues: p0 (ref), eventNamesModule (copy), getPlatformFriendsServiceModule (copy)
						p0.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonViewPlatformProfile, { buttonSurface = p0.buttonSurface })
						getPlatformFriendsServiceModule:ShowProfile(p0.profileWrapperContext.profilePlatformId)
					end
				}
			} else nil
		end
	end else nil
}