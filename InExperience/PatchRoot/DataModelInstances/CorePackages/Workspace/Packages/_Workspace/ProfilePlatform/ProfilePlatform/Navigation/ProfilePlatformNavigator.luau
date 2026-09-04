local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local enumsModule = require(profilePlatform.Common.Enums)
local setAliasModule = require(parent.SetAlias)
local profileContextualMenuModule = require(profilePlatform.Components.ProfileContextualMenu)
local editProfileLandingModule = require(parent.EditProfile.EditProfileLanding)
local editDisplayNameErrorModalModule = require(parent.EditProfile.EditDisplayNameErrorModal)
local usernameInsufficientFundsModalModule = require(parent.EditProfile.UsernameInsufficientFundsModal)
local enumsModule_1 = require(parent.EditProfile.Enums)
local profilePlatformViewAdaptorModule = require(profilePlatform.Components.ProfilePlatformViewAdaptor)
local videoFullscreenPageModule = require(profilePlatform.Components.Videos.VideoFullscreenPage)
local setAliasModal = setAliasModule.SetAliasModal
local editProfileScreenViewAdapterModule = require(parent.EditProfile.EditProfileScreenViewAdapter)
local editProfileToastScreenModule = require(parent.EditProfile.EditProfileToastScreen)
local editProfileBackgroundContainerModule = require(profilePlatform.Components.EditProfileBackgroundContainer)
local communityVerificationModalModule = require(profilePlatform.Components.CommunityVerificationModal)
local inspectAvatarSheetContainerModule = require(profilePlatform.Components.InspectAvatar.InspectAvatarSheetContainer)
local purchaseConfirmationModalModule = require(profilePlatform.Components.InspectAvatar.PurchaseConfirmationModal)
local insufficientRobuxDialogModule = require(profilePlatform.Components.InspectAvatar.InsufficientRobuxDialog)
local momentsGridPageModule = require(profilePlatform.Components.Moments.MomentsGridPage)
local momentsFeedPageModule = require(profilePlatform.Components.Moments.MomentsFeedPage)
local fFlagSocialEnableProfileInspectAndBuy = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local fFlagProfilePlatformEnableMomentsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableMoments)
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local fFlagAddVideoToCommunityProfile = require(parent.SharedFlags).FFlagAddVideoToCommunityProfile
local fFlagEditProfileBackgroundEnabled = require(parent.SharedFlags).FFlagEditProfileBackgroundEnabled
local fFlagEnableCommunityVerificationModalModule = require(profilePlatform.Flags.FFlagEnableCommunityVerificationModal)
local fFlagEditProfileImageV2Enabled = require(parent.SharedFlags).FFlagEditProfileImageV2Enabled
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local fFlagAXHideBottomNavForEditProfileImage = require(parent.SharedFlags).FFlagAXHideBottomNavForEditProfileImage
local fFlagEnableBottomNavOnMarketplace = require(parent.SharedFlags).FFlagEnableBottomNavOnMarketplace
local t = {
	overlayEnabled = true,
	overlayTransparency = 0.5,
	absorbInput = true
}
local t_1 = {
	overlayEnabled = false,
	absorbInput = true,
	renderUnderlyingPage = true
}

local function _(p1, p2)
	-- upvalues: t_1 (ref)
	p2 = p2 or t_1
	
	return function(p3)
		-- upvalues: p2 (ref), p1 (ref)
		return if p3.navigation.getParam("fullBleed") then p2 else p1
	end
end

local function LazyEditProfileImageContainer(p1)
	-- upvalues: profilePlatform (ref), reactModule (ref)
	return reactModule.createElement(require(profilePlatform.Components.EditProfileImage.EditProfileImageContainer), p1)
end

local t_2 = {}
local t_3 = {
	[enumsModule.Screens.ProfileMain] = profilePlatformViewAdaptorModule
}
local t_4 = {}
local editProfilePage = enumsModule.Screens.EditProfilePage
local t_5 = { screen = editProfileLandingModule }

if fFlagAXEnableProfileTab then
	local var1 = t_1
	
	local var2 = function(p1)
		-- upvalues: var1 (ref), t (ref)
		return if p1.navigation.getParam("fullBleed") then var1 else t
	end
else
	local var2 = t
end
t_5.navigationOptions = var2
t_4[editProfilePage] = t_5
-- Unknown statement at pc 2: <SetList>

if fFlagAddVideoToCommunityProfile then
	table.insert(t_2, {
		[enumsModule.Screens.VideoFullscreen] = {
			screen = videoFullscreenPageModule,
			navigationOptions = t
		}
	})
end
if fFlagEnableCommunityVerificationModalModule then
	table.insert(t_2, {
		[enumsModule.Screens.CommunityVerificationModal] = {
			screen = communityVerificationModalModule,
			navigationOptions = t
		}
	})
end
if fFlagEditProfileBackgroundEnabled then
	table.insert(t_2, {
		[enumsModule.Screens.EditProfileBackground] = {
			screen = editProfileBackgroundContainerModule,
			navigationOptions = {
				overlayEnabled = false,
				absorbInput = true,
				renderUnderlyingPage = true
			}
		}
	})
end
local t_6 = {}
local editProfileSubScreen = enumsModule_1.Screens.EditProfileSubScreen
local t_7 = { screen = editProfileScreenViewAdapterModule }

if fFlagAXEnableProfileTab then
	local t_8 = {
		overlayEnabled = true,
		overlayTransparency = 0.5,
		absorbInput = false
	}
	local var3 = t_1
	
	local var4 = function(p1)
		-- upvalues: var3 (ref), t_8 (ref)
		return if p1.navigation.getParam("fullBleed") then var3 else t_8
	end
else
	local var4 = {
		overlayEnabled = true,
		overlayTransparency = 0.5,
		absorbInput = false
	}
end
t_7.navigationOptions = var4
t_6[editProfileSubScreen] = t_7
table.insert(t_2, t_6)
table.insert(t_2, {
	[enumsModule_1.Screens.EditProfileToast] = {
		screen = editProfileToastScreenModule,
		navigationOptions = {
			overlayEnabled = true,
			overlayTransparency = 1,
			absorbInput = false
		}
	}
})

if fFlagEditProfileImageV2Enabled then
	local var5 = if fFlagAXHideBottomNavForEditProfileImage and fFlagEnableBottomNavOnMarketplace then false else nil
	local t_8 = {
		overlayEnabled = true,
		overlayTransparency = 1,
		absorbInput = true,
		tabBarVisible = var5
	}
	local t_9 = {
		overlayEnabled = false,
		absorbInput = true,
		renderUnderlyingPage = true,
		tabBarVisible = var5
	}
	local t_10 = {}
	local editProfileImageProfilePlatform = enumsModule_1.Screens.EditProfileImageProfilePlatform
	local t_11 = { screen = LazyEditProfileImageContainer }
	
	if fFlagAXEnableProfileTab then
		local t_9_1 = t_9 or t_1
		
		local var6 = function(p1)
			-- upvalues: t_9_1 (ref), t_8 (ref)
			return if p1.navigation.getParam("fullBleed") then t_9_1 else t_8
		end
	else
		local var6 = t_8
	end
	t_11.navigationOptions = var6
	t_10[editProfileImageProfilePlatform] = t_11
	table.insert(t_2, t_10)
end
if fFlagSocialEnableProfileInspectAndBuy then
	table.insert(t_2, {
		[enumsModule.Screens.InspectAvatarSheet] = {
			screen = inspectAvatarSheetContainerModule,
			navigationOptions = {
				overlayEnabled = true,
				overlayTransparency = 1,
				absorbInput = true
			}
		}
	})
	table.insert(t_2, {
		[enumsModule.Screens.PurchaseConfirmationModal] = {
			screen = purchaseConfirmationModalModule,
			navigationOptions = t
		}
	})
	table.insert(t_2, {
		[enumsModule.Screens.InsufficientRobuxDialog] = {
			screen = insufficientRobuxDialogModule,
			navigationOptions = t
		}
	})
end
if fFlagProfilePlatformEnableMomentsModule then
	table.insert(t_2, {
		[enumsModule.Screens.MomentsAll] = {
			screen = momentsGridPageModule,
			navigationOptions = {
				overlayEnabled = false,
				absorbInput = true,
				renderUnderlyingPage = true
			}
		}
	})
	table.insert(t_2, {
		[enumsModule.Screens.MomentsFeed] = {
			screen = momentsFeedPageModule,
			navigationOptions = { overlayEnabled = false, absorbInput = true }
		}
	})
end
return roactNavigationModule.createRobloxStackNavigator(t_2, {
	defaultNavigationOptions = {
		overlayEnabled = true,
		absorbInput = true,
		overlayTransparency = 1,
		disableBackButton = true
	},
	mode = roactNavigationModule.StackPresentationStyle.Overlay
})