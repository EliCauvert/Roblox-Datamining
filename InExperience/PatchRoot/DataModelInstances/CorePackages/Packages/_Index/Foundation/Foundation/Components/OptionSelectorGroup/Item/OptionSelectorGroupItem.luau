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
local flagsModule = require(foundation.Utility.Flags)
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

local function _(p0, p1) --[[ line: 36 | named "getTransparency" ]]
	return p1:map(function(p2) --[[ line: 40 ]]
		-- upvalues: p0 (ref)
		return if p0 == nil then p2 else p0 + (1 - p0) * p2
	end)
end

local function getTextStyle(p3, p4, p5) --[[ line: 48 ]]
	-- upvalues: reactModule (ref)
	return reactModule.joinBindings({ p3, p4 }):map(function(p6) --[[ line: 53 ]]
		-- upvalues: p5 (ref)
		return { Color3 = p5, Transparency = p6[2] }
	end)
end

local t = {
	isDisabled = false,
	size = inputSizeModule.Medium,
	width = UDim.new(0, 0)
}

return reactModule.memo(reactModule.forwardRef(function(p7, p8) --[[ line: 95 | named "OptionSelectorGroupItem" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useOptionSelectorGroupModule (ref), orientationModule (ref), flagsModule (ref), fillBehaviorModule (ref), useTokensModule (ref), useOptionSelectorGroupItemVariantsModule (ref), useOptionSelectorGroupItemMotionStatesModule (ref), constantsModule (ref), useMotion (ref), reactModule (ref), textModule (ref), escapeRichTextModule (ref), getTextStyle (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref)
	local var19 = withDefaultsModule(p7, t)
	local var20 = useOptionSelectorGroupModule()
	local var21 = var20.value == var19.value
	local label = var19.label or var19.value
	local var23 = if var20.orientation == orientationModule.Vertical then orientationModule.Horizontal else orientationModule.Vertical
	local _ = nil
	local var24 = if flagsModule.FoundationOptionSelectorGroupFixes then if var23 == orientationModule.Horizontal then fillBehaviorModule.Fill else var19.fillBehavior or fillBehaviorModule.Fit elseif var23 == orientationModule.Horizontal then fillBehaviorModule.Fit else var19.fillBehavior or fillBehaviorModule.Fill
	local var25 = var23 == orientationModule.Vertical and var24 == fillBehaviorModule.Fit
	local var26 = if flagsModule.FoundationOptionSelectorGroupFixes and var25 then nil else UDim2.fromScale(1, 0)
	local var27 = useTokensModule()
	local var28 = useOptionSelectorGroupItemVariantsModule(var27, var19.size, var23, var24)
	local color3 = var28.content.Color3
	local var29 = if var21 then var27.Color.System.Contrast else var27.Color.Stroke.Emphasis
	local var30 = useOptionSelectorGroupItemMotionStatesModule(0, constantsModule.DISABLED_TRANSPARENCY)
	local var31, var32 = useMotion(var30.Default)
	local var33, _ = useMotion(var30.Default)
	reactModule.useEffect(function() --[[ line: 137 ]]
		-- upvalues: var19 (ref), var32 (ref), var30 (ref)
		if var19.isDisabled then
			var32(var30.Disabled)
			
			return
		end
		var32(var30.Default)
	end, { var19.isDisabled })
	local var34 = reactModule.useCallback(function() --[[ line: 146 ]]
		-- upvalues: var20 (ref), var19 (ref)
		var20.onValueChanged(if var20.value == var19.value then nil else var19.value)
	end, {
		var19.isDisabled,
		var19.value,
		var20.onValueChanged,
		var20.value
	})
	var19.testId = `{var20.testId}--item-{var19.value}`
	local var35 = reactModule.useMemo(function() --[[ line: 156 ]]
		-- upvalues: var28 (ref), var27 (ref)
		return {
			radius = UDim.new(0, var28.container.radius),
			offset = var27.Size.Size_200,
			borderWidth = var27.Stroke.Thicker
		}
	end, { var27, var28.container.radius })
	local var36 = reactModule.createElement(textModule, {
		TextWrapped = true,
		RichText = true,
		LayoutOrder = 2,
		Text = escapeRichTextModule(label),
		TextXAlignment = Enum.TextXAlignment.Left,
		tag = var28.label.tag,
		textStyle = getTextStyle(var33.textTransparency, var31.transparency, color3),
		testId = `{var19.testId}--label`
	})
	local createElement = reactModule.createElement
	local t_1 = {}
	local t_2 = { Color = var29.Color3 }
	local transparency = var29.Transparency
	t_2.Transparency = var31.transparency:map(function(p9) --[[ line: 40 ]]
		-- upvalues: transparency (ref)
		return if transparency == nil then p9 else transparency + (1 - transparency) * p9
	end)
	t_1.stroke = t_2
	t_1.Size = var26
	t_1.selection = {
		Selectable = if var19.isDisabled then false else var20.Selectable
	}
	t_1.cursor = var35
	t_1.onActivated = var34
	t_1.isDisabled = var19.isDisabled
	t_1.tag = if flagsModule.FoundationOptionSelectorGroupFixes then var28.container.tag else {
		["auto-xy"] = var24 ~= fillBehaviorModule.Fill,
		["fill auto-y"] = var24 == fillBehaviorModule.Fill,
		[var28.container.tag] = true
	}
	t_1.ref = p8
	
	return createElement(viewModule, withCommonPropsModule(var19, t_1), {
		ItemInner = reactModule.createElement(viewModule, { tag = var28.itemInner.tag, Size = var26 }, {
			Header = reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = if flagsModule.FoundationOptionSelectorGroupFixes then var28.header.tag else "row align-y-center gap-small size-full-0 auto-y"
			}, {
				Icon = if var19.icon then reactModule.createElement(iconModule, {
					LayoutOrder = 0,
					name = var19.icon,
					size = var28.icon.size,
					style = var31.transparency:map(function(p10) --[[ line: 213 ]]
						-- upvalues: color3 (ref)
						return { Color3 = color3, Transparency = p10 }
					end),
					testId = `{var19.testId}--icon`
				}) else nil,
				Label = if var23 == orientationModule.Horizontal then var36 elseif flagsModule.FoundationOptionSelectorGroupFixes and var25 then nil else reactModule.createElement(viewModule, { tag = "grow" }),
				LeadingSpacer = if flagsModule.FoundationOptionSelectorGroupFixes and var25 and not var19.icon then reactModule.createElement(viewModule, { LayoutOrder = 0, Size = UDim2.fromOffset(0, 0) }) else nil,
				Checkmark = reactModule.createElement(iconModule, {
					name = "check-large",
					LayoutOrder = 3,
					size = var28.icon.size,
					style = var31.transparency:map(function(p11) --[[ line: 240 ]]
						-- upvalues: color3 (ref), var21 (ref)
						return { Color3 = color3, Transparency = if var21 then p11 else 1 }
					end),
					testId = if var21 then `{var19.testId}--checkmark-selected` else `{var19.testId}--checkmark-unselected`
				})
			}),
			TextContainer = if flagsModule.FoundationOptionSelectorGroupFixes and var25 then reactModule.createElement(viewModule, { LayoutOrder = 2, tag = var28.textContainer.tag }, {
				Label = if var23 == orientationModule.Vertical then var36 else nil,
				Metadata = if var19.metadata then reactModule.createElement(textModule, {
					RichText = true,
					LayoutOrder = 3,
					Text = escapeRichTextModule(var19.metadata),
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left,
					tag = var28.metadata.tag,
					textStyle = getTextStyle(var33.textTransparency, var31.transparency, color3),
					testId = `{var19.testId}--metadata`
				}) else nil,
				Description = if var19.description then reactModule.createElement(textModule, {
					TextWrapped = true,
					RichText = true,
					LayoutOrder = 4,
					Text = escapeRichTextModule(var19.description),
					TextXAlignment = Enum.TextXAlignment.Left,
					tag = var28.description.tag,
					textStyle = getTextStyle(var33.textTransparency, var31.transparency, color3),
					testId = `{var19.testId}--description`
				}) else nil
			}) else nil,
			Label = if flagsModule.FoundationOptionSelectorGroupFixes and var25 then nil elseif var23 == orientationModule.Vertical then var36 else nil,
			Metadata = if flagsModule.FoundationOptionSelectorGroupFixes and var25 then nil elseif var19.metadata then reactModule.createElement(textModule, {
				RichText = true,
				LayoutOrder = 3,
				Text = escapeRichTextModule(var19.metadata),
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				tag = var28.metadata.tag,
				textStyle = getTextStyle(var33.textTransparency, var31.transparency, color3),
				testId = `{var19.testId}--metadata`
			}) else nil,
			Description = if flagsModule.FoundationOptionSelectorGroupFixes and var25 then nil elseif var19.description then reactModule.createElement(textModule, {
				TextWrapped = true,
				RichText = true,
				LayoutOrder = 4,
				Text = escapeRichTextModule(var19.description),
				TextXAlignment = Enum.TextXAlignment.Left,
				tag = var28.description.tag,
				textStyle = getTextStyle(var33.textTransparency, var31.transparency, color3),
				testId = `{var19.testId}--description`
			}) else nil
		})
	})
end))