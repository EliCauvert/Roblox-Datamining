local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local OtterModule = require(Parent2.Otter)
local ColorsModule = require(Parent.Style.Colors)
local GenericSliderModule = require(Parent1.Core.Slider.GenericSlider)
local ImagesModule = require(Parent.ImageSet.Images)
local config = { frequency = 5 }
local DivideTransparencyModule = require(Parent1.Utility.divideTransparency)
local LerpModule = require(Parent1.Utility.lerp)

return function(Text, p1)
	-- upvalues: RoactModule (copy), DivideTransparencyModule (copy), ColorsModule (copy), LerpModule (copy), OtterModule (copy), config (copy), ImagesModule (copy), GenericSliderModule (copy)
	local ExtendResult = RoactModule.PureComponent:extend("AppSliderFor" .. Text)
	ExtendResult.defaultProps = {
		textInputEnabled = false,
		stepInterval = 1,
		customPressedKnobShadowTransparencyLower = 1,
		width = UDim.new(1, 0)
	}
	
	function ExtendResult.init(p2)
		-- upvalues: RoactModule (upval), DivideTransparencyModule (upval), Text (copy), ColorsModule (upval), LerpModule (upval), OtterModule (upval), config (upval)
		local Binding2
		p2.pressedProgressLower, Binding2 = RoactModule.createBinding(0)
		local Binding2_1
		p2.pressedProgressUpper, Binding2_1 = RoactModule.createBinding(0)
		p2.disabled, p2.setDisabled = RoactModule.createBinding(p2.props.isDisabled)
		p2.style, p2.setStyle = RoactModule.createBinding(p2.props.style)
		p2.wasUnmounted = false
		local JoinBindingsResult = RoactModule.joinBindings({
			disabled = p2.disabled,
			pressedProgressLower = p2.pressedProgressLower,
			pressedProgressUpper = p2.pressedProgressUpper,
			style = p2.style
		})
		p2.trackColor = JoinBindingsResult:map(function(p3)
			return p3.style.Theme.UIMuted.Color
		end)
		p2.trackTransparency = JoinBindingsResult:map(function(p3)
			-- upvalues: DivideTransparencyModule (upval)
			return DivideTransparencyModule(p3.style.Theme.UIMuted.Transparency, if p3.disabled then 2 else 1)
		end)
		p2.trackFillColor = JoinBindingsResult:map(function(p3)
			-- upvalues: Text (upval)
			return p3.style.Theme[Text].Color
		end)
		p2.trackFillTransparency = JoinBindingsResult:map(function(p3)
			-- upvalues: DivideTransparencyModule (upval), Text (upval)
			return DivideTransparencyModule(p3.style.Theme[Text].Transparency, if p3.disabled then 2 else 1)
		end)
		p2.knobColorLower = JoinBindingsResult:map(function(p3)
			-- upvalues: ColorsModule (upval), Text (upval)
			return if p3.disabled then ColorsModule.Pumice else Color3.new(1, 1, 1):lerp(if Text == "SystemPrimaryDefault" then ColorsModule.Pumice else p3.style.Theme[Text].Color, p3.pressedProgressLower)
		end)
		p2.knobColorUpper = JoinBindingsResult:map(function(p3)
			-- upvalues: ColorsModule (upval), Text (upval)
			return if p3.disabled then ColorsModule.Pumice else Color3.new(1, 1, 1):lerp(if Text == "SystemPrimaryDefault" then ColorsModule.Pumice else p3.style.Theme[Text].Color, p3.pressedProgressUpper)
		end)
		p2.knobTransparency = JoinBindingsResult:map(function(p3)
			-- upvalues: DivideTransparencyModule (upval), Text (upval)
			return DivideTransparencyModule(p3.style.Theme[Text].Transparency, if p3.disabled then 2 else 1)
		end)
		p2.knobShadowTransparencyLower = JoinBindingsResult:map(function(p3)
			-- upvalues: p2 (copy), LerpModule (upval)
			return if p3.disabled then 1 else LerpModule(p3.style.Theme.DropShadow.Transparency, p2.props.customPressedKnobShadowTransparencyLower, p3.pressedProgressLower)
		end)
		p2.knobShadowTransparencyUpper = JoinBindingsResult:map(function(p3)
			-- upvalues: LerpModule (upval)
			return if p3.disabled then 1 else LerpModule(p3.style.Theme.DropShadow.Transparency, 1, p3.pressedProgressUpper)
		end)
		p2.pressedMotorLower = OtterModule.createSingleMotor(0)
		p2.pressedMotorLower:onStep(Binding2)
		p2.pressedMotorUpper = OtterModule.createSingleMotor(0)
		p2.pressedMotorUpper:onStep(Binding2_1)
		
		function p2.onDragStartLower()
			-- upvalues: p2 (copy), OtterModule (upval), config (upval)
			if p2.props.onDragStartLower then
				p2.props.onDragStartLower()
			end
			if not p2.wasUnmounted then
				p2.pressedMotorLower:setGoal(OtterModule.spring(1, config))
			end
		end
		
		function p2.onDragStartUpper()
			-- upvalues: p2 (copy), OtterModule (upval), config (upval)
			if p2.props.onDragStartUpper then
				p2.props.onDragStartUpper()
			end
			if not p2.wasUnmounted then
				p2.pressedMotorUpper:setGoal(OtterModule.spring(1, config))
			end
		end
		
		function p2.onDragEnd()
			-- upvalues: p2 (copy), OtterModule (upval), config (upval)
			if p2.props.onDragEnd then
				p2.props.onDragEnd()
			end
			if not p2.wasUnmounted then
				p2.pressedMotorLower:setGoal(OtterModule.spring(0, config))
				p2.pressedMotorUpper:setGoal(OtterModule.spring(0, config))
			end
		end
	end
	
	function ExtendResult.render(p2)
		-- upvalues: ImagesModule (upval), RoactModule (upval), p1 (copy), GenericSliderModule (upval)
		local Props = p2.props
		local config = {
			min = Props.min,
			max = Props.max,
			stepInterval = Props.stepInterval,
			isDisabled = Props.isDisabled,
			width = Props.width,
			position = Props.position,
			anchorPoint = Props.anchorPoint,
			layoutOrder = Props.layoutOrder,
			onValueChanged = Props.onValueChanged,
			onDragStartLower = p2.onDragStartLower,
			onDragStartUpper = p2.onDragStartUpper,
			onDragEnd = p2.onDragEnd,
			trackImage = ImagesModule["component_assets/circle_16"],
			trackColor = p2.trackColor,
			trackTransparency = p2.trackTransparency,
			trackSliceCenter = Rect.new(8, 8, 8, 8),
			trackFillImage = ImagesModule["component_assets/circle_16"],
			trackFillColor = p2.trackFillColor,
			trackFillTransparency = p2.trackFillTransparency,
			trackFillSliceCenter = Rect.new(8, 8, 8, 8),
			knobImage = ImagesModule["component_assets/circle_28_padding_10"],
			knobColorLower = Props.customKnobColorLower or p2.knobColorLower,
			knobColorUpper = p2.knobColorUpper,
			knobTransparency = p2.knobTransparency,
			knobImagePadding = 10,
			knobShadowImage = ImagesModule["component_assets/dropshadow_28"],
			knobShadowTransparencyLower = p2.knobShadowTransparencyLower,
			knobShadowTransparencyUpper = p2.knobShadowTransparencyUpper,
			[RoactModule.Ref] = Props.forwardedRef,
			NextSelectionUp = Props.NextSelectionUp,
			NextSelectionDown = Props.NextSelectionDown,
			focusController = Props.focusController,
			customTrack = Props.customTrack,
			customKnobHeight = Props.customKnobHeight,
			customKnobBorderSize = Props.customKnobBorderSize,
			customKnobBorderColor = Props.customKnobBorderColor,
			containerRef = Props.containerRef
		}
		
		if p1 then
			config.upperValue = Props.upperValue
			config.lowerValue = Props.lowerValue
		else
			config.lowerValue = Props.value
		end
		return RoactModule.createElement(GenericSliderModule, config)
	end
	
	function ExtendResult.didMount(p2)
		p2.pressedMotorLower:start()
		p2.pressedMotorUpper:start()
	end
	
	function ExtendResult.didUpdate(p2, p3)
		-- upvalues: OtterModule (upval), config (upval)
		if p3.style ~= p2.props.style then
			p2.setStyle(p2.props.style)
		end
		if p3.isDisabled ~= p2.props.isDisabled then
			p2.setDisabled(p2.props.isDisabled)
			
			if p2.props.isDisabled then
				p2.pressedMotorLower:setGoal(OtterModule.spring(0, config))
				p2.pressedMotorUpper:setGoal(OtterModule.spring(0, config))
			end
		end
	end
	
	function ExtendResult.willUnmount(p2)
		p2.wasUnmounted = true
		p2.pressedMotorLower:destroy()
		p2.pressedMotorUpper:destroy()
	end
	
	return ExtendResult
end