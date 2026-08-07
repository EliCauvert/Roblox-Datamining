local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local frameModule = require(appChat.Components.Common.Frame)
local avatarThumbnailModule = require(script.Parent.AvatarThumbnail)
local circleMaskModule = require(script.Parent.CircleMask)
local imageSetLabel = require(parent.UIBlox).Core.ImageSet.ImageSetLabel

return function(p0) --[[ line: 30 | named "AvatarOneToOne" ]]
	-- upvalues: reactModule (ref), imageSetLabel (ref), circleMaskModule (ref), frameModule (ref), avatarThumbnailModule (ref)
	return reactModule.createElement(circleMaskModule, {
		circleColor3 = p0.circleColor3,
		circleTransparency = p0.circleTransparency,
		circleInteriorBackgroundColor3 = p0.circleInteriorBackgroundColor3,
		circleInteriorBackgroundTransparency = p0.circleInteriorBackgroundTransparency,
		circleDividerColor3 = p0.circleDividerColor3,
		circleDividerTransparency = p0.circleDividerTransparency,
		overlaySize = p0.overlaySize,
		renderAboveMask = reactModule.createElement(frameModule, {}, {
			layout = reactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Bottom
			}),
			presenceIndicator = if p0.showNewPresenceImage then reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(p0.presenceIndicatorSize, p0.presenceIndicatorSize),
				Image = p0.presenceImage,
				ImageColor3 = p0.presenceImageColor3,
				ImageTransparency = p0.presenceImageTransparency
			}) else reactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, p0.presenceIndicatorSize, 0, p0.presenceIndicatorSize),
				Image = p0.presenceImage
			})
		}),
		onActivated = p0.onActivated,
		selectable = p0.selectable
	}, {
		uiCorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
		avatar = reactModule.createElement(avatarThumbnailModule, { thumbnail = p0.thumbnail, cornerRadius = UDim.new(1, 0) })
	})
end