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
local roactNavigationModule = require(parent.RoactNavigation)
local fFlagAddVideoToCommunityProfile = require(parent.SharedFlags).FFlagAddVideoToCommunityProfile
local fFlagEditProfileBackgroundEnabled = require(parent.SharedFlags).FFlagEditProfileBackgroundEnabled
local fFlagEnableCommunityVerificationModalModule = require(profilePlatform.Flags.FFlagEnableCommunityVerificationModal)
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
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

local function _(p1)
	-- upvalues: t_1 (ref)
	return function(p2)
		-- upvalues: t_1 (copy), p1 (ref)
		return if p2.navigation.getParam("fullBleed") then t_1 else p1
	end
end

local list = {
	{
		[enumsModule.Screens.ProfileMain] = profilePlatformViewAdaptorModule
	},
	{
		[enumsModule.Screens.EditProfilePage] = {
			screen = editProfileLandingModule,
			navigationOptions = if fFlagAXEnableProfileTab then function(p1)
				-- upvalues: t_1 (ref), t (ref)
				return if p1.navigation.getParam("fullBleed") then t_1 else t
			end else t
		}
	},
	{
		[enumsModule.Screens.EditDisplayNameErrorModal] = {
			screen = editDisplayNameErrorModalModule,
			navigationOptions = t
		}
	},
	{
		[enumsModule.Screens.UsernameInsufficientFundsModal] = {
			screen = usernameInsufficientFundsModalModule,
			navigationOptions = t
		}
	},
	{
		[enumsModule.Screens.SetAliasModal] = { screen = setAliasModal, navigationOptions = t }
	},
	{
		[enumsModule.Screens.ContextualMenu] = {
			screen = profileContextualMenuModule,
			navigationOptions = {
				overlayEnabled = true,
				overlayTransparency = 1,
				absorbInput = false
			}
		}
	}
}

if fFlagAddVideoToCommunityProfile then
	table.insert(list, {
		[enumsModule.Screens.VideoFullscreen] = {
			screen = videoFullscreenPageModule,
			navigationOptions = t
		}
	})
end
if fFlagEnableCommunityVerificationModalModule then
	table.insert(list, {
		[enumsModule.Screens.CommunityVerificationModal] = {
			screen = communityVerificationModalModule,
			navigationOptions = t
		}
	})
end
if fFlagEditProfileBackgroundEnabled then
	table.insert(list, {
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
local t_2 = {}
local editProfileSubScreen = enumsModule_1.Screens.EditProfileSubScreen
local t_3 = { screen = editProfileScreenViewAdapterModule }

if fFlagAXEnableProfileTab then
	local t_4 = {
		overlayEnabled = true,
		overlayTransparency = 0.5,
		absorbInput = false
	}
	
	local var1 = function(p1)
		-- upvalues: t_1 (ref), t_4 (ref)
		return if p1.navigation.getParam("fullBleed") then t_1 else t_4
	end
else
	local var1 = {
		overlayEnabled = true,
		overlayTransparency = 0.5,
		absorbInput = false
	}
end
t_3.navigationOptions = var1
t_2[editProfileSubScreen] = t_3
table.insert(list, t_2)
table.insert(list, {
	[enumsModule_1.Screens.EditProfileToast] = {
		screen = editProfileToastScreenModule,
		navigationOptions = {
			overlayEnabled = true,
			overlayTransparency = 1,
			absorbInput = false
		}
	}
})

if fFlagSocialEnableProfileInspectAndBuy then
	table.insert(list, {
		[enumsModule.Screens.InspectAvatarSheet] = {
			screen = inspectAvatarSheetContainerModule,
			navigationOptions = {
				overlayEnabled = true,
				overlayTransparency = 1,
				absorbInput = true
			}
		}
	})
	table.insert(list, {
		[enumsModule.Screens.PurchaseConfirmationModal] = {
			screen = purchaseConfirmationModalModule,
			navigationOptions = t
		}
	})
	table.insert(list, {
		[enumsModule.Screens.InsufficientRobuxDialog] = {
			screen = insufficientRobuxDialogModule,
			navigationOptions = t
		}
	})
end
if fFlagProfilePlatformEnableMomentsModule then
	table.insert(list, {
		[enumsModule.Screens.MomentsAll] = {
			screen = momentsGridPageModule,
			navigationOptions = {
				overlayEnabled = false,
				absorbInput = true,
				renderUnderlyingPage = true
			}
		}
	})
	table.insert(list, {
		[enumsModule.Screens.MomentsFeed] = {
			screen = momentsFeedPageModule,
			navigationOptions = { overlayEnabled = false, absorbInput = true }
		}
	})
end
return roactNavigationModule.createRobloxStackNavigator(list, {
	defaultNavigationOptions = {
		overlayEnabled = true,
		absorbInput = true,
		overlayTransparency = 1,
		disableBackButton = true
	},
	mode = roactNavigationModule.StackPresentationStyle.Overlay
})