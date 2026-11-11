local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local AlertActionsModule = require(Foundation.Components.AlertActions)
local AlertConstantsModule = require(Foundation.Components.AlertActions.AlertConstants)
local _ = require(Foundation.Enums.AlertSeverity)
local CloseAffordanceModule = require(Foundation.Components.CloseAffordance)
local CloseAffordanceVariantModule = require(Foundation.Enums.CloseAffordanceVariant)
local ControlStateModule = require(Foundation.Enums.ControlState)
local IconModule = require(Foundation.Components.Icon)
local IconSizeModule = require(Foundation.Enums.IconSize)
local InputSizeModule = require(Foundation.Enums.InputSize)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local EscapeRichTextModule = require(Foundation.Utility.escapeRichText)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local IconVariant = require(Parent.BuilderIcons).IconVariant
local UseFeedbackAlertVariantsModule = require(script.Parent.useFeedbackAlertVariants)
local config = { testId = "--foundation-feedback-alert" }

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseFeedbackAlertVariantsModule (copy), ReactUtilsModule (copy), EscapeRichTextModule (copy), ReactModule (copy), ControlStateModule (copy), ViewModule (copy), WithCommonPropsModule (copy), IconModule (copy), AlertConstantsModule (copy), IconSizeModule (copy), IconVariant (copy), TextModule (copy), StateLayerAffordanceModule (copy), CloseAffordanceModule (copy), InputSizeModule (copy), CloseAffordanceVariantModule (copy), AlertActionsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseFeedbackAlertVariantsModuleResult = UseFeedbackAlertVariantsModule(UseTokensModule(), WithDefaultsModuleResult.severity)
	local UseComposedRefResult = ReactUtilsModule.useComposedRef(p2)
	local EscapeRichTextModuleResult = if WithDefaultsModuleResult.link then EscapeRichTextModule(WithDefaultsModuleResult.link.text) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function(Hover)
		-- upvalues: UseStateResult2 (copy), ControlStateModule (upval)
		UseStateResult2(Hover == ControlStateModule.Hover)
	end, {})
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseFeedbackAlertVariantsModuleResult.container.tag,
		stroke = UseFeedbackAlertVariantsModuleResult.stroke,
		backgroundStyle = UseFeedbackAlertVariantsModuleResult.backgroundStyle,
		ref = UseComposedRefResult
	}), {
		HeaderRow = ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			tag = UseFeedbackAlertVariantsModuleResult.headerRow.tag,
			testId = `{WithDefaultsModuleResult.testId}--header`
		}, {
			Icon = ReactModule.createElement(IconModule, {
				LayoutOrder = 1,
				name = AlertConstantsModule.SEVERITY_TO_ICON[WithDefaultsModuleResult.severity],
				size = IconSizeModule.Large,
				variant = IconVariant.Filled,
				style = UseFeedbackAlertVariantsModuleResult.icon.style,
				testId = `{WithDefaultsModuleResult.testId}--icon`
			}),
			Content = ReactModule.createElement(ViewModule, {
				LayoutOrder = 2,
				tag = "row align-y-center fill gap-xsmall auto-y",
				testId = `{WithDefaultsModuleResult.testId}--content`
			}, {
				Title = ReactModule.createElement(TextModule, {
					LayoutOrder = 1,
					Text = WithDefaultsModuleResult.title,
					tag = UseFeedbackAlertVariantsModuleResult.title.tag,
					testId = `{WithDefaultsModuleResult.testId}--title`
				}),
				Subtitle = if WithDefaultsModuleResult.subtitle then ReactModule.createElement(TextModule, {
					LayoutOrder = 2,
					Text = WithDefaultsModuleResult.subtitle,
					tag = UseFeedbackAlertVariantsModuleResult.subtitle.tag,
					testId = `{WithDefaultsModuleResult.testId}--subtitle`
				}) else nil,
				Separator = if WithDefaultsModuleResult.link then ReactModule.createElement(TextModule, {
					Text = "·",
					tag = "auto-xy text-body-medium content-default",
					LayoutOrder = 3,
					testId = `{WithDefaultsModuleResult.testId}--separator`
				}) else nil,
				Link = if WithDefaultsModuleResult.link then ReactModule.createElement(TextModule, {
					RichText = true,
					LayoutOrder = 4,
					Text = if UseStateResult then `<u>{EscapeRichTextModuleResult}</u>` else EscapeRichTextModuleResult,
					tag = UseFeedbackAlertVariantsModuleResult.link.tag,
					stateLayer = { affordance = StateLayerAffordanceModule.None },
					onStateChanged = UseResult,
					onActivated = WithDefaultsModuleResult.link.onActivated,
					testId = `{WithDefaultsModuleResult.testId}--link`
				}) else nil
			}),
			Close = if WithDefaultsModuleResult.onClose == nil then nil else ReactModule.createElement(CloseAffordanceModule, {
				LayoutOrder = 3,
				onActivated = WithDefaultsModuleResult.onClose,
				size = InputSizeModule.XSmall,
				variant = CloseAffordanceVariantModule.Utility,
				testId = `{WithDefaultsModuleResult.testId}--close`
			})
		}),
		Description = if WithDefaultsModuleResult.description then ReactModule.createElement(TextModule, {
			LayoutOrder = 2,
			Text = WithDefaultsModuleResult.description,
			tag = UseFeedbackAlertVariantsModuleResult.description.tag,
			testId = `{WithDefaultsModuleResult.testId}--description`
		}) else nil,
		Actions = ReactModule.createElement(AlertActionsModule, {
			LayoutOrder = 3,
			actions = WithDefaultsModuleResult.actions,
			testId = `{WithDefaultsModuleResult.testId}--actions`
		})
	})
end))