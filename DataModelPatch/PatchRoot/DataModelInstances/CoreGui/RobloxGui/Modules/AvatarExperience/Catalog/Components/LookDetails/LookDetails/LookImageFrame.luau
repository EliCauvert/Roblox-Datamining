local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local AvatarExperience = Modules.AvatarExperience
local LookViewportModule = require(Modules.AvatarExperience.Common.Components.Looks.LookViewport)
local _ = require(AvatarExperience.Common.Types)
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ModerationStatusPillModule = require(AvatarExperience.Catalog.Components.LookDetails.LookDetails.ModerationStatusPill)
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local GetFFlagLooksAvatarPDPImageDimensionsModule = require(Modules.AvatarExperience.Flags.GetFFlagLooksAvatarPDPImageDimensions)
local AXLookDetailsThumbnailStretched = game:DefineFastFlag("AXLookDetailsThumbnailStretched", false)

return function(p1)
	-- upvalues: UseStyleFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), GetFFlagLooksAvatarPDPImageDimensionsModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), ReactModule (copy), RoactModule (copy), LookViewportModule (copy), LoadableImage (copy), AXLookDetailsThumbnailStretched (copy), ModerationStatusPillModule (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local Size600 = if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_600 else UseStyleResult.Tokens.Global.Space_300
	local WidthRatio = if GetFFlagLooksAvatarPDPImageDimensionsModule() then nil else p1.width * 9 / 16
	local Look = GetRbxthumbWithTypeSizeAndOptionsFunction(p1.lookId, "Look", 420)
	local DisplayProperties = p1.lookDetails and p1.lookDetails.displayProperties
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		ZIndex = 0,
		Size = if GetFFlagLooksAvatarPDPImageDimensionsModule() then UDim2.new(1, 0, 1, 0) else UDim2.new(1, 0, 0, WidthRatio),
		SizeConstraint = if GetFFlagLooksAvatarPDPImageDimensionsModule() then Enum.SizeConstraint.RelativeXY else nil
	}, {
		AspectRatio = if GetFFlagLooksAvatarPDPImageDimensionsModule() then ReactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1.5 }) else nil,
		ItemBackground = RoactModule.createElement("Frame", {
			ZIndex = 0,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.new(1, if GetFFlagLooksAvatarPDPImageDimensionsModule() then 0 else Size600 * 2, 1, 0),
			BackgroundColor3 = if DisplayProperties and DisplayProperties.backgroundType == "Hex" and DisplayProperties.backgroundValue then Color3.fromHex(DisplayProperties.backgroundValue) else Theme.PlaceHolder.Color,
			BackgroundTransparency = Theme.PlaceHolder.Transparency
		}),
		LookViewport = p1.renderViewport and ReactModule.createElement(LookViewportModule, { lookDetails = p1.lookDetails }),
		Image = if GetFFlagLooksAvatarPDPImageDimensionsModule() or p1.renderViewport then nil else RoactModule.createElement(LoadableImage, {
			BackgroundTransparency = 1,
			useShimmerAnimationWhileLoading = true,
			Image = Look,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.fromOffset(WidthRatio, WidthRatio),
			ScaleType = if AXLookDetailsThumbnailStretched then Enum.ScaleType.Fit else nil
		}),
		ImageFrame = if GetFFlagLooksAvatarPDPImageDimensionsModule() and not p1.renderViewport then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0)
		}, {
			AspectRatio = ReactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1 }),
			Image = RoactModule.createElement(LoadableImage, {
				BackgroundTransparency = 1,
				useShimmerAnimationWhileLoading = true,
				Image = Look,
				Size = UDim2.new(1, 0, 1, 0),
				ScaleType = if AXLookDetailsThumbnailStretched then Enum.ScaleType.Fit else nil
			})
		}) else nil,
		ModerationStatus = RoactModule.createElement(ModerationStatusPillModule, {
			moderationStatus = if p1.lookDetails then p1.lookDetails.moderationStatus else nil
		})
	})
end