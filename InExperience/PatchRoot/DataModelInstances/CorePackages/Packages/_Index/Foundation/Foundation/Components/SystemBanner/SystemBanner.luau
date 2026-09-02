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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useSystemBannerVariantsModule (ref), reactModule (ref), reactUtilsModule (ref), useBreakpointModule (ref), breakpointModule (ref), alertActionsModule (ref), flagsModule (ref), viewModule (ref), withCommonPropsModule (ref), presentationContextModule (ref), iconModule (ref), SEVERITY_TO_ICON (ref), iconSizeModule (ref), iconVariant (ref), textModule (ref), closeAffordanceModule (ref), inputSizeModule (ref), closeAffordanceVariantModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3 = useSystemBannerVariantsModule(var2, var1.variant, var1.severity)
	local var4, var5 = reactModule.useState(nil)
	local var6 = reactUtilsModule.useComposedRef(p2, var5)
	local var7 = useBreakpointModule(var4) == breakpointModule.XSmall
	local var8 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), alertActionsModule (copy), var1 (ref), var7 (ref), var2 (ref)
		return reactModule.createElement(alertActionsModule, {
			LayoutOrder = 3,
			actions = var1.actions,
			testId = `{var1.testId}--actions`,
			tag = {
				["row gap-small auto-xy"] = true,
				["align-x-left"] = var7,
				["align-x-right"] = not var7
			},
			padding = if var7 then { top = UDim.new(0, var2.Gap.Small) } else nil
		})
	end, { var1.actions, var1.testId, var7, var2.Gap.Small })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = {
			[var3.container.tag] = true,
			["align-y-center"] = if var1.title ~= "" then var1.description == nil else true,
			["align-y-top"] = var1.title ~= "" and var1.description ~= nil
		},
		ref = var6
	}), reactModule.createElement(presentationContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
			-- upvalues: var3 (ref)
			return { colorNamespace = var3.container.colorNamespace }
		end, { var3.container.colorNamespace }) else nil else { colorNamespace = var3.container.colorNamespace }
	}, {
		Icon = reactModule.createElement(iconModule, {
			LayoutOrder = 1,
			name = SEVERITY_TO_ICON[var1.severity],
			size = iconSizeModule.Large,
			variant = iconVariant.Filled,
			style = var3.icon.style,
			testId = `{var1.testId}--icon`
		}),
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = { ["fill auto-xy"] = true, col = var7, row = not var7 },
			testId = `{var1.testId}--content`
		}, {
			Text = reactModule.createElement(viewModule, { LayoutOrder = 2, tag = "col auto-xy" }, {
				Title = if var1.title ~= "" then nil else reactModule.createElement(textModule, {
					LayoutOrder = 1,
					Text = var1.title,
					textStyle = var3.title.style,
					tag = var3.title.tag,
					testId = `{var1.testId}--title`
				}),
				Description = if var1.description then reactModule.createElement(textModule, {
					LayoutOrder = 2,
					Text = var1.description,
					textStyle = var3.description.style,
					tag = var3.description.tag,
					testId = `{var1.testId}--description`
				}) else nil,
				Actions = if var7 then var8 else nil
			})
		}),
		Actions = if not var7 then var8 else nil,
		Close = if var1.onClose ~= nil then nil else reactModule.createElement(closeAffordanceModule, {
			LayoutOrder = 4,
			onActivated = var1.onClose,
			size = inputSizeModule.Small,
			variant = closeAffordanceVariantModule.Utility,
			testId = `{var1.testId}--close`
		})
	}))
end))