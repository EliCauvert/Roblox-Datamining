-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:57 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.React)
local useStyleModule = require(parent_1.Core.Style.useStyle)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local imagesModule = require(parent_2.UIBlox.App.ImageSet.Images)
local _ = require(parent.ImageSet.ImagesTypes)
local _ = require(parent_1.App.Style.StyleTypes)

local function renderHalfCircle(p0, p1) --[[ line: 38 ]]
	-- upvalues: reactModule (ref), imageSetComponentModule (ref)
	local layoutOrder = p0.layoutOrder
	local isLeft = p0.isLeft
	local rotation = p0.rotation
	local progressImage = p0.progressImage
	local iconDefault = p1.Theme.IconDefault
	local divider = p1.Theme.Divider
	
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

return function(p2) --[[ line: 79 | named "ProgressIcon" ]]
	-- upvalues: imagesModule (ref), useStyleModule (ref), reactModule (ref), renderHalfCircle (ref), imageSetComponentModule (ref)
	local progress = p2.progress
	local isHolding = p2.isHolding
	local var5 = if isHolding then p2.iconHolding else p2.icon
	local var6 = if isHolding then imagesModule["icons/controls/keys/hold_button_assets/hold_Pressed_RadialFill"] else imagesModule["icons/controls/keys/hold_button_assets/hold_Unpressed_RadialFill"]
	local var7 = useStyleModule()
	
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
				progressImage = var6,
				rotation = reactModule.useMemo(function() --[[ line: 87 ]]
					-- upvalues: progress (ref)
					return progress:map(function(p3) --[[ line: 88 ]]
						return math.clamp((p3 or 0) * 314 + 23, 180, 337)
					end)
				end, { progress })
			}, var7),
			Right = renderHalfCircle({
				layoutOrder = 2,
				progressImage = var6,
				rotation = reactModule.useMemo(function() --[[ line: 94 ]]
					-- upvalues: progress (ref)
					return progress:map(function(p4) --[[ line: 95 ]]
						return math.clamp((p4 or 0) * 314 + 23, 23, 180)
					end)
				end, { progress })
			}, var7)
		}),
		Icon = reactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Image = var5,
			ImageColor3 = var7.Theme.IconEmphasis.Color,
			ImageTransparency = reactModule.useMemo(function() --[[ line: 101 ]]
				-- upvalues: progress (ref)
				return progress:map(function(p5) --[[ line: 102 ]]
					return if p5 then math.clamp(0.8 - p5 * 0.8, 0, 0.8) else 0
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
			ImageColor3 = var7.Theme.IconEmphasis.Color
		})
	})
end