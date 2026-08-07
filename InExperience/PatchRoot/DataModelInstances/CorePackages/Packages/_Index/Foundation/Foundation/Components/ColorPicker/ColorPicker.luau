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

local function _(p0) --[[ line: 40 | named "resolveInitialHSV" ]]
	if type(p0) == "table" then
		return p0.H / 360, (p0.S or 100) / 100, (p0.V or 100) / 100
	end
	return p0:ToHSV()
end

return function(p1) --[[ line: 48 | named "ColorPicker" ]]
	-- upvalues: colorInputModeModule (ref), withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), colorUtilsModule (ref), viewModule (ref), withCommonPropsModule (ref), colorInputsModule (ref), brickColorPickerModule (ref), SVPickerModule (ref), colorSliderModule (ref), colorSliderTypeModule (ref)
	local var19, var20, var21
	local availableModes = p1.availableModes or {
		colorInputModeModule.RGB,
		colorInputModeModule.HSV,
		colorInputModeModule.Hex,
		colorInputModeModule.Brick
	}
	local var15 = withDefaultsModule(p1, t)
	local initialColor = var15.initialColor or useTokensModule().Color.Extended.Magenta.Magenta_700.Color3
	local var17, var18 = reactModule.useBinding(initialColor)
	
	if type(initialColor) == "table" then
		var19 = initialColor.H / 360
		var20 = (initialColor.S or 100) / 100
		var21 = (initialColor.V or 100) / 100
	else
		local var22, var23, var24 = initialColor:ToHSV()
		var19 = var22
		var20 = var23
		var21 = var24
	end
	local var25, var26 = reactModule.useBinding(var19)
	local var27, var28 = reactModule.useBinding(var20)
	local var29, var30 = reactModule.useBinding(var21)
	local var31, var32 = reactModule.useBinding(var15.initialAlpha or 1)
	local var33, var34 = reactModule.useState(var15.initialMode or colorInputModeModule.RGB)
	local toColor3 = var17:map(colorUtilsModule.toColor3)
	local var36 = var17:map(function(p2) --[[ line: 70 ]]
		-- upvalues: colorUtilsModule (copy)
		return not colorUtilsModule.isPartialHSV(p2)
	end)
	local var37 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 76 ]]
		-- upvalues: var15 (ref), availableModes (ref), var34 (ref)
		local initialMode = var15.initialMode
		
		if initialMode then
			local var45 = false
			
			for i, v in availableModes do
				if v == initialMode then
					var45 = true
					break
				end
			end
			if not var45 then
				warn(`ColorPicker: initialMode {initialMode} is not in availableModes. Using first available mode.`)
				var34(availableModes[1])
			end
		end
	end, { var15.initialMode })
	local var38 = reactModule.useCallback(function(p3, p4) --[[ line: 95 ]]
		-- upvalues: var18 (ref), var15 (ref)
		var18(p3)
		var15.onColorChanged(p3, p4)
	end, { var15.onColorChanged })
	local var39 = reactModule.useCallback(function(p5) --[[ line: 100 ]]
		-- upvalues: var32 (ref), var15 (ref)
		var32(p5)
		
		if var15.onAlphaChanged then
			var15.onAlphaChanged(p5)
		end
	end, { var15.onAlphaChanged })
	local var40 = reactModule.useCallback(function(p6) --[[ line: 107 ]]
		-- upvalues: var38 (ref)
		var38(p6.Color, p6)
	end, { var38 })
	local var41 = var15.onAlphaChanged ~= nil
	local var42 = reactModule.useCallback(function(p7) --[[ line: 113 ]]
		-- upvalues: var38 (ref)
		var38(p7, nil)
	end, { var38 })
	local var43 = reactModule.useCallback(colorUtilsModule.createHSVUpdateHandler(var26, var28, var30, var42, var37), {
		var42,
		var26,
		var28,
		var30,
		var18
	})
	local var44 = reactModule.useCallback(colorUtilsModule.createColorInputChangeHandler(var42, var37, var26, var28, var30), {
		var42,
		var37,
		var26,
		var28,
		var30
	})
	reactModule.useEffect(function() --[[ line: 139 ]]
		-- upvalues: toColor3 (ref), var26 (ref), var28 (ref), var30 (ref)
		local var46, var47, var48 = toColor3:getValue():ToHSV()
		var26(var46)
		var28(var47)
		var30(var48)
	end, {})
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var15, { tag = "col gap-small size-full-0 auto-y padding-small" }), {
		ColorInputs = reactModule.createElement(colorInputsModule, {
			LayoutOrder = 1,
			color = var17,
			alpha = var31,
			onColorChanged = var44,
			onAlphaChanged = if var41 then var39 else nil,
			mode = var33,
			onModeChanged = var34,
			availableModes = availableModes,
			testId = `{var15.testId}--input`
		}),
		BrickPicker = if var33 == colorInputModeModule.Brick then reactModule.createElement(brickColorPickerModule, {
			LayoutOrder = 2,
			selectedColor = toColor3,
			onBrickColorChanged = var40,
			testId = `{var15.testId}--brick-picker`
		}) else nil,
		SVPickerContainer = if var33 ~= colorInputModeModule.Brick then nil else reactModule.createElement(viewModule, { LayoutOrder = 2, Size = UDim2.new(1, 0, 0, 156) }, {
			SVPicker = reactModule.createElement(SVPickerModule, {
				hue = var25,
				saturation = var27,
				value = var29,
				onChanged = function(p8, p9) --[[ line: 182 ]]
					-- upvalues: var43 (ref), var25 (ref)
					var43(var25:getValue(), p8, p9)
				end,
				onDragStarted = var15.onDragStarted,
				onDragEnded = var15.onDragEnded,
				showSelectionKnob = var36:getValue(),
				testId = `{var15.testId}--sv-picker`
			})
		}),
		HueSlider = if var33 ~= colorInputModeModule.Brick then nil else reactModule.createElement(colorSliderModule, {
			LayoutOrder = 3,
			sliderType = colorSliderTypeModule.Hue,
			value = var25,
			onValueChanged = function(p10) --[[ line: 197 ]]
				-- upvalues: var43 (ref), var27 (ref), var29 (ref)
				var43(p10, var27:getValue(), var29:getValue())
			end,
			onDragStarted = var15.onDragStarted,
			onDragEnded = var15.onDragEnded,
			testId = `{var15.testId}--hue-slider`
		}),
		AlphaSlider = if var41 then reactModule.createElement(colorSliderModule, {
			LayoutOrder = 4,
			sliderType = colorSliderTypeModule.Alpha,
			value = var31,
			baseColor = toColor3,
			onValueChanged = var39,
			onDragStarted = var15.onDragStarted,
			onDragEnded = var15.onDragEnded,
			testId = `{var15.testId}--alpha-slider`
		}) else nil
	})
end