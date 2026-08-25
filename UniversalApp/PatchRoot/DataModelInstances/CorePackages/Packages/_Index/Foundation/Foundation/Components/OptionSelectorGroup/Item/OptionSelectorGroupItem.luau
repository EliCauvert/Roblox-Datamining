local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
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

local function _(p1, p2)
	return p2:map(function(p1)
		-- upvalues: p1 (ref)
		return if p1 == nil then p1 else p1 + (1 - p1) * p1
	end)
end

local function getTextStyle(p1, p2, p3)
	-- upvalues: reactModule (ref)
	return reactModule.joinBindings({ p1, p2 }):map(function(p1)
		-- upvalues: p3 (ref)
		return { Color3 = p3, Transparency = p1[2] }
	end)
end

local function renderIcon(p1)
	-- upvalues: flagsModule (ref), isBuilderOrMigratedIcon (ref), reactModule (ref), imageModule (ref), normalizeIconName (ref), iconModule (ref)
	if not p1.icon then
		return nil
	elseif flagsModule.FoundationOptionSelectorGroupBeta and not isBuilderOrMigratedIcon(p1.icon) then
		local iconExtent = p1.iconExtent
		
		return reactModule.createElement(imageModule, {
			Image = p1.icon,
			Size = UDim2.fromOffset(iconExtent, iconExtent),
			imageStyle = p1.transparency:map(function(p1)
				-- upvalues: p1 (ref)
				return { Color3 = p1.contentColor, Transparency = p1 }
			end),
			LayoutOrder = p1.layoutOrder,
			testId = `{p1.testId}--icon`
		})
	end
	local var1 = normalizeIconName(p1.icon)
	local t = {
		name = var1.name,
		size = p1.iconSize,
		style = p1.transparency:map(function(p1)
			-- upvalues: p1 (ref)
			return { Color3 = p1.contentColor, Transparency = p1 }
		end),
		LayoutOrder = p1.layoutOrder,
		testId = `{p1.testId}--icon`
	}
	
	if var1.variant then
		t.variant = var1.variant
	end
	return reactModule.createElement(iconModule, t)
end

local t = {
	isDisabled = false,
	size = inputSizeModule.Medium,
	width = UDim.new(0, 0)
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useOptionSelectorGroupModule (ref), flagsModule (ref), inputSizeModule (ref), optionSelectorGroupSizeModule (ref), orientationModule (ref), fillBehaviorModule (ref), useTokensModule (ref), useOptionSelectorGroupItemVariantsModule (ref), useOptionSelectorGroupItemMotionStatesModule (ref), constantsModule (ref), useMotion (ref), reactModule (ref), renderIcon (ref), viewModule (ref), textModule (ref), escapeRichTextModule (ref), getTextStyle (ref), withCommonPropsModule (ref), iconModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useOptionSelectorGroupModule()
	local var3 = var2.value == var1.value
	local var4 = if flagsModule.FoundationOptionSelectorGroupBeta then if var2.size ~= nil then if var1.size == inputSizeModule.Large then optionSelectorGroupSizeModule.Medium else var1.size else var2.size else var1.size
	local var5 = if var2.orientation == orientationModule.Vertical then orientationModule.Horizontal else orientationModule.Vertical
	local var6 = if flagsModule.FoundationOptionSelectorGroupBeta then if var2.fillBehavior ~= nil then var1.fillBehavior else var2.fillBehavior else var1.fillBehavior
	local _ = nil
	local var7 = if flagsModule.FoundationOptionSelectorGroupBeta or flagsModule.FoundationOptionSelectorGroupFixes then if var5 == orientationModule.Horizontal then fillBehaviorModule.Fill else var6 or fillBehaviorModule.Fit elseif var5 == orientationModule.Horizontal then fillBehaviorModule.Fit else var6 or fillBehaviorModule.Fill
	local var8 = var5 == orientationModule.Vertical and var7 == fillBehaviorModule.Fit
	local var9 = if flagsModule.FoundationOptionSelectorGroupBeta or flagsModule.FoundationOptionSelectorGroupFixes then if var8 then nil else UDim2.fromScale(1, 0) else UDim2.fromScale(1, 0)
	local var10 = useTokensModule()
	local var11 = useOptionSelectorGroupItemVariantsModule(var10, var4, var5, var7, if flagsModule.FoundationOptionSelectorGroupBeta then var3 else nil)
	local color3 = var11.content.Color3
	local var12 = if var11.supportingContent then var11.supportingContent.Color3 else color3
	local var13 = if flagsModule.FoundationOptionSelectorGroupBeta then var11.container.stroke elseif var3 then var10.Color.System.Contrast else var10.Color.Stroke.Emphasis
	local var14 = useOptionSelectorGroupItemMotionStatesModule(0, constantsModule.DISABLED_TRANSPARENCY)
	local var15, var16 = useMotion(var14.Default)
	local var17, _ = useMotion(var14.Default)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var16 (ref), var14 (ref)
		if var1.isDisabled then
			var16(var14.Disabled)
			
			return
		end
		var16(var14.Default)
	end, { var1.isDisabled })
	local var18 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var1 (ref)
		var2.onValueChanged(if var2.value == var1.value then nil else var1.value)
	end, {
		var1.isDisabled,
		var1.value,
		var2.onValueChanged,
		var2.value
	})
	var1.testId = `{var2.testId}--item-{var25.value}`
	local var1 = reactModule.useMemo(function()
		-- upvalues: var11 (ref), var10 (ref)
		return {
			radius = UDim.new(0, var11.container.radius),
			offset = var10.Size.Size_200,
			borderWidth = var10.Stroke.Thicker
		}
	end, { var10, var11.container.radius })
	
	if flagsModule.FoundationOptionSelectorGroupBeta then
		local t_1 = {
			Icon = renderIcon({
				layoutOrder = 1,
				icon = var1.icon,
				iconExtent = var11.icon.extent,
				iconSize = var11.icon.size,
				contentColor = color3,
				transparency = var15.transparency,
				testId = var1.testId
			}),
			Text = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = var11.textContainer.tag,
				testId = `{var1.testId}--body`
			}, {
				Label = reactModule.createElement(textModule, {
					TextWrapped = true,
					RichText = true,
					LayoutOrder = 1,
					Text = escapeRichTextModule(var1.label or var1.value),
					TextXAlignment = Enum.TextXAlignment.Left,
					tag = var11.label.tag,
					textStyle = getTextStyle(var17.textTransparency, var15.transparency, color3),
					testId = `{var1.testId}--label`
				}),
				Metadata = if var1.metadata then reactModule.createElement(textModule, {
					TextWrapped = true,
					RichText = true,
					LayoutOrder = 2,
					Text = escapeRichTextModule(var1.metadata),
					TextTruncate = Enum.TextTruncate.None,
					TextXAlignment = Enum.TextXAlignment.Left,
					tag = var11.metadata.tag,
					textStyle = getTextStyle(var17.textTransparency, var15.transparency, var12),
					testId = `{var1.testId}--metadata`
				}) else nil,
				Description = if var1.description then reactModule.createElement(textModule, {
					TextWrapped = true,
					RichText = true,
					LayoutOrder = 3,
					Text = escapeRichTextModule(var1.description),
					TextXAlignment = Enum.TextXAlignment.Left,
					tag = var11.description.tag,
					textStyle = getTextStyle(var17.textTransparency, var15.transparency, var12),
					testId = `{var1.testId}--description`
				}) else nil
			})
		}
		local createElement = reactModule.createElement
		local var2 = viewModule
		local t_2 = {}
		local t_3 = { Color = var13.Color3 }
		local transparency = var13.Transparency
		t_3.Transparency = var15.transparency:map(function(p1)
			-- upvalues: transparency (ref)
			return if transparency == nil then p1 else transparency + (1 - transparency) * p1
		end)
		t_2.stroke = t_3
		t_2.Size = var9
		t_2.padding = var11.container.padding
		t_2.selection = {
			Selectable = if var1.isDisabled then false else var2.Selectable
		}
		t_2.cursor = var1
		t_2.onActivated = var18
		t_2.isDisabled = var1.isDisabled
		t_2.tag = var11.container.tag
		t_2.ref = p2
		
		return createElement(var2, withCommonPropsModule(var1, t_2), {
			ItemInner = reactModule.createElement(viewModule, {
				tag = var11.itemInner.tag,
				Size = var9,
				testId = `{var1.testId}--content`
			}, t_1)
		})
	end
	local var1 = reactModule.createElement(textModule, {
		TextWrapped = true,
		RichText = true,
		LayoutOrder = 2,
		Text = escapeRichTextModule(var1.label or var1.value),
		TextXAlignment = Enum.TextXAlignment.Left,
		tag = var11.label.tag,
		textStyle = getTextStyle(var17.textTransparency, var15.transparency, color3),
		testId = `{var1.testId}--label`
	})
	local createElement = reactModule.createElement
	local t_1 = {}
	local t_2 = { Color = var13.Color3 }
	local transparency = var13.Transparency
	t_2.Transparency = var15.transparency:map(function(p1)
		-- upvalues: transparency (ref)
		return if transparency == nil then p1 else transparency + (1 - transparency) * p1
	end)
	t_1.stroke = t_2
	t_1.Size = var9
	t_1.selection = {
		Selectable = if var1.isDisabled then false else var2.Selectable
	}
	t_1.cursor = var1
	t_1.onActivated = var18
	t_1.isDisabled = var1.isDisabled
	t_1.tag = if flagsModule.FoundationOptionSelectorGroupFixes then var11.container.tag else {
		["auto-xy"] = var7 ~= fillBehaviorModule.Fill,
		["fill auto-y"] = var7 == fillBehaviorModule.Fill,
		[var11.container.tag] = true
	}
	t_1.ref = p2
	
	return createElement(viewModule, withCommonPropsModule(var1, t_1), {
		ItemInner = reactModule.createElement(viewModule, { tag = var11.itemInner.tag, Size = var9 }, {
			Header = reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = if flagsModule.FoundationOptionSelectorGroupFixes then var11.header.tag else "row align-y-center gap-small size-full-0 auto-y"
			}, {
				Icon = if var1.icon then reactModule.createElement(iconModule, {
					LayoutOrder = 0,
					name = var1.icon,
					size = var11.icon.size,
					style = var15.transparency:map(function(p1)
						-- upvalues: color3 (ref)
						return { Color3 = color3, Transparency = p1 }
					end),
					testId = `{var1.testId}--icon`
				}) else nil,
				Label = if var5 == orientationModule.Horizontal then var1 elseif flagsModule.FoundationOptionSelectorGroupFixes and var8 then nil else reactModule.createElement(viewModule, { tag = "grow" }),
				LeadingSpacer = if flagsModule.FoundationOptionSelectorGroupFixes and var8 and not var1.icon then reactModule.createElement(viewModule, { LayoutOrder = 0, Size = UDim2.fromOffset(0, 0) }) else nil,
				Checkmark = reactModule.createElement(iconModule, {
					name = "check-large",
					LayoutOrder = 3,
					size = var11.icon.size,
					style = var15.transparency:map(function(p1)
						-- upvalues: color3 (ref), var3 (ref)
						return { Color3 = color3, Transparency = if var3 then p1 else 1 }
					end),
					testId = if var3 then `{var1.testId}--checkmark-selected` else `{var25.testId}--checkmark-unselected`
				})
			}),
			TextContainer = if flagsModule.FoundationOptionSelectorGroupFixes and var8 then reactModule.createElement(viewModule, { LayoutOrder = 2, tag = var11.textContainer.tag }, {
				Label = if var5 == orientationModule.Vertical then var1 else nil,
				Metadata = if var1.metadata then reactModule.createElement(textModule, {
					RichText = true,
					LayoutOrder = 3,
					Text = escapeRichTextModule(var1.metadata),
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left,
					tag = var11.metadata.tag,
					textStyle = getTextStyle(var17.textTransparency, var15.transparency, color3),
					testId = `{var1.testId}--metadata`
				}) else nil,
				Description = if var1.description then reactModule.createElement(textModule, {
					TextWrapped = true,
					RichText = true,
					LayoutOrder = 4,
					Text = escapeRichTextModule(var1.description),
					TextXAlignment = Enum.TextXAlignment.Left,
					tag = var11.description.tag,
					textStyle = getTextStyle(var17.textTransparency, var15.transparency, color3),
					testId = `{var1.testId}--description`
				}) else nil
			}) else nil,
			Label = if flagsModule.FoundationOptionSelectorGroupFixes and var8 then nil elseif var5 == orientationModule.Vertical then var1 else nil,
			Metadata = if flagsModule.FoundationOptionSelectorGroupFixes and var8 then nil elseif var1.metadata then reactModule.createElement(textModule, {
				RichText = true,
				LayoutOrder = 3,
				Text = escapeRichTextModule(var1.metadata),
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				tag = var11.metadata.tag,
				textStyle = getTextStyle(var17.textTransparency, var15.transparency, color3),
				testId = `{var1.testId}--metadata`
			}) else nil,
			Description = if flagsModule.FoundationOptionSelectorGroupFixes and var8 then nil elseif var1.description then reactModule.createElement(textModule, {
				TextWrapped = true,
				RichText = true,
				LayoutOrder = 4,
				Text = escapeRichTextModule(var1.description),
				TextXAlignment = Enum.TextXAlignment.Left,
				tag = var11.description.tag,
				textStyle = getTextStyle(var17.textTransparency, var15.transparency, color3),
				testId = `{var1.testId}--description`
			}) else nil
		})
	})
end))