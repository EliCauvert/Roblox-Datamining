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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useFeedbackAlertVariantsModule (ref), reactUtilsModule (ref), escapeRichTextModule (ref), reactModule (ref), controlStateModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), alertConstantsModule (ref), iconSizeModule (ref), iconVariant (ref), textModule (ref), stateLayerAffordanceModule (ref), closeAffordanceModule (ref), inputSizeModule (ref), closeAffordanceVariantModule (ref), alertActionsModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useFeedbackAlertVariantsModule(useTokensModule(), var1.severity)
	local var3 = reactUtilsModule.useComposedRef(p2)
	local var4 = if var1.link then escapeRichTextModule(var1.link.text) else nil
	local var5, var6 = reactModule.useState(false)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = var2.container.tag,
		stroke = var2.stroke,
		backgroundStyle = var2.backgroundStyle,
		ref = var3
	}), {
		HeaderRow = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = var2.headerRow.tag,
			testId = `{var1.testId}--header`
		}, {
			Icon = reactModule.createElement(iconModule, {
				LayoutOrder = 1,
				name = alertConstantsModule.SEVERITY_TO_ICON[var1.severity],
				size = iconSizeModule.Large,
				variant = iconVariant.Filled,
				style = var2.icon.style,
				testId = `{var1.testId}--icon`
			}),
			Content = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = "row align-y-center fill gap-xsmall auto-y",
				testId = `{var1.testId}--content`
			}, {
				Title = reactModule.createElement(textModule, {
					LayoutOrder = 1,
					Text = var1.title,
					tag = var2.title.tag,
					testId = `{var1.testId}--title`
				}),
				Subtitle = if var1.subtitle then reactModule.createElement(textModule, {
					LayoutOrder = 2,
					Text = var1.subtitle,
					tag = var2.subtitle.tag,
					testId = `{var1.testId}--subtitle`
				}) else nil,
				Separator = if var1.link then reactModule.createElement(textModule, {
					Text = "\194\183",
					tag = "auto-xy text-body-medium content-default",
					LayoutOrder = 3,
					testId = `{var1.testId}--separator`
				}) else nil,
				Link = if var1.link then reactModule.createElement(textModule, {
					RichText = true,
					LayoutOrder = 4,
					Text = if var5 then `<u>{var4}</u>` else var4,
					tag = var2.link.tag,
					stateLayer = { affordance = stateLayerAffordanceModule.None },
					onStateChanged = reactModule.useCallback(function(p3)
						-- upvalues: var6 (ref), controlStateModule (copy)
						var6(p3 == controlStateModule.Hover)
					end, {}),
					onActivated = var1.link.onActivated,
					testId = `{var1.testId}--link`
				}) else nil
			}),
			Close = if var1.onClose ~= nil then nil else reactModule.createElement(closeAffordanceModule, {
				LayoutOrder = 3,
				onActivated = var1.onClose,
				size = inputSizeModule.XSmall,
				variant = closeAffordanceVariantModule.Utility,
				testId = `{var1.testId}--close`
			})
		}),
		Description = if var1.description then reactModule.createElement(textModule, {
			LayoutOrder = 2,
			Text = var1.description,
			tag = var2.description.tag,
			testId = `{var1.testId}--description`
		}) else nil,
		Actions = reactModule.createElement(alertActionsModule, {
			LayoutOrder = 3,
			actions = var1.actions,
			testId = `{var1.testId}--actions`
		})
	})
end))