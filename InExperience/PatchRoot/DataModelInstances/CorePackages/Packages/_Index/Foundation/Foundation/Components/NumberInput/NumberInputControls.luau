local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local Components = Foundation.Components
local FlagsModule = require(Foundation.Utility.Flags)
local ConstantsModule = require(Foundation.Constants)
local IconModule = require(Components.Icon)
local ImageModule = require(Components.Image)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Components.View)
local BlendTransparenciesModule = require(Foundation.Utility.blendTransparencies)
local MapBindableModule = require(Foundation.Utility.mapBindable)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local UseNumberInputVariantsModule = require(Components.NumberInput.useNumberInputVariants)
local UseTextInputVariantsModule = require(Components.TextInput.useTextInputVariants)
local _ = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Enums.IconSize)
local _ = require(Foundation.Enums.InputVariant)
local NumberInputControlsVariantModule = require(Foundation.Enums.NumberInputControlsVariant)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)

local function v23(p1)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ReactIsModule (copy), MapBindableModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local _UDim = UDim.new(0, UseTokensModuleResult.Radius.Medium)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(p1, {
		onActivated = p1.onActivated,
		isDisabled = not ReactIsModule.isBinding(p1.isDisabled) and p1.isDisabled,
		selection = {
			Selectable = MapBindableModule(p1.isDisabled, function(p2): boolean
				return not p2
			end)
		},
		cursor = ReactModule.useMemo(function()
			-- upvalues: _UDim (copy), UseTokensModuleResult (copy)
			return {
				radius = _UDim,
				offset = UseTokensModuleResult.Size.Size_150,
				borderWidth = UseTokensModuleResult.Stroke.Thicker
			}
		end, { UseTokensModuleResult }),
		padding = p1.padding,
		cornerRadius = _UDim,
		tag = p1.tag
	}), p1.children)
end

local function SplitControls(p1)
	-- upvalues: UseTokensModule (copy), UseNumberInputVariantsModule (copy), UseTextInputVariantsModule (copy), ReactModule (copy), MapBindableModule (copy), BlendTransparenciesModule (copy), ConstantsModule (copy), ViewModule (copy), ReactIsModule (copy), StateLayerAffordanceModule (copy), IconModule (copy), BuilderIconsModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseNumberInputVariantsModuleResult = UseNumberInputVariantsModule(UseTokensModuleResult, p1.size, p1.controlsVariant)
	local Container = UseTextInputVariantsModule(UseTokensModuleResult, p1.size, p1.variant).container
	local ScaledCeiled = math.ceil(UseTokensModuleResult.Stroke.Standard) * 2
	local _UDim2 = UDim2.fromOffset(UseNumberInputVariantsModuleResult.splitButton.size - ScaledCeiled, UseNumberInputVariantsModuleResult.splitButton.size - ScaledCeiled)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: Container (copy), MapBindableModule (upval), BlendTransparenciesModule (upval), ConstantsModule (upval)
		return if Container.strokeStyle and Container.strokeThickness then {
			Color = Container.strokeStyle.Color3,
			Transparency = MapBindableModule(p2, function(p3)
				-- upvalues: BlendTransparenciesModule (upval), Container (upval), ConstantsModule (upval)
				return if p3 then BlendTransparenciesModule(Container.strokeStyle.Transparency, ConstantsModule.DISABLED_TRANSPARENCY) else Container.strokeStyle.Transparency
			end),
			Thickness = Container.strokeThickness,
			BorderStrokePosition = Enum.BorderStrokePosition.Inner
		} else nil
	end, { Container.strokeStyle, Container.strokeThickness })
	
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		ControlIncrement = ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			onActivated = p1.increment.onClick,
			isDisabled = not ReactIsModule.isBinding(p1.increment.isDisabled) and p1.increment.isDisabled,
			stateLayer = {
				affordance = MapBindableModule(p1.increment.isDisabled, function(p2)
					-- upvalues: StateLayerAffordanceModule (upval)
					return if p2 then StateLayerAffordanceModule.None else StateLayerAffordanceModule.Background
				end)
			},
			padding = UseNumberInputVariantsModuleResult.button.padding,
			Size = _UDim2,
			stroke = UseResult(p1.increment.isDisabled),
			tag = UseNumberInputVariantsModuleResult.splitButton.tag,
			testId = `{p1.testId}--increment`
		}, {
			Icon = ReactModule.createElement(IconModule, {
				name = BuilderIconsModule.Icon.PlusSmall,
				size = p1.size,
				style = MapBindableModule(p1.increment.isDisabled, function(p2)
					-- upvalues: ConstantsModule (upval)
					return {
						Color3 = nil,
						Transparency = if p2 then ConstantsModule.DISABLED_TRANSPARENCY else nil
					}
				end),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				testId = `{p1.testId}--increment-icon`
			})
		}),
		ControlDecrement = ReactModule.createElement(ViewModule, {
			LayoutOrder = -1,
			onActivated = p1.decrement.onClick,
			isDisabled = not ReactIsModule.isBinding(p1.decrement.isDisabled) and p1.decrement.isDisabled,
			stateLayer = {
				affordance = MapBindableModule(p1.decrement.isDisabled, function(p2)
					-- upvalues: StateLayerAffordanceModule (upval)
					return if p2 then StateLayerAffordanceModule.None else StateLayerAffordanceModule.Background
				end)
			},
			padding = UseNumberInputVariantsModuleResult.button.padding,
			Size = _UDim2,
			stroke = UseResult(p1.decrement.isDisabled),
			tag = UseNumberInputVariantsModuleResult.splitButton.tag,
			testId = `{p1.testId}--decrement`
		}, {
			Icon = ReactModule.createElement(IconModule, {
				name = BuilderIconsModule.Icon.MinusSmall,
				size = p1.size,
				style = MapBindableModule(p1.decrement.isDisabled, function(p2)
					-- upvalues: ConstantsModule (upval)
					return {
						Color3 = nil,
						Transparency = if p2 then ConstantsModule.DISABLED_TRANSPARENCY else nil
					}
				end),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				testId = `{p1.testId}--decrement-icon`
			})
		})
	})
end

local function StackedControls(Frame)
	-- upvalues: UseTokensModule (copy), UseNumberInputVariantsModule (copy), ReactModule (copy), MapBindableModule (copy), ConstantsModule (copy), ViewModule (copy), v23 (copy), ReactIsModule (copy), ImageModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseNumberInputVariantsModuleResult = UseNumberInputVariantsModule(UseTokensModuleResult, Frame.size, Frame.controlsVariant)
	
	return ReactModule.createElement(ViewModule, {
		tag = "col",
		Size = UDim2.new(0, UseNumberInputVariantsModuleResult.button.width, 1, 0),
		LayoutOrder = Frame.LayoutOrder
	}, {
		ControlIncrement = ReactModule.createElement(v23, {
			onActivated = Frame.increment.onClick,
			isDisabled = not ReactIsModule.isBinding(Frame.increment.isDisabled) and Frame.increment.isDisabled,
			padding = UseNumberInputVariantsModuleResult.button.padding,
			tag = UseNumberInputVariantsModuleResult.upButton.tag,
			testId = `{Frame.testId}--increment`
		}, {
			Icon = ReactModule.createElement(ImageModule, {
				Image = "component_assets/triangleUp_16",
				imageStyle = ReactModule.useMemo(function()
					-- upvalues: MapBindableModule (upval), Frame (copy), UseTokensModuleResult (copy), ConstantsModule (upval)
					return MapBindableModule(Frame.increment.isDisabled, function(p1)
						-- upvalues: UseTokensModuleResult (upval), ConstantsModule (upval)
						return {
							Color3 = UseTokensModuleResult.Color.Stroke.Emphasis.Color3,
							Transparency = if p1 then ConstantsModule.DISABLED_TRANSPARENCY else 0
						}
					end)
				end, { UseTokensModuleResult, Frame.increment.isDisabled }),
				tag = UseNumberInputVariantsModuleResult.icon.tag,
				testId = `{Frame.testId}--increment-icon`
			})
		}),
		ControlDecrement = ReactModule.createElement(v23, {
			tag = UseNumberInputVariantsModuleResult.downButton.tag,
			onActivated = Frame.decrement.onClick,
			isDisabled = not ReactIsModule.isBinding(Frame.decrement.isDisabled) and Frame.decrement.isDisabled,
			padding = UseNumberInputVariantsModuleResult.button.padding,
			testId = `{Frame.testId}--decrement`
		}, {
			Icon = ReactModule.createElement(ImageModule, {
				Image = "component_assets/triangleDown_16",
				imageStyle = ReactModule.useMemo(function()
					-- upvalues: MapBindableModule (upval), Frame (copy), UseTokensModuleResult (copy), ConstantsModule (upval)
					return MapBindableModule(Frame.decrement.isDisabled, function(p1)
						-- upvalues: UseTokensModuleResult (upval), ConstantsModule (upval)
						return {
							Color3 = UseTokensModuleResult.Color.Stroke.Emphasis.Color3,
							Transparency = if p1 then ConstantsModule.DISABLED_TRANSPARENCY else 0
						}
					end)
				end, { UseTokensModuleResult, Frame.decrement.isDisabled }),
				tag = UseNumberInputVariantsModuleResult.icon.tag,
				testId = `{Frame.testId}--decrement-icon`
			})
		})
	})
end

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
	local Controls = UseNumberInputVariantsModule(UseTokensModule(), p1.size, nil).controls
	
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
	-- upvalues: FlagsModule (copy), ReactModule (copy), IncrementControls (copy), NumberInputControlsVariantModule (copy), StackedControls (copy), SplitControls (copy)
	return if FlagsModule.FoundationNumberInputBeta then ReactModule.createElement(IncrementControls, p1) elseif p1.controlsVariant == NumberInputControlsVariantModule.Stacked then ReactModule.createElement(StackedControls, p1) else ReactModule.createElement(SplitControls, p1)
end