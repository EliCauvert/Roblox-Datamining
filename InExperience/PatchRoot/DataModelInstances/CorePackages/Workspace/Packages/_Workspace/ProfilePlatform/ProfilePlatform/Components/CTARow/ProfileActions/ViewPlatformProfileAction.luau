local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local GetPlatformFriendsServiceModule = require(ProfilePlatform.Utils.getPlatformFriendsService)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes

return {
	[EnumsModule.ProfileActions.ViewPlatformProfile] = if require(ProfilePlatform.Parent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption then function(p1) --[[ Line: 15 ]]
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), GetPlatformFriendsServiceModule (copy)
		local ProfilePlatformId = p1.profileWrapperContext.profilePlatformId
		
		return if ProfilePlatformId and ProfilePlatformId ~= "" then {
			text = p1.localized[EnumsModule.ProfileActions.ViewPlatformProfile],
			onActivated = {
				[ProfileTypes.User] = function() --[[ Line: 24 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), GetPlatformFriendsServiceModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonViewPlatformProfile, { buttonSurface = p1.buttonSurface })
					GetPlatformFriendsServiceModule:ShowProfile(p1.profileWrapperContext.profilePlatformId)
				end
			}
		} else nil
	end else nil
}