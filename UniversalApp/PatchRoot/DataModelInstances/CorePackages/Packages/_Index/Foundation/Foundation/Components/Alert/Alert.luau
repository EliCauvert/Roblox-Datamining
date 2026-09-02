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
local iconModule = require(foundation.Components.Icon)
local iconSizeModule = require(foundation.Enums.IconSize)
local inputSizeModule = require(foundation.Enums.InputSize)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local escapeRichTextModule = require(foundation.Utility.escapeRichText)
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

return reactModule.memo(reactModule.forwardRef(function(p3, p4)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), t_1 (ref), reactModule (ref), xSmall (ref), useAlertVariantsModule (ref), buttonVariantModule (ref), iconModule (ref), alertConstantsModule (ref), iconSizeModule (ref), iconVariant (ref), viewModule (ref), textModule (ref), escapeRichTextModule (ref), stateLayerAffordanceModule (ref), buttonGroupModule (ref), inputSizeModule (ref), closeAffordanceModule (ref), closeAffordanceVariantModule (ref), withCommonPropsModule (ref), alertVariantModule (ref)
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
	local var12 = var4.X * 0.4
	local var13 = (var4.X > 0 and var4.X <= xSmall) or (var2.actions ~= nil and (var12 > 0 and var12 < var7))
	local var14 = useAlertVariantsModule(var3, var2.severity, variant, var13)
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
	local iconBackplate = var14.iconBackplate
	local var16 = reactModule.createElement(iconModule, {
		LayoutOrder = 2,
		ZIndex = 2,
		name = alertConstantsModule.SEVERITY_TO_ICON[var2.severity],
		size = iconSizeModule.Medium,
		variant = iconVariant.Filled,
		style = var14.icon.style,
		testId = `{var2.testId}--icon`
	})
	local var17 = reactModule.createElement(viewModule, {
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
			Icon = var16
		}) else var16
	})
	local var18 = reactModule.createElement(textModule, {
		LayoutOrder = 2,
		Text = var2.text,
		tag = var14.message.tag,
		padding = var14.message.padding,
		testId = `{var2.testId}--message`
	})
	local var19 = if not var13 then var9 else nil
	
	if var2.link then
		var1 = reactModule.createElement
		var1 = var1(textModule, {
			RichText = true,
			LayoutOrder = 3,
			Text = `<u>{escapeRichTextModule(var2.link.text)}</u>`,
			tag = var14.link.tag,
			padding = var14.link.padding,
			sizeConstraint = if var13 or var12 <= 0 then nil else { MaxSize = Vector2.new(var12, 1e999) },
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			onActivated = var2.link.onActivated,
			testId = `{var2.testId}--link`,
			onAbsoluteSizeChanged = var19
		})
	else
		var1 = if var15 then reactModule.createElement(buttonGroupModule, {
			LayoutOrder = 3,
			buttons = var15,
			size = inputSizeModule.Small,
			testId = `{var2.testId}--actions`,
			onAbsoluteSizeChanged = var19
		}) else nil
	end
	local var20 = if var2.onClose then reactModule.createElement(closeAffordanceModule, {
		LayoutOrder = 4,
		onActivated = var2.onClose,
		size = inputSizeModule.Small,
		variant = closeAffordanceVariantModule.Utility,
		testId = `{var2.testId}--close`
	}) else nil
	local var21 = if var13 then {
		Icon = var17,
		Stack = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = var14.stack.tag,
			testId = `{var2.testId}--stack`
		}, { Message = var18, Trailing = var1 }),
		Close = var20
	} else {
		Icon = var17,
		Message = var18,
		Trailing = var1,
		Close = var20
	}
	local var22 = withCommonPropsModule(var2, {
		tag = var14.container.tag,
		backgroundStyle = var14.container.backgroundStyle,
		ref = p4
	})
	var22.onAbsoluteSizeChanged = var6
	
	return reactModule.createElement(viewModule, var22, if variant == alertVariantModule.System then {
		TopBorder = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			Size = var14.border.Size,
			backgroundStyle = var14.border.backgroundStyle,
			testId = `{var2.testId}--top-border`
		}),
		Main = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = var14.main.tag }, var21),
		BottomBorder = reactModule.createElement(viewModule, {
			LayoutOrder = 3,
			Size = var14.border.Size,
			backgroundStyle = var14.border.backgroundStyle,
			testId = `{var2.testId}--bottom-border`
		})
	} else var21)
end))