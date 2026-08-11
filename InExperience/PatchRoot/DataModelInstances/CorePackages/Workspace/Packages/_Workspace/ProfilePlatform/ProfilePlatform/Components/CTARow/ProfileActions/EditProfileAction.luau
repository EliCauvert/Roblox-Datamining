local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local buttonVariant = require(parent.Foundation).Enums.ButtonVariant
local refreshProfilePlatformUserInfoModule = require(profilePlatform.Networking.refreshProfilePlatformUserInfo)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes
local fFlagMoveInExperienceModeToEditProfile = sharedFlagsModule.FFlagMoveInExperienceModeToEditProfile
local fFlagAXEnableProfileTab = sharedFlagsModule.FFlagAXEnableProfileTab

return {
	[enumsModule.ProfileActions.EditProfile] = function(p0) --[[ line: 19 ]]
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), fFlagAXEnableProfileTab (ref), refreshProfilePlatformUserInfoModule (ref), fFlagMoveInExperienceModeToEditProfile (ref)
		return {
			variant = buttonVariant.Standard,
			text = p0.localized[enumsModule.ProfileActions.EditProfile],
			onActivated = {
				[profileTypes.User] = function() --[[ line: 24 ]]
					-- upvalues: p0 (ref), eventNamesModule (copy), enumsModule (copy), fFlagAXEnableProfileTab (copy), refreshProfilePlatformUserInfoModule (copy), fFlagMoveInExperienceModeToEditProfile (copy)
					local var6
					p0.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonOpenEditProfilePage, { buttonSurface = p0.buttonSurface })
					local navigate = p0.navigation.navigate
					local editProfilePage = enumsModule.Screens.EditProfilePage
					local t = {}
					
					if fFlagAXEnableProfileTab then
						var6 = p0.profileWrapperContext.forceFullView == true
						var6 = nil
					else
						var6 = nil
					end
					t.fullBleed = var6
					
					function t.navigateToEditUsername(p1) --[[ line: 36 ]]
						-- upvalues: p0 (copy), refreshProfilePlatformUserInfoModule (copy)
						p0.navigateTo.editUsername({
							showToast = p1,
							onUsernameChanged = function() --[[ line: 39 ]]
								-- upvalues: p0 (copy), refreshProfilePlatformUserInfoModule (copy)
								p0.dispatch(refreshProfilePlatformUserInfoModule(p0.profileId))
							end
						})
					end
					
					function t.onIdentityChange() --[[ line: 44 ]]
						-- upvalues: p0 (copy), refreshProfilePlatformUserInfoModule (copy)
						p0.dispatch(refreshProfilePlatformUserInfoModule(p0.profileId))
					end
					
					t.onToggleInExperienceMode = if fFlagMoveInExperienceModeToEditProfile then function() --[[ line: 48 ]]
						-- upvalues: p0 (copy), refreshProfilePlatformUserInfoModule (copy), eventNamesModule (copy)
						p0.dispatch(refreshProfilePlatformUserInfoModule(p0.profileId))
						p0.analytics.fireAnalyticsEvent(eventNamesModule.ToggleInExperienceModeButton, {})
					end else nil
					navigate(editProfilePage, t)
				end
			}
		}
	end
}