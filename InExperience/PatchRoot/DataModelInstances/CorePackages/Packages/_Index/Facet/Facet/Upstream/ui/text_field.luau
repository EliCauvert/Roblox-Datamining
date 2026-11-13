local FeedbackPaintModule = require("./feedback_paint")
local ReducedFunction = require("./motion").reduced
local ArithmeticModule = require("./arithmetic")
local FieldChromeModule = require("./field_chrome")
local TextPressModule = require("./text_press")
local KeyboardInsetModule = require("./keyboard_inset")
local MeasuredScrollModule = require("./measured_scroll")
local _ = require("./theme_types")
local _ = require("./input_types")
local _ = require("./types")
local _ = require("../vendor/compose/core")
local _ = require("./environment_types")
local _ = require("./control_types")
local Frozen = table.freeze({
	"value", "numericValue", "presentation", "min", "max", "parse", "format",
	"validate", "maxLength", "enabled", "disabled", "readOnly", "placeholder",
	"multiline", "visibleLines", "minHeight", "onChange", "onCommit", "onCancel",
	"invalid", "clearButton", "clearButtonMode", "selectOnFocus", "leading",
	"trailing", "label", "requiredMark", "hint", "errorText", "controlSize",
	"appearance", "corners", "step", "precision", "stepButtons", "prefix",
	"suffix", "scrub"
})
local list = {
	"step", "precision", "stepButtons", "prefix", "suffix", "scrub"
}
local list1 = {
	"Name", "Size", "Position", "AnchorPoint", "LayoutOrder", "Visible", "ZIndex"
}

local function _(Value: number): boolean
	return type(Value) == "number" and Value == Value and math.abs(Value) < 1e999
end

local function places(Value: number): number
	if Value == nil or Value % 1 == 0 then
		return 0
	else
		local _0: string = string.format("%.10f", (math.abs(Value))):gsub("0+$", "")
		local FoundAt: number? = string.find(_0, ".", 1, true)
		
		return if FoundAt then #_0 - FoundAt else 0
	end
end

local _ = function(p1: number, p2: number)
	local v1 = 10 ^ p2
	local Value = p1 * v1
	
	if type(Value) == "number" and (Value == Value and math.abs(Value) < 1e999) then
		local FlooredRatio = math.floor(math.abs(Value) + 0.5) / v1
		
		return if p1 < 0 then -FlooredRatio else FlooredRatio
	else
		return p1
	end
end

return function(p1, p2)
	-- upvalues: FieldChromeModule (copy), list (copy), ReducedFunction (copy), places (copy), ArithmeticModule (copy), Frozen (copy), list1 (copy), KeyboardInsetModule (copy), MeasuredScrollModule (copy), TextPressModule (copy), FeedbackPaintModule (copy)
	local Runtime = p1.runtime
	local Host = p1.Host
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local TypesUDim = p1.types.UDim
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local FieldChromeModuleResult = FieldChromeModule(p1)
	
	local function _(TextBox, p3, p4)
		-- upvalues: ReadFunction (copy), p1 (copy), TypesUDim (copy)
		return function(p5)
			-- upvalues: ReadFunction (upval), p1 (upval), TypesUDim (upval), p3 (copy), TextBox (copy), p4 (copy)
			local v1 = ReadFunction(p1.config.theme, p5)
			local Field = v1 and (v1.chrome and v1.chrome.field)
			local ContentInsets = Field and Field.contentInsets or {}
			
			return TypesUDim.new(0, p3 + (if ReadFunction(TextBox.appearance, p5) == "utility" then 0 else ContentInsets[p4] or 0))
		end
	end
	
	local _ = function(Callback)
		-- upvalues: Compose (copy)
		return Compose.isValue(Callback) or type(Callback) == "function"
	end
	
	local _ = function(p3): boolean
		-- upvalues: Compose (copy)
		return type(p3) == "table" and (Compose.isValue(p3) and type(p3.set) == "function")
	end
	
	local _ = function(p3, Attributes)
		-- upvalues: Runtime (copy)
		Runtime.decorate(p3, { Attributes = Attributes })
	end
	
	local function build(Control, TextBox)
		-- upvalues: ReadFunction (copy), Compose (copy), list (upval), FieldChromeModuleResult (copy), Runtime (copy), p1 (copy), ReducedFunction (upval), places (upval), ArithmeticModule (upval), Frozen (upval), TypesEnum (copy), list1 (upval), TypesUDim2 (copy), KeyboardInsetModule (upval), Host (copy), p2 (copy), TypesVector2 (copy), MeasuredScrollModule (upval), TypesUDim (copy), TextPressModule (upval), FeedbackPaintModule (upval)
		local function _(p3, p4)
			-- upvalues: ReadFunction (upval), TextBox (copy), Control (copy)
			local ReadResult: number = ReadFunction(TextBox.minHeight, p3)
			
			if ReadResult == nil then
				return p4
			else
				assert(type(ReadResult) == "number" and ReadResult >= 0 and ReadResult < 1e999, `Facet.{Control}: minHeight must be a finite number of pixels, 0 or more`)
				
				return ReadResult
			end
		end
		
		local Invalid = TextBox.invalid
		assert(type(ReadFunction(TextBox.value)) == "string", `Facet.{Control}: value must resolve to a string`)
		local Value = TextBox.value
		local v1: boolean = type(Value) == "table" and (Compose.isValue(Value) and type(Value.set) == "function") or type(TextBox.onChange) == "function"
		assert(v1, `Facet.{Control}: a read-only value requires onChange`)
		
		for i, value in {
			parse = TextBox.parse,
			format = TextBox.format,
			validate = TextBox.validate,
			onChange = TextBox.onChange,
			onCommit = TextBox.onCommit,
			onCancel = TextBox.onCancel
		} do
			assert(value == nil or type(value) == "function", `Facet.{Control}: {i} must be a function`)
		end
		local IsNumber = TextBox.presentation == "number"
		local NoIsNumber = not IsNumber
		
		if not NoIsNumber then
			local NumericValue = TextBox.numericValue
			NoIsNumber = type(NumericValue) == "table" and (Compose.isValue(NumericValue) and type(NumericValue.set) == "function")
		end
		assert(NoIsNumber, `Facet.{Control}: numeric presentation requires numericValue`)
		assert(not IsNumber or TextBox.multiline ~= true, `Facet.{Control}: numeric input must be single-line`)
		assert(TextBox.enabled == nil or TextBox.disabled == nil, `Facet.{Control}: use enabled or disabled, not both`)
		assert(TextBox.presentation == nil or table.find({ "plain", "search", "number" }, TextBox.presentation), `Facet.{Control}: invalid presentation`)
		
		for _, value1 in { TextBox.min, TextBox.max } do
			assert(value1 == nil or type(value1) == "number" and value1 == value1 and math.abs(value1) < 1e999, `Facet.{Control}: numeric bounds must be finite`)
		end
		assert(TextBox.min == nil or (TextBox.max == nil or TextBox.min <= TextBox.max), `Facet.{Control}: min must not exceed max`)
		assert(TextBox.maxLength == nil or TextBox.maxLength >= 0 and TextBox.maxLength % 1 == 0, `Facet.{Control}: maxLength must be a nonnegative integer`)
		assert(TextBox.invalid == nil or Compose.isValue(TextBox.invalid) and type(ReadFunction(TextBox.invalid)) == "boolean", `Facet.{Control}: invalid must be a boolean readable`)
		assert(type(ReadFunction(TextBox.readOnly) or false) == "boolean", `Facet.{Control}: readOnly must be a boolean`)
		
		for _, value3 in list do
			assert(IsNumber or TextBox[value3] == nil, `Facet.{Control}: {value3} belongs to the number presentation`)
		end
		local IsStepAbove = true
		
		if TextBox.step ~= nil then
			local Step: number = TextBox.step
			IsStepAbove = type(Step) == "number" and (Step == Step and math.abs(Step) < 1e999 and TextBox.step > 0)
		end
		assert(IsStepAbove, `Facet.{Control}: step must be finite and above zero`)
		local IsPrecisionBelow = true
		
		if TextBox.precision ~= nil then
			local Precision: number = TextBox.precision
			IsPrecisionBelow = type(Precision) == "number" and (Precision == Precision and math.abs(Precision) < 1e999 and (TextBox.precision % 1 == 0 and TextBox.precision >= 0 and TextBox.precision <= 10))
		end
		assert(IsPrecisionBelow, `Facet.{Control}: precision must be a whole number from 0 to 10`)
		
		for _, value2 in { "prefix", "suffix" } do
			local ReadResult1 = ReadFunction(TextBox[value2])
			assert(ReadResult1 == nil or type(ReadResult1) == "string", `Facet.{Control}: {value2} must be a string`)
		end
		assert(TextBox.scrub == nil or type(ReadFunction(TextBox.scrub)) == "boolean", `Facet.{Control}: scrub must be a boolean or a readable boolean`)
		assert(TextBox.visibleLines == nil or TextBox.multiline == true, `Facet.{Control}: visibleLines requires multiline`)
		local IsVisibleLinesAbove = true
		
		if TextBox.visibleLines ~= nil then
			local VisibleLines: number = TextBox.visibleLines
			IsVisibleLinesAbove = type(VisibleLines) == "number" and (VisibleLines == VisibleLines and math.abs(VisibleLines) < 1e999 and (TextBox.visibleLines % 1 == 0 and TextBox.visibleLines >= 1))
		end
		assert(IsVisibleLinesAbove, `Facet.{Control}: visibleLines must be a whole number of at least 1`)
		assert(TextBox.leading == nil or TextBox.presentation ~= "search", `Facet.{Control}: a search field already leads with its search mark`)
		FieldChromeModuleResult.check(Control, TextBox)
		v1 = "none"
		
		local function policyOf(p3)
			-- upvalues: Control (copy)
			if p3 == nil then
				return "none"
			end
			if p3 ~= "none" and p3 ~= "all" and p3 ~= "end" then
				error(`Facet UI.{Control}: selectOnFocus: one of none | all | end (got {tostring(p3)})`, 0)
			end
			return p15
		end
		
		local ReadResult = ReadFunction(TextBox.selectOnFocus)
		
		if ReadResult == nil then
			v1 = "none"
		else
			if ReadResult ~= "none" and ReadResult ~= "all" and ReadResult ~= "end" then
				error(`Facet UI.{Control}: selectOnFocus: one of none | all | end (got {tostring(ReadResult)})`, 0)
			end
			v1 = ReadResult
		end
		local PresentResult = FieldChromeModuleResult.present(TextBox) or (TextBox.presentation == "search" or (TextBox.leading ~= nil or (TextBox.trailing ~= nil or (TextBox.prefix ~= nil or TextBox.suffix ~= nil)) or (TextBox.stepButtons == true or TextBox.visibleLines ~= nil)))
		
		local function Enabled(p3): boolean
			-- upvalues: ReadFunction (upval), TextBox (copy)
			return ReadFunction(TextBox.enabled, p3) ~= false and ReadFunction(TextBox.disabled, p3) ~= true
		end
		
		local _ = function(p3): boolean
			-- upvalues: ReadFunction (upval), TextBox (copy)
			return ReadFunction(TextBox.readOnly, p3) == true
		end
		
		local _ = function(p3): boolean
			-- upvalues: ReadFunction (upval), TextBox (copy)
			return ReadFunction(TextBox.enabled, p3) ~= false and ReadFunction(TextBox.disabled, p3) ~= true and not (ReadFunction(TextBox.readOnly, p3) == true)
		end
		
		local CellResult = Compose.cell(false)
		local CellResult1 = Compose.cell(false)
		local CellResult2 = Compose.cell("")
		local IsNumber1: boolean = IsNumber or TextBox.invalid ~= nil
		local TimelineResult = if IsNumber1 then Runtime.timeline({
			autoplay = false,
			duration = p1.metric("motion.durations.fieldReject")
		}) else nil
		local ReducedResult = if TimelineResult then ReducedFunction(p1) else nil
		
		if TimelineResult then
			TimelineResult:seek(0.24)
		end
		local CellResult3 = Compose.cell(18)
		local CellResult4 = Compose.cell(0)
		local Flag = false
		local Flag1 = false
		local ReadResult2 = ReadFunction(TextBox.value)
		local Config = nil
		local Text = nil
		local Text1 = ""
		local v2 = assert(Compose.currentOwner())
		
		local _ = function(p3)
			-- upvalues: ReadFunction (upval), TextBox (copy)
			if ReadFunction(TextBox.value) == p3 then return end
			if TextBox.onChange then
				TextBox.onChange(p3)
				
				return
			else
				TextBox.value:set(p3)
			end
		end
		
		local _ = function(Value)
			-- upvalues: Text1 (ref), Flag (ref), Text (ref)
			if Text1 ~= Value then
				Flag = true
				Text1 = Value
				Text.Text = Value
				Flag = false
			end
		end
		
		local function markInvalid(p3, p4)
			-- upvalues: CellResult1 (copy), CellResult2 (copy), Invalid (copy), Compose (upval), TimelineResult (copy), ReducedResult (copy)
			CellResult1:set(p3)
			CellResult2:set(if p3 then p4 or "Check this value." else "")
			
			if type(Invalid) == "table" and (Compose.isValue(Invalid) and type(Invalid.set) == "function") then
				Invalid:set(p3)
			end
			if p3 and TimelineResult and ReducedResult and not ReducedResult() then
				TimelineResult:restart()
			end
		end
		
		local function normalize(Text: string)
			-- upvalues: TextBox (copy)
			local Length = utf8.len(Text)
			
			if Length == nil then
				return nil
			end
			if TextBox.maxLength and TextBox.maxLength < Length then
				Text = string.sub(Text, 1, utf8.offset(Text, TextBox.maxLength + 1) - 1)
			end
			local ValidateResult = if TextBox.validate then TextBox.validate(Text) else Text
			
			return if type(ValidateResult) == "string" and utf8.len(ValidateResult) ~= nil then ValidateResult else nil
		end
		
		local function propose(p3)
			-- upvalues: Flag1 (ref), ReadFunction (upval), TextBox (copy), Text1 (ref), Flag (ref), Text (ref), normalize (copy)
			if Flag1 or (ReadFunction(TextBox.enabled, nil) == false or ReadFunction(TextBox.disabled, nil) == true or ReadFunction(TextBox.readOnly, nil) == true) then
				local ReadResult = ReadFunction(TextBox.value)
				
				if Text1 ~= ReadResult then
					Flag = true
					Text1 = ReadResult
					Text.Text = ReadResult
					Flag = false
				end
				return
			else
				local NormalizeResult = normalize(p3)
				
				if NormalizeResult == nil then
					local ReadResult = ReadFunction(TextBox.value)
					
					if Text1 ~= ReadResult then
						Flag = true
						Text1 = ReadResult
						Text.Text = ReadResult
						Flag = false
					end
					return
				else
					if ReadFunction(TextBox.value) ~= NormalizeResult then
						if TextBox.onChange then
							TextBox.onChange(NormalizeResult)
						else
							TextBox.value:set(NormalizeResult)
						end
					end
					local ReadResult = ReadFunction(TextBox.value)
					
					if Text1 ~= ReadResult then
						Flag = true
						Text1 = ReadResult
						Text.Text = ReadResult
						Flag = false
					end
				end
			end
		end
		
		local _ = function()
			-- upvalues: Text (ref)
			if Text:IsFocused() then
				Text:ReleaseFocus(false)
			end
		end
		
		local function cancel()
			-- upvalues: CellResult (copy), ReadResult2 (ref), ReadFunction (upval), TextBox (copy), Text1 (ref), Flag (ref), Text (ref)
			if not CellResult:peek() then return end
			CellResult:set(false)
			local ReadResult1 = ReadResult2
			
			if ReadFunction(TextBox.value) ~= ReadResult1 then
				if TextBox.onChange then
					TextBox.onChange(ReadResult1)
				else
					TextBox.value:set(ReadResult1)
				end
			end
			local ReadResult2 = ReadFunction(TextBox.value)
			
			if Text1 ~= ReadResult2 then
				Flag = true
				Text1 = ReadResult2
				Text.Text = ReadResult2
				Flag = false
			end
			if Text:IsFocused() then
				Text:ReleaseFocus(false)
			end
			if TextBox.onCancel then
				TextBox.onCancel()
			end
		end
		
		local _ = function()
			-- upvalues: TextBox (copy), places (upval)
			return if TextBox.precision == nil then math.max(places(TextBox.step), (places(TextBox.min))) else TextBox.precision
		end
		
		local function formatNumber(PeekResult)
			-- upvalues: TextBox (copy)
			local Success, Text = pcall(function(p3)
				-- upvalues: TextBox (upval)
				return if TextBox.format then TextBox.format(p3) elseif TextBox.precision == nil then tostring(p3) else string.format(`%.{TextBox.precision}f`, p3)
			end, PeekResult)
			
			if not Success or type(Text) ~= "string" or utf8.len(Text) == nil then
				return nil
			end
			if TextBox.validate then
				local Success1, Result = pcall(TextBox.validate, Text)
				
				if not Success1 or type(Result) ~= "string" or utf8.len(Result) == nil then
					return nil
				end
				Text = Result
			end
			return if TextBox.maxLength and TextBox.maxLength < utf8.len(Text) then nil else Text
		end
		
		local _ = function(Max)
			-- upvalues: TextBox (copy)
			local Max1 = Max
			
			if TextBox.min and Max1 < TextBox.min then
				Max1 = TextBox.min
			end
			if TextBox.max and TextBox.max < Max1 then
				Max1 = TextBox.max
			end
			return Max1, Max1 ~= Max
		end
		
		local function settleNumber(Written, Clamped, p3): boolean
			-- upvalues: TextBox (copy), formatNumber (copy), Flag1 (ref), ReadFunction (upval), markInvalid (copy), Runtime (upval), Text1 (ref), Flag (ref), Text (ref), CellResult1 (copy), CellResult2 (copy), Invalid (copy), Compose (upval)
			local v3 = assert(TextBox.numericValue)
			local FormatNumberResult = formatNumber(Written)
			
			if Flag1 or (ReadFunction(TextBox.enabled, nil) == false or ReadFunction(TextBox.disabled, nil) == true) then
				return false
			end
			if FormatNumberResult == nil then
				markInvalid(true)
				
				return false
			end
			local v4 = false
			Runtime:batch(function()
				-- upvalues: FormatNumberResult (copy), ReadFunction (upval), TextBox (upval), v4 (ref), v3 (copy), Written (copy)
				if ReadFunction(TextBox.value) ~= FormatNumberResult then
					if TextBox.onChange then
						TextBox.onChange(FormatNumberResult)
					else
						TextBox.value:set(FormatNumberResult)
					end
				end
				v4 = ReadFunction(TextBox.value) == FormatNumberResult
				
				if v4 then
					v3:set(Written)
				end
			end)
			
			if v4 then
				if Text1 ~= FormatNumberResult then
					Flag = true
					Text1 = FormatNumberResult
					Text.Text = FormatNumberResult
					Flag = false
				end
				CellResult1:set(false)
				CellResult2:set("")
				
				if type(Invalid) == "table" and (Compose.isValue(Invalid) and type(Invalid.set) == "function") then
					Invalid:set(false)
				end
				if p3 and TextBox.onCommit then
					TextBox.onCommit(Written, Clamped)
				end
				return true
			else
				local ReadResult = ReadFunction(TextBox.value)
				
				if Text1 ~= ReadResult then
					Flag = true
					Text1 = ReadResult
					Text.Text = ReadResult
					Flag = false
				end
				markInvalid(true)
				
				return false
			end
		end
		
		local function commitNumber(p3)
			-- upvalues: TextBox (copy), ReadFunction (upval), ArithmeticModule (upval), CellResult1 (copy), CellResult2 (copy), Invalid (copy), Compose (upval), TimelineResult (copy), ReducedResult (copy), formatNumber (copy), Text1 (ref), Flag (ref), Text (ref), Flag1 (ref), settleNumber (copy)
			local v3 = assert(TextBox.numericValue)
			local ReadResult = ReadFunction(TextBox.value)
			
			if ArithmeticModule.incomplete(ReadResult) then
				if TextBox.requiredMark == "required" then
					CellResult1:set(true)
					CellResult2:set("Enter a number.")
					
					if type(Invalid) == "table" and (Compose.isValue(Invalid) and type(Invalid.set) == "function") then
						Invalid:set(true)
					end
					if TimelineResult and ReducedResult and not ReducedResult() then
						TimelineResult:restart()
					end
					return
				else
					local FormatNumberResult = formatNumber(v3:peek())
					
					if FormatNumberResult then
						if ReadFunction(TextBox.value) ~= FormatNumberResult then
							if TextBox.onChange then
								TextBox.onChange(FormatNumberResult)
							else
								TextBox.value:set(FormatNumberResult)
							end
						end
						local ReadResult1 = ReadFunction(TextBox.value)
						
						if Text1 ~= ReadResult1 then
							Flag = true
							Text1 = ReadResult1
							Text.Text = ReadResult1
							Flag = false
						end
					end
					CellResult1:set(false)
					CellResult2:set("")
					
					if type(Invalid) == "table" and (Compose.isValue(Invalid) and type(Invalid.set) == "function") then
						Invalid:set(false)
					end
					return
				end
			else
				local Success, Result = pcall(function(p4)
					-- upvalues: TextBox (upval), ArithmeticModule (upval)
					return if TextBox.parse then TextBox.parse(p4) else ArithmeticModule.number(p4)
				end, ReadResult)
				
				if Flag1 or (ReadFunction(TextBox.enabled, nil) == false or ReadFunction(TextBox.disabled, nil) == true) then return end
				if Success and (type(Result) == "number" and (Result == Result and math.abs(Result) < 1e999)) then
					local Max = Result
					
					if TextBox.min and Max < TextBox.min then
						Max = TextBox.min
					end
					if TextBox.max and TextBox.max < Max then
						Max = TextBox.max
					end
					local v4 = Max
					local IsNotMaxMatch = Max ~= Result
					
					if TextBox.precision ~= nil then
						local v5: number = v4
						local v6 = 10 ^ TextBox.precision
						local Value = v5 * v6
						
						if type(Value) == "number" and (Value == Value and math.abs(Value) < 1e999) then
							local FlooredRatio = math.floor(math.abs(Value) + 0.5) / v6
							v4 = if v5 < 0 then -FlooredRatio else FlooredRatio
						else
							v4 = v5
						end
					end
					settleNumber(v4, if IsNotMaxMatch then "clamped" else p3, true)
					
					return
				else
					CellResult1:set(true)
					CellResult2:set("Enter a valid number.")
					
					if type(Invalid) == "table" and (Compose.isValue(Invalid) and type(Invalid.set) == "function") then
						Invalid:set(true)
					end
					if TimelineResult and ReducedResult and not ReducedResult() then
						TimelineResult:restart()
					end
				end
			end
		end
		
		local function commit(Submit)
			-- upvalues: Flag1 (ref), CellResult (copy), ReadFunction (upval), TextBox (copy), Text1 (ref), Flag (ref), Text (ref), IsNumber (copy), commitNumber (copy), normalize (copy), CellResult1 (copy), CellResult2 (copy), Invalid (copy), Compose (upval), TimelineResult (copy), ReducedResult (copy)
			if Flag1 or not CellResult:peek() then return end
			CellResult:set(false)
			
			if ReadFunction(TextBox.enabled, nil) ~= false and ReadFunction(TextBox.disabled, nil) ~= true and ReadFunction(TextBox.readOnly, nil) ~= true then
				if IsNumber then
					commitNumber(Submit)
					
					return
				end
				local NormalizeResult = normalize((ReadFunction(TextBox.value)))
				
				if Flag1 or (ReadFunction(TextBox.enabled, nil) == false or ReadFunction(TextBox.disabled, nil) == true) then return end
				if NormalizeResult == nil then
					CellResult1:set(true)
					CellResult2:set("Check this value.")
					
					if type(Invalid) == "table" and (Compose.isValue(Invalid) and type(Invalid.set) == "function") then
						Invalid:set(true)
					end
					if TimelineResult and ReducedResult and not ReducedResult() then
						TimelineResult:restart()
					end
					return
				else
					if ReadFunction(TextBox.value) ~= NormalizeResult then
						if TextBox.onChange then
							TextBox.onChange(NormalizeResult)
						else
							TextBox.value:set(NormalizeResult)
						end
					end
					if ReadFunction(TextBox.value) == NormalizeResult then
						if Text1 ~= NormalizeResult then
							Flag = true
							Text1 = NormalizeResult
							Text.Text = NormalizeResult
							Flag = false
						end
						if TextBox.onCommit then
							TextBox.onCommit(NormalizeResult, Submit)
						end
						return
					else
						local ReadResult = ReadFunction(TextBox.value)
						
						if Text1 ~= ReadResult then
							Flag = true
							Text1 = ReadResult
							Text.Text = ReadResult
							Flag = false
						end
						CellResult1:set(true)
						CellResult2:set("Check this value.")
						
						if type(Invalid) == "table" and (Compose.isValue(Invalid) and type(Invalid.set) == "function") then
							Invalid:set(true)
						end
						if TimelineResult and ReducedResult and not ReducedResult() then
							TimelineResult:restart()
						end
						return
					end
				end
			else
				local ReadResult = ReadFunction(TextBox.value)
				
				if Text1 ~= ReadResult then
					Flag = true
					Text1 = ReadResult
					Text.Text = ReadResult
					Flag = false
				end
			end
		end
		
		local function stepped(PeekResult, ScaledFloored)
			-- upvalues: TextBox (copy), places (upval)
			local Step = TextBox.step or 1
			local NewPeekResult = PeekResult + ScaledFloored * Step
			
			if TextBox.min ~= nil and TextBox.max ~= nil then
				local Min = TextBox.min
				NewPeekResult = Min + (math.floor((PeekResult - Min) / Step + 0.5) + ScaledFloored) * Step
			end
			local Max = NewPeekResult
			
			if TextBox.min and Max < TextBox.min then
				Max = TextBox.min
			end
			if TextBox.max and TextBox.max < Max then
				Max = TextBox.max
			end
			local Max1: number = Max
			
			local v3 = 10 ^ (if TextBox.precision == nil then math.max(places(TextBox.step), (places(TextBox.min))) else TextBox.precision)
			local Value = Max1 * v3
			
			if type(Value) == "number" and (Value == Value and math.abs(Value) < 1e999) then
				local FlooredRatio = math.floor(math.abs(Value) + 0.5) / v3
				
				return if Max1 < 0 then -FlooredRatio else FlooredRatio
			else
				return Max1
			end
		end
		
		local function stepBy(p3)
			-- upvalues: Flag1 (ref), ReadFunction (upval), TextBox (copy), CellResult (copy), Text (ref), stepped (copy), formatNumber (copy), settleNumber (copy)
			if Flag1 or (ReadFunction(TextBox.enabled, nil) == false or ReadFunction(TextBox.disabled, nil) == true or ReadFunction(TextBox.readOnly, nil) == true) then return end
			if CellResult:peek() then
				CellResult:set(false)
				
				if Text:IsFocused() then
					Text:ReleaseFocus(false)
				end
			end
			local v3 = assert(TextBox.numericValue)
			local SteppedResult = stepped(v3:peek(), p3)
			
			if SteppedResult ~= v3:peek() or ReadFunction(TextBox.value) ~= formatNumber(SteppedResult) then
				settleNumber(SteppedResult, "submit", true)
			end
		end
		
		local UchFloor = p1.touchFloor()
		local Field = p1.props(TextBox, Frozen, {
			ClearTextOnFocus = false,
			Text = ReadFunction(TextBox.value),
			PlaceholderText = TextBox.placeholder or "",
			MultiLine = TextBox.multiline == true,
			TextWrapped = TextBox.multiline == true,
			TextXAlignment = TypesEnum.TextXAlignment.Left,
			TextYAlignment = if IsNumber1 and not PresentResult then TypesEnum.TextYAlignment.Top elseif TextBox.multiline == true then TypesEnum.TextYAlignment.Top else TypesEnum.TextYAlignment.Center,
			TextEditable = function(p3): boolean
				-- upvalues: ReadFunction (upval), TextBox (copy)
				return ReadFunction(TextBox.enabled, p3) ~= false and ReadFunction(TextBox.disabled, p3) ~= true and not (ReadFunction(TextBox.readOnly, p3) == true)
			end,
			Selectable = function(p3): boolean
				-- upvalues: ReadFunction (upval), TextBox (copy)
				return ReadFunction(TextBox.enabled, p3) ~= false and ReadFunction(TextBox.disabled, p3) ~= true
			end
		})
		local Native = {}
		
		if PresentResult then
			for _, value4 in list1 do
				Native[value4] = Field[value4]
				Field[value4] = nil
			end
			local List = {}
			
			for i1 = #Field, 1, -1 do
				local FieldEntry = Field[i1]
				local IsInstance: boolean = typeof(FieldEntry) == "Instance" or type(FieldEntry) == "table" and FieldEntry.IsA ~= nil
				local FieldEntry1 = if IsInstance then FieldEntry else nil
				
				if FieldEntry1 and (FieldEntry1:IsA("UIFlexItem") or FieldEntry1:IsA("UISizeConstraint")) then
					table.insert(List, 1, FieldEntry1)
					table.remove(Field, i1)
				end
			end
			for _, value5 in List do
				table.insert(Native, value5)
			end
			Field.Name = "Field"
			Field.BackgroundTransparency = 1
			Field.Size = if TextBox.visibleLines then TypesUDim2.new(1, 0, 0, 0) else function(Callback)
				-- upvalues: TextBox (copy), ReadFunction (upval), Control (copy), TypesUDim2 (upval), UchFloor (copy), CellResult3 (copy)
				local v3: number = if TextBox.multiline == true then 96 elseif TextBox.controlSize then 0 else 36
				local ReadResult: number = ReadFunction(TextBox.minHeight, Callback)
				local v4 = nil
				
				if ReadResult == nil then
					v4 = v3
				else
					assert(type(ReadResult) == "number" and ReadResult >= 0 and ReadResult < 1e999, `Facet.{Control}: minHeight must be a finite number of pixels, 0 or more`)
					v4 = ReadResult
				end
				return TypesUDim2.new(0, 0, 0, (math.max(v4, if TextBox.presentation == "search" then UchFloor(Callback) else 0, Callback(CellResult3) + 12)))
			end
			Field.AutomaticSize = if TextBox.visibleLines then TypesEnum.AutomaticSize.Y else nil
		else
			Field.Size = Field.Size or function(Callback)
				-- upvalues: CellResult2 (copy), CellResult4 (copy), TextBox (copy), ReadFunction (upval), Control (copy), TypesUDim2 (upval), CellResult3 (copy)
				local CallbackResult = if Callback(CellResult2) == "" then 0 else Callback(CellResult4)
				local v3: number = if TextBox.multiline == true then 96 else 44
				local ReadResult: number = ReadFunction(TextBox.minHeight, Callback)
				local v4 = nil
				
				if ReadResult == nil then
					v4 = v3
				else
					assert(type(ReadResult) == "number" and ReadResult >= 0 and ReadResult < 1e999, `Facet.{Control}: minHeight must be a finite number of pixels, 0 or more`)
					v4 = ReadResult
				end
				return TypesUDim2.new(1, 0, 0, (math.max(v4, Callback(CellResult3) + CallbackResult + 16)))
			end
		end
		local v3 = nil
		
		function Field.Focused(...)
			-- upvalues: ReadFunction (upval), TextBox (copy), CellResult (copy), ReadResult2 (ref), v3 (ref)
			if ReadFunction(TextBox.enabled, nil) ~= false and ReadFunction(TextBox.disabled, nil) ~= true and not CellResult:peek() then
				ReadResult2 = ReadFunction(TextBox.value)
				CellResult:set(true)
				local Callback: () -> () = v3
				
				if Callback then
					v3 = nil
					Callback()
				end
			end
			if TextBox.Focused then
				TextBox.Focused(...)
			end
		end
		
		function Field.FocusLost(p3, Input)
			-- upvalues: KeyboardInsetModule (upval), p1 (upval), Text (ref), v2 (copy), Config (ref), CellResult (copy), TypesEnum (upval), cancel (copy), commit (copy), TextBox (copy)
			KeyboardInsetModule.capture(p1, p1.config.userInputService, Text, Input, v2)
			
			if Config == nil then
				if Input and (Input.KeyCode == TypesEnum.KeyCode.Escape or Input.KeyCode == TypesEnum.KeyCode.ButtonB) then
					cancel()
				else
					commit(if p3 then "submit" else "focusLost")
				end
			else
				CellResult:set(false)
			end
			if TextBox.FocusLost then
				TextBox.FocusLost(p3, Input)
			end
		end
		
		Field[#Field + 1] = p1.padding(if PresentResult then 0 else 10, 6)
		local v4 = nil
		
		if IsNumber1 and not PresentResult then
			local Validation = p1.styled(p1.text({
				Name = "ValidationMessage",
				TextWrapped = true,
				Text = CellResult2,
				Visible = function(Callback): boolean
					-- upvalues: CellResult2 (copy)
					return Callback(CellResult2) ~= ""
				end,
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				Position = function(Callback)
					-- upvalues: TypesUDim2 (upval), CellResult3 (copy)
					return TypesUDim2.fromOffset(0, Callback(CellResult3) + 4)
				end
			}), "validation")
			v4 = Validation
			Field[#Field + 1] = Validation
		end
		local v5 = if TimelineResult then Host.UIScale("ValidationPulse")({
			Scale = function(Callback): number
				-- upvalues: ReducedResult (copy), TimelineResult (copy)
				if assert(ReducedResult)(Callback) then
					return 1
				else
					local CallbackResult: number = Callback(assert(TimelineResult).progress)
					
					return 1 - math.sin(3.141592653589793 * CallbackResult) * 0.03 * (1 - CallbackResult)
				end
			end
		}) else nil
		local ClearButtonMode = TextBox.clearButtonMode or (if TextBox.clearButton or TextBox.presentation == "search" then "always" else "never")
		assert(table.find({ "always", "never", "whileEditing", "unlessEditing" }, ClearButtonMode), `Facet.{Control}: invalid clearButtonMode`)
		local v6 = if ClearButtonMode == "never" then nil else p2.Button("Clear")({
			name = "Clear",
			icon = "close",
			appearance = "utility",
			shape = "circle",
			Size = function(Callback)
				-- upvalues: CellResult3 (copy), TypesUDim2 (upval)
				local LargestDelta = math.max(36, Callback(CellResult3) + 12) - 8
				
				return TypesUDim2.fromOffset(LargestDelta, LargestDelta)
			end,
			Host.UISizeConstraint("TouchFloor")({
				MinSize = function(p3)
					-- upvalues: UchFloor (copy), TypesVector2 (upval)
					local UchFloorResult = UchFloor(p3)
					
					return TypesVector2.new(UchFloorResult, UchFloorResult)
				end
			}),
			AnchorPoint = if PresentResult then nil else TypesVector2.new(1, 0.5),
			Position = if PresentResult then nil else TypesUDim2.fromScale(1, 0.5),
			LayoutOrder = if PresentResult then 40 else nil,
			Visible = function(Callback)
				-- upvalues: ReadFunction (upval), TextBox (copy), ClearButtonMode (copy), CellResult (copy)
				return ReadFunction(TextBox.enabled, Callback) ~= false and (ReadFunction(TextBox.disabled, Callback) ~= true and not (ReadFunction(TextBox.readOnly, Callback) == true)) and (ReadFunction(TextBox.value, Callback) ~= "" and (ClearButtonMode == "always" or (ClearButtonMode == "whileEditing" and Callback(CellResult) or ClearButtonMode == "unlessEditing" and not Callback(CellResult))))
			end,
			onActivate = function()
				-- upvalues: propose (copy)
				propose("")
			end
		})
		
		if v6 and not PresentResult then
			Field[#Field + 1] = v6
		end
		Text = p1.styled(Host.TextBox(Field), "text")
		
		if Field.TextSize == nil then
			p1.textRole(Text, "body")
		end
		Text1 = Text.Text
		
		if not PresentResult then
			p1.styled(p1.styled(Text, "field"), "text-input")
		end
		local WrapResult = Text
		local UserInputService = p1.config.userInputService
		
		if UserInputService then
			local v7 = p2
			local OnScreenKeyboardVisibleResult = p1.observe.OnScreenKeyboardVisible(UserInputService)
			local OnScreenKeyboardPositionResult = p1.observe.OnScreenKeyboardPosition(UserInputService)
			local AbsolutePositionResult = p1.observe.AbsolutePosition(Text)
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(Text)
			Compose.watch(function(Callback)
				-- upvalues: OnScreenKeyboardVisibleResult (copy), CellResult (copy), AbsolutePositionResult (copy), AbsoluteSizeResult (copy), Text (ref), p1 (upval), v7 (copy), WrapResult (ref), OnScreenKeyboardPositionResult (copy), TypesVector2 (upval)
				if Callback(OnScreenKeyboardVisibleResult) ~= true or not Callback(CellResult) then return end
				Callback(AbsolutePositionResult)
				Callback(AbsoluteSizeResult)
				local ScrollingFrame = Text:FindFirstAncestorWhichIsA("ScrollingFrame")
				
				if ScrollingFrame then
					Callback(p1.observe.AbsoluteWindowSize(ScrollingFrame))
				end
				local ScrollToVisibleFunction: (any, any, any) -> () = v7.scrollToVisible
				local Y = if ScrollingFrame then ScrollingFrame.CanvasPosition.Y else 0
				
				if ScrollToVisibleFunction then
					ScrollToVisibleFunction(WrapResult, nil, { animated = false })
				end
				local YDelta = if ScrollingFrame then ScrollingFrame.CanvasPosition.Y - Y else 0
				local Y1: number = Callback(OnScreenKeyboardPositionResult).Y
				local YDelta1 = Text.AbsolutePosition.Y + Text.AbsoluteSize.Y + 8 - Y1 - YDelta
				local ScrollToFunction: (any, any) -> () = v7.scrollTo
				
				if ScrollToFunction and ScrollingFrame and Y1 > 0 and YDelta1 > 0 then
					ScrollToFunction(ScrollingFrame, ScrollingFrame.CanvasPosition + TypesVector2.new(0, YDelta1))
				end
			end)
		end
		if PresentResult then
			local List1 = {}
			
			local function slot(p3, LayoutOrder, Leading)
				-- upvalues: List1 (copy), Host (upval), TypesUDim2 (upval), TypesEnum (upval)
				table.insert(List1, Host.Frame(p3)({
					LayoutOrder = LayoutOrder,
					BackgroundTransparency = 1,
					Size = TypesUDim2.fromOffset(0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.XY,
					Leading
				}))
			end
			
			if TextBox.presentation == "search" then
				table.insert(List1, p1.icon("facet:search", { Name = "SearchIcon", LayoutOrder = 5 }))
			end
			if TextBox.leading then
				slot("Leading", 10, TextBox.leading)
			end
			local function unit(Name, LayoutOrder, Text)
				-- upvalues: List1 (copy), p1 (upval), TypesEnum (upval)
				if Text ~= nil then
					table.insert(List1, p1.styled(p1.text({
						Name = Name,
						LayoutOrder = LayoutOrder,
						Text = Text,
						AutomaticSize = TypesEnum.AutomaticSize.XY
					}), "secondary"))
				end
			end
			
			unit("Prefix", 20, TextBox.prefix)
			local MeasuredScrollModuleResult = Text
			
			if TextBox.visibleLines then
				local VisibleLines = TextBox.visibleLines
				MeasuredScrollModuleResult = MeasuredScrollModule(p1, {
					Name = "Viewport",
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Selectable = true,
					ScrollingDirection = TypesEnum.ScrollingDirection.Y,
					Size = function(p3)
						-- upvalues: p1 (upval), TypesUDim2 (upval), VisibleLines (copy)
						return TypesUDim2.new(0, 0, 0, math.ceil(VisibleLines * p1.metric("typography.body.size", p3) * 1.2) + 12)
					end
				}, { Text })
				local ScrollFrame = MeasuredScrollModuleResult
				local CursorPositionResult = p1.observe.CursorPosition(Text)
				local TextBoundsResult = p1.observe.TextBounds(Text)
				local AbsoluteWindowSizeResult = p1.observe.AbsoluteWindowSize(ScrollFrame)
				local AbsoluteCanvasSizeResult = p1.observe.AbsoluteCanvasSize(ScrollFrame)
				Compose.watch(function(Callback)
					-- upvalues: CursorPositionResult (copy), TextBoundsResult (copy), AbsoluteWindowSizeResult (copy), AbsoluteCanvasSizeResult (copy), Text (ref), ScrollFrame (copy), TypesVector2 (upval)
					local Number: number = tonumber(Callback(CursorPositionResult)) or -1
					local CallbackResult = Callback(TextBoundsResult)
					local CallbackResult1 = Callback(AbsoluteWindowSizeResult)
					local CallbackResult2 = Callback(AbsoluteCanvasSizeResult)
					
					if Number < 1 or CallbackResult.Y <= 0 or CallbackResult1.Y <= 0 then return end
					local Text1: string = Text.Text
					local Largest = math.max(0, CallbackResult2.Y - CallbackResult1.Y)
					local Largest1 = nil
					local Y = nil
					
					if #Text1 < Number then
						Largest1 = Largest
						Y = CallbackResult2.Y
					else
						local _, Replaced2 = string.gsub(Text1, "\n", "")
						local _, Replaced2_1 = string.gsub(string.sub(Text1, 1, Number - 1), "\n", "")
						local YRatio = CallbackResult.Y / (Replaced2 + 1)
						Largest1 = Replaced2_1 * YRatio
						Y = (Replaced2_1 + 1) * YRatio
					end
					local CanvasPosition = ScrollFrame.CanvasPosition
					
					if CanvasPosition.Y + CallbackResult1.Y < Y then
						ScrollFrame.CanvasPosition = TypesVector2.new(CanvasPosition.X, (math.min(Largest, Y - CallbackResult1.Y)))
						
						return
					end
					if Largest1 < CanvasPosition.Y then
						ScrollFrame.CanvasPosition = TypesVector2.new(CanvasPosition.X, (math.max(0, Largest1)))
					end
				end)
			end
			Runtime.mountFragment(function()
				-- upvalues: Host (upval), TypesEnum (upval)
				return {
					Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
				}
			end, MeasuredScrollModuleResult)
			table.insert(List1, MeasuredScrollModuleResult)
			unit("Suffix", 32, TextBox.suffix)
			
			if v6 then
				table.insert(List1, v6)
			end
			if TextBox.stepButtons then
				local function stepButton(Name, Icon, p3, LayoutOrder)
					-- upvalues: p2 (upval), TypesUDim2 (upval), TypesEnum (upval), ReadFunction (upval), TextBox (copy), stepBy (copy), List1 (copy)
					local Object = p2.Button(Name)({
						repeatDelay = 0.4,
						repeatInterval = 0.1,
						icon = Icon,
						name = Name,
						LayoutOrder = LayoutOrder,
						Size = TypesUDim2.fromOffset(44, 44),
						AutomaticSize = TypesEnum.AutomaticSize.None,
						enabled = function(Callback): boolean
							-- upvalues: ReadFunction (upval), TextBox (upval), p3 (copy)
							if ReadFunction(TextBox.enabled, Callback) ~= false and ReadFunction(TextBox.disabled, Callback) ~= true and not (ReadFunction(TextBox.readOnly, Callback) == true) then
								local CallbackResult = Callback(assert(TextBox.numericValue))
								
								return if p3 < 0 then TextBox.min == nil or TextBox.min < CallbackResult else TextBox.max == nil or CallbackResult < TextBox.max
							else
								return false
							end
						end,
						onActivate = function()
							-- upvalues: stepBy (upval), p3 (copy)
							stepBy(p3)
						end
					})
					Object:AddTag("facet-stepper-button")
					table.insert(List1, Object)
				end
				
				stepButton("Decrement", "decrement", -1, 50)
				stepButton("Increment", "increment", 1, 51)
			end
			local TrailingResult = if type(TextBox.trailing) == "function" then TextBox.trailing() else TextBox.trailing
			
			if TextBox.trailing ~= nil and (typeof(TrailingResult) ~= "Instance" or not TrailingResult:IsA("GuiObject")) then
				error("Facet UI.TextInput: trailing is one GuiObject or a factory that returns one", 0)
			end
			if TrailingResult then
				slot("Trailing", 60, TrailingResult)
			end
			local v8 = 10
			local v9 = "left"
			
			local function PaddingLeft(p3)
				-- upvalues: ReadFunction (upval), p1 (upval), TypesUDim (upval), v8 (copy), TextBox (copy), v9 (copy)
				local v10 = ReadFunction(p1.config.theme, p3)
				local Field = v10 and (v10.chrome and v10.chrome.field)
				local ContentInsets = Field and Field.contentInsets or {}
				
				return TypesUDim.new(0, v8 + (if ReadFunction(TextBox.appearance, p3) == "utility" then 0 else ContentInsets[v9] or 0))
			end
			
			local v10 = 10
			local v11 = "right"
			
			local function PaddingRight(p3)
				-- upvalues: ReadFunction (upval), p1 (upval), TypesUDim (upval), v10 (copy), TextBox (copy), v11 (copy)
				local v12 = ReadFunction(p1.config.theme, p3)
				local Field = v12 and (v12.chrome and v12.chrome.field)
				local ContentInsets = Field and Field.contentInsets or {}
				
				return TypesUDim.new(0, v10 + (if ReadFunction(TextBox.appearance, p3) == "utility" then 0 else ContentInsets[v11] or 0))
			end
			
			local v12 = 4
			local v13 = "top"
			
			local function PaddingTop(p3)
				-- upvalues: ReadFunction (upval), p1 (upval), TypesUDim (upval), v12 (copy), TextBox (copy), v13 (copy)
				local v14 = ReadFunction(p1.config.theme, p3)
				local Field = v14 and (v14.chrome and v14.chrome.field)
				local ContentInsets = Field and Field.contentInsets or {}
				
				return TypesUDim.new(0, v12 + (if ReadFunction(TextBox.appearance, p3) == "utility" then 0 else ContentInsets[v13] or 0))
			end
			
			local v14 = 4
			local v15 = "bottom"
			local RowResult = p1.row(List1, {
				Name = "Input",
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				BackgroundTransparency = 0,
				Host.UIPadding({
					PaddingLeft = PaddingLeft,
					PaddingRight = PaddingRight,
					PaddingTop = PaddingTop,
					PaddingBottom = function(p3)
						-- upvalues: ReadFunction (upval), p1 (upval), TypesUDim (upval), v14 (copy), TextBox (copy), v15 (copy)
						local v16 = ReadFunction(p1.config.theme, p3)
						local Field = v16 and (v16.chrome and v16.chrome.field)
						local ContentInsets = Field and Field.contentInsets or {}
						
						return TypesUDim.new(0, v14 + (if ReadFunction(TextBox.appearance, p3) == "utility" then 0 else ContentInsets[v15] or 0))
					end
				})
			})
			local v16 = assert(RowResult:FindFirstChildWhichIsA("UIListLayout"))
			v16.VerticalAlignment = TypesEnum.VerticalAlignment.Center
			v16.Padding = TypesUDim.new(0, 4)
			p1.styled(RowResult, "text-input")
			local ErrorOfResult = FieldChromeModuleResult.errorOf(TextBox, if IsNumber or TextBox.invalid then CellResult2 else nil)
			FieldChromeModuleResult.paint(Control, RowResult, TextBox, function(p3): boolean
				-- upvalues: ErrorOfResult (copy), ReadFunction (upval), TextBox (copy)
				return ErrorOfResult(p3) ~= "" or ReadFunction(TextBox.invalid, p3) == true
			end)
			p1.skin(RowResult, "field", {
				disabled = function(p3): boolean
					-- upvalues: ReadFunction (upval), TextBox (copy)
					return not (ReadFunction(TextBox.enabled, p3) ~= false and ReadFunction(TextBox.disabled, p3) ~= true)
				end,
				visible = function(p3): boolean
					-- upvalues: ReadFunction (upval), TextBox (copy)
					return ReadFunction(TextBox.appearance, p3) ~= "utility"
				end
			})
			
			if not TextBox.stepButtons then
				local List = {}
				local Parent = Text.Parent
				while Parent and Parent ~= RowResult do
					table.insert(List, "..")
					Parent = Parent.Parent
				end
				table.insert(List, "..")
				Text:SetAttribute("FacetFocusPart", table.concat(List, "/"))
			end
			WrapResult = FieldChromeModuleResult.wrap({
				control = Control,
				spec = TextBox,
				plate = RowResult,
				focus = function()
					-- upvalues: Text (ref)
					if not Text:IsFocused() then
						Text:CaptureFocus()
					end
				end,
				enabled = Enabled,
				message = if IsNumber or TextBox.invalid then CellResult2 else nil,
				native = Native
			})
		end
		local FormulaResult = nil
		
		if TextBox.multiline == true then
			local TextResult = p1.observe.Text(Text)
			local Measure = p1.text({
				Name = "Measure",
				Visible = false,
				TextWrapped = true,
				TextTransparency = 1,
				Text = function(Callback): string
					-- upvalues: TextResult (copy)
					local CallbackResult: string = Callback(TextResult)
					
					return if string.sub(CallbackResult, -1) == "\n" then CallbackResult .. " " else CallbackResult
				end,
				Size = TypesUDim2.new(1, 0, 0, 100000),
				AutomaticSize = TypesEnum.AutomaticSize.None,
				TextXAlignment = TypesEnum.TextXAlignment.Left,
				TextYAlignment = TypesEnum.TextYAlignment.Top,
				FontFace = p1.observeStyled.FontFace(Text),
				TextSize = p1.observeStyled.TextSize(Text),
				LineHeight = p1.observeStyled.LineHeight(Text)
			})
			Runtime.mount(function()
				-- upvalues: Measure (copy)
				return Measure
			end, Text)
			local TextBoundsResult1 = p1.observe.TextBounds(Measure)
			FormulaResult = Compose.formula(function(Callback)
				-- upvalues: TextBoundsResult1 (copy)
				return Callback(TextBoundsResult1).Y
			end)
		elseif v4 then
			local TextBoundsResult2 = p1.observe.TextBounds(Text)
			FormulaResult = Compose.formula(function(Callback)
				-- upvalues: TextBoundsResult2 (copy)
				return Callback(TextBoundsResult2).Y
			end)
		end
		if TextBox.multiline == true and not v4 then
			Compose.watch(function(Callback)
				-- upvalues: CellResult3 (copy), FormulaResult (ref)
				CellResult3:set(Callback(FormulaResult))
			end)
		end
		if v4 then
			local TextBoundsResult3 = p1.observe.TextBounds(v4)
			Compose.watch(function(Callback)
				-- upvalues: CellResult3 (copy), FormulaResult (ref), CellResult4 (copy), TextBoundsResult3 (copy)
				CellResult3:set(Callback(FormulaResult))
				CellResult4:set(Callback(TextBoundsResult3).Y)
			end)
		end
		if IsNumber1 then
			local v17 = false
			Compose.watch(function(p3)
				-- upvalues: ReadFunction (upval), TextBox (copy), v17 (ref), CellResult1 (copy), CellResult2 (copy), Invalid (copy), Compose (upval), TimelineResult (copy), ReducedResult (copy)
				local IsReadResult = ReadFunction(TextBox.invalid, p3) == true
				
				if IsReadResult and not v17 and not CellResult1:peek() then
					CellResult1:set(true)
					CellResult2:set("Check this value.")
					
					if type(Invalid) == "table" and (Compose.isValue(Invalid) and type(Invalid.set) == "function") then
						Invalid:set(true)
					end
					if TimelineResult and ReducedResult and not ReducedResult() then
						TimelineResult:restart()
					end
				end
				if not IsReadResult and v17 then
					CellResult1:set(false)
					CellResult2:set("")
					
					if type(Invalid) == "table" and (Compose.isValue(Invalid) and type(Invalid.set) == "function") then
						Invalid:set(false)
					end
				end
				v17 = IsReadResult
				
				if assert(ReducedResult)(p3) then
					assert(TimelineResult):pause()
					assert(TimelineResult):seek(0.24)
				end
			end)
		end
		v3 = Compose.bindOwner(function()
			-- upvalues: p1 (upval), Text (ref), TypesEnum (upval), CellResult (copy), cancel (copy), Compose (upval)
			p1.action(Text, "TextEditing", {
				TypesEnum.KeyCode.Up, TypesEnum.KeyCode.Down, TypesEnum.KeyCode.Left,
				TypesEnum.KeyCode.Right, TypesEnum.KeyCode.DPadUp, TypesEnum.KeyCode.DPadDown,
				TypesEnum.KeyCode.DPadLeft, TypesEnum.KeyCode.DPadRight
			}, CellResult, function() end, { priority = 10000 })
			local _, Cancel2 = p1.action(Text, "Cancel", { TypesEnum.KeyCode.Escape, TypesEnum.KeyCode.ButtonB }, CellResult, cancel, { priority = 10000 })
			local EnabledResult = p1.observe.Enabled(Cancel2)
			Compose.watch(function(Callback)
				-- upvalues: EnabledResult (copy), CellResult (upval), Text (upval)
				if not Callback(EnabledResult) and CellResult:peek() then
					CellResult:set(false)
					
					if Text:IsFocused() then
						Text:ReleaseFocus(false)
					end
				end
			end)
		end)
		local UserInputService1 = p1.config.services.UserInputService
		
		if UserInputService1 then
			local UchEnabled = p1.observe.TouchEnabled(UserInputService1)
			local KeyboardEnabledResult = p1.observe.KeyboardEnabled(UserInputService1)
			local IsPeekResult = UchEnabled:peek() == true
			Compose.watch(function(Callback)
				-- upvalues: UchEnabled (copy), KeyboardEnabledResult (copy), IsPeekResult (ref), CellResult (copy), Text (ref)
				local IsCallbackResult = Callback(UchEnabled) == true
				local IsCallbackResult1 = Callback(KeyboardEnabledResult) == true
				
				if IsPeekResult and not IsCallbackResult and not IsCallbackResult1 and CellResult:peek() and Text:IsFocused() then
					Text:ReleaseFocus(false)
				end
				IsPeekResult = IsCallbackResult
			end)
		end
		Runtime.connect(Text, "ReturnPressedFromOnScreenKeyboard", function()
			-- upvalues: TextBox (copy), commit (copy), Text (ref)
			if TextBox.multiline ~= true then
				commit("submit")
				
				if Text:IsFocused() then
					Text:ReleaseFocus(false)
				end
			end
		end)
		Runtime.decorate(Text, {
			Attributes = {
				invalid = function(Callback)
					-- upvalues: CellResult1 (copy), ReadFunction (upval), TextBox (copy)
					return Callback(CellResult1) or ReadFunction(TextBox.invalid, Callback) == true
				end,
				validationMessage = function(Callback)
					-- upvalues: CellResult2 (copy)
					return Callback(CellResult2)
				end,
				readOnly = function(p3): boolean
					-- upvalues: ReadFunction (upval), TextBox (copy)
					return ReadFunction(TextBox.readOnly, p3) == true
				end
			}
		})
		
		if TextBox.label ~= nil or TextBox.presentation == "search" then
			Runtime.decorate(Text, {
				Attributes = {
					AccessibleLabel = function(p3)
						-- upvalues: TextBox (copy), FieldChromeModuleResult (upval), ReadFunction (upval)
						if TextBox.label == nil then
							local ReadResult = ReadFunction(TextBox.placeholder, p3)
							
							return if ReadResult == nil or ReadResult == "" then "Search" else ReadResult
						else
							return FieldChromeModuleResult.labelText(TextBox, p3)
						end
					end
				}
			})
		end
		if TextBox.selectOnFocus ~= nil then
			Runtime.decorate(Text, {
				Attributes = {
					selectOnFocus = function(p3)
						-- upvalues: policyOf (copy), ReadFunction (upval), TextBox (copy), v1 (ref)
						local Success, Result = pcall(policyOf, ReadFunction(TextBox.selectOnFocus, p3))
						
						return if Success then Result else v1
					end
				}
			})
		end
		if TextBox.selectOnFocus ~= nil then
			local SelectOnFocusFunction = TextBox.selectOnFocus
			
			if Compose.isValue(SelectOnFocusFunction) or type(SelectOnFocusFunction) == "function" then
				Compose.watch(function(p3)
					-- upvalues: v1 (ref), ReadFunction (upval), TextBox (copy), Control (copy)
					local ReadResult = ReadFunction(TextBox.selectOnFocus, p3)
					local v18 = nil
					
					if ReadResult == nil then
						v18 = "none"
					else
						if ReadResult ~= "none" and ReadResult ~= "all" and ReadResult ~= "end" then
							error(`Facet UI.{Control}: selectOnFocus: one of none | all | end (got {tostring(ReadResult)})`, 0)
						end
						v18 = ReadResult
					end
					v1 = v240
				end)
			end
		end
		Compose.cleanup(assert(Runtime.host.observation).observeProperty(Text, "Text", function()
			-- upvalues: Text1 (ref), Text (ref), Flag (ref), CellResult (copy), propose (copy)
			Text1 = Text.Text
			
			if not Flag and CellResult:peek() then
				propose(Text1)
			end
		end))
		Compose.watch(function(p3)
			-- upvalues: ReadFunction (upval), TextBox (copy), Text1 (ref), Flag (ref), Text (ref)
			local ReadResult = ReadFunction(TextBox.value, p3)
			
			if Text1 ~= ReadResult then
				Flag = true
				Text1 = ReadResult
				Text.Text = ReadResult
				Flag = false
			end
		end)
		Compose.watch(function(p3)
			-- upvalues: ReadFunction (upval), TextBox (copy), Text (ref), CellResult (copy)
			if ReadFunction(TextBox.enabled, p3) ~= false and ReadFunction(TextBox.disabled, p3) ~= true then
				Text:RemoveTag("facet-disabled")
			else
				Text:AddTag("facet-disabled")
			end
			if (ReadFunction(TextBox.enabled, p3) == false or ReadFunction(TextBox.disabled, p3) == true) and CellResult:peek() then
				CellResult:set(false)
				
				if Text:IsFocused() then
					Text:ReleaseFocus(false)
				end
			end
		end)
		
		local function endScrub(p3)
			-- upvalues: Config (ref), Flag1 (ref), TextBox (copy), ReadFunction (upval), Text1 (ref), Flag (ref), Text (ref), Compose (upval)
			local Config1 = Config
			
			if Config1 == nil then return end
			Config = nil
			
			if p3 and not Flag1 then
				assert(TextBox.numericValue):set(Config1.start)
				local Text2 = Config1.text
				
				if ReadFunction(TextBox.value) ~= Text2 then
					if TextBox.onChange then
						TextBox.onChange(Text2)
					else
						TextBox.value:set(Text2)
					end
				end
				local ReadResult = ReadFunction(TextBox.value)
				
				if Text1 ~= ReadResult then
					Flag = true
					Text1 = ReadResult
					Text.Text = ReadResult
					Flag = false
					
					return
				end
			elseif p3 then
				assert(TextBox.numericValue):set(Config1.start)
				local Value = TextBox.value
				
				if type(Value) == "table" and (Compose.isValue(Value) and type(Value.set) == "function") then
					TextBox.value:set(Config1.text)
				end
			end
		end
		
		local _ = function(p3): boolean
			-- upvalues: ReadFunction (upval), TextBox (copy)
			return ReadFunction(TextBox.scrub, p3) == true and (ReadFunction(TextBox.enabled, p3) ~= false and (ReadFunction(TextBox.disabled, p3) ~= true and not (ReadFunction(TextBox.readOnly, p3) == true)))
		end
		
		local OnScrub: ((any, number) -> boolean)? = nil
		
		if IsNumber and TextBox.scrub ~= nil then
			OnScrub = function(p3, Value: number): boolean
				-- upvalues: Flag1 (ref), TextBox (copy), ReadFunction (upval), CellResult (copy), ReadResult2 (ref), Config (ref), Text1 (ref), Flag (ref), Text (ref), CellResult1 (copy), CellResult2 (copy), Invalid (copy), Compose (upval), stepped (copy), settleNumber (copy), endScrub (copy)
				if Flag1 then
					return false
				end
				local v18 = assert(TextBox.numericValue)
				
				if p3 == "press" then
					return ReadFunction(TextBox.scrub, nil) == true and (ReadFunction(TextBox.enabled, nil) ~= false and (ReadFunction(TextBox.disabled, nil) ~= true and not (ReadFunction(TextBox.readOnly, nil) == true)))
				end
				if p3 == "begin" then
					if ReadFunction(TextBox.scrub, nil) ~= true or (ReadFunction(TextBox.enabled, nil) == false or ReadFunction(TextBox.disabled, nil) == true or ReadFunction(TextBox.readOnly, nil) == true) then
						return false
					end
					local PeekResult = v18:peek()
					local ReadResult1 = if CellResult:peek() then ReadResult2 else ReadFunction(TextBox.value)
					Config = {
						promoted = true,
						start = PeekResult,
						text = ReadResult1,
						written = PeekResult
					}
					
					if ReadFunction(TextBox.value) ~= ReadResult1 then
						if TextBox.onChange then
							TextBox.onChange(ReadResult1)
						else
							TextBox.value:set(ReadResult1)
						end
					end
					local ReadResult2 = ReadFunction(TextBox.value)
					
					if Text1 ~= ReadResult2 then
						Flag = true
						Text1 = ReadResult2
						Text.Text = ReadResult2
						Flag = false
					end
					CellResult1:set(false)
					CellResult2:set("")
					
					if type(Invalid) == "table" and (Compose.isValue(Invalid) and type(Invalid.set) == "function") then
						Invalid:set(false)
					end
					return true
				elseif p3 == "move" then
					local Config1 = Config
					
					if Config1 == nil or type(Value) ~= "number" then
						return false
					end
					local SteppedResult = stepped(Config1.start, math.floor(math.abs(Value) / 8) * (if Value < 0 then -1 else 1))
					
					if SteppedResult ~= v18:peek() then
						Config1.written = SteppedResult
						settleNumber(SteppedResult, "submit", false)
						Config1.written = v18:peek()
					end
					return true
				else
					if p3 ~= "end" then
						endScrub(true)
						
						return true
					end
					if Config == nil then
						return false
					end
					Config = nil
					
					if TextBox.onCommit then
						TextBox.onCommit(v18:peek(), "submit")
					end
					return true
				end
			end
			
			Compose.watch(function(Callback)
				-- upvalues: TextBox (copy), Config (ref)
				local CallbackResult = Callback(assert(TextBox.numericValue))
				local Config1 = Config
				
				if Config1 ~= nil and CallbackResult ~= Config1.written then
					Config = nil
				end
			end)
			Compose.watch(function(p3)
				-- upvalues: ReadFunction (upval), TextBox (copy), endScrub (copy)
				if ReadFunction(TextBox.scrub, p3) ~= true or (ReadFunction(TextBox.enabled, p3) == false or ReadFunction(TextBox.disabled, p3) == true or ReadFunction(TextBox.readOnly, p3) == true) then
					endScrub(true)
				end
			end)
			local UserInputService2 = p1.config.services.UserInputService
			
			if UserInputService2 then
				local PreferredInputResult = p1.observe.PreferredInput(UserInputService2)
				local Flag2 = true
				Compose.watch(function(Callback: (any) -> ())
					-- upvalues: PreferredInputResult (copy), Flag2 (ref), endScrub (copy)
					Callback(PreferredInputResult)
					
					if not Flag2 then
						endScrub(true)
					end
					Flag2 = false
				end)
			end
		end
		local UserInputService3 = p1.config.services.UserInputService
		
		if UserInputService3 and (TextBox.selectOnFocus ~= nil or OnScrub ~= nil) then
			Compose.cleanup(TextPressModule({
				box = Text,
				input = UserInputService3,
				Enum = TypesEnum,
				policy = function()
					-- upvalues: v1 (ref)
					return v1
				end,
				disabled = function(): boolean
					-- upvalues: ReadFunction (upval), TextBox (copy)
					return not (ReadFunction(TextBox.enabled, nil) ~= false and ReadFunction(TextBox.disabled, nil) ~= true)
				end,
				onScrub = OnScrub
			}))
		end
		Compose.cleanup(function()
			-- upvalues: KeyboardInsetModule (upval), p1 (upval), Text (ref), endScrub (copy), Flag1 (ref)
			KeyboardInsetModule.release(p1, Text)
			endScrub(true)
			Flag1 = true
		end)
		
		if not PresentResult then
			p1.skin(Text, "field", {
				disabled = function(p3): boolean
					-- upvalues: ReadFunction (upval), TextBox (copy)
					return not (ReadFunction(TextBox.enabled, p3) ~= false and ReadFunction(TextBox.disabled, p3) ~= true)
				end
			})
		end
		if v5 then
			local Native1 = if PresentResult then Native else Field
			FeedbackPaintModule(p1, WrapResult, v5, {
				Size = Native1.Size,
				AutomaticSize = Native1.AutomaticSize
			})
		end
		return WrapResult
	end
	
	p2.TextInput = p1.construct("TextInput", function(TextBox)
		-- upvalues: build (copy)
		return (build("TextInput", TextBox))
	end)
	p2.NumberInput = p1.construct("NumberInput", function(Tbl)
		-- upvalues: build (copy)
		if Tbl.presentation ~= nil then
			error("Facet UI.NumberInput: NumberInput IS the number presentation; remove presentation", 0)
		end
		local Copy = table.clone(Tbl)
		Copy.presentation = "number"
		
		return (build("NumberInput", Copy))
	end)
end