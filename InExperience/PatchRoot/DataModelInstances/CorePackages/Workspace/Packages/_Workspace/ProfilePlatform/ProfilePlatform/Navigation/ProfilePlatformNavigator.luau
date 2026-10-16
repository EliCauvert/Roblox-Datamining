local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local EnumsModule = require(ProfilePlatform.Common.Enums)
local EnumsModule1 = require(Parent.EditProfile.Enums)
local EditProfileScreenViewAdapterModule = require(Parent.EditProfile.EditProfileScreenViewAdapter)
local EditProfileToastScreenModule = require(Parent.EditProfile.EditProfileToastScreen)
local EditProfileBackgroundContainerModule = require(ProfilePlatform.Components.EditProfileBackgroundContainer)
local CommunityVerificationModalModule = require(ProfilePlatform.Components.CommunityVerificationModal)
local InspectAvatarSheetContainerModule = require(ProfilePlatform.Components.InspectAvatar.InspectAvatarSheetContainer)
local PurchaseConfirmationModalModule = require(ProfilePlatform.Components.InspectAvatar.PurchaseConfirmationModal)
local InsufficientRobuxDialogModule = require(ProfilePlatform.Components.InspectAvatar.InsufficientRobuxDialog)
local MomentsGridPageModule = require(ProfilePlatform.Components.Moments.MomentsGridPage)
local MomentsFeedPageModule = require(ProfilePlatform.Components.Moments.MomentsFeedPage)
local FFlagSocialEnableProfileInspectAndBuy = require(Parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local FFlagProfilePlatformEnableMomentsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableMoments)
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local FFlagEditProfileBackgroundEnabled = require(Parent.SharedFlags).FFlagEditProfileBackgroundEnabled
local FFlagEditProfileImageV2Enabled = require(Parent.SharedFlags).FFlagEditProfileImageV2Enabled
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local FFlagAXHideBottomNavForEditProfileImage = require(Parent.SharedFlags).FFlagAXHideBottomNavForEditProfileImage
local FFlagEnableBottomNavOnMarketplace = require(Parent.SharedFlags).FFlagEnableBottomNavOnMarketplace
local FFlagAXSaveManagerOutsideAX = require(Parent.SharedFlags).FFlagAXSaveManagerOutsideAX
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

local function _(p1, p2) --[[ Line: 57 | Named "makeFullBleedNavigationOptions" ]]
	-- upvalues: config (copy)
	local P1 = p2 or config
	
	return function(p3) --[[ Line: 62 ]]
		-- upvalues: P1 (copy), p1 (copy)
		return if p3.navigation.getParam("fullBleed") then P1 else p1
	end
end

local function LazyEditProfileImageContainer(p1) --[[ Line: 72 ]]
	-- upvalues: ProfilePlatform (copy), ReactModule (copy)
	return ReactModule.createElement(require(ProfilePlatform.Components.EditProfileImage.EditProfileImageContainer), p1)
end

local List = {
	{
		[EnumsModule.Screens.ProfileMain] = require(ProfilePlatform.Components.ProfilePlatformViewAdaptor)
	},
	{
		[EnumsModule.Screens.EditProfilePage] = {
			screen = require(Parent.EditProfile.EditProfileLanding),
			navigationOptions = if FFlagAXEnableProfileTab then function(p1) --[[ Line: 62 ]]
				-- upvalues: config (copy), NavigationOptions (copy)
				return if p1.navigation.getParam("fullBleed") then config else NavigationOptions
			end else NavigationOptions
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

if require(ProfilePlatform.Flags.FFlagEnableCommunityVerificationModal) then
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
local t = {}
local EditProfileSubScreen = EnumsModule1.Screens.EditProfileSubScreen
local config1 = { screen = EditProfileScreenViewAdapterModule }

if FFlagAXEnableProfileTab then
	local config2 = {
		overlayEnabled = true,
		overlayTransparency = 0.5,
		absorbInput = false
	}
	
	local function NavigationOptions1(p1) --[[ Line: 62 ]]
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

if FFlagEditProfileImageV2Enabled then
	local TabBarVisible = (not FFlagAXHideBottomNavForEditProfileImage or not FFlagEnableBottomNavOnMarketplace) and nil
	local config3 = {
		overlayEnabled = true,
		overlayTransparency = 1,
		absorbInput = true,
		tabBarVisible = TabBarVisible
	}
	local config4 = {
		overlayEnabled = false,
		absorbInput = true,
		renderUnderlyingPage = true,
		tabBarVisible = TabBarVisible
	}
	local t1 = {}
	local EditProfileImageProfilePlatform = EnumsModule1.Screens.EditProfileImageProfilePlatform
	local config5 = {
		screen = LazyEditProfileImageContainer,
		params = if FFlagAXSaveManagerOutsideAX then { runAvatarSaveManager = true } else nil
	}
	
	if FFlagAXEnableProfileTab then
		local Config4 = config4 or config
		
		local function NavigationOptions2(p1) --[[ Line: 62 ]]
			-- upvalues: Config4 (copy), config3 (copy)
			return if p1.navigation.getParam("fullBleed") then Config4 else config3
		end
	else
		local NavigationOptions2: (any) -> any = config3
	end
	config5.navigationOptions = NavigationOptions2
	t1[EditProfileImageProfilePlatform] = config5
	table.insert(List, t1)
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
	table.insert(List, {
		[EnumsModule.Screens.InsufficientRobuxDialog] = {
			screen = InsufficientRobuxDialogModule,
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