local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local RefreshProfilePlatformUserInfoModule = require(ProfilePlatform.Networking.refreshProfilePlatformUserInfo)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes
local FFlagMoveInExperienceModeToEditProfile = SharedFlagsModule.FFlagMoveInExperienceModeToEditProfile
local FFlagAXEnableProfileTab = SharedFlagsModule.FFlagAXEnableProfileTab

return {
	[EnumsModule.ProfileActions.EditProfile] = function(p1)
		-- upvalues: ButtonVariant (copy), EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), FFlagAXEnableProfileTab (copy), RefreshProfilePlatformUserInfoModule (copy), FFlagMoveInExperienceModeToEditProfile (copy)
		return {
			variant = ButtonVariant.Standard,
			text = p1.localized[EnumsModule.ProfileActions.EditProfile],
			onActivated = {
				[ProfileTypes.User] = function()
					-- upvalues: p1 (copy), EventNamesModule (upval), EnumsModule (upval), FFlagAXEnableProfileTab (upval), RefreshProfilePlatformUserInfoModule (upval), FFlagMoveInExperienceModeToEditProfile (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonOpenEditProfilePage, { buttonSurface = p1.buttonSurface })
					p1.navigation.navigate(EnumsModule.Screens.EditProfilePage, {
						fullBleed = if FFlagAXEnableProfileTab then p1.profileWrapperContext.forceFullView == true else nil,
						navigateToEditUsername = function(ShowToast)
							-- upvalues: p1 (upval), RefreshProfilePlatformUserInfoModule (upval)
							p1.navigateTo.editUsername({
								showToast = ShowToast,
								onUsernameChanged = function()
									-- upvalues: p1 (upval), RefreshProfilePlatformUserInfoModule (upval)
									p1.dispatch(RefreshProfilePlatformUserInfoModule(p1.profileId))
								end
							})
						end,
						onIdentityChange = function()
							-- upvalues: p1 (upval), RefreshProfilePlatformUserInfoModule (upval)
							p1.dispatch(RefreshProfilePlatformUserInfoModule(p1.profileId))
						end,
						onToggleInExperienceMode = if FFlagMoveInExperienceModeToEditProfile then function()
							-- upvalues: p1 (upval), RefreshProfilePlatformUserInfoModule (upval), EventNamesModule (upval)
							p1.dispatch(RefreshProfilePlatformUserInfoModule(p1.profileId))
							p1.analytics.fireAnalyticsEvent(EventNamesModule.ToggleInExperienceModeButton, {})
						end else nil
					})
				end
			}
		}
	end
}