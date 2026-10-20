local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FrameModule = require(AppChat.Components.Common.Frame)
local AvatarThumbnailModule = require(script.Parent.AvatarThumbnail)
local CircleMaskModule = require(script.Parent.CircleMask)
local ImageSetLabel = require(Parent.UIBlox).Core.ImageSet.ImageSetLabel

return function(p1)
	-- upvalues: ReactModule (copy), ImageSetLabel (copy), CircleMaskModule (copy), FrameModule (copy), AvatarThumbnailModule (copy)
	return ReactModule.createElement(CircleMaskModule, {
		circleColor3 = p1.circleColor3,
		circleTransparency = p1.circleTransparency,
		circleInteriorBackgroundColor3 = p1.circleInteriorBackgroundColor3,
		circleInteriorBackgroundTransparency = p1.circleInteriorBackgroundTransparency,
		circleDividerColor3 = p1.circleDividerColor3,
		circleDividerTransparency = p1.circleDividerTransparency,
		overlaySize = p1.overlaySize,
		renderAboveMask = ReactModule.createElement(FrameModule, {}, {
			layout = ReactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Bottom
			}),
			presenceIndicator = if p1.showNewPresenceImage then ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(p1.presenceIndicatorSize, p1.presenceIndicatorSize),
				Image = p1.presenceImage,
				ImageColor3 = p1.presenceImageColor3,
				ImageTransparency = p1.presenceImageTransparency
			}) else ReactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, p1.presenceIndicatorSize, 0, p1.presenceIndicatorSize),
				Image = p1.presenceImage
			})
		}),
		onActivated = p1.onActivated,
		selectable = p1.selectable
	}, {
		uiCorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
		avatar = ReactModule.createElement(AvatarThumbnailModule, { thumbnail = p1.thumbnail, cornerRadius = UDim.new(1, 0) })
	})
end