local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local UIBloxModule = require(Parent.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local ReactModule = require(Parent.React)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseStyleMetadataFunction = UIBloxModule.Core.Style.useStyleMetadata
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Image = FoundationModule.Image
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local DisplayBackground = require(Parent.EditProfileBackground).DisplayBackground
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseAvatarBackgroundFromWrapperModule = require(ProfilePlatform.Hooks.useAvatarBackgroundFromWrapper)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local FFlagProfilePlatformMeTabMobileProfileHero = require(Parent.SharedFlags).FFlagProfilePlatformMeTabMobileProfileHero
local FFlagProfilePlatformNewProfileHeader = require(Parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local FFlagPPVBackgroundUse2DAsLoadingState = require(Parent.SharedFlags).FFlagPPVBackgroundUse2DAsLoadingState
local FFlagPPVEnable3DBackground = require(Parent.SharedFlags).FFlagPPVEnable3DBackground
local FFlagProfilePlatformEnableAvatarBackground = require(Parent.SharedFlags).FFlagProfilePlatformEnableAvatarBackground

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseStyleMetadataFunction (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), FFlagPPVEnable3DBackground (copy), FFlagProfilePlatformEnableAvatarBackground (copy), UseAvatarBackgroundFromWrapperModule (copy), FFlagProfilePlatformNewProfileHeader (copy), ConstantsModule (copy), FFlagProfilePlatformMeTabMobileProfileHero (copy), ReactModule (copy), Image (copy), ImageSetLabel (copy), Images (copy), View (copy), DisplayBackground (copy), FFlagPPVBackgroundUse2DAsLoadingState (copy)
	local UseStyleResult = UseStyleFunction()
	local UseStyleMetadataResult = UseStyleMetadataFunction()
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.ProfileBackground)
	local UseAvatarBackgroundFromWrapperModuleResult = if FFlagPPVEnable3DBackground or not FFlagProfilePlatformEnableAvatarBackground then nil else UseAvatarBackgroundFromWrapperModule()
	local AssetId = if FFlagPPVEnable3DBackground then UseProfileJsonComponentModuleResult and UseProfileJsonComponentModuleResult.assetId or -1 else nil
	local HasUseAvatarBackgroundFromWrapperModuleResult: boolean = FFlagProfilePlatformEnableAvatarBackground and UseAvatarBackgroundFromWrapperModuleResult ~= nil
	local NumberSequence1 = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(0.25, 0.75),
		NumberSequenceKeypoint.new(0.55, 0.4),
		NumberSequenceKeypoint.new(0.8, 0.15),
		NumberSequenceKeypoint.new(1, 0)
	})
	local NumberSequence2 = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(1, 0)
	})
	local Height = if FFlagProfilePlatformNewProfileHeader and p1.height then p1.height else ConstantsModule.USER_PROFILE_HEADER_HEIGHT
	local Floored: number = if FFlagProfilePlatformMeTabMobileProfileHero and p1.layoutVariant == EnumsModule.ProfileAvatarLayoutVariant.MeTabMobile then math.floor(Height * ConstantsModule.ME_TAB_MOBILE_TOP_BACKGROUND_INSET_RATIO / (ConstantsModule.ME_TAB_MOBILE_AVATAR_HEIGHT_ASPECT + ConstantsModule.ME_TAB_MOBILE_TOP_BACKGROUND_INSET_RATIO)) else 0
	local Floored1: number = if FFlagProfilePlatformMeTabMobileProfileHero and p1.layoutVariant == EnumsModule.ProfileAvatarLayoutVariant.MeTabMobile then math.floor(Height * ConstantsModule.ME_TAB_MOBILE_AVATAR_OFFSET_Y_RATIO) else 0
	local NewHeight: number = if FFlagProfilePlatformMeTabMobileProfileHero and p1.layoutVariant == EnumsModule.ProfileAvatarLayoutVariant.MeTabMobile then Height - Floored + ConstantsModule.ME_TAB_MOBILE_AVATAR_EXTRA_HEIGHT else Height - Floored
	local METABMOBILEAVATARDOWNOFFSETDelta: number = if FFlagProfilePlatformMeTabMobileProfileHero and p1.layoutVariant == EnumsModule.ProfileAvatarLayoutVariant.MeTabMobile then ConstantsModule.ME_TAB_MOBILE_AVATAR_DOWN_OFFSET - Floored1 else 0
	
	return ReactModule.createElement(if FFlagProfilePlatformNewProfileHeader then View else ReactModule.Fragment, {
		Size = if FFlagProfilePlatformNewProfileHeader then UDim2.new(1, 0, 0, Height) else nil,
		ClipsDescendants = FFlagProfilePlatformMeTabMobileProfileHero and p1.layoutVariant == EnumsModule.ProfileAvatarLayoutVariant.MeTabMobile or nil
	}, {
		Background = if FFlagPPVEnable3DBackground then nil elseif FFlagProfilePlatformEnableAvatarBackground and UseAvatarBackgroundFromWrapperModuleResult ~= nil then ReactModule.createElement(Image, {
			ZIndex = 1,
			Size = UDim2.fromScale(if FFlagProfilePlatformMeTabMobileProfileHero and p1.layoutVariant == EnumsModule.ProfileAvatarLayoutVariant.MeTabMobile then ConstantsModule.ME_TAB_MOBILE_BACKGROUND_SCALE_X else 1.35, if FFlagProfilePlatformMeTabMobileProfileHero and p1.layoutVariant == EnumsModule.ProfileAvatarLayoutVariant.MeTabMobile then ConstantsModule.ME_TAB_MOBILE_BACKGROUND_SCALE_Y else 1.35),
			AnchorPoint = if FFlagProfilePlatformMeTabMobileProfileHero and p1.layoutVariant == EnumsModule.ProfileAvatarLayoutVariant.MeTabMobile then Vector2.new(0.5, 0) else Vector2.new(0.5, 0.5),
			Position = if FFlagProfilePlatformMeTabMobileProfileHero and p1.layoutVariant == EnumsModule.ProfileAvatarLayoutVariant.MeTabMobile then UDim2.fromScale(0.5, ConstantsModule.ME_TAB_MOBILE_BACKGROUND_OFFSET_Y_RATIO) else UDim2.fromScale(0.5, 0.4),
			Image = UseAvatarBackgroundFromWrapperModuleResult,
			ScaleType = Enum.ScaleType.Crop
		}) else ReactModule.createElement(ImageSetLabel, {
			BorderSizePixel = 0,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1),
			Image = Images[UseStyleResult.Theme.PlayerBackgroundDefault.Image],
			ImageColor3 = if UseStyleMetadataResult and UseStyleMetadataResult.HasSurfaceOverrides then UseStyleResult.Theme.BackgroundUIDefault.Color:Lerp(UseStyleResult.Theme.PlayerBackgroundDefault.Color, UseStyleResult.Theme.Overlay.Transparency) else nil
		}),
		AvatarThumbnail = if FFlagProfilePlatformMeTabMobileProfileHero and p1.layoutVariant == EnumsModule.ProfileAvatarLayoutVariant.MeTabMobile then ReactModule.createElement(View, {
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, NewHeight),
			Position = UDim2.new(0, 0, 1, METABMOBILEAVATARDOWNOFFSETDelta),
			AnchorPoint = Vector2.new(0, 1)
		}, {
			DisplayBackground = ReactModule.createElement(DisplayBackground, {
				height = NewHeight,
				currentBackgroundId = AssetId,
				userId = p1.userId,
				userThumbnail = if FFlagPPVBackgroundUse2DAsLoadingState then p1.userThumbnail else nil,
				cameraDistanceScale = ConstantsModule.ME_TAB_MOBILE_CAMERA_DISTANCE_SCALE
			})
		}) else ReactModule.createElement(DisplayBackground, {
			height = Height,
			currentBackgroundId = AssetId,
			userId = p1.userId,
			userThumbnail = if FFlagPPVBackgroundUse2DAsLoadingState then p1.userThumbnail else nil
		}),
		TopGradient = if FFlagPPVEnable3DBackground or FFlagProfilePlatformEnableAvatarBackground and HasUseAvatarBackgroundFromWrapperModuleResult then nil elseif FFlagProfilePlatformNewProfileHeader then nil else ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 3,
			Size = UDim2.new(1, 0, 0, ConstantsModule.USER_PROFILE_GRADIENT_HEIGHT),
			Position = UDim2.fromScale(0, 0),
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
		}, {
			UIGradient = ReactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
		}),
		BottomGradient = if FFlagProfilePlatformEnableAvatarBackground and HasUseAvatarBackgroundFromWrapperModuleResult then nil else ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 3,
			Size = if FFlagProfilePlatformNewProfileHeader then UDim2.new(1, 0, 0, ConstantsModule.USER_PROFILE_GRADIENT_HEIGHT) else UDim2.new(1, 0, 0, Height / 2),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
		}, {
			UIGradient = ReactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = if FFlagPPVEnable3DBackground then NumberSequence1 else NumberSequence2
			})
		}),
		CornerRadius = if FFlagProfilePlatformNewProfileHeader and p1.isPeekView then ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }) else nil
	})
end