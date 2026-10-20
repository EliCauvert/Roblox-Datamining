local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local IconVariant = require(Parent.BuilderIcons).IconVariant
local CloseAffordanceModule = require(Foundation.Components.CloseAffordance)
local CloseAffordanceVariantModule = require(Foundation.Enums.CloseAffordanceVariant)
local IconModule = require(Foundation.Components.Icon)
local InputSizeModule = require(Foundation.Enums.InputSize)
local PresentationContextModule = require(Foundation.Providers.Style.PresentationContext)
local StateLayerModeModule = require(Foundation.Enums.StateLayerMode)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = { testId = "--foundation-snackbar" }
local config1 = {
	colorNamespace = require(Foundation.Enums.ColorNamespace).Inverse
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseScaledValueModule (copy), IconVariant (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), PresentationContextModule (copy), config1 (copy), IconModule (copy), DashModule (copy), TextModule (copy), StateLayerModeModule (copy), CloseAffordanceModule (copy), InputSizeModule (copy), CloseAffordanceVariantModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local IsNotIconMatch: boolean = WithDefaultsModuleResult.icon and WithDefaultsModuleResult.icon ~= ""
	local IsNotTextMatch: boolean = WithDefaultsModuleResult.action ~= nil and WithDefaultsModuleResult.action.text ~= ""
	local IsNotTextMatch1: boolean = IsNotTextMatch or WithDefaultsModuleResult.onClose ~= nil
	local IsNotIconMatch1: boolean = IsNotIconMatch or IsNotTextMatch1
	local UseScaledValueModuleResult = UseScaledValueModule(371)
	local UseScaledValueModuleResult1 = UseScaledValueModule(if IsNotIconMatch then 304 else 272)
	local Config = if typeof(WithDefaultsModuleResult.icon) == "string" then {
		name = WithDefaultsModuleResult.icon,
		variant = IconVariant.Regular
	} else WithDefaultsModuleResult.icon
	local Action = WithDefaultsModuleResult.action
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		Size = if IsNotTextMatch1 then UDim2.fromOffset(UseScaledValueModuleResult, 0) else UDim2.fromOffset(0, 0),
		sizeConstraint = if IsNotTextMatch1 then nil else {
			MinSize = Vector2.new(0, 0),
			MaxSize = Vector2.new(UseScaledValueModuleResult1, 1e999)
		},
		tag = {
			["row align-y-center gap-large padding-y-xsmall radius-medium bg-system-contrast"] = true,
			["padding-left-large"] = not IsNotIconMatch1,
			["padding-left-medium"] = IsNotIconMatch1,
			["auto-xy padding-right-large"] = not IsNotTextMatch1,
			["auto-y padding-right-small"] = IsNotTextMatch1
		},
		ref = Ref
	}), ReactModule.createElement(PresentationContextModule.Provider, { value = config1 }, {
		Content = ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			tag = "row align-y-center fill gap-small auto-xy padding-y-small",
			testId = `{WithDefaultsModuleResult.testId}--content`
		}, {
			Icon = if IsNotIconMatch then ReactModule.createElement(IconModule, DashModule.join(Config, {
				LayoutOrder = 1,
				style = UseTokensModuleResult.Inverse.Content.Emphasis,
				testId = `{WithDefaultsModuleResult.testId}--icon`
			})) else nil,
			Title = ReactModule.createElement(TextModule, {
				LayoutOrder = 2,
				tag = "fill auto-xy text-caption-large text-wrap text-align-x-left text-truncate-split content-inverse-emphasis",
				Text = WithDefaultsModuleResult.title,
				sizeConstraint = {
					MinSize = Vector2.new(0, 0),
					MaxSize = Vector2.new(1e999, UseTokensModuleResult.Typography.CaptionLarge.FontSize * UseTokensModuleResult.Typography.CaptionLarge.LineHeight * 2)
				},
				testId = `{WithDefaultsModuleResult.testId}--title`
			})
		}),
		Buttons = if IsNotTextMatch1 then ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			tag = "row align-y-center gap-xsmall auto-xy",
			testId = `{WithDefaultsModuleResult.testId}--buttons`
		}, {
			Action = if IsNotTextMatch then ReactModule.createElement(TextModule, {
				LayoutOrder = 1,
				tag = "auto-xy padding-small text-label-medium radius-medium content-inverse-link",
				onActivated = Action.onActivated,
				stateLayer = { mode = StateLayerModeModule.Inverse },
				Text = Action.text,
				testId = `{WithDefaultsModuleResult.testId}--action`
			}) else nil,
			CloseAffordance = if WithDefaultsModuleResult.onClose == nil then nil else ReactModule.createElement(CloseAffordanceModule, {
				LayoutOrder = 2,
				onActivated = WithDefaultsModuleResult.onClose,
				size = InputSizeModule.Small,
				variant = CloseAffordanceVariantModule.Utility,
				testId = `{WithDefaultsModuleResult.testId}--close-affordance`
			})
		}) else nil
	}))
end))