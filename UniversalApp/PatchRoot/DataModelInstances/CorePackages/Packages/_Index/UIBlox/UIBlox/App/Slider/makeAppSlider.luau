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

return function(p1, p2)
	-- upvalues: roactModule (ref), divideTransparencyModule (ref), colorsModule (ref), lerpModule (ref), otterModule (ref), t (ref), imagesModule (ref), genericSliderModule (ref)
	local var1 = roactModule.PureComponent:extend("AppSliderFor" .. p0)
	var1.defaultProps = {
		textInputEnabled = false,
		stepInterval = 1,
		customPressedKnobShadowTransparencyLower = 1,
		width = UDim.new(1, 0)
	}
	
	function var8.init(p3)
		-- upvalues: roactModule (copy), divideTransparencyModule (copy), p1 (ref), colorsModule (copy), lerpModule (copy), otterModule (copy), t (copy)
		local _ = nil
		local _ = nil
		local var2, var3 = roactModule.createBinding(0)
		p3.pressedProgressLower = var2
		local var4, var5 = roactModule.createBinding(0)
		p3.pressedProgressUpper = var4
		local var6, var7 = roactModule.createBinding(p3.props.isDisabled)
		p3.disabled = var6
		p3.setDisabled = var7
		local var8, var9 = roactModule.createBinding(p3.props.style)
		p3.style = var8
		p3.setStyle = var9
		p3.wasUnmounted = false
		local var10 = roactModule.joinBindings({
			disabled = p3.disabled,
			pressedProgressLower = p3.pressedProgressLower,
			pressedProgressUpper = p3.pressedProgressUpper,
			style = p3.style
		})
		p3.trackColor = var10:map(function(p4)
			return p4.style.Theme.UIMuted.Color
		end)
		p3.trackTransparency = var10:map(function(p4)
			-- upvalues: divideTransparencyModule (copy)
			return divideTransparencyModule(p4.style.Theme.UIMuted.Transparency, if p4.disabled then 2 else 1)
		end)
		p3.trackFillColor = var10:map(function(p4)
			-- upvalues: p1 (copy)
			return p4.style.Theme[p1].Color
		end)
		p3.trackFillTransparency = var10:map(function(p4)
			-- upvalues: divideTransparencyModule (copy), p1 (copy)
			return divideTransparencyModule(p4.style.Theme[p1].Transparency, if p4.disabled then 2 else 1)
		end)
		p3.knobColorLower = var10:map(function(p4)
			-- upvalues: colorsModule (copy), p1 (copy)
			return if p4.disabled then colorsModule.Pumice else Color3.new(1, 1, 1):lerp(if p1 ~= "SystemPrimaryDefault" then p4.style.Theme[p1].Color else colorsModule.Pumice, p4.pressedProgressLower)
		end)
		p3.knobColorUpper = var10:map(function(p4)
			-- upvalues: colorsModule (copy), p1 (copy)
			return if p4.disabled then colorsModule.Pumice else Color3.new(1, 1, 1):lerp(if p1 ~= "SystemPrimaryDefault" then p4.style.Theme[p1].Color else colorsModule.Pumice, p4.pressedProgressUpper)
		end)
		p3.knobTransparency = var10:map(function(p4)
			-- upvalues: divideTransparencyModule (copy), p1 (copy)
			return divideTransparencyModule(p4.style.Theme[p1].Transparency, if p4.disabled then 2 else 1)
		end)
		p3.knobShadowTransparencyLower = var10:map(function(p4)
			-- upvalues: p3 (ref), lerpModule (copy)
			return if p4.disabled then 1 else lerpModule(p4.style.Theme.DropShadow.Transparency, p3.props.customPressedKnobShadowTransparencyLower, p4.pressedProgressLower)
		end)
		p3.knobShadowTransparencyUpper = var10:map(function(p4)
			-- upvalues: lerpModule (copy)
			return if p4.disabled then 1 else lerpModule(p4.style.Theme.DropShadow.Transparency, 1, p4.pressedProgressUpper)
		end)
		p3.pressedMotorLower = otterModule.createSingleMotor(0)
		p3.pressedMotorLower:onStep(var3)
		p3.pressedMotorUpper = otterModule.createSingleMotor(0)
		p3.pressedMotorUpper:onStep(var5)
		
		function p2.onDragStartLower()
			-- upvalues: p3 (ref), otterModule (copy), t (copy)
			if p3.props.onDragStartLower then
				p3.props.onDragStartLower()
			end
			if not p3.wasUnmounted then
				p3.pressedMotorLower:setGoal(otterModule.spring(1, t))
			end
		end
		
		function p2.onDragStartUpper()
			-- upvalues: p3 (ref), otterModule (copy), t (copy)
			if p3.props.onDragStartUpper then
				p3.props.onDragStartUpper()
			end
			if not p3.wasUnmounted then
				p3.pressedMotorUpper:setGoal(otterModule.spring(1, t))
			end
		end
		
		function p2.onDragEnd()
			-- upvalues: p3 (ref), otterModule (copy), t (copy)
			if p3.props.onDragEnd then
				p3.props.onDragEnd()
			end
			if not p3.wasUnmounted then
				p3.pressedMotorLower:setGoal(otterModule.spring(0, t))
				p3.pressedMotorUpper:setGoal(otterModule.spring(0, t))
			end
		end
	end
	
	function var8.render(p3)
		-- upvalues: imagesModule (copy), roactModule (copy), p2 (ref), genericSliderModule (copy)
		local props = p3.props
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
			onDragStartLower = p3.onDragStartLower,
			onDragStartUpper = p3.onDragStartUpper,
			onDragEnd = p3.onDragEnd,
			trackImage = imagesModule["component_assets/circle_16"],
			trackColor = p3.trackColor,
			trackTransparency = p3.trackTransparency,
			trackSliceCenter = Rect.new(8, 8, 8, 8),
			trackFillImage = imagesModule["component_assets/circle_16"],
			trackFillColor = p3.trackFillColor,
			trackFillTransparency = p3.trackFillTransparency,
			trackFillSliceCenter = Rect.new(8, 8, 8, 8),
			knobImage = imagesModule["component_assets/circle_28_padding_10"],
			knobColorLower = props.customKnobColorLower or p3.knobColorLower,
			knobColorUpper = p3.knobColorUpper,
			knobTransparency = p3.knobTransparency,
			knobImagePadding = 10,
			knobShadowImage = imagesModule["component_assets/dropshadow_28"],
			knobShadowTransparencyLower = p3.knobShadowTransparencyLower,
			knobShadowTransparencyUpper = p3.knobShadowTransparencyUpper,
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
		
		if p2 then
			t.upperValue = props.upperValue
			t.lowerValue = props.lowerValue
		else
			t.lowerValue = props.value
		end
		return roactModule.createElement(genericSliderModule, t)
	end
	
	function var8.didMount(p3)
		p3.pressedMotorLower:start()
		p3.pressedMotorUpper:start()
	end
	
	function var8.didUpdate(p3, p4)
		-- upvalues: otterModule (copy), t (copy)
		if p4.style ~= p3.props.style then
			p3.setStyle(p3.props.style)
		end
		if p4.isDisabled ~= p3.props.isDisabled then
			p3.setDisabled(p3.props.isDisabled)
			
			if p3.props.isDisabled then
				p3.pressedMotorLower:setGoal(otterModule.spring(0, t))
				p3.pressedMotorUpper:setGoal(otterModule.spring(0, t))
			end
		end
	end
	
	function var8.willUnmount(p3)
		p3.wasUnmounted = true
		p3.pressedMotorLower:destroy()
		p3.pressedMotorUpper:destroy()
	end
	
	return var1
end