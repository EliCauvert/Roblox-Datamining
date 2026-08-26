local parent = script:FindFirstAncestor("GameFilters").Parent
local _ = require(parent.DiscoveryTypes)
local foundationModule = require(parent.Foundation)
local radioGroup = foundationModule.RadioGroup
local view = foundationModule.View
local badge = foundationModule.Badge
local text = foundationModule.Text
local reactModule = require(parent.React)
local fFlagLuaAppChartsFilterOptionTextTag = require(parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag
local luaAppWrapChartsFilterOptionLabels = game:DefineFastFlag("LuaAppWrapChartsFilterOptionLabels", false)
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), fFlagLuaAppChartsFilterOptionTextTag (ref), radioGroup (ref), view (ref), text (ref), luaAppWrapChartsFilterOptionLabels (ref), badge (ref), foundationModule (ref)
	local var1 = useTokens()
	local XXLarge = var1.Padding.XXLarge
	local t = {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var1.Padding.Medium),
			PaddingBottom = UDim.new(0, var1.Padding.Medium)
		}),
		SizeConstraint = if fFlagLuaAppChartsFilterOptionTextTag then nil else reactModule.createElement("UISizeConstraint", {
			MaxSize = p1.containerMaxWidthBinding:map(function(p2)
				-- upvalues: XXLarge (ref)
				return Vector2.new(p2 - 3 * XXLarge, 1e999)
			end)
		}),
		Layout = if fFlagLuaAppChartsFilterOptionTextTag then reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalFlex = Enum.UIFlexAlignment.Fill
		}) else nil
	}
	
	for i, v in p1.options do
		local var2
		if fFlagLuaAppChartsFilterOptionTextTag then
			var2 = false
			
			if v.optionContextTag ~= nil then
				local _ = v.optionContextTag ~= ""
			end
		else
			var2 = nil
		end
		table.insert(t, if fFlagLuaAppChartsFilterOptionTextTag then reactModule.createElement(radioGroup.Item, {
			value = v.optionId,
			LayoutOrder = i,
			label = reactModule.createElement(view, {
				tag = "size-0 auto-xy row gap-medium flex-between align-y-center fill"
			}, {
				OptionItem = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = {
						["auto-xy content-default gui-object-defaults size-0 text-color-defaults text-defaults text-size-defaults text-title-medium text-truncate-split text-align-x-left text-align-y-center shrink"] = true,
						["text-wrap"] = luaAppWrapChartsFilterOptionLabels
					},
					Text = v.optionDisplayName,
					textStyle = if p1.selectedOptionId == v.optionId then var1.Color.Content.Emphasis else var1.Color.Content.Default
				}, {
					SizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var1.Size.Size_3000 * 3, 1e999) })
				}),
				ContextTag = var2 and reactModule.createElement(view, { tag = "auto-xy size-0", LayoutOrder = 2 }, {
					Badge = reactModule.createElement(badge, {
						variant = foundationModule.Enums.BadgeVariant.Neutral,
						text = v.optionContextTag
					}),
					SizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var1.Size.Size_3000, 1e999) })
				}) or nil
			})
		}) else reactModule.createElement(radioGroup.Item, { value = v.optionId, label = v.optionDisplayName }))
	end
	return if fFlagLuaAppChartsFilterOptionTextTag then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = p1.Size
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, XXLarge),
			PaddingRight = UDim.new(0, XXLarge)
		}),
		ScrollingFrame = reactModule.createElement("ScrollingFrame", {
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
			[reactModule.Change.AbsoluteCanvasSize] = p1.onCanvasSizeChanged
		}, {
			RadioGroup = reactModule.createElement(radioGroup.Root, {
				value = p1.selectedOptionId,
				onValueChanged = p1.onSelectedOptionChanged
			}, t),
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalFlex = Enum.UIFlexAlignment.Fill
			})
		})
	}) else reactModule.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ScrollBarThickness = 0,
		Selectable = false,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasSize = UDim2.fromScale(1, 0),
		ElasticBehavior = Enum.ElasticBehavior.Always,
		LayoutOrder = p1.LayoutOrder,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		Size = p1.Size
	}, {
		MenuFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			[reactModule.Change.AbsoluteSize] = function(p2)
				-- upvalues: p1 (ref)
				p1.onCanvasSizeChanged(p2.AbsoluteSize)
			end
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, XXLarge),
				PaddingRight = UDim.new(0, XXLarge)
			}),
			RadioGroup = reactModule.createElement(radioGroup.Root, {
				value = p1.selectedOptionId,
				onValueChanged = p1.onSelectedOptionChanged
			}, t)
		})
	})
end