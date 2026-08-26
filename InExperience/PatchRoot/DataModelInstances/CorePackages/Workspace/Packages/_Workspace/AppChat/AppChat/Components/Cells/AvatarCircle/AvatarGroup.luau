local appChat = script:FindFirstAncestor("AppChat")
local reactModule = require(appChat.Parent.React)
local frameModule = require(appChat.Components.Common.Frame)
local UIListLayoutModule = require(appChat.Components.Common.UIListLayout)
local avatarThumbnailModule = require(script.Parent.AvatarThumbnail)
local circleMaskModule = require(script.Parent.CircleMask)

return function(p1)
	-- upvalues: reactModule (ref), frameModule (ref), avatarThumbnailModule (ref), UIListLayoutModule (ref), circleMaskModule (ref)
	local thumbnailsCount = #p1.thumbnails
	local var1 = thumbnailsCount / 2
	local var2 = if thumbnailsCount % 2 == 0 then var1 else math.floor(var1)
	local var3 = thumbnailsCount - var2
	local t = {}
	local t_1 = {}
	
	for i, v in p1.thumbnails do
		local uDim2, var4, var5
		local _ = nil
		local var6 = 0
		local _ = nil
		local _ = nil
		
		if i > var2 then
			uDim2 = UDim2.new(1 / var3, 0, 1 / var3, 0)
			var4 = t_1
			
			if thumbnailsCount == 2 then
				var6 = -0.125
			end
			var5 = reactModule.createElement(frameModule, { ZIndex = 2 }, {
				border = reactModule.createElement(frameModule, {
					Size = UDim2.new(1, 0, 0, 2),
					Position = UDim2.new(0, 0, 0, -1),
					BackgroundColor3 = p1.circleDividerColor3,
					BackgroundTransparency = p1.circleDividerTransparency
				}),
				borderVertical = reactModule.createElement(frameModule, {
					Size = UDim2.new(0, 2, 1, 0),
					Position = UDim2.new(0, -1, 0, 0),
					BackgroundColor3 = p1.circleDividerColor3,
					BackgroundTransparency = p1.circleDividerTransparency
				})
			})
			var4["thumbnail-" .. tostring(i)] = reactModule.createElement(frameModule, { ClipsDescendants = true, Size = uDim2, LayoutOrder = i }, {
				headshotContainer = reactModule.createElement(frameModule, {
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.new(var6, 0, 0, 0)
				}, {
					headshot = reactModule.createElement(avatarThumbnailModule, { thumbnail = v })
				}),
				borderObject = var5
			})
		end
		uDim2 = UDim2.new(1 / var2, 0, 1 / var2, 0)
		var4 = t
		
		if thumbnailsCount == 3 then
			var6 = 0.125
		elseif thumbnailsCount == 2 then
			var6 = 0.125
		end
		var5 = reactModule.createElement(frameModule, { ZIndex = 2, Size = UDim2.fromScale(1, 1) }, {
			border = reactModule.createElement(frameModule, {
				Size = UDim2.new(1, 0, 0, 2),
				Position = UDim2.new(0, 0, 1, -1),
				BackgroundColor3 = p1.circleDividerColor3,
				BackgroundTransparency = p1.circleDividerTransparency
			}),
			borderVertical = reactModule.createElement(frameModule, {
				Size = UDim2.new(0, 2, 1, 0),
				Position = UDim2.new(0, -1, 0, 0),
				BackgroundColor3 = p1.circleDividerColor3,
				BackgroundTransparency = p1.circleDividerTransparency
			})
		})
	end
	return reactModule.createElement(circleMaskModule, {
		circleColor3 = p1.circleColor3,
		circleTransparency = p1.circleTransparency,
		circleInteriorBackgroundColor3 = p1.circleInteriorBackgroundColor3,
		circleInteriorBackgroundTransparency = p1.circleInteriorBackgroundTransparency,
		circleDividerColor3 = p1.circleDividerColor3,
		circleDividerTransparency = p1.circleDividerTransparency,
		LayoutOrder = p1.LayoutOrder,
		overlaySize = p1.overlaySize,
		onActivated = p1.onActivated,
		selectable = p1.selectable
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