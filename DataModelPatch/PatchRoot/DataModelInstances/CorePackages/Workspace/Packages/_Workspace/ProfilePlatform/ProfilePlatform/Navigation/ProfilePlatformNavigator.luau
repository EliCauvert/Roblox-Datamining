local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local EnumsModule = require(ProfilePlatform.Common.Enums)
local EditProfilePageModule = require(Parent.EditProfile.EditProfilePage)
local EditProfileLandingModule = require(Parent.EditProfile.EditProfileLanding)
local EnumsModule1 = require(Parent.EditProfile.Enums)
local VideoFullscreenPageModule = require(ProfilePlatform.Components.Videos.VideoFullscreenPage)
local EditProfileScreenViewAdapterModule = require(Parent.EditProfile.EditProfileScreenViewAdapter)
local EditProfileToastScreenModule = require(Parent.EditProfile.EditProfileToastScreen)
local EditProfileBackgroundContainerModule = require(ProfilePlatform.Components.EditProfileBackgroundContainer)
local CommunityVerificationModalModule = require(ProfilePlatform.Components.CommunityVerificationModal)
local InspectAvatarSheetContainerModule = require(ProfilePlatform.Components.InspectAvatar.InspectAvatarSheetContainer)
local PurchaseConfirmationModalModule = require(ProfilePlatform.Components.InspectAvatar.PurchaseConfirmationModal)
local MomentsGridPageModule = require(ProfilePlatform.Components.Moments.MomentsGridPage)
local MomentsFeedPageModule = require(ProfilePlatform.Components.Moments.MomentsFeedPage)
local FFlagSocialEnableProfileInspectAndBuy = require(Parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local FFlagProfilePlatformEnableMomentsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableMoments)
local RoactNavigationModule = require(Parent.RoactNavigation)
local FFlagEditProfileBackgroundEnabled = require(Parent.SharedFlags).FFlagEditProfileBackgroundEnabled
local FFlagEnableCommunityVerificationModalModule = require(ProfilePlatform.Flags.FFlagEnableCommunityVerificationModal)
local FFlagEditProfileMigration = require(Parent.EditProfile.Flags).FFlagEditProfileMigration
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local NavigationOptions = {
	overlayEnabled = true,
	overlayTransparency = 0.5,
	absorbInput = true
}
local config = {
	overlayEnabled = false,
	absorbInput = true,
	renderUnderlyingPage = true
}

local function _(p1)
	-- upvalues: config (copy)
	return function(p2)
		-- upvalues: config (upval), p1 (copy)
		return if p2.navigation.getParam("fullBleed") then config else p1
	end
end

local List = {
	{
		[EnumsModule.Screens.ProfileMain] = require(ProfilePlatform.Components.ProfilePlatformViewAdaptor)
	},
	{
		[EnumsModule.Screens.EditProfilePage] = {
			screen = if FFlagEditProfileMigration then EditProfileLandingModule else EditProfilePageModule,
			navigationOptions = if FFlagAXEnableProfileTab then function(p1)
				-- upvalues: config (copy), NavigationOptions (copy)
				return if p1.navigation.getParam("fullBleed") then config else NavigationOptions
			end else NavigationOptions
		}
	},
	{
		[EnumsModule.Screens.EditDisplayNameModal] = {
			screen = require(Parent.EditProfile.EditDisplayNameModal),
			navigationOptions = NavigationOptions
		}
	},
	{
		[EnumsModule.Screens.EditDescriptionModal] = {
			screen = require(Parent.EditProfile.EditDescriptionModal),
			navigationOptions = NavigationOptions
		}
	},
	{
		[EnumsModule.Screens.EditDisplayNameErrorModal] = {
			screen = require(Parent.EditProfile.EditDisplayNameErrorModal),
			navigationOptions = NavigationOptions
		}
	},
	{
		[EnumsModule.Screens.UsernameInsufficientFundsModal] = {
			screen = require(Parent.EditProfile.UsernameInsufficientFundsModal),
			navigationOptions = NavigationOptions
		}
	},
	{
		[EnumsModule.Screens.SetAliasModal] = {
			screen = require(Parent.SetAlias).SetAliasModal,
			navigationOptions = NavigationOptions
		}
	},
	{
		[EnumsModule.Screens.ContextualMenu] = {
			screen = require(ProfilePlatform.Components.ProfileContextualMenu),
			navigationOptions = {
				overlayEnabled = true,
				overlayTransparency = 1,
				absorbInput = false
			}
		}
	}
}

if require(Parent.SharedFlags).FFlagAddVideoToCommunityProfile then
	table.insert(List, {
		[EnumsModule.Screens.VideoFullscreen] = {
			screen = VideoFullscreenPageModule,
			navigationOptions = NavigationOptions
		}
	})
end
if FFlagEnableCommunityVerificationModalModule then
	table.insert(List, {
		[EnumsModule.Screens.CommunityVerificationModal] = {
			screen = CommunityVerificationModalModule,
			navigationOptions = NavigationOptions
		}
	})
end
if FFlagEditProfileBackgroundEnabled then
	table.insert(List, {
		[EnumsModule.Screens.EditProfileBackground] = {
			screen = EditProfileBackgroundContainerModule,
			navigationOptions = {
				overlayEnabled = false,
				absorbInput = true,
				renderUnderlyingPage = true
			}
		}
	})
end
if FFlagEditProfileMigration then
	local t = {}
	local EditProfileSubScreen = EnumsModule1.Screens.EditProfileSubScreen
	local config1 = { screen = EditProfileScreenViewAdapterModule }
	
	if FFlagAXEnableProfileTab then
		local config2 = {
			overlayEnabled = true,
			overlayTransparency = 0.5,
			absorbInput = false
		}
		
		local function NavigationOptions1(p1)
			-- upvalues: config (copy), config2 (copy)
			return if p1.navigation.getParam("fullBleed") then config else config2
		end
	else
		local NavigationOptions1: (any) -> any = {
			overlayEnabled = true,
			overlayTransparency = 0.5,
			absorbInput = false
		}
	end
	config1.navigationOptions = NavigationOptions1
	t[EditProfileSubScreen] = config1
	table.insert(List, t)
	table.insert(List, {
		[EnumsModule1.Screens.EditProfileToast] = {
			screen = EditProfileToastScreenModule,
			navigationOptions = {
				overlayEnabled = true,
				overlayTransparency = 1,
				absorbInput = false
			}
		}
	})
end
if FFlagSocialEnableProfileInspectAndBuy then
	table.insert(List, {
		[EnumsModule.Screens.InspectAvatarSheet] = {
			screen = InspectAvatarSheetContainerModule,
			navigationOptions = {
				overlayEnabled = true,
				overlayTransparency = 1,
				absorbInput = true
			}
		}
	})
	table.insert(List, {
		[EnumsModule.Screens.PurchaseConfirmationModal] = {
			screen = PurchaseConfirmationModalModule,
			navigationOptions = NavigationOptions
		}
	})
end
if FFlagProfilePlatformEnableMomentsModule then
	table.insert(List, {
		[EnumsModule.Screens.MomentsAll] = {
			screen = MomentsGridPageModule,
			navigationOptions = {
				overlayEnabled = false,
				absorbInput = true,
				renderUnderlyingPage = true
			}
		}
	})
	table.insert(List, {
		[EnumsModule.Screens.MomentsFeed] = {
			screen = MomentsFeedPageModule,
			navigationOptions = { overlayEnabled = false, absorbInput = true }
		}
	})
end
return (RoactNavigationModule.createRobloxStackNavigator(List, {
	defaultNavigationOptions = {
		overlayEnabled = true,
		absorbInput = true,
		overlayTransparency = 1,
		disableBackButton = true
	},
	mode = RoactNavigationModule.StackPresentationStyle.Overlay
}))