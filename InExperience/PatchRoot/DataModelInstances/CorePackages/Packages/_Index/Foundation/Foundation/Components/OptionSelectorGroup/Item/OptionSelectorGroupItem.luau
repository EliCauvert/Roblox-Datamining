local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local icon = require(parent.BuilderIcons).Icon
local useMotion = require(parent.Motion).useMotion
local components = foundation.Components
local iconModule = require(components.Icon)
local imageModule = require(components.Image)
local textModule = require(components.Text)
local _ = require(components.Types)
local viewModule = require(components.View)
local constantsModule = require(foundation.Constants)
local flagsModule = require(foundation.Utility.Flags)
local escapeRichTextModule = require(foundation.Utility.escapeRichText)
local iconMigrationUtilsModule = require(foundation.Utility.iconMigrationUtils)
local isBuilderOrMigratedIcon = iconMigrationUtilsModule.isBuilderOrMigratedIcon
local normalizeIconName = iconMigrationUtilsModule.normalizeIconName
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useOptionSelectorGroupItemMotionStatesModule = require(script.Parent.useOptionSelectorGroupItemMotionStates)
local useOptionSelectorGroupItemVariantsModule = require(script.Parent.useOptionSelectorGroupItemVariants)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local _ = require(foundation.Enums.IconSize)
local inputSizeModule = require(foundation.Enums.InputSize)
local optionSelectorGroupSizeModule = require(foundation.Enums.OptionSelectorGroupSize)
local orientationModule = require(foundation.Enums.Orientation)
local useOptionSelectorGroupModule = require(script.Parent.Parent.useOptionSelectorGroup)

local function _(p0, p1) --[[ line: 49 | named "getTransparency" ]]
	return p1:map(function(p2) --[[ line: 53 ]]
		-- upvalues: p0 (ref)
		return if p0 == nil then p2 else p0 + (1 - p0) * p2
	end)
end

local function getTextStyle(p3, p4, p5) --[[ line: 61 ]]
	-- upvalues: reactModule (ref)
	return reactModule.joinBindings({ p3, p4 }):map(function(p6) --[[ line: 66 ]]
		-- upvalues: p5 (ref)
		return { Color3 = p5, Transparency = p6[2] }
	end)
end

local function renderIcon(p7) --[[ line: 75 ]]
	-- upvalues: flagsModule (ref), isBuilderOrMigratedIcon (ref), reactModule (ref), imageModule (ref), normalizeIconName (ref), iconModule (ref)
	if not p7.icon then
		return nil
	elseif flagsModule.FoundationOptionSelectorGroupBeta and not isBuilderOrMigratedIcon(p7.icon) then
		local iconExtent = p7.iconExtent
		
		return reactModule.createElement(imageModule, {
			Image = p7.icon,
			Size = UDim2.fromOffset(iconExtent, iconExtent),
			imageStyle = p7.transparency:map(function(p8) --[[ line: 95 ]]
				-- upvalues: p7 (ref)
				return { Color3 = p7.contentColor, Transparency = p8 }
			end),
			LayoutOrder = p7.layoutOrder,
			testId = `{p7.testId}--icon`
		})
	end
	local var23 = normalizeIconName(p7.icon)
	local t = {
		name = var23.name,
		size = p7.iconSize,
		style = p7.transparency:map(function(p9) --[[ line: 112 ]]
			-- upvalues: p7 (ref)
			return { Color3 = p7.contentColor, Transparency = p9 }
		end),
		LayoutOrder = p7.layoutOrder,
		testId = `{p7.testId}--icon`
	}
	
	if var23.variant then
		t.variant = var23.variant
	end
	return reactModule.createElement(iconModule, t)
end

local t = {
	isDisabled = false,
	size = inputSizeModule.Medium,
	width = UDim.new(0, 0)
}

return reactModule.memo(reactModule.forwardRef(function(p10, p11) --[[ line: 165 | named "OptionSelectorGroupItem" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useOptionSelectorGroupModule (ref), flagsModule (ref), inputSizeModule (ref), optionSelectorGroupSizeModule (ref), orientationModule (ref), fillBehaviorModule (ref), useTokensModule (ref), useOptionSelectorGroupItemVariantsModule (ref), useOptionSelectorGroupItemMotionStatesModule (ref), constantsModule (ref), useMotion (ref), reactModule (ref), renderIcon (ref), viewModule (ref), textModule (ref), escapeRichTextModule (ref), getTextStyle (ref), withCommonPropsModule (ref), iconModule (ref), icon (ref)
	local var25 = withDefaultsModule(p10, t)
	local var26 = useOptionSelectorGroupModule()
	local var27 = var26.value == var25.value
	local var28 = if flagsModule.FoundationOptionSelectorGroupBeta then if var26.size ~= nil then if var25.size == inputSizeModule.Large then optionSelectorGroupSizeModule.Medium else var25.size else var26.size else var25.size
	local var29 = if var26.orientation == orientationModule.Vertical then orientationModule.Horizontal else orientationModule.Vertical
	local var30 = if flagsModule.FoundationOptionSelectorGroupBeta then if var26.fillBehavior ~= nil then var25.fillBehavior else var26.fillBehavior else var25.fillBehavior
	local _ = nil
	local var31 = if flagsModule.FoundationOptionSelectorGroupBeta or flagsModule.FoundationOptionSelectorGroupFixes then if var29 == orientationModule.Horizontal then fillBehaviorModule.Fill else var30 or fillBehaviorModule.Fit elseif var29 == orientationModule.Horizontal then fillBehaviorModule.Fit else var30 or fillBehaviorModule.Fill
	local var32 = var29 == orientationModule.Vertical and var31 == fillBehaviorModule.Fit
	local var33 = if flagsModule.FoundationOptionSelectorGroupBeta or flagsModule.FoundationOptionSelectorGroupFixes then if var32 then nil else UDim2.fromScale(1, 0) else UDim2.fromScale(1, 0)
	local var34 = useTokensModule()
	local var35 = useOptionSelectorGroupItemVariantsModule(var34, var28, var29, var31, if flagsModule.FoundationOptionSelectorGroupBeta then var27 else nil)
	local color3 = var35.content.Color3
	local var36 = if var35.supportingContent then var35.supportingContent.Color3 else color3
	local var37 = if flagsModule.FoundationOptionSelectorGroupBeta then var35.container.stroke elseif var27 then var34.Color.System.Contrast else var34.Color.Stroke.Emphasis
	local var38 = useOptionSelectorGroupItemMotionStatesModule(0, constantsModule.DISABLED_TRANSPARENCY)
	local var39, var40 = useMotion(var38.Default)
	local var41, _ = useMotion(var38.Default)
	reactModule.useEffect(function() --[[ line: 231 ]]
		-- upvalues: var25 (ref), var40 (ref), var38 (ref)
		if var25.isDisabled then
			var40(var38.Disabled)
			
			return
		end
		var40(var38.Default)
	end, { var25.isDisabled })
	local var42 = reactModule.useCallback(function() --[[ line: 240 ]]
		-- upvalues: var26 (ref), var25 (ref)
		var26.onValueChanged(if var26.value == var25.value then nil else var25.value)
	end, {
		var25.isDisabled,
		var25.value,
		var26.onValueChanged,
		var26.value
	})
	var25.testId = `{var26.testId}--item-{var25.value}`
	local var43 = reactModule.useMemo(function() --[[ line: 250 ]]
		-- upvalues: var35 (ref), var34 (ref)
		return {
			radius = UDim.new(0, var35.container.radius),
			offset = var34.Size.Size_200,
			borderWidth = var34.Stroke.Thicker
		}
	end, { var34, var35.container.radius })
	
	if flagsModule.FoundationOptionSelectorGroupBeta then
		local t_1 = {
			Icon = renderIcon({
				layoutOrder = 1,
				icon = var25.icon,
				iconExtent = var35.icon.extent,
				iconSize = var35.icon.size,
				contentColor = color3,
				transparency = var39.transparency,
				testId = var25.testId
			}),
			Text = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = var35.textContainer.tag,
				testId = `{var25.testId}--body`
			}, {
				Label = reactModule.createElement(textModule, {
					TextWrapped = true,
					RichText = true,
					LayoutOrder = 1,
					Text = escapeRichTextModule(var25.label or var25.value),
					TextXAlignment = Enum.TextXAlignment.Left,
					tag = var35.label.tag,
					textStyle = getTextStyle(var41.textTransparency, var39.transparency, color3),
					testId = `{var25.testId}--label`
				}),
				Metadata = if var25.metadata then reactModule.createElement(textModule, {
					TextWrapped = true,
					RichText = true,
					LayoutOrder = 2,
					Text = escapeRichTextModule(var25.metadata),
					TextTruncate = Enum.TextTruncate.None,
					TextXAlignment = Enum.TextXAlignment.Left,
					tag = var35.metadata.tag,
					textStyle = getTextStyle(var41.textTransparency, var39.transparency, var36),
					testId = `{var25.testId}--metadata`
				}) else nil,
				Description = if var25.description then reactModule.createElement(textModule, {
					TextWrapped = true,
					RichText = true,
					LayoutOrder = 3,
					Text = escapeRichTextModule(var25.description),
					TextXAlignment = Enum.TextXAlignment.Left,
					tag = var35.description.tag,
					textStyle = getTextStyle(var41.textTransparency, var39.transparency, var36),
					testId = `{var25.testId}--description`
				}) else nil
			})
		}
		local createElement = reactModule.createElement
		local var45 = viewModule
		local t_2 = {}
		local t_3 = { Color = var37.Color3 }
		local transparency = var37.Transparency
		t_3.Transparency = var39.transparency:map(function(p12) --[[ line: 53 ]]
			-- upvalues: transparency (ref)
			return if transparency == nil then p12 else transparency + (1 - transparency) * p12
		end)
		t_2.stroke = t_3
		t_2.Size = var33
		t_2.padding = var35.container.padding
		t_2.selection = {
			Selectable = if var25.isDisabled then false else var26.Selectable
		}
		t_2.cursor = var43
		t_2.onActivated = var42
		t_2.isDisabled = var25.isDisabled
		t_2.tag = var35.container.tag
		t_2.ref = p11
		
		return createElement(var45, withCommonPropsModule(var25, t_2), {
			ItemInner = reactModule.createElement(viewModule, {
				tag = var35.itemInner.tag,
				Size = var33,
				testId = `{var25.testId}--content`
			}, t_1)
		})
	end
	local var48 = reactModule.createElement(textModule, {
		TextWrapped = true,
		RichText = true,
		LayoutOrder = 2,
		Text = escapeRichTextModule(var25.label or var25.value),
		TextXAlignment = Enum.TextXAlignment.Left,
		tag = var35.label.tag,
		textStyle = getTextStyle(var41.textTransparency, var39.transparency, color3),
		testId = `{var25.testId}--label`
	})
	local createElement = reactModule.createElement
	local t_1 = {}
	local t_2 = { Color = var37.Color3 }
	local transparency = var37.Transparency
	t_2.Transparency = var39.transparency:map(function(p13) --[[ line: 53 ]]
		-- upvalues: transparency (ref)
		return if transparency == nil then p13 else transparency + (1 - transparency) * p13
	end)
	t_1.stroke = t_2
	t_1.Size = var33
	t_1.selection = {
		Selectable = if var25.isDisabled then false else var26.Selectable
	}
	t_1.cursor = var43
	t_1.onActivated = var42
	t_1.isDisabled = var25.isDisabled
	t_1.tag = if flagsModule.FoundationOptionSelectorGroupFixes then var35.container.tag else {
		["auto-xy"] = var31 ~= fillBehaviorModule.Fill,
		["fill auto-y"] = var31 == fillBehaviorModule.Fill,
		[var35.container.tag] = true
	}
	t_1.ref = p11
	
	return createElement(viewModule, withCommonPropsModule(var25, t_1), {
		ItemInner = reactModule.createElement(viewModule, { tag = var35.itemInner.tag, Size = var33 }, {
			Header = reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = if flagsModule.FoundationOptionSelectorGroupFixes then var35.header.tag else "row align-y-center gap-small size-full-0 auto-y"
			}, {
				Icon = if var25.icon then reactModule.createElement(iconModule, {
					LayoutOrder = 0,
					name = var25.icon,
					size = var35.icon.size,
					style = var39.transparency:map(function(p14) --[[ line: 397 ]]
						-- upvalues: color3 (ref)
						return { Color3 = color3, Transparency = p14 }
					end),
					testId = `{var25.testId}--icon`
				}) else nil,
				Label = if var29 == orientationModule.Horizontal then var48 elseif flagsModule.FoundationOptionSelectorGroupFixes and var32 then nil else reactModule.createElement(viewModule, { tag = "grow" }),
				LeadingSpacer = if flagsModule.FoundationOptionSelectorGroupFixes and var32 and not var25.icon then reactModule.createElement(viewModule, { LayoutOrder = 0, Size = UDim2.fromOffset(0, 0) }) else nil,
				Checkmark = reactModule.createElement(iconModule, {
					LayoutOrder = 3,
					name = icon.CheckLarge,
					size = var35.icon.size,
					style = var39.transparency:map(function(p15) --[[ line: 424 ]]
						-- upvalues: color3 (ref), var27 (ref)
						return { Color3 = color3, Transparency = if var27 then p15 else 1 }
					end),
					testId = if var27 then `{var25.testId}--checkmark-selected` else `{var25.testId}--checkmark-unselected`
				})
			}),
			TextContainer = if flagsModule.FoundationOptionSelectorGroupFixes and var32 then reactModule.createElement(viewModule, { LayoutOrder = 2, tag = var35.textContainer.tag }, {
				Label = if var29 == orientationModule.Vertical then var48 else nil,
				Metadata = if var25.metadata then reactModule.createElement(textModule, {
					RichText = true,
					LayoutOrder = 3,
					Text = escapeRichTextModule(var25.metadata),
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left,
					tag = var35.metadata.tag,
					textStyle = getTextStyle(var41.textTransparency, var39.transparency, color3),
					testId = `{var25.testId}--metadata`
				}) else nil,
				Description = if var25.description then reactModule.createElement(textModule, {
					TextWrapped = true,
					RichText = true,
					LayoutOrder = 4,
					Text = escapeRichTextModule(var25.description),
					TextXAlignment = Enum.TextXAlignment.Left,
					tag = var35.description.tag,
					textStyle = getTextStyle(var41.textTransparency, var39.transparency, color3),
					testId = `{var25.testId}--description`
				}) else nil
			}) else nil,
			Label = if flagsModule.FoundationOptionSelectorGroupFixes and var32 then nil elseif var29 == orientationModule.Vertical then var48 else nil,
			Metadata = if flagsModule.FoundationOptionSelectorGroupFixes and var32 then nil elseif var25.metadata then reactModule.createElement(textModule, {
				RichText = true,
				LayoutOrder = 3,
				Text = escapeRichTextModule(var25.metadata),
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				tag = var35.metadata.tag,
				textStyle = getTextStyle(var41.textTransparency, var39.transparency, color3),
				testId = `{var25.testId}--metadata`
			}) else nil,
			Description = if flagsModule.FoundationOptionSelectorGroupFixes and var32 then nil elseif var25.description then reactModule.createElement(textModule, {
				TextWrapped = true,
				RichText = true,
				LayoutOrder = 4,
				Text = escapeRichTextModule(var25.description),
				TextXAlignment = Enum.TextXAlignment.Left,
				tag = var35.description.tag,
				textStyle = getTextStyle(var41.textTransparency, var39.transparency, color3),
				testId = `{var25.testId}--description`
			}) else nil
		})
	})
end))