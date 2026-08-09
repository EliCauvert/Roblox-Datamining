local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local UIBloxModule = require(parent.UIBlox)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local reactModule = require(parent.React)
local useStyle = UIBloxModule.Core.Style.useStyle
local useStyleMetadata = UIBloxModule.Core.Style.useStyleMetadata
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local image = foundationModule.Image
local constantsModule = require(profilePlatform.Common.Constants)
local displayBackground = require(parent.EditProfileBackground).DisplayBackground
local enumsModule = require(profilePlatform.Common.Enums)
local useAvatarBackgroundFromWrapperModule = require(profilePlatform.Hooks.useAvatarBackgroundFromWrapper)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local fFlagProfilePlatformNewProfileHeader = require(parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local fFlagPPVBackgroundUse2DAsLoadingState = require(parent.SharedFlags).FFlagPPVBackgroundUse2DAsLoadingState
local fFlagPPVEnable3DBackground = require(parent.SharedFlags).FFlagPPVEnable3DBackground
local fFlagProfilePlatformEnableAvatarBackground = require(parent.SharedFlags).FFlagProfilePlatformEnableAvatarBackground

return function(p0) --[[ line: 36 | named "UserProfileAvatar" ]]
	-- upvalues: useStyle (ref), useStyleMetadata (ref), useProfileJsonComponentModule (ref), enumsModule (ref), fFlagPPVEnable3DBackground (ref), fFlagProfilePlatformEnableAvatarBackground (ref), useAvatarBackgroundFromWrapperModule (ref), fFlagProfilePlatformNewProfileHeader (ref), constantsModule (ref), reactModule (ref), image (ref), imageSetLabel (ref), images (ref), view (ref), displayBackground (ref), fFlagPPVBackgroundUse2DAsLoadingState (ref)
	local var8 = useStyle()
	local var9 = useStyleMetadata()
	local var10 = useProfileJsonComponentModule(enumsModule.Components.ProfileBackground)
	local var11 = if fFlagPPVEnable3DBackground or not fFlagProfilePlatformEnableAvatarBackground then nil else useAvatarBackgroundFromWrapperModule()
	local var12 = if fFlagPPVEnable3DBackground then if var10 then var10.assetId else -1 else nil
	local var13 = fFlagProfilePlatformEnableAvatarBackground and var11 ~= nil
	local numberSequence = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(0.25, 0.75),
		NumberSequenceKeypoint.new(0.55, 0.4),
		NumberSequenceKeypoint.new(0.8, 0.15),
		NumberSequenceKeypoint.new(1, 0)
	})
	local numberSequence_1 = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(1, 0)
	})
	local var16 = if fFlagProfilePlatformNewProfileHeader and p0.height then p0.height else constantsModule.USER_PROFILE_HEADER_HEIGHT
	local _ = nil
	
	return reactModule.createElement(if fFlagProfilePlatformNewProfileHeader then view else reactModule.Fragment, {
		Size = if fFlagProfilePlatformNewProfileHeader then UDim2.new(1, 0, 0, var16) else nil
	}, {
		Background = if fFlagPPVEnable3DBackground then nil elseif fFlagProfilePlatformEnableAvatarBackground and var11 ~= nil then reactModule.createElement(image, {
			ZIndex = 1,
			Size = UDim2.fromScale(1.35, 1.35),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.4),
			Image = var11,
			ScaleType = Enum.ScaleType.Crop
		}) else reactModule.createElement(imageSetLabel, {
			BorderSizePixel = 0,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1),
			Image = images[var8.Theme.PlayerBackgroundDefault.Image],
			ImageColor3 = if var9 and var9.HasSurfaceOverrides then var8.Theme.BackgroundUIDefault.Color:Lerp(var8.Theme.PlayerBackgroundDefault.Color, var8.Theme.Overlay.Transparency) else nil
		}),
		AvatarThumbnail = reactModule.createElement(displayBackground, {
			height = var16,
			currentBackgroundId = var12,
			userId = p0.userId,
			userThumbnail = if fFlagPPVBackgroundUse2DAsLoadingState then p0.userThumbnail else nil
		}),
		TopGradient = if fFlagPPVEnable3DBackground or fFlagProfilePlatformEnableAvatarBackground and var13 or fFlagProfilePlatformNewProfileHeader then nil else reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 3,
			Size = UDim2.new(1, 0, 0, constantsModule.USER_PROFILE_GRADIENT_HEIGHT),
			Position = UDim2.fromScale(0, 0),
			BackgroundColor3 = var8.Theme.BackgroundDefault.Color
		}, {
			UIGradient = reactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
		}),
		BottomGradient = if fFlagProfilePlatformEnableAvatarBackground and var13 then nil else reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 3,
			Size = if fFlagProfilePlatformNewProfileHeader then UDim2.new(1, 0, 0, constantsModule.USER_PROFILE_GRADIENT_HEIGHT) else UDim2.new(1, 0, 0, var16 / 2),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = var8.Theme.BackgroundDefault.Color
		}, {
			UIGradient = reactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = if fFlagPPVEnable3DBackground then numberSequence else numberSequence_1
			})
		}),
		CornerRadius = if fFlagProfilePlatformNewProfileHeader and p0.isPeekView then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }) else nil
	})
end