local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local alertActionsModule = require(foundation.Components.AlertActions)
local alertConstantsModule = require(foundation.Components.AlertActions.AlertConstants)
local _ = require(foundation.Enums.AlertSeverity)
local alertVariantModule = require(foundation.Enums.AlertVariant)
local breakpointModule = require(foundation.Enums.Breakpoint)
local builderIconsModule = require(parent.BuilderIcons)
local _ = require(foundation.Enums.ButtonVariant)
local closeAffordanceModule = require(foundation.Components.CloseAffordance)
local closeAffordanceVariantModule = require(foundation.Enums.CloseAffordanceVariant)
local iconModule = require(foundation.Components.Icon)
local iconSizeModule = require(foundation.Enums.IconSize)
local iconVariant = builderIconsModule.IconVariant
local inputSizeModule = require(foundation.Enums.InputSize)
local presentationContextModule = require(foundation.Providers.Style.PresentationContext)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useBreakpointModule = require(foundation.Providers.Responsive.Hooks.useBreakpoint)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useSystemBannerVariantsModule = require(script.Parent.useSystemBannerVariants)
local SEVERITY_TO_ICON = alertConstantsModule.SEVERITY_TO_ICON
local t = {
	testId = "--foundation-system-banner",
	variant = alertVariantModule.Standard
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 56 | named "SystemBanner" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useSystemBannerVariantsModule (ref), reactModule (ref), reactUtilsModule (ref), useBreakpointModule (ref), breakpointModule (ref), alertActionsModule (ref), viewModule (ref), withCommonPropsModule (ref), presentationContextModule (ref), iconModule (ref), SEVERITY_TO_ICON (ref), iconSizeModule (ref), iconVariant (ref), textModule (ref), closeAffordanceModule (ref), inputSizeModule (ref), closeAffordanceVariantModule (ref)
	local var22 = withDefaultsModule(p0, t)
	local var23 = useTokensModule()
	local var24 = useSystemBannerVariantsModule(var23, var22.variant, var22.severity)
	local var25, var26 = reactModule.useState(nil)
	local var27 = reactUtilsModule.useComposedRef(p1, var26)
	local var28 = useBreakpointModule(var25) == breakpointModule.XSmall
	local var29 = reactModule.useMemo(function() --[[ line: 68 ]]
		-- upvalues: reactModule (copy), alertActionsModule (copy), var22 (ref), var28 (ref), var23 (ref)
		return reactModule.createElement(alertActionsModule, {
			LayoutOrder = 3,
			actions = var22.actions,
			testId = `{var22.testId}--actions`,
			tag = {
				["row gap-small auto-xy"] = true,
				["align-x-left"] = var28,
				["align-x-right"] = not var28
			},
			padding = if var28 then { top = UDim.new(0, var23.Gap.Small) } else nil
		})
	end, { var22.actions, var22.testId, var28, var23.Gap.Small })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var22, {
		tag = {
			[var24.container.tag] = true,
			["align-y-center"] = if var22.title ~= "" then var22.description == nil else true,
			["align-y-top"] = var22.title ~= "" and var22.description ~= nil
		},
		ref = var27
	}), reactModule.createElement(presentationContextModule.Provider, {
		value = { colorNamespace = var24.container.colorNamespace }
	}, {
		Icon = reactModule.createElement(iconModule, {
			LayoutOrder = 1,
			name = SEVERITY_TO_ICON[var22.severity],
			size = iconSizeModule.Large,
			variant = iconVariant.Filled,
			style = var24.icon.style,
			testId = `{var22.testId}--icon`
		}),
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = { ["fill auto-xy"] = true, col = var28, row = not var28 },
			testId = `{var22.testId}--content`
		}, {
			Text = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = "col auto-xy" }, {
				Title = if var22.title ~= "" then nil else reactModule.createElement(textModule, {
					LayoutOrder = 1,
					Text = var22.title,
					textStyle = var24.title.style,
					tag = var24.title.tag,
					testId = `{var22.testId}--title`
				}),
				Description = if var22.description then reactModule.createElement(textModule, {
					LayoutOrder = 2,
					Text = var22.description,
					textStyle = var24.description.style,
					tag = var24.description.tag,
					testId = `{var22.testId}--description`
				}) else nil,
				Actions = if var28 then var29 else nil
			})
		}),
		Actions = if not var28 then var29 else nil,
		Close = if var22.onClose ~= nil then nil else reactModule.createElement(closeAffordanceModule, {
			LayoutOrder = 4,
			onActivated = var22.onClose,
			size = inputSizeModule.Small,
			variant = closeAffordanceVariantModule.Utility,
			testId = `{var22.testId}--close`
		})
	}))
end))