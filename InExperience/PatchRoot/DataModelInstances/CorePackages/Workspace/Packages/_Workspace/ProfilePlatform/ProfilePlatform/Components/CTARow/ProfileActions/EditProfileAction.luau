local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local foundationModule = require(parent.Foundation)
local sharedFlagsModule = require(parent.SharedFlags)
local socialStopwatchModule = require(parent.SocialStopwatch)
local buttonVariant = foundationModule.Enums.ButtonVariant
local refreshProfilePlatformUserInfoModule = require(profilePlatform.Networking.refreshProfilePlatformUserInfo)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes
local fFlagMoveInExperienceModeToEditProfile = sharedFlagsModule.FFlagMoveInExperienceModeToEditProfile
local fFlagAXEnableProfileTab = sharedFlagsModule.FFlagAXEnableProfileTab

return {
	[enumsModule.ProfileActions.EditProfile] = function(p0) --[[ line: 20 ]]
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), socialStopwatchModule (ref), eventNamesModule (ref), fFlagAXEnableProfileTab (ref), refreshProfilePlatformUserInfoModule (ref), fFlagMoveInExperienceModeToEditProfile (ref)
		return {
			variant = buttonVariant.Standard,
			text = p0.localized[enumsModule.ProfileActions.EditProfile],
			onActivated = {
				[profileTypes.User] = function() --[[ line: 25 ]]
					-- upvalues: socialStopwatchModule (copy), p0 (ref), eventNamesModule (copy), enumsModule (copy), fFlagAXEnableProfileTab (copy), refreshProfilePlatformUserInfoModule (copy), fFlagMoveInExperienceModeToEditProfile (copy)
					local var8
					socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.EditProfileOpened)
					p0.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonOpenEditProfilePage, { buttonSurface = p0.buttonSurface })
					local navigate = p0.navigation.navigate
					local editProfilePage = enumsModule.Screens.EditProfilePage
					local t = { profileScreens = enumsModule.Screens }
					
					if fFlagAXEnableProfileTab then
						var8 = p0.profileWrapperContext.forceFullView == true
						var8 = nil
					else
						var8 = nil
					end
					t.fullBleed = var8
					
					function t.navigateToEditUsername(p1) --[[ line: 39 ]]
						-- upvalues: p0 (copy), refreshProfilePlatformUserInfoModule (copy)
						p0.navigateTo.editUsername({
							showToast = p1,
							onUsernameChanged = function() --[[ line: 42 ]]
								-- upvalues: p0 (copy), refreshProfilePlatformUserInfoModule (copy)
								p0.dispatch(refreshProfilePlatformUserInfoModule(p0.profileId))
							end
						})
					end
					
					function t.onIdentityChange() --[[ line: 47 ]]
						-- upvalues: p0 (copy), refreshProfilePlatformUserInfoModule (copy)
						p0.dispatch(refreshProfilePlatformUserInfoModule(p0.profileId))
					end
					
					t.onToggleInExperienceMode = if fFlagMoveInExperienceModeToEditProfile then function() --[[ line: 51 ]]
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