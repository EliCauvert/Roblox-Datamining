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
local flagsModule = require(foundation.Utility.Flags)
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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 57 | named "SystemBanner" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useSystemBannerVariantsModule (ref), reactModule (ref), reactUtilsModule (ref), useBreakpointModule (ref), breakpointModule (ref), alertActionsModule (ref), flagsModule (ref), viewModule (ref), withCommonPropsModule (ref), presentationContextModule (ref), iconModule (ref), SEVERITY_TO_ICON (ref), iconSizeModule (ref), iconVariant (ref), textModule (ref), closeAffordanceModule (ref), inputSizeModule (ref), closeAffordanceVariantModule (ref)
	local var23 = withDefaultsModule(p0, t)
	local var24 = useTokensModule()
	local var25 = useSystemBannerVariantsModule(var24, var23.variant, var23.severity)
	local var26, var27 = reactModule.useState(nil)
	local var28 = reactUtilsModule.useComposedRef(p1, var27)
	local var29 = useBreakpointModule(var26) == breakpointModule.XSmall
	local var30 = reactModule.useMemo(function() --[[ line: 69 ]]
		-- upvalues: reactModule (copy), alertActionsModule (copy), var23 (ref), var29 (ref), var24 (ref)
		return reactModule.createElement(alertActionsModule, {
			LayoutOrder = 3,
			actions = var23.actions,
			testId = `{var23.testId}--actions`,
			tag = {
				["row gap-small auto-xy"] = true,
				["align-x-left"] = var29,
				["align-x-right"] = not var29
			},
			padding = if var29 then { top = UDim.new(0, var24.Gap.Small) } else nil
		})
	end, { var23.actions, var23.testId, var29, var24.Gap.Small })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var23, {
		tag = {
			[var25.container.tag] = true,
			["align-y-center"] = if var23.title ~= "" then var23.description == nil else true,
			["align-y-top"] = var23.title ~= "" and var23.description ~= nil
		},
		ref = var28
	}), reactModule.createElement(presentationContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function() --[[ line: 84 ]]
			-- upvalues: var25 (ref)
			return { colorNamespace = var25.container.colorNamespace }
		end, { var25.container.colorNamespace }) else nil else { colorNamespace = var25.container.colorNamespace }
	}, {
		Icon = reactModule.createElement(iconModule, {
			LayoutOrder = 1,
			name = SEVERITY_TO_ICON[var23.severity],
			size = iconSizeModule.Large,
			variant = iconVariant.Filled,
			style = var25.icon.style,
			testId = `{var23.testId}--icon`
		}),
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = { ["fill auto-xy"] = true, col = var29, row = not var29 },
			testId = `{var23.testId}--content`
		}, {
			Text = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = "col auto-xy" }, {
				Title = if var23.title ~= "" then nil else reactModule.createElement(textModule, {
					LayoutOrder = 1,
					Text = var23.title,
					textStyle = var25.title.style,
					tag = var25.title.tag,
					testId = `{var23.testId}--title`
				}),
				Description = if var23.description then reactModule.createElement(textModule, {
					LayoutOrder = 2,
					Text = var23.description,
					textStyle = var25.description.style,
					tag = var25.description.tag,
					testId = `{var23.testId}--description`
				}) else nil,
				Actions = if var29 then var30 else nil
			})
		}),
		Actions = if not var29 then var30 else nil,
		Close = if var23.onClose ~= nil then nil else reactModule.createElement(closeAffordanceModule, {
			LayoutOrder = 4,
			onActivated = var23.onClose,
			size = inputSizeModule.Small,
			variant = closeAffordanceVariantModule.Utility,
			testId = `{var23.testId}--close`
		})
	}))
end))