local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local frameModule = require(appChat.Components.Common.Frame)
local avatarThumbnailModule = require(script.Parent.AvatarThumbnail)
local circleMaskModule = require(script.Parent.CircleMask)
local imageSetLabel = require(parent.UIBlox).Core.ImageSet.ImageSetLabel

return function(p1)
	-- upvalues: reactModule (ref), imageSetLabel (ref), circleMaskModule (ref), frameModule (ref), avatarThumbnailModule (ref)
	return reactModule.createElement(circleMaskModule, {
		circleColor3 = p1.circleColor3,
		circleTransparency = p1.circleTransparency,
		circleInteriorBackgroundColor3 = p1.circleInteriorBackgroundColor3,
		circleInteriorBackgroundTransparency = p1.circleInteriorBackgroundTransparency,
		circleDividerColor3 = p1.circleDividerColor3,
		circleDividerTransparency = p1.circleDividerTransparency,
		overlaySize = p1.overlaySize,
		renderAboveMask = reactModule.createElement(frameModule, {}, {
			layout = reactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Bottom
			}),
			presenceIndicator = if p1.showNewPresenceImage then reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(p1.presenceIndicatorSize, p1.presenceIndicatorSize),
				Image = p1.presenceImage,
				ImageColor3 = p1.presenceImageColor3,
				ImageTransparency = p1.presenceImageTransparency
			}) else reactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, p1.presenceIndicatorSize, 0, p1.presenceIndicatorSize),
				Image = p1.presenceImage
			})
		}),
		onActivated = p1.onActivated,
		selectable = p1.selectable
	}, {
		uiCorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
		avatar = reactModule.createElement(avatarThumbnailModule, { thumbnail = p1.thumbnail, cornerRadius = UDim.new(1, 0) })
	})
end