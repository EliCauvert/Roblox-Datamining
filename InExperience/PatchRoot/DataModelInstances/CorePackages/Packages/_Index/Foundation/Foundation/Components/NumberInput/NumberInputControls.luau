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

local var17 = function(p0)
	-- upvalues: useTokensModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), reactIsModule (ref), mapBindableModule (ref)
	local var22 = useTokensModule()
	local uDim = UDim.new(0, var22.Radius.Medium)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p0, {
		onActivated = p0.onActivated,
		isDisabled = if reactIsModule.isBinding(p0.isDisabled) then false else p0.isDisabled,
		selection = {
			Selectable = mapBindableModule(p0.isDisabled, function(p1)
				return not p1
			end)
		},
		cursor = reactModule.useMemo(function()
			-- upvalues: uDim (ref), var22 (ref)
			return {
				radius = uDim,
				offset = var22.Size.Size_150,
				borderWidth = var22.Stroke.Thicker
			}
		end, { var22 }),
		padding = p0.padding,
		cornerRadius = uDim,
		tag = p0.tag
	}), p0.children)
end

local function SplitControls(p2)
	-- upvalues: useTokensModule (ref), useNumberInputVariantsModule (ref), useTextInputVariantsModule (ref), reactModule (ref), mapBindableModule (ref), blendTransparenciesModule (ref), constantsModule (ref), viewModule (ref), reactIsModule (ref), stateLayerAffordanceModule (ref), iconModule (ref), builderIconsModule (ref)
	local var24 = useTokensModule()
	local var25 = useNumberInputVariantsModule(var24, p2.size, p2.controlsVariant)
	local container = useTextInputVariantsModule(var24, p2.size, p2.variant).container
	local var26 = math.ceil(var24.Stroke.Standard) * 2
	local uDim2 = UDim2.fromOffset(var25.splitButton.size - var26, var25.splitButton.size - var26)
	local var28 = reactModule.useCallback(function(p3)
		-- upvalues: container (ref), mapBindableModule (copy), blendTransparenciesModule (copy), constantsModule (copy)
		return if container.strokeStyle and container.strokeThickness then {
			Color = container.strokeStyle.Color3,
			Transparency = mapBindableModule(p3, function(p4)
				-- upvalues: blendTransparenciesModule (copy), container (copy), constantsModule (copy)
				return if p4 then blendTransparenciesModule(container.strokeStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else container.strokeStyle.Transparency
			end),
			Thickness = container.strokeThickness,
			BorderStrokePosition = Enum.BorderStrokePosition.Inner
		} else nil
	end, { container.strokeStyle, container.strokeThickness })
	
	return reactModule.createElement(reactModule.Fragment, {}, {
		ControlIncrement = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			onActivated = p2.increment.onClick,
			isDisabled = if reactIsModule.isBinding(p2.increment.isDisabled) then false else p2.increment.isDisabled,
			stateLayer = {
				affordance = mapBindableModule(p2.increment.isDisabled, function(p5)
					-- upvalues: stateLayerAffordanceModule (copy)
					return if p5 then stateLayerAffordanceModule.None else stateLayerAffordanceModule.Background
				end)
			},
			padding = var25.button.padding,
			Size = uDim2,
			stroke = var28(p2.increment.isDisabled),
			tag = var25.splitButton.tag,
			testId = `{p2.testId}--increment`
		}, {
			Icon = reactModule.createElement(iconModule, {
				name = builderIconsModule.Icon.PlusSmall,
				size = p2.size,
				style = mapBindableModule(p2.increment.isDisabled, function(p6)
					-- upvalues: constantsModule (copy)
					return {
						Color3 = nil,
						Transparency = if p6 then constantsModule.DISABLED_TRANSPARENCY else nil
					}
				end),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				testId = `{p2.testId}--increment-icon`
			})
		}),
		ControlDecrement = reactModule.createElement(viewModule, {
			LayoutOrder = -1,
			onActivated = p2.decrement.onClick,
			isDisabled = if reactIsModule.isBinding(p2.decrement.isDisabled) then false else p2.decrement.isDisabled,
			stateLayer = {
				affordance = mapBindableModule(p2.decrement.isDisabled, function(p7)
					-- upvalues: stateLayerAffordanceModule (copy)
					return if p7 then stateLayerAffordanceModule.None else stateLayerAffordanceModule.Background
				end)
			},
			padding = var25.button.padding,
			Size = uDim2,
			stroke = var28(p2.decrement.isDisabled),
			tag = var25.splitButton.tag,
			testId = `{p2.testId}--decrement`
		}, {
			Icon = reactModule.createElement(iconModule, {
				name = builderIconsModule.Icon.MinusSmall,
				size = p2.size,
				style = mapBindableModule(p2.decrement.isDisabled, function(p8)
					-- upvalues: constantsModule (copy)
					return {
						Color3 = nil,
						Transparency = if p8 then constantsModule.DISABLED_TRANSPARENCY else nil
					}
				end),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				testId = `{p2.testId}--decrement-icon`
			})
		})
	})
end

local function StackedControls(p9)
	-- upvalues: useTokensModule (ref), useNumberInputVariantsModule (ref), reactModule (ref), mapBindableModule (ref), constantsModule (ref), viewModule (ref), var17 (ref), reactIsModule (ref), imageModule (ref)
	local var29 = useTokensModule()
	local var30 = useNumberInputVariantsModule(var29, p9.size, p9.controlsVariant)
	
	return reactModule.createElement(viewModule, {
		tag = "col",
		Size = UDim2.new(0, var30.button.width, 1, 0),
		LayoutOrder = p9.LayoutOrder
	}, {
		ControlIncrement = reactModule.createElement(var17, {
			onActivated = p9.increment.onClick,
			isDisabled = if reactIsModule.isBinding(p9.increment.isDisabled) then false else p9.increment.isDisabled,
			padding = var30.button.padding,
			tag = var30.upButton.tag,
			testId = `{p9.testId}--increment`
		}, {
			Icon = reactModule.createElement(imageModule, {
				Image = "component_assets/triangleUp_16",
				imageStyle = reactModule.useMemo(function()
					-- upvalues: mapBindableModule (copy), p9 (ref), var29 (ref), constantsModule (copy)
					return mapBindableModule(p9.increment.isDisabled, function(p10)
						-- upvalues: var29 (copy), constantsModule (copy)
						return {
							Color3 = var29.Color.Stroke.Emphasis.Color3,
							Transparency = if p10 then constantsModule.DISABLED_TRANSPARENCY else 0
						}
					end)
				end, { var29, p9.increment.isDisabled }),
				tag = var30.icon.tag,
				testId = `{p9.testId}--increment-icon`
			})
		}),
		ControlDecrement = reactModule.createElement(var17, {
			tag = var30.downButton.tag,
			onActivated = p9.decrement.onClick,
			isDisabled = if reactIsModule.isBinding(p9.decrement.isDisabled) then false else p9.decrement.isDisabled,
			padding = var30.button.padding,
			testId = `{p9.testId}--decrement`
		}, {
			Icon = reactModule.createElement(imageModule, {
				Image = "component_assets/triangleDown_16",
				imageStyle = reactModule.useMemo(function()
					-- upvalues: mapBindableModule (copy), p9 (ref), var29 (ref), constantsModule (copy)
					return mapBindableModule(p9.decrement.isDisabled, function(p11)
						-- upvalues: var29 (copy), constantsModule (copy)
						return {
							Color3 = var29.Color.Stroke.Emphasis.Color3,
							Transparency = if p11 then constantsModule.DISABLED_TRANSPARENCY else 0
						}
					end)
				end, { var29, p9.decrement.isDisabled }),
				tag = var30.icon.tag,
				testId = `{p9.testId}--decrement-icon`
			})
		})
	})
end

local function IncrementButton(p12)
	-- upvalues: useTokensModule (ref), reactModule (ref), viewModule (ref), reactIsModule (ref), mapBindableModule (ref), stateLayerAffordanceModule (ref), iconModule (ref), blendTransparenciesModule (ref), constantsModule (ref)
	local var31 = useTokensModule()
	
	return reactModule.createElement(viewModule, {
		onActivated = p12.onActivated,
		isDisabled = if reactIsModule.isBinding(p12.isDisabled) then false else p12.isDisabled,
		selection = {
			Selectable = mapBindableModule(p12.isDisabled, function(p13)
				return not p13
			end)
		},
		stateLayer = {
			affordance = mapBindableModule(p12.isDisabled, function(p14)
				-- upvalues: stateLayerAffordanceModule (copy)
				return if p14 then stateLayerAffordanceModule.None else stateLayerAffordanceModule.Background
			end)
		},
		cursor = reactModule.useMemo(function()
			-- upvalues: p12 (ref), var31 (ref)
			return {
				radius = UDim.new(0, p12.radius),
				offset = var31.Size.Size_150,
				borderWidth = var31.Stroke.Thicker
			}
		end, { p12.radius, var31.Size.Size_150, var31.Stroke.Thicker }),
		cornerRadius = UDim.new(0, p12.radius),
		Size = UDim2.fromOffset(p12.size, p12.size),
		LayoutOrder = p12.LayoutOrder,
		testId = p12.testId
	}, {
		Divider = if p12.hasDivider then reactModule.createElement(viewModule, {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.new(0, var31.Stroke.Standard, 1, 0),
			backgroundStyle = var31.Color.Stroke.Default,
			testId = `{p12.testId}--divider`
		}) else nil,
		Icon = reactModule.createElement(iconModule, {
			name = p12.icon,
			size = p12.iconSize,
			style = mapBindableModule(p12.isDisabled, function(p15)
				-- upvalues: var31 (ref), blendTransparenciesModule (copy), constantsModule (copy)
				return {
					Color3 = var31.Color.ActionUtility.Foreground.Color3,
					Transparency = if p15 then blendTransparenciesModule(var31.Color.ActionUtility.Foreground.Transparency, constantsModule.DISABLED_TRANSPARENCY) else var31.Color.ActionUtility.Foreground.Transparency
				}
			end),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			testId = `{p12.testId}--icon`
		})
	})
end

local function IncrementControls(p16)
	-- upvalues: useTokensModule (ref), useNumberInputVariantsModule (ref), reactModule (ref), viewModule (ref), IncrementButton (ref), builderIconsModule (ref)
	local controls = useNumberInputVariantsModule(useTokensModule(), p16.size, nil).controls
	
	return reactModule.createElement(viewModule, {
		LayoutOrder = 1,
		tag = controls.tag,
		Size = UDim2.fromOffset(controls.width, controls.buttonSize),
		testId = `{p16.testId}--increment-buttons`
	}, {
		ControlDecrement = reactModule.createElement(IncrementButton, {
			LayoutOrder = 1,
			icon = builderIconsModule.Icon.MinusSmall,
			iconSize = controls.iconSize,
			isDisabled = p16.decrement.isDisabled,
			onActivated = p16.decrement.onClick,
			radius = controls.radius,
			size = controls.buttonSize,
			testId = `{p16.testId}--decrement`
		}),
		ControlIncrement = reactModule.createElement(IncrementButton, {
			LayoutOrder = 2,
			icon = builderIconsModule.Icon.PlusSmall,
			iconSize = controls.iconSize,
			hasDivider = p16.hasDivider,
			isDisabled = p16.increment.isDisabled,
			onActivated = p16.increment.onClick,
			radius = controls.radius,
			size = controls.buttonSize,
			testId = `{p16.testId}--increment`
		})
	})
end

return function(p17)
	-- upvalues: flagsModule (ref), reactModule (ref), IncrementControls (ref), numberInputControlsVariantModule (ref), StackedControls (ref), SplitControls (ref)
	return if flagsModule.FoundationNumberInputBeta then reactModule.createElement(IncrementControls, p17) elseif p17.controlsVariant == numberInputControlsVariantModule.Stacked then reactModule.createElement(StackedControls, p17) else reactModule.createElement(SplitControls, p17)
end