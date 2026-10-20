local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local BrickColorPickerModule = require(Foundation.Components.ColorPicker.BrickColorPicker)
local ColorInputModeModule = require(Foundation.Enums.ColorInputMode)
local ColorInputsModule = require(Foundation.Components.ColorPicker.ColorInputs)
local ColorSliderModule = require(Foundation.Components.ColorPicker.ColorSlider)
local ColorSliderTypeModule = require(Foundation.Enums.ColorSliderType)
local SVPickerModule = require(Foundation.Components.ColorPicker.SVPicker)
local ViewModule = require(Foundation.Components.View)
local ColorUtilsModule = require(Foundation.Components.ColorPicker.colorUtils)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(Foundation.Components.Types)
local config = {
	initialAlpha = 1,
	testId = "--foundation-color-picker",
	initialMode = ColorInputModeModule.RGB
}

local function _(p1)
	if type(p1) == "table" then
		return p1.H / 360, (p1.S or 100) / 100, (p1.V or 100) / 100
	else
		return p1:ToHSV()
	end
end

return function(p1)
	-- upvalues: ColorInputModeModule (copy), WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), ColorUtilsModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ColorInputsModule (copy), BrickColorPickerModule (copy), SVPickerModule (copy), ColorSliderModule (copy), ColorSliderTypeModule (copy)
	local AvailableModes = p1.availableModes or {
		ColorInputModeModule.RGB,
		ColorInputModeModule.HSV,
		ColorInputModeModule.Hex,
		ColorInputModeModule.Brick
	}
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local MagentaColor3 = UseTokensModule().Color.Extended.Magenta.Magenta_700.Color3
	local InitialColor = WithDefaultsModuleResult.initialColor or MagentaColor3
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(InitialColor)
	local v1 = nil
	local HRatio = nil
	local v2 = nil
	
	if type(InitialColor) == "table" then
		HRatio = InitialColor.H / 360
		v1 = (InitialColor.S or 100) / 100
		v2 = (InitialColor.V or 100) / 100
	else
		HRatio, v1, v24 = InitialColor:ToHSV()
	end
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(HRatio)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(v1)
	local UseBindingResult4, UseBindingResult2_3 = ReactModule.useBinding(v2)
	local UseBindingResult5, UseBindingResult2_4 = ReactModule.useBinding(WithDefaultsModuleResult.initialAlpha or 1)
	local UseStateResult, UseStateResult2 = ReactModule.useState(WithDefaultsModuleResult.initialMode or ColorInputModeModule.RGB)
	local MapResult = UseBindingResult:map(ColorUtilsModule.toColor3)
	local MapResult1 = UseBindingResult:map(function(p2): boolean
		-- upvalues: ColorUtilsModule (upval)
		return not ColorUtilsModule.isPartialHSV(p2)
	end)
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: WithDefaultsModuleResult (copy), AvailableModes (copy), UseStateResult2 (copy)
		local InitialMode = WithDefaultsModuleResult.initialMode
		
		if InitialMode then
			local Flag = false
			
			for _, availableMode in AvailableModes do
				if availableMode == InitialMode then
					Flag = true
					break
				end
			end
			if not Flag then
				warn(`ColorPicker: initialMode {InitialMode} is not in availableModes. Using first available mode.`)
				UseStateResult2(AvailableModes[1])
			end
		end
	end, { WithDefaultsModuleResult.initialMode })
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseBindingResult2 (copy), WithDefaultsModuleResult (copy)
		UseBindingResult2(p2)
		WithDefaultsModuleResult.onColorChanged(p2, p3)
	end, { WithDefaultsModuleResult.onColorChanged })
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseBindingResult2_4 (copy), WithDefaultsModuleResult (copy)
		UseBindingResult2_4(p2)
		
		if WithDefaultsModuleResult.onAlphaChanged then
			WithDefaultsModuleResult.onAlphaChanged(p2)
		end
	end, { WithDefaultsModuleResult.onAlphaChanged })
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseResult (copy)
		UseResult(p2.Color, p2)
	end, { UseResult })
	local HasOnAlphaChanged = WithDefaultsModuleResult.onAlphaChanged ~= nil
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: UseResult (copy)
		UseResult(p2, nil)
	end, { UseResult })
	local UseResult4 = ReactModule.useCallback(ColorUtilsModule.createHSVUpdateHandler(UseBindingResult2_1, UseBindingResult2_2, UseBindingResult2_3, UseResult3, UseRefResult), {
		UseResult3,
		UseBindingResult2_1,
		UseBindingResult2_2,
		UseBindingResult2_3,
		UseBindingResult2
	})
	local UseResult5 = ReactModule.useCallback(ColorUtilsModule.createColorInputChangeHandler(UseResult3, UseRefResult, UseBindingResult2_1, UseBindingResult2_2, UseBindingResult2_3), {
		UseResult3,
		UseRefResult,
		UseBindingResult2_1,
		UseBindingResult2_2,
		UseBindingResult2_3
	})
	ReactModule.useEffect(function()
		-- upvalues: MapResult (copy), UseBindingResult2_1 (copy), UseBindingResult2_2 (copy), UseBindingResult2_3 (copy)
		local HSV, HSV2, HSV3 = MapResult:getValue():ToHSV()
		UseBindingResult2_1(HSV)
		UseBindingResult2_2(HSV2)
		UseBindingResult2_3(HSV3)
	end, {})
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { tag = "col gap-small size-full-0 auto-y padding-small" }), {
		ColorInputs = ReactModule.createElement(ColorInputsModule, {
			LayoutOrder = 1,
			color = UseBindingResult,
			alpha = UseBindingResult5,
			onColorChanged = UseResult5,
			onAlphaChanged = if HasOnAlphaChanged then UseResult1 else nil,
			mode = UseStateResult,
			onModeChanged = UseStateResult2,
			availableModes = AvailableModes,
			testId = `{WithDefaultsModuleResult.testId}--input`
		}),
		BrickPicker = if UseStateResult == ColorInputModeModule.Brick then ReactModule.createElement(BrickColorPickerModule, {
			LayoutOrder = 2,
			selectedColor = MapResult,
			onBrickColorChanged = UseResult2,
			testId = `{WithDefaultsModuleResult.testId}--brick-picker`
		}) else nil,
		SVPickerContainer = if UseStateResult == ColorInputModeModule.Brick then nil else ReactModule.createElement(ViewModule, { LayoutOrder = 2, Size = UDim2.new(1, 0, 0, 156) }, {
			SVPicker = ReactModule.createElement(SVPickerModule, {
				hue = UseBindingResult1,
				saturation = UseBindingResult3,
				value = UseBindingResult4,
				onChanged = function(p2, p3)
					-- upvalues: UseResult4 (copy), UseBindingResult1 (copy)
					UseResult4(UseBindingResult1:getValue(), p2, p3)
				end,
				onDragStarted = WithDefaultsModuleResult.onDragStarted,
				onDragEnded = WithDefaultsModuleResult.onDragEnded,
				showSelectionKnob = MapResult1:getValue(),
				testId = `{WithDefaultsModuleResult.testId}--sv-picker`
			})
		}),
		HueSlider = if UseStateResult == ColorInputModeModule.Brick then nil else ReactModule.createElement(ColorSliderModule, {
			LayoutOrder = 3,
			sliderType = ColorSliderTypeModule.Hue,
			value = UseBindingResult1,
			onValueChanged = function(p2)
				-- upvalues: UseResult4 (copy), UseBindingResult3 (copy), UseBindingResult4 (copy)
				UseResult4(p2, UseBindingResult3:getValue(), UseBindingResult4:getValue())
			end,
			onDragStarted = WithDefaultsModuleResult.onDragStarted,
			onDragEnded = WithDefaultsModuleResult.onDragEnded,
			testId = `{WithDefaultsModuleResult.testId}--hue-slider`
		}),
		AlphaSlider = if HasOnAlphaChanged then ReactModule.createElement(ColorSliderModule, {
			LayoutOrder = 4,
			sliderType = ColorSliderTypeModule.Alpha,
			value = UseBindingResult5,
			baseColor = MapResult,
			onValueChanged = UseResult1,
			onDragStarted = WithDefaultsModuleResult.onDragStarted,
			onDragEnded = WithDefaultsModuleResult.onDragEnded,
			testId = `{WithDefaultsModuleResult.testId}--alpha-slider`
		}) else nil
	})
end