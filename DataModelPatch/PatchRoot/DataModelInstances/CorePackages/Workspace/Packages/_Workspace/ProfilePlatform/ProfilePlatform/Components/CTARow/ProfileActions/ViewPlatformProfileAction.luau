local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local FFlagPPVEnabledOnConsole = require(Parent.SharedFlags).FFlagPPVEnabledOnConsole
local GetPlatformFriendsServiceModule = require(ProfilePlatform.Utils.getPlatformFriendsService)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes

return {
	[EnumsModule.ProfileActions.ViewPlatformProfile] = if require(Parent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption then function(p1)
		-- upvalues: FFlagPPVEnabledOnConsole (copy), EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), GetPlatformFriendsServiceModule (copy)
		if FFlagPPVEnabledOnConsole then
			local ProfilePlatformId = p1.profileWrapperContext.profilePlatformId
			
			if not ProfilePlatformId or ProfilePlatformId == "" then
				return nil
			end
		end
		return {
			text = p1.localized[EnumsModule.ProfileActions.ViewPlatformProfile],
			onActivated = {
				[ProfileTypes.User] = function()
					-- upvalues: p1 (copy), EventNamesModule (upval), GetPlatformFriendsServiceModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonViewPlatformProfile, { buttonSurface = p1.buttonSurface })
					GetPlatformFriendsServiceModule:ShowProfile(p1.profileWrapperContext.profilePlatformId)
				end
			}
		}
	end else nil
}