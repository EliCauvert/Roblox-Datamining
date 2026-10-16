local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local Image = FoundationModule.Image
local Skeleton = FoundationModule.Skeleton
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local MapWidgetContentToFrameItemsModule = require(AvatarExperienceProfilePictureEditor.Utils.mapWidgetContentToFrameItems)

return function(p1) --[[ Line: 25 | Named "ProfileFramePreviewThumbnail" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Skeleton (copy), Radius (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), MapWidgetContentToFrameItemsModule (copy), Image (copy)
	local UseTokensResult = UseTokensFunction()
	local PreviewSize = p1.previewSize or UseTokensResult.Size.Size_800
	
	return ReactModule.createElement(View, {
		testId = "profile-frame-preview-thumbnail",
		tag = "align-x-center align-y-center radius-medium bg-surface-100",
		Size = UDim2.fromOffset(PreviewSize, PreviewSize)
	}, {
		Content = if p1.isLoading then ReactModule.createElement(Skeleton, {
			Size = UDim2.fromOffset(PreviewSize, PreviewSize),
			radius = Radius.Medium
		}) elseif p1.frameAssetId == nil then ReactModule.createElement(View, { testId = "none-frame-icon", tag = "auto-xy" }, {
			Icon = ReactModule.createElement(Icon, { name = IconName.CircleSlash, size = IconSize.Medium })
		}) else ReactModule.createElement(View, {
			testId = "frame-preview-image",
			tag = "size-full-full padding-xsmall"
		}, {
			Image = ReactModule.createElement(Image, {
				tag = "size-full-full",
				Image = MapWidgetContentToFrameItemsModule.getProfileFramePickerImage(p1.frameAssetId)
			})
		})
	})
end