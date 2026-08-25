local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local otterModule = require(parent_2.Otter)
local colorsModule = require(parent.Style.Colors)
local genericSliderModule = require(parent_1.Core.Slider.GenericSlider)
local imagesModule = require(parent.ImageSet.Images)
local t = { frequency = 5 }
local divideTransparencyModule = require(parent_1.Utility.divideTransparency)
local lerpModule = require(parent_1.Utility.lerp)

return function(p0, p1)
	-- upvalues: roactModule (ref), divideTransparencyModule (ref), colorsModule (ref), lerpModule (ref), otterModule (ref), t (ref), imagesModule (ref), genericSliderModule (ref)
	local var8 = roactModule.PureComponent:extend("AppSliderFor" .. p0)
	var8.defaultProps = {
		textInputEnabled = false,
		stepInterval = 1,
		customPressedKnobShadowTransparencyLower = 1,
		width = UDim.new(1, 0)
	}
	
	function var8.init(p2)
		-- upvalues: roactModule (copy), divideTransparencyModule (copy), p0 (ref), colorsModule (copy), lerpModule (copy), otterModule (copy), t (copy)
		local _ = nil
		local _ = nil
		local var9, var10 = roactModule.createBinding(0)
		p2.pressedProgressLower = var9
		local var11, var12 = roactModule.createBinding(0)
		p2.pressedProgressUpper = var11
		local var13, var14 = roactModule.createBinding(p2.props.isDisabled)
		p2.disabled = var13
		p2.setDisabled = var14
		local var15, var16 = roactModule.createBinding(p2.props.style)
		p2.style = var15
		p2.setStyle = var16
		p2.wasUnmounted = false
		local var17 = roactModule.joinBindings({
			disabled = p2.disabled,
			pressedProgressLower = p2.pressedProgressLower,
			pressedProgressUpper = p2.pressedProgressUpper,
			style = p2.style
		})
		p2.trackColor = var17:map(function(p3)
			return p3.style.Theme.UIMuted.Color
		end)
		p2.trackTransparency = var17:map(function(p4)
			-- upvalues: divideTransparencyModule (copy)
			return divideTransparencyModule(p4.style.Theme.UIMuted.Transparency, if p4.disabled then 2 else 1)
		end)
		p2.trackFillColor = var17:map(function(p5)
			-- upvalues: p0 (copy)
			return p5.style.Theme[p0].Color
		end)
		p2.trackFillTransparency = var17:map(function(p6)
			-- upvalues: divideTransparencyModule (copy), p0 (copy)
			return divideTransparencyModule(p6.style.Theme[p0].Transparency, if p6.disabled then 2 else 1)
		end)
		p2.knobColorLower = var17:map(function(p7)
			-- upvalues: colorsModule (copy), p0 (copy)
			return if p7.disabled then colorsModule.Pumice else Color3.new(1, 1, 1):lerp(if p0 ~= "SystemPrimaryDefault" then p7.style.Theme[p0].Color else colorsModule.Pumice, p7.pressedProgressLower)
		end)
		p2.knobColorUpper = var17:map(function(p8)
			-- upvalues: colorsModule (copy), p0 (copy)
			return if p8.disabled then colorsModule.Pumice else Color3.new(1, 1, 1):lerp(if p0 ~= "SystemPrimaryDefault" then p8.style.Theme[p0].Color else colorsModule.Pumice, p8.pressedProgressUpper)
		end)
		p2.knobTransparency = var17:map(function(p9)
			-- upvalues: divideTransparencyModule (copy), p0 (copy)
			return divideTransparencyModule(p9.style.Theme[p0].Transparency, if p9.disabled then 2 else 1)
		end)
		p2.knobShadowTransparencyLower = var17:map(function(p10)
			-- upvalues: p2 (ref), lerpModule (copy)
			return if p10.disabled then 1 else lerpModule(p10.style.Theme.DropShadow.Transparency, p2.props.customPressedKnobShadowTransparencyLower, p10.pressedProgressLower)
		end)
		p2.knobShadowTransparencyUpper = var17:map(function(p11)
			-- upvalues: lerpModule (copy)
			return if p11.disabled then 1 else lerpModule(p11.style.Theme.DropShadow.Transparency, 1, p11.pressedProgressUpper)
		end)
		p2.pressedMotorLower = otterModule.createSingleMotor(0)
		p2.pressedMotorLower:onStep(var10)
		p2.pressedMotorUpper = otterModule.createSingleMotor(0)
		p2.pressedMotorUpper:onStep(var12)
		
		function p2.onDragStartLower()
			-- upvalues: p2 (ref), otterModule (copy), t (copy)
			if p2.props.onDragStartLower then
				p2.props.onDragStartLower()
			end
			if not p2.wasUnmounted then
				p2.pressedMotorLower:setGoal(otterModule.spring(1, t))
			end
		end
		
		function p2.onDragStartUpper()
			-- upvalues: p2 (ref), otterModule (copy), t (copy)
			if p2.props.onDragStartUpper then
				p2.props.onDragStartUpper()
			end
			if not p2.wasUnmounted then
				p2.pressedMotorUpper:setGoal(otterModule.spring(1, t))
			end
		end
		
		function p2.onDragEnd()
			-- upvalues: p2 (ref), otterModule (copy), t (copy)
			if p2.props.onDragEnd then
				p2.props.onDragEnd()
			end
			if not p2.wasUnmounted then
				p2.pressedMotorLower:setGoal(otterModule.spring(0, t))
				p2.pressedMotorUpper:setGoal(otterModule.spring(0, t))
			end
		end
	end
	
	function var8.render(p12)
		-- upvalues: imagesModule (copy), roactModule (copy), p1 (ref), genericSliderModule (copy)
		local props = p12.props
		local t = {
			min = props.min,
			max = props.max,
			stepInterval = props.stepInterval,
			isDisabled = props.isDisabled,
			width = props.width,
			position = props.position,
			anchorPoint = props.anchorPoint,
			layoutOrder = props.layoutOrder,
			onValueChanged = props.onValueChanged,
			onDragStartLower = p12.onDragStartLower,
			onDragStartUpper = p12.onDragStartUpper,
			onDragEnd = p12.onDragEnd,
			trackImage = imagesModule["component_assets/circle_16"],
			trackColor = p12.trackColor,
			trackTransparency = p12.trackTransparency,
			trackSliceCenter = Rect.new(8, 8, 8, 8),
			trackFillImage = imagesModule["component_assets/circle_16"],
			trackFillColor = p12.trackFillColor,
			trackFillTransparency = p12.trackFillTransparency,
			trackFillSliceCenter = Rect.new(8, 8, 8, 8),
			knobImage = imagesModule["component_assets/circle_28_padding_10"],
			knobColorLower = props.customKnobColorLower or p12.knobColorLower,
			knobColorUpper = p12.knobColorUpper,
			knobTransparency = p12.knobTransparency,
			knobImagePadding = 10,
			knobShadowImage = imagesModule["component_assets/dropshadow_28"],
			knobShadowTransparencyLower = p12.knobShadowTransparencyLower,
			knobShadowTransparencyUpper = p12.knobShadowTransparencyUpper,
			[roactModule.Ref] = props.forwardedRef,
			NextSelectionUp = props.NextSelectionUp,
			NextSelectionDown = props.NextSelectionDown,
			focusController = props.focusController,
			customTrack = props.customTrack,
			customKnobHeight = props.customKnobHeight,
			customKnobBorderSize = props.customKnobBorderSize,
			customKnobBorderColor = props.customKnobBorderColor,
			containerRef = props.containerRef
		}
		
		if p1 then
			t.upperValue = props.upperValue
			t.lowerValue = props.lowerValue
		else
			t.lowerValue = props.value
		end
		return roactModule.createElement(genericSliderModule, t)
	end
	
	function var8.didMount(p13)
		p13.pressedMotorLower:start()
		p13.pressedMotorUpper:start()
	end
	
	function var8.didUpdate(p14, p15)
		-- upvalues: otterModule (copy), t (copy)
		if p15.style ~= p14.props.style then
			p14.setStyle(p14.props.style)
		end
		if p15.isDisabled ~= p14.props.isDisabled then
			p14.setDisabled(p14.props.isDisabled)
			
			if p14.props.isDisabled then
				p14.pressedMotorLower:setGoal(otterModule.spring(0, t))
				p14.pressedMotorUpper:setGoal(otterModule.spring(0, t))
			end
		end
	end
	
	function var8.willUnmount(p16)
		p16.wasUnmounted = true
		p16.pressedMotorLower:destroy()
		p16.pressedMotorUpper:destroy()
	end
	
	return var8
end