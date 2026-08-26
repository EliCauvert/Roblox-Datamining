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
	[enumsModule.ProfileActions.EditProfile] = function(p1)
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), fFlagAXEnableProfileTab (ref), refreshProfilePlatformUserInfoModule (ref), fFlagMoveInExperienceModeToEditProfile (ref)
		return {
			variant = buttonVariant.Standard,
			text = p1.localized[enumsModule.ProfileActions.EditProfile],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), enumsModule (copy), fFlagAXEnableProfileTab (copy), refreshProfilePlatformUserInfoModule (copy), fFlagMoveInExperienceModeToEditProfile (copy)
					local var1
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonOpenEditProfilePage, { buttonSurface = p1.buttonSurface })
					local navigate = p1.navigation.navigate
					local editProfilePage = enumsModule.Screens.EditProfilePage
					local t = {}
					
					if fFlagAXEnableProfileTab then
						var1 = p1.profileWrapperContext.forceFullView == true
						var1 = nil
					else
						var1 = nil
					end
					t.fullBleed = var1
					
					function t.navigateToEditUsername(p2)
						-- upvalues: p1 (copy), refreshProfilePlatformUserInfoModule (copy)
						p1.navigateTo.editUsername({
							showToast = p2,
							onUsernameChanged = function()
								-- upvalues: p1 (copy), refreshProfilePlatformUserInfoModule (copy)
								p1.dispatch(refreshProfilePlatformUserInfoModule(p1.profileId))
							end
						})
					end
					
					function t.onIdentityChange()
						-- upvalues: p1 (copy), refreshProfilePlatformUserInfoModule (copy)
						p1.dispatch(refreshProfilePlatformUserInfoModule(p1.profileId))
					end
					
					t.onToggleInExperienceMode = if fFlagMoveInExperienceModeToEditProfile then function()
						-- upvalues: p1 (copy), refreshProfilePlatformUserInfoModule (copy), eventNamesModule (copy)
						p1.dispatch(refreshProfilePlatformUserInfoModule(p1.profileId))
						p1.analytics.fireAnalyticsEvent(eventNamesModule.ToggleInExperienceModeButton, {})
					end else nil
					navigate(editProfilePage, t)
				end
			}
		}
	end
}