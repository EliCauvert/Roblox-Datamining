local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local Components = Foundation.Components
local ConstantsModule = require(Foundation.Constants)
local IconModule = require(Components.Icon)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Components.View)
local BlendTransparenciesModule = require(Foundation.Utility.blendTransparencies)
local MapBindableModule = require(Foundation.Utility.mapBindable)
local UseNumberInputVariantsModule = require(Components.NumberInput.useNumberInputVariants)
local _ = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Enums.IconSize)
local _ = require(Foundation.Enums.InputVariant)
local _ = require(Foundation.Enums.NumberInputControlsVariant)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)

local function IncrementButton(Frame)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), ViewModule (copy), ReactIsModule (copy), MapBindableModule (copy), StateLayerAffordanceModule (copy), IconModule (copy), BlendTransparenciesModule (copy), ConstantsModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	
	return ReactModule.createElement(ViewModule, {
		onActivated = Frame.onActivated,
		isDisabled = not ReactIsModule.isBinding(Frame.isDisabled) and Frame.isDisabled,
		selection = {
			Selectable = MapBindableModule(Frame.isDisabled, function(p1): boolean
				return not p1
			end)
		},
		stateLayer = {
			affordance = MapBindableModule(Frame.isDisabled, function(p1)
				-- upvalues: StateLayerAffordanceModule (upval)
				return if p1 then StateLayerAffordanceModule.None else StateLayerAffordanceModule.Background
			end)
		},
		cursor = ReactModule.useMemo(function()
			-- upvalues: Frame (copy), UseTokensModuleResult (copy)
			return {
				radius = UDim.new(0, Frame.radius),
				offset = UseTokensModuleResult.Size.Size_150,
				borderWidth = UseTokensModuleResult.Stroke.Thicker
			}
		end, {
			Frame.radius,
			UseTokensModuleResult.Size.Size_150,
			UseTokensModuleResult.Stroke.Thicker
		}),
		cornerRadius = UDim.new(0, Frame.radius),
		Size = UDim2.fromOffset(Frame.size, Frame.size),
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}, {
		Divider = if Frame.hasDivider then ReactModule.createElement(ViewModule, {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.new(0, UseTokensModuleResult.Stroke.Standard, 1, 0),
			backgroundStyle = UseTokensModuleResult.Color.Stroke.Default,
			testId = `{Frame.testId}--divider`
		}) else nil,
		Icon = ReactModule.createElement(IconModule, {
			name = Frame.icon,
			size = Frame.iconSize,
			style = MapBindableModule(Frame.isDisabled, function(p1)
				-- upvalues: UseTokensModuleResult (copy), BlendTransparenciesModule (upval), ConstantsModule (upval)
				return {
					Color3 = UseTokensModuleResult.Color.ActionUtility.Foreground.Color3,
					Transparency = if p1 then BlendTransparenciesModule(UseTokensModuleResult.Color.ActionUtility.Foreground.Transparency, ConstantsModule.DISABLED_TRANSPARENCY) else UseTokensModuleResult.Color.ActionUtility.Foreground.Transparency
				}
			end),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			testId = `{Frame.testId}--icon`
		})
	})
end

local function IncrementControls(p1)
	-- upvalues: UseTokensModule (copy), UseNumberInputVariantsModule (copy), ReactModule (copy), ViewModule (copy), IncrementButton (copy), BuilderIconsModule (copy)
	local Controls = UseNumberInputVariantsModule(UseTokensModule(), p1.size).controls
	
	return ReactModule.createElement(ViewModule, {
		LayoutOrder = 1,
		tag = Controls.tag,
		Size = UDim2.fromOffset(Controls.width, Controls.buttonSize),
		testId = `{p1.testId}--increment-buttons`
	}, {
		ControlDecrement = ReactModule.createElement(IncrementButton, {
			LayoutOrder = 1,
			icon = BuilderIconsModule.Icon.MinusSmall,
			iconSize = Controls.iconSize,
			isDisabled = p1.decrement.isDisabled,
			onActivated = p1.decrement.onClick,
			radius = Controls.radius,
			size = Controls.buttonSize,
			testId = `{p1.testId}--decrement`
		}),
		ControlIncrement = ReactModule.createElement(IncrementButton, {
			LayoutOrder = 2,
			icon = BuilderIconsModule.Icon.PlusSmall,
			iconSize = Controls.iconSize,
			hasDivider = p1.hasDivider,
			isDisabled = p1.increment.isDisabled,
			onActivated = p1.increment.onClick,
			radius = Controls.radius,
			size = Controls.buttonSize,
			testId = `{p1.testId}--increment`
		})
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), IncrementControls (copy)
	return ReactModule.createElement(IncrementControls, p1)
end