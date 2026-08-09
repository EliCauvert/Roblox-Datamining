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
local getDisabledStyleModule = require(foundation.Utility.getDisabledStyle)
local mapBindableModule = require(foundation.Utility.mapBindable)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local useNumberInputVariantsModule = require(components.NumberInput.useNumberInputVariants)
local useTextInputVariantsModule = require(components.TextInput.useTextInputVariants)
local _ = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.InputVariant)
local numberInputControlsVariantModule = require(foundation.Enums.NumberInputControlsVariant)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)

local var18 = function(p0) --[[ line: 63 ]]
	-- upvalues: useTokensModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), reactIsModule (ref), mapBindableModule (ref)
	local var21 = useTokensModule()
	local uDim = UDim.new(0, var21.Radius.Medium)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p0, {
		onActivated = p0.onActivated,
		isDisabled = if reactIsModule.isBinding(p0.isDisabled) then false else p0.isDisabled,
		selection = {
			Selectable = mapBindableModule(p0.isDisabled, function(p1) --[[ line: 81 ]]
				return not p1
			end)
		},
		cursor = reactModule.useMemo(function() --[[ line: 67 ]]
			-- upvalues: uDim (ref), var21 (ref)
			return {
				radius = uDim,
				offset = var21.Size.Size_150,
				borderWidth = var21.Stroke.Thicker
			}
		end, { var21 }),
		padding = p0.padding,
		cornerRadius = uDim,
		tag = p0.tag
	}), p0.children)
end

local function SplitControls(p2) --[[ line: 94 ]]
	-- upvalues: useTokensModule (ref), useNumberInputVariantsModule (ref), useTextInputVariantsModule (ref), reactModule (ref), getDisabledStyleModule (ref), mapBindableModule (ref), blendTransparenciesModule (ref), constantsModule (ref), viewModule (ref), reactIsModule (ref), stateLayerAffordanceModule (ref), flagsModule (ref), iconModule (ref), builderIconsModule (ref)
	local var23 = useTokensModule()
	local var24 = useNumberInputVariantsModule(var23, p2.size, p2.controlsVariant)
	local container = useTextInputVariantsModule(var23, p2.size, p2.variant).container
	local var25 = math.ceil(var23.Stroke.Standard) * 2
	local uDim2 = UDim2.fromOffset(var24.splitButton.size - var25, var24.splitButton.size - var25)
	local var27 = reactModule.useCallback(function(p3) --[[ line: 107 ]]
		-- upvalues: container (ref), getDisabledStyleModule (copy)
		return if container.bgStyle then getDisabledStyleModule(container.bgStyle, p3) else nil
	end, { container.bgStyle })
	local var28 = reactModule.useCallback(function(p4) --[[ line: 113 ]]
		-- upvalues: container (ref), mapBindableModule (copy), blendTransparenciesModule (copy), constantsModule (copy)
		return if container.strokeStyle and container.strokeThickness then {
			Color = container.strokeStyle.Color3,
			Transparency = mapBindableModule(p4, function(p5) --[[ line: 117 ]]
				-- upvalues: blendTransparenciesModule (copy), container (copy), constantsModule (copy)
				return if p5 then blendTransparenciesModule(container.strokeStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else container.strokeStyle.Transparency
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
				affordance = mapBindableModule(p2.increment.isDisabled, function(p6) --[[ line: 138 ]]
					-- upvalues: stateLayerAffordanceModule (copy)
					return if p6 then stateLayerAffordanceModule.None else stateLayerAffordanceModule.Background
				end)
			},
			padding = var24.button.padding,
			Size = uDim2,
			backgroundStyle = if flagsModule.FoundationTextInputRemoveBackgroundStyle then nil else mapBindableModule(p2.increment.isDisabled, function(p7) --[[ line: 146 ]]
				-- upvalues: var27 (ref)
				return var27(p7)
			end),
			stroke = var28(p2.increment.isDisabled),
			tag = var24.splitButton.tag,
			testId = `{p2.testId}--increment`
		}, {
			Icon = reactModule.createElement(iconModule, {
				name = builderIconsModule.Icon.PlusSmall,
				size = p2.size,
				style = mapBindableModule(p2.increment.isDisabled, function(p8) --[[ line: 157 ]]
					-- upvalues: constantsModule (copy)
					return {
						Color3 = nil,
						Transparency = if p8 then constantsModule.DISABLED_TRANSPARENCY else nil
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
				affordance = mapBindableModule(p2.decrement.isDisabled, function(p9) --[[ line: 174 ]]
					-- upvalues: stateLayerAffordanceModule (copy)
					return if p9 then stateLayerAffordanceModule.None else stateLayerAffordanceModule.Background
				end)
			},
			padding = var24.button.padding,
			Size = uDim2,
			backgroundStyle = if flagsModule.FoundationTextInputRemoveBackgroundStyle then nil else mapBindableModule(p2.decrement.isDisabled, function(p10) --[[ line: 182 ]]
				-- upvalues: var27 (ref)
				return var27(p10)
			end),
			stroke = var28(p2.decrement.isDisabled),
			tag = var24.splitButton.tag,
			testId = `{p2.testId}--decrement`
		}, {
			Icon = reactModule.createElement(iconModule, {
				name = builderIconsModule.Icon.MinusSmall,
				size = p2.size,
				style = mapBindableModule(p2.decrement.isDisabled, function(p11) --[[ line: 193 ]]
					-- upvalues: constantsModule (copy)
					return {
						Color3 = nil,
						Transparency = if p11 then constantsModule.DISABLED_TRANSPARENCY else nil
					}
				end),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				testId = `{p2.testId}--decrement-icon`
			})
		})
	})
end

local function StackedControls(p12) --[[ line: 207 ]]
	-- upvalues: useTokensModule (ref), useNumberInputVariantsModule (ref), reactModule (ref), mapBindableModule (ref), constantsModule (ref), viewModule (ref), var18 (ref), reactIsModule (ref), imageModule (ref)
	local var29 = useTokensModule()
	local var30 = useNumberInputVariantsModule(var29, p12.size, p12.controlsVariant)
	
	return reactModule.createElement(viewModule, {
		tag = "col",
		Size = UDim2.new(0, var30.button.width, 1, 0),
		LayoutOrder = p12.LayoutOrder
	}, {
		ControlIncrement = reactModule.createElement(var18, {
			onActivated = p12.increment.onClick,
			isDisabled = if reactIsModule.isBinding(p12.increment.isDisabled) then false else p12.increment.isDisabled,
			padding = var30.button.padding,
			tag = var30.upButton.tag,
			testId = `{p12.testId}--increment`
		}, {
			Icon = reactModule.createElement(imageModule, {
				Image = "component_assets/triangleUp_16",
				imageStyle = reactModule.useMemo(function() --[[ line: 211 ]]
					-- upvalues: mapBindableModule (copy), p12 (ref), var29 (ref), constantsModule (copy)
					return mapBindableModule(p12.increment.isDisabled, function(p13) --[[ line: 212 ]]
						-- upvalues: var29 (copy), constantsModule (copy)
						return {
							Color3 = var29.Color.Stroke.Emphasis.Color3,
							Transparency = if p13 then constantsModule.DISABLED_TRANSPARENCY else 0
						}
					end)
				end, { var29, p12.increment.isDisabled }),
				tag = var30.icon.tag,
				testId = `{p12.testId}--increment-icon`
			})
		}),
		ControlDecrement = reactModule.createElement(var18, {
			tag = var30.downButton.tag,
			onActivated = p12.decrement.onClick,
			isDisabled = if reactIsModule.isBinding(p12.decrement.isDisabled) then false else p12.decrement.isDisabled,
			padding = var30.button.padding,
			testId = `{p12.testId}--decrement`
		}, {
			Icon = reactModule.createElement(imageModule, {
				Image = "component_assets/triangleDown_16",
				imageStyle = reactModule.useMemo(function() --[[ line: 220 ]]
					-- upvalues: mapBindableModule (copy), p12 (ref), var29 (ref), constantsModule (copy)
					return mapBindableModule(p12.decrement.isDisabled, function(p14) --[[ line: 221 ]]
						-- upvalues: var29 (copy), constantsModule (copy)
						return {
							Color3 = var29.Color.Stroke.Emphasis.Color3,
							Transparency = if p14 then constantsModule.DISABLED_TRANSPARENCY else 0
						}
					end)
				end, { var29, p12.decrement.isDisabled }),
				tag = var30.icon.tag,
				testId = `{p12.testId}--decrement-icon`
			})
		})
	})
end

return function(p15) --[[ line: 269 | named "NumberInputControls" ]]
	-- upvalues: numberInputControlsVariantModule (ref), reactModule (ref), StackedControls (ref), SplitControls (ref)
	return if p15.controlsVariant == numberInputControlsVariantModule.Stacked then reactModule.createElement(StackedControls, p15) else reactModule.createElement(SplitControls, p15)
end