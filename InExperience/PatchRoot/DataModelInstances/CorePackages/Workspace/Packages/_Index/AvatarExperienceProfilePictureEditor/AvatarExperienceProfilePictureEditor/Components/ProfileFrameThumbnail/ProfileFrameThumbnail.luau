local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local icon = foundationModule.Icon
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local mapWidgetContentToFrameItemsModule = require(avatarExperienceProfilePictureEditor.Utils.mapWidgetContentToFrameItems)

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), skeleton (ref), radius (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), mapWidgetContentToFrameItemsModule (ref), image (ref)
	local previewSize = p1.previewSize or useTokens().Size.Size_800
	
	return reactModule.createElement(view, {
		testId = "profile-frame-preview-thumbnail",
		tag = "align-x-center align-y-center radius-medium bg-surface-100",
		Size = UDim2.fromOffset(previewSize, previewSize)
	}, {
		Content = if p1.isLoading then reactModule.createElement(skeleton, {
			Size = UDim2.fromOffset(previewSize, previewSize),
			radius = radius.Medium
		}) elseif p1.frameAssetId == nil then reactModule.createElement(view, { testId = "none-frame-icon", tag = "auto-xy" }, {
			Icon = reactModule.createElement(icon, { name = iconName.CircleSlash, size = iconSize.Medium })
		}) else reactModule.createElement(view, {
			testId = "frame-preview-image",
			tag = "size-full-full padding-xsmall"
		}, {
			Image = reactModule.createElement(image, {
				tag = "size-full-full",
				Image = mapWidgetContentToFrameItemsModule.getProfileFramePickerImage(p1.frameAssetId)
			})
		})
	})
end