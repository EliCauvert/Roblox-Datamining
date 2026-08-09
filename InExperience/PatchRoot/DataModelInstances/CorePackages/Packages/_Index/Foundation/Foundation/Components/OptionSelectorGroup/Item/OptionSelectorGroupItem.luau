local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local useMotion = require(parent.Motion).useMotion
local components = foundation.Components
local iconModule = require(components.Icon)
local textModule = require(components.Text)
local _ = require(components.Types)
local viewModule = require(components.View)
local constantsModule = require(foundation.Constants)
local escapeRichTextModule = require(foundation.Utility.escapeRichText)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useOptionSelectorGroupItemMotionStatesModule = require(script.Parent.useOptionSelectorGroupItemMotionStates)
local useOptionSelectorGroupItemVariantsModule = require(script.Parent.useOptionSelectorGroupItemVariants)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local inputSizeModule = require(foundation.Enums.InputSize)
local orientationModule = require(foundation.Enums.Orientation)
local useOptionSelectorGroupModule = require(script.Parent.Parent.useOptionSelectorGroup)

local function _(p0, p1) --[[ line: 35 | named "getTransparency" ]]
	return p1:map(function(p2) --[[ line: 39 ]]
		-- upvalues: p0 (ref)
		return if p0 == nil then p2 else p0 + (1 - p0) * p2
	end)
end

local function getTextStyle(p3, p4, p5) --[[ line: 47 ]]
	-- upvalues: reactModule (ref)
	return reactModule.joinBindings({ p3, p4 }):map(function(p6) --[[ line: 52 ]]
		-- upvalues: p5 (ref)
		return { Color3 = p5, Transparency = p6[2] }
	end)
end

local t = {
	isDisabled = false,
	size = inputSizeModule.Medium,
	width = UDim.new(0, 0)
}

return reactModule.memo(reactModule.forwardRef(function(p7, p8) --[[ line: 89 | named "OptionSelectorGroupItem" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useOptionSelectorGroupModule (ref), orientationModule (ref), fillBehaviorModule (ref), useTokensModule (ref), useOptionSelectorGroupItemVariantsModule (ref), useOptionSelectorGroupItemMotionStatesModule (ref), constantsModule (ref), useMotion (ref), reactModule (ref), textModule (ref), escapeRichTextModule (ref), getTextStyle (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref)
	local var18 = withDefaultsModule(p7, t)
	local var19 = useOptionSelectorGroupModule()
	local var20 = var19.value == var18.value
	local label = var18.label or var18.value
	local var22 = if var19.orientation == orientationModule.Vertical then orientationModule.Horizontal else orientationModule.Vertical
	local var23 = if var22 == orientationModule.Horizontal then fillBehaviorModule.Fit else var18.fillBehavior or fillBehaviorModule.Fill
	local uDim2 = UDim2.fromScale(1, 0)
	local var25 = useTokensModule()
	local var26 = useOptionSelectorGroupItemVariantsModule(var25, var18.size)
	local color3 = var26.content.Color3
	local var27 = if var20 then var25.Color.System.Contrast else var25.Color.Stroke.Emphasis
	local var28 = useOptionSelectorGroupItemMotionStatesModule(0, constantsModule.DISABLED_TRANSPARENCY)
	local var29, var30 = useMotion(var28.Default)
	local var31, _ = useMotion(var28.Default)
	reactModule.useEffect(function() --[[ line: 119 ]]
		-- upvalues: var18 (ref), var30 (ref), var28 (ref)
		if var18.isDisabled then
			var30(var28.Disabled)
			
			return
		end
		var30(var28.Default)
	end, { var18.isDisabled })
	local var32 = reactModule.useCallback(function() --[[ line: 128 ]]
		-- upvalues: var19 (ref), var18 (ref)
		var19.onValueChanged(if var19.value == var18.value then nil else var18.value)
	end, {
		var18.isDisabled,
		var18.value,
		var19.onValueChanged,
		var19.value
	})
	var18.testId = `{var19.testId}--item-{var18.value}`
	local var33 = reactModule.useMemo(function() --[[ line: 138 ]]
		-- upvalues: var26 (ref), var25 (ref)
		return {
			radius = UDim.new(0, var26.container.radius),
			offset = var25.Size.Size_200,
			borderWidth = var25.Stroke.Thicker
		}
	end, { var25, var26.container.radius })
	local var34 = reactModule.createElement(textModule, {
		TextWrapped = true,
		RichText = true,
		LayoutOrder = 2,
		Text = escapeRichTextModule(label),
		TextXAlignment = Enum.TextXAlignment.Left,
		tag = var26.label.tag,
		textStyle = getTextStyle(var31.textTransparency, var29.transparency, color3)
	})
	local createElement = reactModule.createElement
	local t_1 = {}
	local t_2 = { Color = var27.Color3 }
	local transparency = var27.Transparency
	t_2.Transparency = var29.transparency:map(function(p9) --[[ line: 39 ]]
		-- upvalues: transparency (ref)
		return if transparency == nil then p9 else transparency + (1 - transparency) * p9
	end)
	t_1.stroke = t_2
	t_1.Size = uDim2
	t_1.selection = {
		Selectable = if var18.isDisabled then false else var19.Selectable
	}
	t_1.cursor = var33
	t_1.onActivated = var32
	t_1.isDisabled = var18.isDisabled
	t_1.tag = {
		["auto-xy"] = var23 ~= fillBehaviorModule.Fill,
		["fill auto-y"] = var23 == fillBehaviorModule.Fill,
		[var26.container.tag] = true
	}
	t_1.ref = p8
	
	return createElement(viewModule, withCommonPropsModule(var18, t_1), {
		ItemInner = reactModule.createElement(viewModule, { tag = var26.itemInner.tag, Size = uDim2 }, {
			IconRow = reactModule.createElement(viewModule, {
				tag = "row align-y-center gap-small size-full-0 auto-y",
				LayoutOrder = 1
			}, {
				Icon = if var18.icon then reactModule.createElement(iconModule, {
					LayoutOrder = 0,
					name = var18.icon,
					size = var26.icon.size,
					style = var29.transparency:map(function(p10) --[[ line: 190 ]]
						-- upvalues: color3 (ref)
						return { Color3 = color3, Transparency = p10 }
					end)
				}) else nil,
				Label = if var22 == orientationModule.Horizontal then var34 else reactModule.createElement(viewModule, { tag = "grow" }),
				Checkmark = reactModule.createElement(iconModule, {
					name = "check-large",
					LayoutOrder = 3,
					size = var26.icon.size,
					style = var29.transparency:map(function(p11) --[[ line: 205 ]]
						-- upvalues: color3 (ref), var20 (ref)
						return { Color3 = color3, Transparency = if var20 then p11 else 1 }
					end)
				})
			}),
			Label = if var22 == orientationModule.Vertical then var34 else nil,
			Metadata = if var18.metadata then reactModule.createElement(textModule, {
				RichText = true,
				LayoutOrder = 3,
				Text = escapeRichTextModule(var18.metadata),
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				tag = var26.metadata.tag,
				textStyle = getTextStyle(var31.textTransparency, var29.transparency, color3)
			}) else nil,
			Description = if var18.description then reactModule.createElement(textModule, {
				TextWrapped = true,
				RichText = true,
				LayoutOrder = 4,
				Text = escapeRichTextModule(var18.description),
				TextXAlignment = Enum.TextXAlignment.Left,
				tag = var26.description.tag,
				textStyle = getTextStyle(var31.textTransparency, var29.transparency, color3)
			}) else nil
		})
	})
end))