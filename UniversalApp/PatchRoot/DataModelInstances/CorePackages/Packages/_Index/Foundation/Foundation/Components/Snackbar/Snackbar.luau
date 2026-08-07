local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local iconVariant = builderIconsModule.IconVariant
local closeAffordanceModule = require(foundation.Components.CloseAffordance)
local closeAffordanceVariantModule = require(foundation.Enums.CloseAffordanceVariant)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local iconModule = require(foundation.Components.Icon)
local inputSizeModule = require(foundation.Enums.InputSize)
local presentationContextModule = require(foundation.Providers.Style.PresentationContext)
local stateLayerModeModule = require(foundation.Enums.StateLayerMode)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = { testId = "--foundation-snackbar" }
local t_1 = { colorNamespace = colorNamespaceModule.Inverse }

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 56 | named "Snackbar" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useScaledValueModule (ref), iconVariant (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), presentationContextModule (ref), t_1 (ref), iconModule (ref), dashModule (ref), textModule (ref), stateLayerModeModule (ref), closeAffordanceModule (ref), inputSizeModule (ref), closeAffordanceVariantModule (ref)
	local var19 = withDefaultsModule(p0, t)
	local var20 = useTokensModule()
	local var21 = var19.icon and var19.icon ~= ""
	local var22 = var19.action ~= nil and var19.action.text ~= ""
	local var22_1 = var22 or var19.onClose ~= nil
	local var21_1 = var21 or var22_1
	local action = var19.action
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var19, {
		Size = if var22_1 then UDim2.fromOffset(useScaledValueModule(371), 0) else UDim2.fromOffset(0, 0),
		sizeConstraint = if var22_1 then nil else {
			MinSize = Vector2.new(0, 0),
			MaxSize = Vector2.new(useScaledValueModule(if var21 then 304 else 272), 1e999)
		},
		tag = {
			["row align-y-center gap-large padding-y-xsmall radius-medium bg-system-contrast"] = true,
			["padding-left-large"] = not var21_1,
			["padding-left-medium"] = var21_1,
			["auto-xy padding-right-large"] = not var22_1,
			["auto-y padding-right-small"] = var22_1
		},
		ref = p1
	}), reactModule.createElement(presentationContextModule.Provider, { value = t_1 }, {
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = "row align-y-center fill gap-small auto-xy padding-y-small",
			testId = `{var19.testId}--content`
		}, {
			Icon = if var21 then reactModule.createElement(iconModule, dashModule.join(if typeof(var19.icon) == "string" then { name = var19.icon, variant = iconVariant.Regular } else var19.icon, {
				LayoutOrder = 1,
				style = var20.Inverse.Content.Emphasis,
				testId = `{var19.testId}--icon`
			})) else nil,
			Title = reactModule.createElement(textModule, {
				LayoutOrder = 2,
				tag = "fill auto-xy text-caption-large text-wrap text-align-x-left text-truncate-split content-inverse-emphasis",
				Text = var19.title,
				sizeConstraint = {
					MinSize = Vector2.new(0, 0),
					MaxSize = Vector2.new(1e999, var20.Typography.CaptionLarge.FontSize * var20.Typography.CaptionLarge.LineHeight * 2)
				},
				testId = `{var19.testId}--title`
			})
		}),
		Buttons = if var22_1 then reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = "row align-y-center gap-xsmall auto-xy",
			testId = `{var19.testId}--buttons`
		}, {
			Action = if var22 then reactModule.createElement(textModule, {
				LayoutOrder = 1,
				tag = "auto-xy padding-small text-label-medium radius-medium content-inverse-link",
				onActivated = action.onActivated,
				stateLayer = { mode = stateLayerModeModule.Inverse },
				Text = action.text,
				testId = `{var19.testId}--action`
			}) else nil,
			CloseAffordance = if var19.onClose ~= nil then nil else reactModule.createElement(closeAffordanceModule, {
				LayoutOrder = 2,
				onActivated = var19.onClose,
				size = inputSizeModule.Small,
				variant = closeAffordanceVariantModule.Utility,
				testId = `{var19.testId}--close-affordance`
			})
		}) else nil
	}))
end))