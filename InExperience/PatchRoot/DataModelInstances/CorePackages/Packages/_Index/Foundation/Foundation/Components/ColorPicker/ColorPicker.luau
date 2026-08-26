local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local brickColorPickerModule = require(foundation.Components.ColorPicker.BrickColorPicker)
local colorInputModeModule = require(foundation.Enums.ColorInputMode)
local colorInputsModule = require(foundation.Components.ColorPicker.ColorInputs)
local colorSliderModule = require(foundation.Components.ColorPicker.ColorSlider)
local colorSliderTypeModule = require(foundation.Enums.ColorSliderType)
local SVPickerModule = require(foundation.Components.ColorPicker.SVPicker)
local viewModule = require(foundation.Components.View)
local colorUtilsModule = require(foundation.Components.ColorPicker.colorUtils)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local _ = require(foundation.Components.Types)
local t = {
	initialAlpha = 1,
	testId = "--foundation-color-picker",
	initialMode = colorInputModeModule.RGB
}

local function _(p1)
	if type(p1) == "table" then
		return p1.H / 360, (p1.S or 100) / 100, (p1.V or 100) / 100
	end
	return p1:ToHSV()
end

return function(p1)
	-- upvalues: colorInputModeModule (ref), withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), colorUtilsModule (ref), viewModule (ref), withCommonPropsModule (ref), colorInputsModule (ref), brickColorPickerModule (ref), SVPickerModule (ref), colorSliderModule (ref), colorSliderTypeModule (ref)
	local var1, var2, var3
	local availableModes = p1.availableModes or {
		colorInputModeModule.RGB,
		colorInputModeModule.HSV,
		colorInputModeModule.Hex,
		colorInputModeModule.Brick
	}
	local var4 = withDefaultsModule(p1, t)
	local initialColor = var4.initialColor or useTokensModule().Color.Extended.Magenta.Magenta_700.Color3
	local var5, var6 = reactModule.useBinding(initialColor)
	
	if type(initialColor) == "table" then
		var1 = initialColor.H / 360
		var2 = (initialColor.S or 100) / 100
		var3 = (initialColor.V or 100) / 100
	else
		local var7, var8, var9 = initialColor:ToHSV()
		var1 = var7
		var2 = var8
		var3 = var9
	end
	local var10, var11 = reactModule.useBinding(var1)
	local var12, var13 = reactModule.useBinding(var2)
	local var14, var15 = reactModule.useBinding(var3)
	local var16, var17 = reactModule.useBinding(var4.initialAlpha or 1)
	local var18, var19 = reactModule.useState(var4.initialMode or colorInputModeModule.RGB)
	local toColor3 = var5:map(colorUtilsModule.toColor3)
	local var20 = var5:map(function(p2)
		-- upvalues: colorUtilsModule (copy)
		return not colorUtilsModule.isPartialHSV(p2)
	end)
	local var21 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), availableModes (ref), var19 (ref)
		local initialMode = var4.initialMode
		
		if initialMode then
			local var22 = false
			
			for i, v in availableModes do
				if v == initialMode then
					var22 = true
					break
				end
			end
			if not var22 then
				warn(`ColorPicker: initialMode {initialMode} is not in availableModes. Using first available mode.`)
				var19(availableModes[1])
			end
		end
	end, { var4.initialMode })
	local var23 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var6 (ref), var4 (ref)
		var6(p2)
		var4.onColorChanged(p2, p3)
	end, { var4.onColorChanged })
	local var24 = reactModule.useCallback(function(p2)
		-- upvalues: var17 (ref), var4 (ref)
		var17(p2)
		
		if var4.onAlphaChanged then
			var4.onAlphaChanged(p2)
		end
	end, { var4.onAlphaChanged })
	local var25 = reactModule.useCallback(function(p2)
		-- upvalues: var23 (ref)
		var23(p2.Color, p2)
	end, { var23 })
	local var26 = var4.onAlphaChanged ~= nil
	local var27 = reactModule.useCallback(function(p2)
		-- upvalues: var23 (ref)
		var23(p2, nil)
	end, { var23 })
	local var28 = reactModule.useCallback(colorUtilsModule.createHSVUpdateHandler(var11, var13, var15, var27, var21), {
		var27,
		var11,
		var13,
		var15,
		var6
	})
	local var29 = reactModule.useCallback(colorUtilsModule.createColorInputChangeHandler(var27, var21, var11, var13, var15), {
		var27,
		var21,
		var11,
		var13,
		var15
	})
	reactModule.useEffect(function()
		-- upvalues: toColor3 (ref), var11 (ref), var13 (ref), var15 (ref)
		local var30, var31, var32 = toColor3:getValue():ToHSV()
		var11(var30)
		var13(var31)
		var15(var32)
	end, {})
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var4, { tag = "col gap-small size-full-0 auto-y padding-small" }), {
		ColorInputs = reactModule.createElement(colorInputsModule, {
			LayoutOrder = 1,
			color = var5,
			alpha = var16,
			onColorChanged = var29,
			onAlphaChanged = if var26 then var24 else nil,
			mode = var18,
			onModeChanged = var19,
			availableModes = availableModes,
			testId = `{var4.testId}--input`
		}),
		BrickPicker = if var18 == colorInputModeModule.Brick then reactModule.createElement(brickColorPickerModule, {
			LayoutOrder = 2,
			selectedColor = toColor3,
			onBrickColorChanged = var25,
			testId = `{var4.testId}--brick-picker`
		}) else nil,
		SVPickerContainer = if var18 ~= colorInputModeModule.Brick then nil else reactModule.createElement(viewModule, { LayoutOrder = 2, Size = UDim2.new(1, 0, 0, 156) }, {
			SVPicker = reactModule.createElement(SVPickerModule, {
				hue = var10,
				saturation = var12,
				value = var14,
				onChanged = function(p2, p3)
					-- upvalues: var28 (ref), var10 (ref)
					var28(var10:getValue(), p2, p3)
				end,
				onDragStarted = var4.onDragStarted,
				onDragEnded = var4.onDragEnded,
				showSelectionKnob = var20:getValue(),
				testId = `{var4.testId}--sv-picker`
			})
		}),
		HueSlider = if var18 ~= colorInputModeModule.Brick then nil else reactModule.createElement(colorSliderModule, {
			LayoutOrder = 3,
			sliderType = colorSliderTypeModule.Hue,
			value = var10,
			onValueChanged = function(p2)
				-- upvalues: var28 (ref), var12 (ref), var14 (ref)
				var28(p2, var12:getValue(), var14:getValue())
			end,
			onDragStarted = var4.onDragStarted,
			onDragEnded = var4.onDragEnded,
			testId = `{var4.testId}--hue-slider`
		}),
		AlphaSlider = if var26 then reactModule.createElement(colorSliderModule, {
			LayoutOrder = 4,
			sliderType = colorSliderTypeModule.Alpha,
			value = var16,
			baseColor = toColor3,
			onValueChanged = var24,
			onDragStarted = var4.onDragStarted,
			onDragEnded = var4.onDragEnded,
			testId = `{var4.testId}--alpha-slider`
		}) else nil
	})
end