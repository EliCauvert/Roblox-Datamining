local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.React)
local useStyleModule = require(parent_1.Core.Style.useStyle)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local imagesModule = require(parent_2.UIBlox.App.ImageSet.Images)
local _ = require(parent.ImageSet.ImagesTypes)
local _ = require(parent_1.App.Style.StyleTypes)

local function renderHalfCircle(p1, p2)
	-- upvalues: reactModule (ref), imageSetComponentModule (ref)
	local layoutOrder = p1.layoutOrder
	local isLeft = p1.isLeft
	local rotation = p1.rotation
	local progressImage = p1.progressImage
	local iconDefault = p2.Theme.IconDefault
	local divider = p2.Theme.Divider
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		LayoutOrder = layoutOrder,
		Size = UDim2.fromScale(0.5, 1)
	}, {
		CircleImage = reactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(2, 1),
			AnchorPoint = if isLeft then nil else Vector2.new(0.5, 0),
			Image = progressImage
		}, {
			UIGradient = reactModule.createElement("UIGradient", {
				Rotation = rotation,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, iconDefault.Color),
					ColorSequenceKeypoint.new(0.499, iconDefault.Color),
					ColorSequenceKeypoint.new(0.5, divider.Color),
					ColorSequenceKeypoint.new(1, divider.Color)
				}),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, iconDefault.Transparency),
					NumberSequenceKeypoint.new(0.499, iconDefault.Transparency),
					NumberSequenceKeypoint.new(0.5, divider.Transparency),
					NumberSequenceKeypoint.new(1, divider.Transparency)
				})
			})
		})
	})
end

return function(p1)
	-- upvalues: imagesModule (ref), useStyleModule (ref), reactModule (ref), renderHalfCircle (ref), imageSetComponentModule (ref)
	local progress = p1.progress
	local isHolding = p1.isHolding
	local var1 = if isHolding then p1.iconHolding else p1.icon
	local var2 = if isHolding then imagesModule["icons/controls/keys/hold_button_assets/hold_Pressed_RadialFill"] else imagesModule["icons/controls/keys/hold_button_assets/hold_Unpressed_RadialFill"]
	local var3 = useStyleModule()
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1)
	}, {
		Progress = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1)
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Left = renderHalfCircle({
				layoutOrder = 1,
				isLeft = true,
				progressImage = var2,
				rotation = reactModule.useMemo(function()
					-- upvalues: progress (ref)
					return progress:map(function(p2)
						return math.clamp((p2 or 0) * 314 + 23, 180, 337)
					end)
				end, { progress })
			}, var3),
			Right = renderHalfCircle({
				layoutOrder = 2,
				progressImage = var2,
				rotation = reactModule.useMemo(function()
					-- upvalues: progress (ref)
					return progress:map(function(p2)
						return math.clamp((p2 or 0) * 314 + 23, 23, 180)
					end)
				end, { progress })
			}, var3)
		}),
		Icon = reactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Image = var1,
			ImageColor3 = var3.Theme.IconEmphasis.Color,
			ImageTransparency = reactModule.useMemo(function()
				-- upvalues: progress (ref)
				return progress:map(function(p2)
					return if p2 then math.clamp(0.8 - p2 * 0.8, 0, 0.8) else 0
				end)
			end, { progress })
		}),
		Arrow = reactModule.createElement(imageSetComponentModule.Label, {
			ImageTransparency = 0,
			BackgroundTransparency = 1,
			ZIndex = 3,
			Size = UDim2.fromScale(1, 1),
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Image = if isHolding then imagesModule["icons/controls/keys/hold_button_assets/hold_Pressed_Arrow"] else imagesModule["icons/controls/keys/hold_button_assets/hold_Unpressed_Arrow"],
			ImageColor3 = var3.Theme.IconEmphasis.Color
		})
	})
end