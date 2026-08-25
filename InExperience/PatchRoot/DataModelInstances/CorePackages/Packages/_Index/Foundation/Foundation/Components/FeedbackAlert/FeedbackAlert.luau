local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local alertActionsModule = require(foundation.Components.AlertActions)
local alertConstantsModule = require(foundation.Components.AlertActions.AlertConstants)
local _ = require(foundation.Enums.AlertSeverity)
local builderIconsModule = require(parent.BuilderIcons)
local closeAffordanceModule = require(foundation.Components.CloseAffordance)
local closeAffordanceVariantModule = require(foundation.Enums.CloseAffordanceVariant)
local controlStateModule = require(foundation.Enums.ControlState)
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
local iconVariant = builderIconsModule.IconVariant
local useFeedbackAlertVariantsModule = require(script.Parent.useFeedbackAlertVariants)
local t = { testId = "--foundation-feedback-alert" }

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useFeedbackAlertVariantsModule (ref), reactUtilsModule (ref), escapeRichTextModule (ref), reactModule (ref), controlStateModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), alertConstantsModule (ref), iconSizeModule (ref), iconVariant (ref), textModule (ref), stateLayerAffordanceModule (ref), closeAffordanceModule (ref), inputSizeModule (ref), closeAffordanceVariantModule (ref), alertActionsModule (ref)
	local var21 = withDefaultsModule(p0, t)
	local var22 = useFeedbackAlertVariantsModule(useTokensModule(), var21.severity)
	local var23 = reactUtilsModule.useComposedRef(p1)
	local var24 = if var21.link then escapeRichTextModule(var21.link.text) else nil
	local var25, var26 = reactModule.useState(false)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var21, {
		tag = var22.container.tag,
		stroke = var22.stroke,
		backgroundStyle = var22.backgroundStyle,
		ref = var23
	}), {
		HeaderRow = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = var22.headerRow.tag,
			testId = `{var21.testId}--header`
		}, {
			Icon = reactModule.createElement(iconModule, {
				LayoutOrder = 1,
				name = alertConstantsModule.SEVERITY_TO_ICON[var21.severity],
				size = iconSizeModule.Large,
				variant = iconVariant.Filled,
				style = var22.icon.style,
				testId = `{var21.testId}--icon`
			}),
			Content = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = "row align-y-center fill gap-xsmall auto-y",
				testId = `{var21.testId}--content`
			}, {
				Title = reactModule.createElement(textModule, {
					LayoutOrder = 1,
					Text = var21.title,
					tag = var22.title.tag,
					testId = `{var21.testId}--title`
				}),
				Subtitle = if var21.subtitle then reactModule.createElement(textModule, {
					LayoutOrder = 2,
					Text = var21.subtitle,
					tag = var22.subtitle.tag,
					testId = `{var21.testId}--subtitle`
				}) else nil,
				Separator = if var21.link then reactModule.createElement(textModule, {
					Text = "\194\183",
					tag = "auto-xy text-body-medium content-default",
					LayoutOrder = 3,
					testId = `{var21.testId}--separator`
				}) else nil,
				Link = if var21.link then reactModule.createElement(textModule, {
					RichText = true,
					LayoutOrder = 4,
					Text = if var25 then `<u>{var24}</u>` else var24,
					tag = var22.link.tag,
					stateLayer = { affordance = stateLayerAffordanceModule.None },
					onStateChanged = reactModule.useCallback(function(p2)
						-- upvalues: var26 (ref), controlStateModule (copy)
						var26(p2 == controlStateModule.Hover)
					end, {}),
					onActivated = var21.link.onActivated,
					testId = `{var21.testId}--link`
				}) else nil
			}),
			Close = if var21.onClose ~= nil then nil else reactModule.createElement(closeAffordanceModule, {
				LayoutOrder = 3,
				onActivated = var21.onClose,
				size = inputSizeModule.XSmall,
				variant = closeAffordanceVariantModule.Utility,
				testId = `{var21.testId}--close`
			})
		}),
		Description = if var21.description then reactModule.createElement(textModule, {
			LayoutOrder = 2,
			Text = var21.description,
			tag = var22.description.tag,
			testId = `{var21.testId}--description`
		}) else nil,
		Actions = reactModule.createElement(alertActionsModule, {
			LayoutOrder = 3,
			actions = var21.actions,
			testId = `{var21.testId}--actions`
		})
	})
end))