local CorePackages = game:GetService("CorePackages")
local NotificationService = game:GetService("NotificationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local _ = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local Images = UIBloxModule.App.ImageSet.Images
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local PageButtonModule = require(Modules.AvatarExperience.Common.Components.Landing.PageButton)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local AvatarThumbnailRequests = UserLibModule.Utils.AvatarThumbnailRequests
local TModule = require(CorePackages.Packages.t)
local RbxThumbnailSizeToNumberSizeEntry = nil
local RbxAvatarThumbnailTypeFromEnumToRbxthumbTypeEntry = nil
assert(AvatarThumbnailRequests.CUSTOMIZE_BUTTON ~= nil, "AvatarThumbnailRequests.CUSTOMIZE_BUTTON should exist. Silence type checker.")
assert(AvatarThumbnailRequests.CUSTOMIZE_BUTTON[1] ~= nil, "AvatarThumbnailRequests.CUSTOMIZE_BUTTON[1] should exist. Silence type checker.")
local CUSTOMIZEBUTTONEntry = AvatarThumbnailRequests.CUSTOMIZE_BUTTON[1]
RbxThumbnailSizeToNumberSizeEntry = Constants.RbxThumbnailSizeToNumberSize[CUSTOMIZEBUTTONEntry.thumbnailSize]
RbxAvatarThumbnailTypeFromEnumToRbxthumbTypeEntry = Constants.RbxAvatarThumbnailTypeFromEnumToRbxthumbType[CUSTOMIZEBUTTONEntry.thumbnailType]
local IconsMenuCustomizeLarge = Images["icons/menu/customize_large"]
local AvatarPageButton = RoactModule.PureComponent:extend("AvatarPageButton")
AvatarPageButton.validateProps = TModule.strictInterface({
	transparencyModifier = TModule.number,
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	onActivated = TModule.callback,
	forwardRef = TModule.optional(TModule.table),
	localUserId = TModule.string
})
AvatarPageButton.defaultProps = { transparencyModifier = 0 }

function AvatarPageButton.init(p1)
	-- upvalues: NotificationService (copy), CryoModule (copy), RoactModule (copy), Loading (copy), IconSize (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), RbxAvatarThumbnailTypeFromEnumToRbxthumbTypeEntry (ref), RbxThumbnailSizeToNumberSizeEntry (ref), LoadableImage (copy), ConstantsModule (copy)
	p1.state = { style = string.lower(NotificationService.SelectedTheme) }
	
	function p1.getLoadingImage(p2)
		-- upvalues: CryoModule (upval), RoactModule (upval), Loading (upval), IconSize (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, (CryoModule.Dictionary.join(p2 or {}, {
			LoadingSpinner = RoactModule.createElement(Loading, {
				size = IconSize.Large,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}),
			AspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1,
				AspectType = Enum.AspectType.ScaleWithParentSize
			})
		})))
	end
	
	function p1.getThumbnail(Position, Size, ImageRectOffset, ImageRectSize, ZIndex, _)
		-- upvalues: p1 (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), RbxAvatarThumbnailTypeFromEnumToRbxthumbTypeEntry (upval), RbxThumbnailSizeToNumberSizeEntry (upval), RoactModule (upval), LoadableImage (upval), ConstantsModule (upval)
		return if p1.props.localUserId == nil or p1.props.localUserId == "" then nil else RoactModule.createElement(LoadableImage, {
			BackgroundTransparency = 1,
			useShimmerAnimationWhileLoading = false,
			shouldHandleReloads = true,
			Position = Position,
			Size = Size,
			Image = GetRbxthumbWithTypeSizeAndOptionsFunction(p1.props.localUserId, RbxAvatarThumbnailTypeFromEnumToRbxthumbTypeEntry, RbxThumbnailSizeToNumberSizeEntry),
			renderOnLoading = p1.getLoadingImage,
			ZIndex = ZIndex,
			cornerRadius = UDim.new(0, ConstantsModule.PageButtonCornerRadius),
			ImageRectOffset = ImageRectOffset,
			ImageRectSize = ImageRectSize
		})
	end
end

function AvatarPageButton.render(p1)
	-- upvalues: WithLocalizationFunction (copy), RoactModule (copy), PageButtonModule (copy), RbxThumbnailSizeToNumberSizeEntry (ref), IconsMenuCustomizeLarge (copy)
	local TransparencyModifier = p1.props.transparencyModifier
	local NextSelectionLeft = p1.props.NextSelectionLeft
	local NextSelectionRight = p1.props.NextSelectionRight
	local NextSelectionUp = p1.props.NextSelectionUp
	local NextSelectionDown = p1.props.NextSelectionDown
	local AvatarEditorPng: string = if p1.state.style == "dark" then "rbxasset://textures/AvatarEditorImages/AvatarEditor.png" else "rbxasset://textures/AvatarEditorImages/AvatarEditor_LightTheme.png"
	local ForwardRef = p1.props.forwardRef
	
	return WithLocalizationFunction({ avatarEditorText = "Feature.Catalog.Action.Customize" })(function(p2)
		-- upvalues: RoactModule (upval), PageButtonModule (upval), AvatarEditorPng (ref), p1 (copy), RbxThumbnailSizeToNumberSizeEntry (upval), IconsMenuCustomizeLarge (upval), TransparencyModifier (copy), NextSelectionLeft (copy), NextSelectionRight (copy), NextSelectionUp (copy), NextSelectionDown (copy), ForwardRef (copy)
		return RoactModule.createElement(PageButtonModule, {
			Size = UDim2.new(1, 0, 1, 0),
			backgroundImage = AvatarEditorPng,
			getThumbnail = p1.getThumbnail,
			thumbnailSize = RbxThumbnailSizeToNumberSizeEntry,
			thumbnailZoom = 2,
			thumbnailImageYInsetScale = 0.05,
			icon = IconsMenuCustomizeLarge,
			text = p2.avatarEditorText,
			transparencyModifier = TransparencyModifier,
			NextSelectionLeft = NextSelectionLeft,
			NextSelectionRight = NextSelectionRight,
			NextSelectionUp = NextSelectionUp,
			NextSelectionDown = NextSelectionDown,
			[RoactModule.Ref] = ForwardRef,
			onActivated = p1.props.onActivated
		})
	end)
end

function AvatarPageButton.didMount(p1)
	-- upvalues: NotificationService (copy)
	p1.themeChangedConn = NotificationService:GetPropertyChangedSignal("SelectedTheme"):Connect(function()
		-- upvalues: p1 (copy), NotificationService (upval)
		p1:setState({ style = string.lower(NotificationService.SelectedTheme) })
	end)
end

function AvatarPageButton.willUnmount(p1)
	if p1.themeChangedConn then
		p1.themeChangedConn:Disconnect()
		p1.themeChangedConn = nil
	end
end

local v1 = RoactRoduxModule.connect(function(p1)
	return { localUserId = p1.LocalUserId }
end)(AvatarPageButton)

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), v1 (ref), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)