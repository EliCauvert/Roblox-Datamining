local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local components = foundation.Components
local flagsModule = require(foundation.Utility.Flags)
local constantsModule = require(foundation.Constants)
local iconModule = require(components.Icon)
local imageModule = require(components.Image)
local _ = require(foundation.Components.Types)
local viewModule = require(components.View)
local blendTransparenciesModule = require(foundation.Utility.blendTransparencies)
local mapBindableModule = require(foundation.Utility.mapBindable)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local useNumberInputVariantsModule = require(components.NumberInput.useNumberInputVariants)
local useTextInputVariantsModule = require(components.TextInput.useTextInputVariants)
local _ = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.IconSize)
local _ = require(foundation.Enums.InputVariant)
local numberInputControlsVariantModule = require(foundation.Enums.NumberInputControlsVariant)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)

local var1 = function(p1)
	-- upvalues: useTokensModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), reactIsModule (ref), mapBindableModule (ref)
	local var2 = useTokensModule()
	local uDim = UDim.new(0, var2.Radius.Medium)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p1, {
		onActivated = p1.onActivated,
		isDisabled = if reactIsModule.isBinding(p1.isDisabled) then false else p1.isDisabled,
		selection = {
			Selectable = mapBindableModule(p1.isDisabled, function(p2)
				return not p2
			end)
		},
		cursor = reactModule.useMemo(function()
			-- upvalues: uDim (ref), var2 (ref)
			return {
				radius = uDim,
				offset = var2.Size.Size_150,
				borderWidth = var2.Stroke.Thicker
			}
		end, { var2 }),
		padding = p1.padding,
		cornerRadius = uDim,
		tag = p1.tag
	}), p1.children)
end

local function SplitControls(p1)
	-- upvalues: useTokensModule (ref), useNumberInputVariantsModule (ref), useTextInputVariantsModule (ref), reactModule (ref), mapBindableModule (ref), blendTransparenciesModule (ref), constantsModule (ref), viewModule (ref), reactIsModule (ref), stateLayerAffordanceModule (ref), iconModule (ref), builderIconsModule (ref)
	local var2 = useTokensModule()
	local var3 = useNumberInputVariantsModule(var2, p1.size, p1.controlsVariant)
	local container = useTextInputVariantsModule(var2, p1.size, p1.variant).container
	local var4 = math.ceil(var2.Stroke.Standard) * 2
	local uDim2 = UDim2.fromOffset(var3.splitButton.size - var4, var3.splitButton.size - var4)
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: container (ref), mapBindableModule (copy), blendTransparenciesModule (copy), constantsModule (copy)
		return if container.strokeStyle and container.strokeThickness then {
			Color = container.strokeStyle.Color3,
			Transparency = mapBindableModule(p2, function(p3)
				-- upvalues: blendTransparenciesModule (copy), container (copy), constantsModule (copy)
				return if p3 then blendTransparenciesModule(container.strokeStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else container.strokeStyle.Transparency
			end),
			Thickness = container.strokeThickness,
			BorderStrokePosition = Enum.BorderStrokePosition.Inner
		} else nil
	end, { container.strokeStyle, container.strokeThickness })
	
	return reactModule.createElement(reactModule.Fragment, {}, {
		ControlIncrement = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			onActivated = p1.increment.onClick,
			isDisabled = if reactIsModule.isBinding(p1.increment.isDisabled) then false else p1.increment.isDisabled,
			stateLayer = {
				affordance = mapBindableModule(p1.increment.isDisabled, function(p2)
					-- upvalues: stateLayerAffordanceModule (copy)
					return if p2 then stateLayerAffordanceModule.None else stateLayerAffordanceModule.Background
				end)
			},
			padding = var3.button.padding,
			Size = uDim2,
			stroke = var5(p1.increment.isDisabled),
			tag = var3.splitButton.tag,
			testId = `{p1.testId}--increment`
		}, {
			Icon = reactModule.createElement(iconModule, {
				name = builderIconsModule.Icon.PlusSmall,
				size = p1.size,
				style = mapBindableModule(p1.increment.isDisabled, function(p2)
					-- upvalues: constantsModule (copy)
					return {
						Color3 = nil,
						Transparency = if p2 then constantsModule.DISABLED_TRANSPARENCY else nil
					}
				end),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				testId = `{p1.testId}--increment-icon`
			})
		}),
		ControlDecrement = reactModule.createElement(viewModule, {
			LayoutOrder = -1,
			onActivated = p1.decrement.onClick,
			isDisabled = if reactIsModule.isBinding(p1.decrement.isDisabled) then false else p1.decrement.isDisabled,
			stateLayer = {
				affordance = mapBindableModule(p1.decrement.isDisabled, function(p2)
					-- upvalues: stateLayerAffordanceModule (copy)
					return if p2 then stateLayerAffordanceModule.None else stateLayerAffordanceModule.Background
				end)
			},
			padding = var3.button.padding,
			Size = uDim2,
			stroke = var5(p1.decrement.isDisabled),
			tag = var3.splitButton.tag,
			testId = `{p1.testId}--decrement`
		}, {
			Icon = reactModule.createElement(iconModule, {
				name = builderIconsModule.Icon.MinusSmall,
				size = p1.size,
				style = mapBindableModule(p1.decrement.isDisabled, function(p2)
					-- upvalues: constantsModule (copy)
					return {
						Color3 = nil,
						Transparency = if p2 then constantsModule.DISABLED_TRANSPARENCY else nil
					}
				end),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				testId = `{p1.testId}--decrement-icon`
			})
		})
	})
end

local function StackedControls(p1)
	-- upvalues: useTokensModule (ref), useNumberInputVariantsModule (ref), reactModule (ref), mapBindableModule (ref), constantsModule (ref), viewModule (ref), var1 (ref), reactIsModule (ref), imageModule (ref)
	local var2 = useTokensModule()
	local var3 = useNumberInputVariantsModule(var2, p1.size, p1.controlsVariant)
	
	return reactModule.createElement(viewModule, {
		tag = "col",
		Size = UDim2.new(0, var3.button.width, 1, 0),
		LayoutOrder = p1.LayoutOrder
	}, {
		ControlIncrement = reactModule.createElement(var2, {
			onActivated = p1.increment.onClick,
			isDisabled = if reactIsModule.isBinding(p1.increment.isDisabled) then false else p1.increment.isDisabled,
			padding = var3.button.padding,
			tag = var3.upButton.tag,
			testId = `{p1.testId}--increment`
		}, {
			Icon = reactModule.createElement(imageModule, {
				Image = "component_assets/triangleUp_16",
				imageStyle = reactModule.useMemo(function()
					-- upvalues: mapBindableModule (copy), p1 (ref), var2 (ref), constantsModule (copy)
					return mapBindableModule(p1.increment.isDisabled, function(p2)
						-- upvalues: var2 (copy), constantsModule (copy)
						return {
							Color3 = var2.Color.Stroke.Emphasis.Color3,
							Transparency = if p2 then constantsModule.DISABLED_TRANSPARENCY else 0
						}
					end)
				end, { var2, p1.increment.isDisabled }),
				tag = var3.icon.tag,
				testId = `{p1.testId}--increment-icon`
			})
		}),
		ControlDecrement = reactModule.createElement(var2, {
			tag = var3.downButton.tag,
			onActivated = p1.decrement.onClick,
			isDisabled = if reactIsModule.isBinding(p1.decrement.isDisabled) then false else p1.decrement.isDisabled,
			padding = var3.button.padding,
			testId = `{p1.testId}--decrement`
		}, {
			Icon = reactModule.createElement(imageModule, {
				Image = "component_assets/triangleDown_16",
				imageStyle = reactModule.useMemo(function()
					-- upvalues: mapBindableModule (copy), p1 (ref), var2 (ref), constantsModule (copy)
					return mapBindableModule(p1.decrement.isDisabled, function(p2)
						-- upvalues: var2 (copy), constantsModule (copy)
						return {
							Color3 = var2.Color.Stroke.Emphasis.Color3,
							Transparency = if p2 then constantsModule.DISABLED_TRANSPARENCY else 0
						}
					end)
				end, { var2, p1.decrement.isDisabled }),
				tag = var3.icon.tag,
				testId = `{p1.testId}--decrement-icon`
			})
		})
	})
end

local function IncrementButton(p1)
	-- upvalues: useTokensModule (ref), reactModule (ref), viewModule (ref), reactIsModule (ref), mapBindableModule (ref), stateLayerAffordanceModule (ref), iconModule (ref), blendTransparenciesModule (ref), constantsModule (ref)
	local var2 = useTokensModule()
	
	return reactModule.createElement(viewModule, {
		onActivated = p1.onActivated,
		isDisabled = if reactIsModule.isBinding(p1.isDisabled) then false else p1.isDisabled,
		selection = {
			Selectable = mapBindableModule(p1.isDisabled, function(p2)
				return not p2
			end)
		},
		stateLayer = {
			affordance = mapBindableModule(p1.isDisabled, function(p2)
				-- upvalues: stateLayerAffordanceModule (copy)
				return if p2 then stateLayerAffordanceModule.None else stateLayerAffordanceModule.Background
			end)
		},
		cursor = reactModule.useMemo(function()
			-- upvalues: p1 (ref), var2 (ref)
			return {
				radius = UDim.new(0, p1.radius),
				offset = var2.Size.Size_150,
				borderWidth = var2.Stroke.Thicker
			}
		end, { p1.radius, var2.Size.Size_150, var2.Stroke.Thicker }),
		cornerRadius = UDim.new(0, p1.radius),
		Size = UDim2.fromOffset(p1.size, p1.size),
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	}, {
		Divider = if p1.hasDivider then reactModule.createElement(viewModule, {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.new(0, var2.Stroke.Standard, 1, 0),
			backgroundStyle = var2.Color.Stroke.Default,
			testId = `{p1.testId}--divider`
		}) else nil,
		Icon = reactModule.createElement(iconModule, {
			name = p1.icon,
			size = p1.iconSize,
			style = mapBindableModule(p1.isDisabled, function(p2)
				-- upvalues: var2 (ref), blendTransparenciesModule (copy), constantsModule (copy)
				return {
					Color3 = var2.Color.ActionUtility.Foreground.Color3,
					Transparency = if p2 then blendTransparenciesModule(var2.Color.ActionUtility.Foreground.Transparency, constantsModule.DISABLED_TRANSPARENCY) else var2.Color.ActionUtility.Foreground.Transparency
				}
			end),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			testId = `{p1.testId}--icon`
		})
	})
end

local function IncrementControls(p1)
	-- upvalues: useTokensModule (ref), useNumberInputVariantsModule (ref), reactModule (ref), viewModule (ref), IncrementButton (ref), builderIconsModule (ref)
	local controls = useNumberInputVariantsModule(useTokensModule(), p1.size, nil).controls
	
	return reactModule.createElement(viewModule, {
		LayoutOrder = 1,
		tag = controls.tag,
		Size = UDim2.fromOffset(controls.width, controls.buttonSize),
		testId = `{p1.testId}--increment-buttons`
	}, {
		ControlDecrement = reactModule.createElement(IncrementButton, {
			LayoutOrder = 1,
			icon = builderIconsModule.Icon.MinusSmall,
			iconSize = controls.iconSize,
			isDisabled = p1.decrement.isDisabled,
			onActivated = p1.decrement.onClick,
			radius = controls.radius,
			size = controls.buttonSize,
			testId = `{p1.testId}--decrement`
		}),
		ControlIncrement = reactModule.createElement(IncrementButton, {
			LayoutOrder = 2,
			icon = builderIconsModule.Icon.PlusSmall,
			iconSize = controls.iconSize,
			hasDivider = p1.hasDivider,
			isDisabled = p1.increment.isDisabled,
			onActivated = p1.increment.onClick,
			radius = controls.radius,
			size = controls.buttonSize,
			testId = `{p1.testId}--increment`
		})
	})
end

return function(p1)
	-- upvalues: flagsModule (ref), reactModule (ref), IncrementControls (ref), numberInputControlsVariantModule (ref), StackedControls (ref), SplitControls (ref)
	return if flagsModule.FoundationNumberInputBeta then reactModule.createElement(IncrementControls, p1) elseif p1.controlsVariant == numberInputControlsVariantModule.Stacked then reactModule.createElement(StackedControls, p1) else reactModule.createElement(SplitControls, p1)
end