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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useScaledValueModule (ref), iconVariant (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), presentationContextModule (ref), t_1 (ref), iconModule (ref), dashModule (ref), textModule (ref), stateLayerModeModule (ref), closeAffordanceModule (ref), inputSizeModule (ref), closeAffordanceVariantModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3 = var1.icon and var1.icon ~= ""
	local var4 = var1.action ~= nil and var1.action.text ~= ""
	local var5 = var4 or var1.onClose ~= nil
	local var6 = var3 or var5
	local action = var1.action
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		Size = if var5 then UDim2.fromOffset(useScaledValueModule(371), 0) else UDim2.fromOffset(0, 0),
		sizeConstraint = if var5 then nil else {
			MinSize = Vector2.new(0, 0),
			MaxSize = Vector2.new(useScaledValueModule(if var3 then 304 else 272), 1e999)
		},
		tag = {
			["row align-y-center gap-large padding-y-xsmall radius-medium bg-system-contrast"] = true,
			["padding-left-large"] = not var6,
			["padding-left-medium"] = var6,
			["auto-xy padding-right-large"] = not var5,
			["auto-y padding-right-small"] = var5
		},
		ref = p2
	}), reactModule.createElement(presentationContextModule.Provider, { value = t_1 }, {
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = "row align-y-center fill gap-small auto-xy padding-y-small",
			testId = `{var1.testId}--content`
		}, {
			Icon = if var3 then reactModule.createElement(iconModule, dashModule.join(if typeof(var1.icon) == "string" then { name = var1.icon, variant = iconVariant.Regular } else var1.icon, {
				LayoutOrder = 1,
				style = var2.Inverse.Content.Emphasis,
				testId = `{var1.testId}--icon`
			})) else nil,
			Title = reactModule.createElement(textModule, {
				LayoutOrder = 2,
				tag = "fill auto-xy text-caption-large text-wrap text-align-x-left text-truncate-split content-inverse-emphasis",
				Text = var1.title,
				sizeConstraint = {
					MinSize = Vector2.new(0, 0),
					MaxSize = Vector2.new(1e999, var2.Typography.CaptionLarge.FontSize * var2.Typography.CaptionLarge.LineHeight * 2)
				},
				testId = `{var1.testId}--title`
			})
		}),
		Buttons = if var5 then reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = "row align-y-center gap-xsmall auto-xy",
			testId = `{var1.testId}--buttons`
		}, {
			Action = if var4 then reactModule.createElement(textModule, {
				LayoutOrder = 1,
				tag = "auto-xy padding-small text-label-medium radius-medium content-inverse-link",
				onActivated = action.onActivated,
				stateLayer = { mode = stateLayerModeModule.Inverse },
				Text = action.text,
				testId = `{var1.testId}--action`
			}) else nil,
			CloseAffordance = if var1.onClose ~= nil then nil else reactModule.createElement(closeAffordanceModule, {
				LayoutOrder = 2,
				onActivated = var1.onClose,
				size = inputSizeModule.Small,
				variant = closeAffordanceVariantModule.Utility,
				testId = `{var1.testId}--close-affordance`
			})
		}) else nil
	}))
end))