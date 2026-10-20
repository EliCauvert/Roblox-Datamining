local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local ReactModule = require(Parent2.React)
local UseStyleModule = require(Parent1.Core.Style.useStyle)
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local ImagesModule = require(Parent2.UIBlox.App.ImageSet.Images)
local _ = require(Parent.ImageSet.ImagesTypes)
local _ = require(Parent1.App.Style.StyleTypes)

local function renderHalfCircle(p1, p2)
	-- upvalues: ReactModule (copy), ImageSetComponentModule (copy)
	local IconDefault = p2.Theme.IconDefault
	local Divider = p2.Theme.Divider
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.fromScale(0.5, 1)
	}, {
		CircleImage = ReactModule.createElement(ImageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(2, 1),
			AnchorPoint = if p1.isLeft then nil else Vector2.new(0.5, 0),
			Image = p1.progressImage
		}, {
			UIGradient = ReactModule.createElement("UIGradient", {
				Rotation = p1.rotation,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, IconDefault.Color),
					ColorSequenceKeypoint.new(0.499, IconDefault.Color),
					ColorSequenceKeypoint.new(0.5, Divider.Color),
					ColorSequenceKeypoint.new(1, Divider.Color)
				}),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, IconDefault.Transparency),
					NumberSequenceKeypoint.new(0.499, IconDefault.Transparency),
					NumberSequenceKeypoint.new(0.5, Divider.Transparency),
					NumberSequenceKeypoint.new(1, Divider.Transparency)
				})
			})
		})
	})
end

return function(p1)
	-- upvalues: ImagesModule (copy), UseStyleModule (copy), ReactModule (copy), renderHalfCircle (copy), ImageSetComponentModule (copy)
	local Progress = p1.progress
	local IsHolding = p1.isHolding
	local IconsControlsKeysHoldButtonAssetsHoldPressedRadialFill = if IsHolding then ImagesModule["icons/controls/keys/hold_button_assets/hold_Pressed_RadialFill"] else ImagesModule["icons/controls/keys/hold_button_assets/hold_Unpressed_RadialFill"]
	local UseStyleModuleResult = UseStyleModule()
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1)
	}, {
		Progress = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Left = renderHalfCircle({
				layoutOrder = 1,
				isLeft = true,
				progressImage = IconsControlsKeysHoldButtonAssetsHoldPressedRadialFill,
				rotation = ReactModule.useMemo(function()
					-- upvalues: Progress (copy)
					return Progress:map(function(p2): number
						return (math.clamp((p2 or 0) * 314 + 23, 180, 337))
					end)
				end, { Progress })
			}, UseStyleModuleResult),
			Right = renderHalfCircle({
				layoutOrder = 2,
				progressImage = IconsControlsKeysHoldButtonAssetsHoldPressedRadialFill,
				rotation = ReactModule.useMemo(function()
					-- upvalues: Progress (copy)
					return Progress:map(function(p2): number
						return (math.clamp((p2 or 0) * 314 + 23, 23, 180))
					end)
				end, { Progress })
			}, UseStyleModuleResult)
		}),
		Icon = ReactModule.createElement(ImageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Image = if IsHolding then p1.iconHolding else p1.icon,
			ImageColor3 = UseStyleModuleResult.Theme.IconEmphasis.Color,
			ImageTransparency = ReactModule.useMemo(function()
				-- upvalues: Progress (copy)
				return Progress:map(function(p2: number): number
					return if p2 then math.clamp(0.8 - p2 * 0.8, 0, 0.8) else 0
				end)
			end, { Progress })
		}),
		Arrow = ReactModule.createElement(ImageSetComponentModule.Label, {
			ImageTransparency = 0,
			BackgroundTransparency = 1,
			ZIndex = 3,
			Size = UDim2.fromScale(1, 1),
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Image = if IsHolding then ImagesModule["icons/controls/keys/hold_button_assets/hold_Pressed_Arrow"] else ImagesModule["icons/controls/keys/hold_button_assets/hold_Unpressed_Arrow"],
			ImageColor3 = UseStyleModuleResult.Theme.IconEmphasis.Color
		})
	})
end