local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local alertConstantsModule = require(foundation.Components.AlertActions.AlertConstants)
local alertSeverityModule = require(foundation.Enums.AlertSeverity)
local alertVariantModule = require(foundation.Enums.AlertVariant)
local breakpointModule = require(foundation.Enums.Breakpoint)
local breakpointConfigModule = require(foundation.Utility.Responsive.BreakpointConfig)
local buttonGroupModule = require(foundation.Components.ButtonGroup)
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local closeAffordanceModule = require(foundation.Components.CloseAffordance)
local closeAffordanceVariantModule = require(foundation.Enums.CloseAffordanceVariant)
local flagsModule = require(foundation.Utility.Flags)
local iconModule = require(foundation.Components.Icon)
local iconSizeModule = require(foundation.Enums.IconSize)
local inputSizeModule = require(foundation.Enums.InputSize)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local escapeRichTextModule = require(foundation.Utility.escapeRichText)
local isBuilderIconModule = require(foundation.Utility.isBuilderIcon)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useAlertVariantsModule = require(script.Parent.useAlertVariants)
local iconVariant = builderIconsModule.IconVariant
local t = {
	testId = "--foundation-alert",
	variant = alertVariantModule.Feedback,
	severity = alertSeverityModule.Info
}
local t_1 = {
	[alertVariantModule.Standard] = alertVariantModule.Feedback,
	[alertVariantModule.Emphasis] = alertVariantModule.Feedback
}
local xSmall = breakpointConfigModule.widths[breakpointModule.XSmall]

local function _(p1, p2)
	return if p1 then p1.text elseif p2 then `{p2.primary.text}|{if p2.secondary then p2.secondary.text else ""}` else ""
end

local function WrappingRichText(p3)
	-- upvalues: reactModule (ref), textModule (ref), viewModule (ref)
	local var1, var2 = reactModule.useState(0)
	local alertWidth = p3.alertWidth
	
	return reactModule.createElement(viewModule, {
		tag = p3.slot.tag,
		LayoutOrder = p3.LayoutOrder,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p4)
			-- upvalues: alertWidth (ref), var2 (ref)
			local x = p4.AbsoluteSize.X
			
			if alertWidth <= 0 or x <= alertWidth then
				var2(x)
			end
		end, { alertWidth })
	}, {
		[`Label-{math.floor(var1)}`] = reactModule.createElement(textModule, {
			RichText = true,
			Text = p3.text,
			tag = { ["size-full-0"] = true, [p3.slot.tag] = true },
			padding = p3.slot.padding,
			sizeConstraint = if var1 > 0 then { MaxSize = Vector2.new(var1, 1e999) } else nil,
			stateLayer = p3.stateLayer,
			onActivated = p3.onActivated,
			testId = p3.testId
		})
	})
end

return reactModule.memo(reactModule.forwardRef(function(p3, p4)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), t_1 (ref), reactModule (ref), xSmall (ref), flagsModule (ref), useAlertVariantsModule (ref), buttonVariantModule (ref), alertConstantsModule (ref), iconVariant (ref), alertSeverityModule (ref), isBuilderIconModule (ref), iconModule (ref), iconSizeModule (ref), viewModule (ref), WrappingRichText (ref), textModule (ref), escapeRichTextModule (ref), stateLayerAffordanceModule (ref), buttonGroupModule (ref), inputSizeModule (ref), closeAffordanceModule (ref), closeAffordanceVariantModule (ref), withCommonPropsModule (ref), alertVariantModule (ref)
	local var1
	local var2 = withDefaultsModule(p3, t)
	local var3 = useTokensModule()
	local variant = t_1[var2.variant] or var2.variant
	local var4, var5 = reactModule.useState(Vector2.zero)
	local var6 = reactModule.useCallback(function(p5)
		-- upvalues: var5 (ref), var2 (ref)
		var5(p5.AbsoluteSize)
		
		if var2.onAbsoluteSizeChanged then
			var2.onAbsoluteSizeChanged(p5)
		end
	end, { var2.onAbsoluteSizeChanged })
	local var7, var8 = reactModule.useState(0)
	local var9 = reactModule.useCallback(function(p5)
		-- upvalues: var8 (ref)
		var8(p5.AbsoluteSize.X)
	end, {})
	local link = var2.link
	local actions = var2.actions
	local var10 = if link then link.text elseif actions then `{actions.primary.text}|{if actions.secondary then actions.secondary.text else ""}` else ""
	local var11 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var8 (ref)
		if var11.current then
			var8(0)
		end
		var11.current = true
	end, { var10 })
	local var12 = var4.X > 0 and var4.X <= xSmall
	local var13 = var4.X * (if flagsModule.FoundationAlertStackTrailingOnOverflow then 0.3 else 0.4)
	
	if flagsModule.FoundationAlertStackTrailingOnOverflow then
		var1 = var12
		
		if not var1 then
			var1 = false
			
			if var13 > 0 then
				var1 = var13 < var7
				var1 = nil
			end
		end
	else
		var1 = var12 or (var2.actions ~= nil and (var13 > 0 and var13 < var7))
	end
	local var14 = useAlertVariantsModule(var3, var2.severity, variant, var1)
	local var15 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), buttonVariantModule (copy)
		if not var2.actions then
			return nil
		end
		local list = {
			{
				text = var2.actions.primary.text,
				onActivated = var2.actions.primary.onActivated,
				variant = buttonVariantModule.Standard
			}
		}
		
		if var2.actions.secondary then
			table.insert(list, {
				text = var2.actions.secondary.text,
				onActivated = var2.actions.secondary.onActivated,
				variant = buttonVariantModule.Utility
			})
		end
		return list
	end, { var2.actions })
	local severity = alertConstantsModule.SEVERITY_TO_ICON[var2.severity]
	local filled = iconVariant.Filled
	local iconBackplate = var14.iconBackplate
	local icon = var2.icon
	
	if icon ~= nil and var2.severity == alertSeverityModule.Info then
		local var16 = if typeof(icon) == "string" then icon else icon.name
		
		if isBuilderIconModule(var16) then
			severity = var16
			filled = if typeof(icon) == "table" and icon.variant then icon.variant else iconVariant.Filled
			iconBackplate = nil
		end
	end
	local var17
	local var18 = reactModule.createElement(iconModule, {
		LayoutOrder = 2,
		ZIndex = 2,
		name = severity,
		size = iconSizeModule.Medium,
		variant = filled,
		style = var14.icon.style,
		testId = `{var2.testId}--icon`
	})
	local var19 = reactModule.createElement(viewModule, {
		tag = "align-y-center size-0-800 auto-x",
		LayoutOrder = 1
	}, {
		Content = if iconBackplate then reactModule.createElement(viewModule, { LayoutOrder = 1, Size = var14.iconFrame.Size }, {
			Backplate = reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				ZIndex = 1,
				Size = iconBackplate.Size,
				Position = iconBackplate.Position,
				tag = iconBackplate.tag,
				backgroundStyle = iconBackplate.backgroundStyle,
				testId = `{var2.testId}--icon-backplate`
			}),
			Icon = var18
		}) else var18
	})
	local var20 = if var2.richText then reactModule.createElement(WrappingRichText, {
		LayoutOrder = 2,
		slot = var14.message,
		text = var2.text,
		testId = `{var2.testId}--message`,
		alertWidth = var4.X
	}) else reactModule.createElement(textModule, {
		LayoutOrder = 2,
		Text = var2.text,
		tag = var14.message.tag,
		padding = var14.message.padding,
		testId = `{var2.testId}--message`
	})
	local var21 = if not var1 then var9 else nil
	
	if not var2.link then
		var17 = if var15 then reactModule.createElement(buttonGroupModule, {
			LayoutOrder = 3,
			buttons = var15,
			size = inputSizeModule.Small,
			testId = `{var2.testId}--actions`,
			onAbsoluteSizeChanged = var21
		}) else nil
	elseif var1 and flagsModule.FoundationAlertLinkWrap then
		var17 = reactModule.createElement(WrappingRichText, {
			LayoutOrder = 3,
			slot = var14.link,
			text = `<u>{escapeRichTextModule(var2.link.text)}</u>`,
			testId = `{var2.testId}--link`,
			alertWidth = var4.X,
			onActivated = var2.link.onActivated,
			stateLayer = { affordance = stateLayerAffordanceModule.None }
		})
	else
		var17 = reactModule.createElement
		var17 = var17(textModule, {
			RichText = true,
			LayoutOrder = 3,
			Text = `<u>{escapeRichTextModule(var2.link.text)}</u>`,
			tag = var14.link.tag,
			padding = var14.link.padding,
			sizeConstraint = if flagsModule.FoundationAlertStackTrailingOnOverflow then nil elseif var1 or var13 <= 0 then nil else { MaxSize = Vector2.new(var13, 1e999) },
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			onActivated = var2.link.onActivated,
			testId = `{var2.testId}--link`,
			onAbsoluteSizeChanged = var21
		})
	end
	local var22 = if var2.onClose then reactModule.createElement(closeAffordanceModule, {
		LayoutOrder = 4,
		onActivated = var2.onClose,
		size = inputSizeModule.Small,
		variant = closeAffordanceVariantModule.Utility,
		testId = `{var2.testId}--close`
	}) else nil
	local var23 = if var1 then {
		Icon = var19,
		Stack = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = var14.stack.tag,
			testId = `{var2.testId}--stack`
		}, { Message = var20, Trailing = var17 }),
		Close = var22
	} else {
		Icon = var19,
		Message = var20,
		Trailing = var17,
		Close = var22
	}
	local var24 = withCommonPropsModule(var2, {
		tag = var14.container.tag,
		backgroundStyle = var14.container.backgroundStyle,
		ref = p4
	})
	var24.onAbsoluteSizeChanged = var6
	
	return reactModule.createElement(viewModule, var24, if variant == alertVariantModule.System then {
		TopBorder = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			Size = var14.border.Size,
			backgroundStyle = var14.border.backgroundStyle,
			testId = `{var2.testId}--top-border`
		}),
		Main = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = var14.main.tag }, var23),
		BottomBorder = reactModule.createElement(viewModule, {
			LayoutOrder = 3,
			Size = var14.border.Size,
			backgroundStyle = var14.border.backgroundStyle,
			testId = `{var2.testId}--bottom-border`
		})
	} else var23)
end))