local appChat = script:FindFirstAncestor("AppChat")
local reactModule = require(appChat.Parent.React)
local frameModule = require(appChat.Components.Common.Frame)
local UIListLayoutModule = require(appChat.Components.Common.UIListLayout)
local avatarThumbnailModule = require(script.Parent.AvatarThumbnail)
local circleMaskModule = require(script.Parent.CircleMask)

return function(p0)
	-- upvalues: reactModule (ref), frameModule (ref), avatarThumbnailModule (ref), UIListLayoutModule (ref), circleMaskModule (ref)
	local thumbnailsCount = #p0.thumbnails
	local var7 = thumbnailsCount / 2
	local var8 = if thumbnailsCount % 2 == 0 then var7 else math.floor(var7)
	local var9 = thumbnailsCount - var8
	local t = {}
	local t_1 = {}
	
	for i, v in p0.thumbnails do
		local uDim2, var14, var15
		local _ = nil
		local var12 = 0
		local _ = nil
		local _ = nil
		
		if i > var8 then
			uDim2 = UDim2.new(1 / var9, 0, 1 / var9, 0)
			var14 = t_1
			
			if thumbnailsCount == 2 then
				var12 = -0.125
			end
			var15 = reactModule.createElement(frameModule, { ZIndex = 2 }, {
				border = reactModule.createElement(frameModule, {
					Size = UDim2.new(1, 0, 0, 2),
					Position = UDim2.new(0, 0, 0, -1),
					BackgroundColor3 = p0.circleDividerColor3,
					BackgroundTransparency = p0.circleDividerTransparency
				}),
				borderVertical = reactModule.createElement(frameModule, {
					Size = UDim2.new(0, 2, 1, 0),
					Position = UDim2.new(0, -1, 0, 0),
					BackgroundColor3 = p0.circleDividerColor3,
					BackgroundTransparency = p0.circleDividerTransparency
				})
			})
			var14["thumbnail-" .. tostring(i)] = reactModule.createElement(frameModule, { ClipsDescendants = true, Size = uDim2, LayoutOrder = i }, {
				headshotContainer = reactModule.createElement(frameModule, {
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.new(var12, 0, 0, 0)
				}, {
					headshot = reactModule.createElement(avatarThumbnailModule, { thumbnail = v })
				}),
				borderObject = var15
			})
		end
		uDim2 = UDim2.new(1 / var8, 0, 1 / var8, 0)
		var14 = t
		
		if thumbnailsCount == 3 then
			var12 = 0.125
		elseif thumbnailsCount == 2 then
			var12 = 0.125
		end
		var15 = reactModule.createElement(frameModule, { ZIndex = 2, Size = UDim2.fromScale(1, 1) }, {
			border = reactModule.createElement(frameModule, {
				Size = UDim2.new(1, 0, 0, 2),
				Position = UDim2.new(0, 0, 1, -1),
				BackgroundColor3 = p0.circleDividerColor3,
				BackgroundTransparency = p0.circleDividerTransparency
			}),
			borderVertical = reactModule.createElement(frameModule, {
				Size = UDim2.new(0, 2, 1, 0),
				Position = UDim2.new(0, -1, 0, 0),
				BackgroundColor3 = p0.circleDividerColor3,
				BackgroundTransparency = p0.circleDividerTransparency
			})
		})
	end
	return reactModule.createElement(circleMaskModule, {
		circleColor3 = p0.circleColor3,
		circleTransparency = p0.circleTransparency,
		circleInteriorBackgroundColor3 = p0.circleInteriorBackgroundColor3,
		circleInteriorBackgroundTransparency = p0.circleInteriorBackgroundTransparency,
		circleDividerColor3 = p0.circleDividerColor3,
		circleDividerTransparency = p0.circleDividerTransparency,
		LayoutOrder = p0.LayoutOrder,
		overlaySize = p0.overlaySize,
		onActivated = p0.onActivated,
		selectable = p0.selectable
	}, {
		fragment = reactModule.createElement(reactModule.Fragment, {}, {
			uiCorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			left = reactModule.createElement(frameModule, {
				Size = UDim2.new(1, -1, 1, 0),
				Position = UDim2.fromScale(-0.5, 0)
			}, {
				elementContainer = reactModule.createElement(frameModule, { Size = UDim2.fromScale(1, 1) }, {
					layout = reactModule.createElement(UIListLayoutModule, { HorizontalAlignment = Enum.HorizontalAlignment.Right })
				}, t)
			}),
			right = reactModule.createElement(frameModule, {
				Size = UDim2.new(1, -1, 1, 0),
				Position = UDim2.new(0.5, -2, 0, 0)
			}, {
				elementContainer = reactModule.createElement(frameModule, { Size = UDim2.fromScale(1, 1) }, {
					layout = reactModule.createElement(UIListLayoutModule, { HorizontalAlignment = Enum.HorizontalAlignment.Left })
				}, t_1)
			})
		})
	})
end