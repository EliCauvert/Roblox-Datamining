local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local CalculateAdjacentStepValueModule = require(Foundation.Components.InternalSlider.calculateAdjacentStepValue)
local FormatInputSliderValueModule = require(script.Parent.formatInputSliderValue)
local ServicesModule = require(Foundation.Utility.Wrappers.Services)
local OnChangeCallbackReasonModule = require(Foundation.Enums.OnChangeCallbackReason)
local SliderStepDirectionModule = require(Foundation.Components.InternalSlider.SliderStepDirection)

local function _(p1)
	local Number: number? = tonumber(p1)
	
	return if Number == Number then Number else nil
end

local _ = function(KeyCode)
	-- upvalues: SliderStepDirectionModule (copy)
	return if KeyCode == Enum.KeyCode.Up then SliderStepDirectionModule.Increment elseif KeyCode == Enum.KeyCode.Down then SliderStepDirectionModule.Decrement else nil
end

return function(p1)
	-- upvalues: ReactModule (copy), FormatInputSliderValueModule (copy), CalculateAdjacentStepValueModule (copy), SliderStepDirectionModule (copy), OnChangeCallbackReasonModule (copy), ServicesModule (copy)
	local UseResult = ReactModule.useCallback(function(p2, Increment)
		-- upvalues: p1 (copy), FormatInputSliderValueModule (upval), CalculateAdjacentStepValueModule (upval), SliderStepDirectionModule (upval), OnChangeCallbackReasonModule (upval)
		local Value1 = p1.getValue()
		local Value = nil
		
		if p2.Text ~= FormatInputSliderValueModule(Value1) then
			local Number: number? = tonumber(p2.Text)
			Value = if Number == Number then Number else nil
		else
			Value = nil
		end
		local ClampedValue = if Value then math.clamp(Value, p1.range.Min, p1.range.Max) else Value1
		local AdjacentStepValueModule = if p1.step then CalculateAdjacentStepValueModule(ClampedValue, Increment, p1.range, p1.step) else math.clamp(ClampedValue + (if Increment == SliderStepDirectionModule.Increment then p1.defaultStep else -p1.defaultStep), p1.range.Min, p1.range.Max)
		local FormatInputSliderValueModuleResult = FormatInputSliderValueModule(AdjacentStepValueModule)
		p2.Text = FormatInputSliderValueModuleResult
		p2.CursorPosition = utf8.len(FormatInputSliderValueModuleResult) + 1
		p2.SelectionStart = -1
		p1.changeValue(AdjacentStepValueModule, OnChangeCallbackReasonModule.Keyboard)
	end, {
		p1.getValue,
		p1.changeValue,
		p1.range,
		p1.step,
		p1.defaultStep
	})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), ServicesModule (upval), SliderStepDirectionModule (upval), UseResult (copy)
		if not p1.isTyping or p1.isDisabled then return end
		local InputBeganConnection = ServicesModule.UserInputService.InputBegan:Connect(function(Input)
			-- upvalues: SliderStepDirectionModule (upval), p1 (upval), UseResult (upval)
			local KeyCode = Input.KeyCode
			local Increment = if KeyCode == Enum.KeyCode.Up then SliderStepDirectionModule.Increment elseif KeyCode == Enum.KeyCode.Down then SliderStepDirectionModule.Decrement else nil
			local Current = p1.textBoxRef.current
			
			if Increment ~= nil and Current ~= nil and Current:IsFocused() then
				UseResult(Current, Increment)
			end
		end)
		
		return function()
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, { p1.isTyping, p1.isDisabled, p1.textBoxRef, UseResult })
end