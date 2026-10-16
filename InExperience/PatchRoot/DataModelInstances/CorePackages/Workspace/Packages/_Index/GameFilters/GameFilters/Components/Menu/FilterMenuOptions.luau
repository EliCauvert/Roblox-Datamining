local Parent = script:FindFirstAncestor("GameFilters").Parent
local _ = require(Parent.DiscoveryTypes)
local FoundationModule = require(Parent.Foundation)
local RadioGroup = FoundationModule.RadioGroup
local View = FoundationModule.View
local Badge = FoundationModule.Badge
local Text = FoundationModule.Text
local ReactModule = require(Parent.React)
local FFlagLuaAppChartsFilterOptionTextTag = require(Parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag
local LuaAppWrapChartsFilterOptionLabels = game:DefineFastFlag("LuaAppWrapChartsFilterOptionLabels", false)
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame: Frame) --[[ Line: 28 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FFlagLuaAppChartsFilterOptionTextTag (copy), RadioGroup (copy), View (copy), Text (copy), LuaAppWrapChartsFilterOptionLabels (copy), Badge (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local XXLarge = UseTokensResult.Padding.XXLarge
	local config = {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseTokensResult.Padding.Medium),
			PaddingBottom = UDim.new(0, UseTokensResult.Padding.Medium)
		}),
		SizeConstraint = if FFlagLuaAppChartsFilterOptionTextTag then nil else ReactModule.createElement("UISizeConstraint", {
			MaxSize = Frame.containerMaxWidthBinding:map(function(p1): Vector2 --[[ Line: 42 ]]
				-- upvalues: XXLarge (copy)
				return Vector2.new(p1 - 3 * XXLarge, 1e999)
			end)
		}),
		Layout = if FFlagLuaAppChartsFilterOptionTextTag then ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalFlex = Enum.UIFlexAlignment.Fill
		}) else nil
	}
	
	for LayoutOrder, option in Frame.options do
		local IsNotOptionContextTagMatch = if FFlagLuaAppChartsFilterOptionTextTag then option.optionContextTag ~= nil and option.optionContextTag ~= "" else nil
		table.insert(config, if FFlagLuaAppChartsFilterOptionTextTag then ReactModule.createElement(RadioGroup.Item, {
			value = option.optionId,
			LayoutOrder = LayoutOrder,
			label = ReactModule.createElement(View, {
				tag = "size-0 auto-xy row gap-medium flex-between align-y-center fill"
			}, {
				OptionItem = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = {
						["auto-xy content-default gui-object-defaults size-0 text-color-defaults text-defaults text-size-defaults text-title-medium text-truncate-split text-align-x-left text-align-y-center shrink"] = true,
						["text-wrap"] = LuaAppWrapChartsFilterOptionLabels
					},
					Text = option.optionDisplayName,
					textStyle = if Frame.selectedOptionId == option.optionId then UseTokensResult.Color.Content.Emphasis else UseTokensResult.Color.Content.Default
				}, {
					SizeConstraint = ReactModule.createElement("UISizeConstraint", {
						MaxSize = Vector2.new(UseTokensResult.Size.Size_3000 * 3, 1e999)
					})
				}),
				ContextTag = IsNotOptionContextTagMatch and ReactModule.createElement(View, { tag = "auto-xy size-0", LayoutOrder = 2 }, {
					Badge = ReactModule.createElement(Badge, {
						variant = FoundationModule.Enums.BadgeVariant.Neutral,
						text = option.optionContextTag
					}),
					SizeConstraint = ReactModule.createElement("UISizeConstraint", {
						MaxSize = Vector2.new(UseTokensResult.Size.Size_3000, 1e999)
					})
				}) or nil
			})
		}) else ReactModule.createElement(RadioGroup.Item, {
			value = option.optionId,
			label = option.optionDisplayName
		}))
	end
	return if FFlagLuaAppChartsFilterOptionTextTag then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = Frame.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = Frame.Size
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, XXLarge),
			PaddingRight = UDim.new(0, XXLarge)
		}),
		ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			CanvasSize = UDim2.fromScale(0, 0),
			ClipsDescendants = true,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollBarThickness = 0,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Selectable = false,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.fromScale(1, 1),
			[ReactModule.Change.AbsoluteCanvasSize] = Frame.onCanvasSizeChanged
		}, {
			RadioGroup = ReactModule.createElement(RadioGroup.Root, {
				value = Frame.selectedOptionId,
				onValueChanged = Frame.onSelectedOptionChanged
			}, config),
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalFlex = Enum.UIFlexAlignment.Fill
			})
		})
	}) else ReactModule.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ScrollBarThickness = 0,
		Selectable = false,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasSize = UDim2.fromScale(1, 0),
		ElasticBehavior = Enum.ElasticBehavior.Always,
		LayoutOrder = Frame.LayoutOrder,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		Size = Frame.Size
	}, {
		MenuFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			[ReactModule.Change.AbsoluteSize] = function(Frame1) --[[ Line: 163 ]]
				-- upvalues: Frame (copy)
				Frame.onCanvasSizeChanged(Frame1.AbsoluteSize)
			end
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, XXLarge),
				PaddingRight = UDim.new(0, XXLarge)
			}),
			RadioGroup = ReactModule.createElement(RadioGroup.Root, {
				value = Frame.selectedOptionId,
				onValueChanged = Frame.onSelectedOptionChanged
			}, config)
		})
	})
end