local AppChat = script:FindFirstAncestor("AppChat")
local ReactModule = require(AppChat.Parent.React)
local FrameModule = require(AppChat.Components.Common.Frame)
local UIListLayoutModule = require(AppChat.Components.Common.UIListLayout)
local AvatarThumbnailModule = require(script.Parent.AvatarThumbnail)
local CircleMaskModule = require(script.Parent.CircleMask)

return function(Frame)
	-- upvalues: ReactModule (copy), FrameModule (copy), AvatarThumbnailModule (copy), UIListLayoutModule (copy), CircleMaskModule (copy)
	local CountThumbnails = #Frame.thumbnails
	local Value = CountThumbnails / 2
	local Value1 = CountThumbnails % 2 == 0 and Value or math.floor(Value)
	local CountThumbnailsDelta = CountThumbnails - Value1
	local t = {}
	local t1 = {}
	
	for LayoutOrder, thumbnail in Frame.thumbnails do
		local XScale = 0
		local _UDim2 = nil
		local Elements = nil
		local Element = nil
		
		if LayoutOrder <= Value1 then
			_UDim2 = UDim2.new(1 / Value1, 0, 1 / Value1, 0)
			Elements = t
			
			if CountThumbnails == 3 then
				XScale = 0.125
			elseif CountThumbnails == 2 then
				XScale = 0.125
			end
			Element = ReactModule.createElement(FrameModule, { ZIndex = 2, Size = UDim2.fromScale(1, 1) }, {
				border = ReactModule.createElement(FrameModule, {
					Size = UDim2.new(1, 0, 0, 2),
					Position = UDim2.new(0, 0, 1, -1),
					BackgroundColor3 = Frame.circleDividerColor3,
					BackgroundTransparency = Frame.circleDividerTransparency
				}),
				borderVertical = ReactModule.createElement(FrameModule, {
					Size = UDim2.new(0, 2, 1, 0),
					Position = UDim2.new(0, -1, 0, 0),
					BackgroundColor3 = Frame.circleDividerColor3,
					BackgroundTransparency = Frame.circleDividerTransparency
				})
			})
		else
			_UDim2 = UDim2.new(1 / CountThumbnailsDelta, 0, 1 / CountThumbnailsDelta, 0)
			Elements = t1
			
			if CountThumbnails == 2 then
				XScale = -0.125
			end
			Element = ReactModule.createElement(FrameModule, { ZIndex = 2 }, {
				border = ReactModule.createElement(FrameModule, {
					Size = UDim2.new(1, 0, 0, 2),
					Position = UDim2.new(0, 0, 0, -1),
					BackgroundColor3 = Frame.circleDividerColor3,
					BackgroundTransparency = Frame.circleDividerTransparency
				}),
				borderVertical = ReactModule.createElement(FrameModule, {
					Size = UDim2.new(0, 2, 1, 0),
					Position = UDim2.new(0, -1, 0, 0),
					BackgroundColor3 = Frame.circleDividerColor3,
					BackgroundTransparency = Frame.circleDividerTransparency
				})
			})
		end
		Elements["thumbnail-" .. tostring(LayoutOrder)] = ReactModule.createElement(FrameModule, {
			ClipsDescendants = true,
			Size = _UDim2,
			LayoutOrder = LayoutOrder
		}, {
			headshotContainer = ReactModule.createElement(FrameModule, {
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.new(XScale, 0, 0, 0)
			}, {
				headshot = ReactModule.createElement(AvatarThumbnailModule, { thumbnail = thumbnail })
			}),
			borderObject = Element
		})
	end
	return ReactModule.createElement(CircleMaskModule, {
		circleColor3 = Frame.circleColor3,
		circleTransparency = Frame.circleTransparency,
		circleInteriorBackgroundColor3 = Frame.circleInteriorBackgroundColor3,
		circleInteriorBackgroundTransparency = Frame.circleInteriorBackgroundTransparency,
		circleDividerColor3 = Frame.circleDividerColor3,
		circleDividerTransparency = Frame.circleDividerTransparency,
		LayoutOrder = Frame.LayoutOrder,
		overlaySize = Frame.overlaySize,
		onActivated = Frame.onActivated,
		selectable = Frame.selectable
	}, {
		fragment = ReactModule.createElement(ReactModule.Fragment, {}, {
			uiCorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			left = ReactModule.createElement(FrameModule, {
				Size = UDim2.new(1, -1, 1, 0),
				Position = UDim2.fromScale(-0.5, 0)
			}, {
				elementContainer = ReactModule.createElement(FrameModule, { Size = UDim2.fromScale(1, 1) }, {
					layout = ReactModule.createElement(UIListLayoutModule, { HorizontalAlignment = Enum.HorizontalAlignment.Right })
				}, t)
			}),
			right = ReactModule.createElement(FrameModule, {
				Size = UDim2.new(1, -1, 1, 0),
				Position = UDim2.new(0.5, -2, 0, 0)
			}, {
				elementContainer = ReactModule.createElement(FrameModule, { Size = UDim2.fromScale(1, 1) }, {
					layout = ReactModule.createElement(UIListLayoutModule, { HorizontalAlignment = Enum.HorizontalAlignment.Left })
				}, t1)
			})
		})
	})
end