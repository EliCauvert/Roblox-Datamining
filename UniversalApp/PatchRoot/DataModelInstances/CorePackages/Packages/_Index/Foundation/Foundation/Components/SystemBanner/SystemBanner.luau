local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local AlertActionsModule = require(Foundation.Components.AlertActions)
local _ = require(Foundation.Enums.AlertSeverity)
local AlertVariantModule = require(Foundation.Enums.AlertVariant)
local BreakpointModule = require(Foundation.Enums.Breakpoint)
local _ = require(Foundation.Enums.ButtonVariant)
local CloseAffordanceModule = require(Foundation.Components.CloseAffordance)
local CloseAffordanceVariantModule = require(Foundation.Enums.CloseAffordanceVariant)
local IconModule = require(Foundation.Components.Icon)
local IconSizeModule = require(Foundation.Enums.IconSize)
local IconVariant = require(Parent.BuilderIcons).IconVariant
local InputSizeModule = require(Foundation.Enums.InputSize)
local PresentationContextModule = require(Foundation.Providers.Style.PresentationContext)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseBreakpointModule = require(Foundation.Providers.Responsive.Hooks.useBreakpoint)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseSystemBannerVariantsModule = require(script.Parent.useSystemBannerVariants)
local SEVERITYTOICON = require(Foundation.Components.AlertActions.AlertConstants).SEVERITY_TO_ICON
local config = {
	testId = "--foundation-system-banner",
	variant = AlertVariantModule.Standard
}
local config1 = {
	[AlertVariantModule.System] = AlertVariantModule.Standard,
	[AlertVariantModule.Feedback] = AlertVariantModule.Standard
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), config1 (copy), UseSystemBannerVariantsModule (copy), ReactModule (copy), ReactUtilsModule (copy), UseBreakpointModule (copy), BreakpointModule (copy), AlertActionsModule (copy), ViewModule (copy), WithCommonPropsModule (copy), PresentationContextModule (copy), IconModule (copy), SEVERITYTOICON (copy), IconSizeModule (copy), IconVariant (copy), TextModule (copy), CloseAffordanceModule (copy), InputSizeModule (copy), CloseAffordanceVariantModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseSystemBannerVariantsModuleResult = UseSystemBannerVariantsModule(UseTokensModuleResult, config1[WithDefaultsModuleResult.variant] or WithDefaultsModuleResult.variant, WithDefaultsModuleResult.severity)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseComposedRefResult = ReactUtilsModule.useComposedRef(p2, UseStateResult2)
	local IsUseBreakpointModuleResultMatch = UseBreakpointModule(UseStateResult) == BreakpointModule.XSmall
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), AlertActionsModule (upval), WithDefaultsModuleResult (copy), IsUseBreakpointModuleResultMatch (copy), UseTokensModuleResult (copy)
		return (ReactModule.createElement(AlertActionsModule, {
			LayoutOrder = 3,
			actions = WithDefaultsModuleResult.actions,
			testId = `{WithDefaultsModuleResult.testId}--actions`,
			tag = {
				["row gap-small auto-xy"] = true,
				["align-x-left"] = IsUseBreakpointModuleResultMatch,
				["align-x-right"] = not IsUseBreakpointModuleResultMatch
			},
			padding = if IsUseBreakpointModuleResultMatch then { top = UDim.new(0, UseTokensModuleResult.Gap.Small) } else nil
		}))
	end, {
		WithDefaultsModuleResult.actions,
		WithDefaultsModuleResult.testId,
		IsUseBreakpointModuleResultMatch,
		UseTokensModuleResult.Gap.Small
	})
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = {
			[UseSystemBannerVariantsModuleResult.container.tag] = true,
			["align-y-center"] = WithDefaultsModuleResult.title == "" or WithDefaultsModuleResult.description == nil,
			["align-y-top"] = WithDefaultsModuleResult.title ~= "" and WithDefaultsModuleResult.description ~= nil
		},
		ref = UseComposedRefResult
	}), ReactModule.createElement(PresentationContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UseSystemBannerVariantsModuleResult (copy)
			return {
				colorNamespace = UseSystemBannerVariantsModuleResult.container.colorNamespace
			}
		end, {
			UseSystemBannerVariantsModuleResult.container.colorNamespace
		})
	}, {
		Icon = ReactModule.createElement(IconModule, {
			LayoutOrder = 1,
			name = SEVERITYTOICON[WithDefaultsModuleResult.severity],
			size = IconSizeModule.Large,
			variant = IconVariant.Filled,
			style = UseSystemBannerVariantsModuleResult.icon.style,
			testId = `{WithDefaultsModuleResult.testId}--icon`
		}),
		Content = ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			tag = {
				["fill auto-xy"] = true,
				col = IsUseBreakpointModuleResultMatch,
				row = not IsUseBreakpointModuleResultMatch
			},
			testId = `{WithDefaultsModuleResult.testId}--content`
		}, {
			Text = ReactModule.createElement(ViewModule, { LayoutOrder = 2, tag = "col auto-xy" }, {
				Title = if WithDefaultsModuleResult.title == "" then nil else ReactModule.createElement(TextModule, {
					LayoutOrder = 1,
					Text = WithDefaultsModuleResult.title,
					textStyle = UseSystemBannerVariantsModuleResult.title.style,
					tag = UseSystemBannerVariantsModuleResult.title.tag,
					testId = `{WithDefaultsModuleResult.testId}--title`
				}),
				Description = if WithDefaultsModuleResult.description then ReactModule.createElement(TextModule, {
					LayoutOrder = 2,
					Text = WithDefaultsModuleResult.description,
					textStyle = UseSystemBannerVariantsModuleResult.description.style,
					tag = UseSystemBannerVariantsModuleResult.description.tag,
					testId = `{WithDefaultsModuleResult.testId}--description`
				}) else nil,
				Actions = if IsUseBreakpointModuleResultMatch then UseMemoResult else nil
			})
		}),
		Actions = if IsUseBreakpointModuleResultMatch then nil else UseMemoResult,
		Close = if WithDefaultsModuleResult.onClose == nil then nil else ReactModule.createElement(CloseAffordanceModule, {
			LayoutOrder = 4,
			onActivated = WithDefaultsModuleResult.onClose,
			size = InputSizeModule.Small,
			variant = CloseAffordanceVariantModule.Utility,
			testId = `{WithDefaultsModuleResult.testId}--close`
		})
	}))
end))