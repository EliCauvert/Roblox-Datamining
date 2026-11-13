local CivilDateModule = require("./civil_date")
local _ = require("./field_chrome")
local _ = require("./types")
local _ = require("./date_time_picker_types")
local _ = require("./civil_date_types")
local _ = require("./input_props")
local config = {
	months = true,
	weekdays = true,
	order = true,
	separator = true,
	hourCycle = true
}
local config1 = { id = true, label = true, range = true }
local config2 = { mdy = true, dmy = true, ymd = true }

return function(p1, p2, p3)
	-- upvalues: CivilDateModule (copy), config (copy), config2 (copy), config1 (copy)
	local ReadFunction = p1.read
	
	local function _(p4)
		error(`Facet UI.DateTimePicker: {p4}`, 0)
	end
	
	local Selection = p3.selection or "single"
	
	if Selection ~= "single" and Selection ~= "range" then
		error("Facet UI.DateTimePicker: selection is \"single\" or \"range\".", 0)
	end
	local IsRange = Selection == "range"
	
	if IsRange and (p3.value ~= nil or p3.onChange ~= nil or p3.onCommit ~= nil) then
		error("Facet UI.DateTimePicker: a range picker uses range, onRangeChange and onRangeCommit, not the single keys.", 0)
	end
	if not IsRange and (p3.range ~= nil or p3.onRangeChange ~= nil or p3.onRangeCommit ~= nil or p3.presets ~= nil) then
		error("Facet UI.DateTimePicker: range, onRangeChange, onRangeCommit and presets belong to selection = \"range\".", 0)
	end
	for _, value in {
		"onChange", "onCommit", "onRangeChange", "onRangeCommit", "onPresentedChange",
		"onDismiss", "isDateDisabled", "clock", "format"
	} do
		if p3[value] ~= nil and type(p3[value]) ~= "function" then
			error(`Facet UI.DateTimePicker: {`{value} is a function.`}`, 0)
		end
	end
	for _, value1 in { "time", "draft" } do
		if p3[value1] ~= nil and type(p3[value1]) ~= "boolean" then
			error(`Facet UI.DateTimePicker: {`{value1} is true or false.`}`, 0)
		end
	end
	local IsTime = p3.time == true
	
	if IsTime and IsRange then
		error("Facet UI.DateTimePicker: time belongs to a single date; a range holds whole days.", 0)
	end
	local IsDraft = p3.draft == true
	local ReadResult = ReadFunction(p3.readOnly)
	
	if ReadResult ~= nil and type(ReadResult) ~= "boolean" then
		error("Facet UI.DateTimePicker: readOnly is a boolean or a readable boolean.", 0)
	end
	local OnChange = p3.onChange
	local OnRangeChange = p3.onRangeChange
	local HasOnRangeChange: boolean = if IsRange then OnRangeChange ~= nil else OnChange ~= nil
	
	if not HasOnRangeChange and ReadResult ~= true then
		error(`Facet UI.DateTimePicker: {`an interactive picker needs {if IsRange then "onRangeChange" else "onChange"}; only a readOnly one may omit it.`}`, 0)
	end
	local MinuteStep = p3.minuteStep or 5
	
	if type(MinuteStep) ~= "number" or MinuteStep < 1 or MinuteStep % 1 ~= 0 or 60 % MinuteStep ~= 0 then
		error("Facet UI.DateTimePicker: minuteStep is a whole number of minutes that divides 60.", 0)
	end
	local WeekStart = p3.weekStart or 1
	
	if type(WeekStart) ~= "number" or WeekStart % 1 ~= 0 or WeekStart < 1 or WeekStart > 7 then
		error("Facet UI.DateTimePicker: weekStart is 1 (Sunday) to 7 (Saturday).", 0)
	end
	local ENGLISH = CivilDateModule.ENGLISH
	local Months = assert(ENGLISH.months)
	local Weekdays = assert(ENGLISH.weekdays)
	local Order = ENGLISH.order
	local Separator = ENGLISH.separator
	local HourCycle = ENGLISH.hourCycle
	
	if p3.locale ~= nil then
		if type(p3.locale) ~= "table" then
			error("Facet UI.DateTimePicker: locale is a table: { months?, weekdays?, order?, separator?, hourCycle? }.", 0)
		end
		for i in p3.locale do
			if type(i) ~= "string" or not config[i] then
				error(`Facet UI.DateTimePicker: {`locale: unknown key '{tostring(i)}'.`}`, 0)
			end
		end
		local Locale = p3.locale
		Months = Locale.months or Months
		Weekdays = Locale.weekdays or Weekdays
		Order = Locale.order or Order
		Separator = Locale.separator or Separator
		HourCycle = Locale.hourCycle or HourCycle
		
		if type(Months) ~= "table" or #Months ~= 12 then
			error("Facet UI.DateTimePicker: locale.months names the twelve months, January first.", 0)
		end
		if type(Weekdays) ~= "table" or #Weekdays ~= 7 then
			error("Facet UI.DateTimePicker: locale.weekdays names the seven days, Sunday first.", 0)
		end
		if Order == nil or not config2[Order] then
			error("Facet UI.DateTimePicker: locale.order is \"mdy\", \"dmy\" or \"ymd\".", 0)
		end
	end
	local HourCycle1 = p3.hourCycle or (HourCycle or 12)
	
	if HourCycle1 ~= 12 and HourCycle1 ~= 24 then
		error("Facet UI.DateTimePicker: hourCycle is 12 or 24.", 0)
	end
	local Locale = {
		months = Months,
		weekdays = Weekdays,
		order = Order,
		separator = Separator,
		hourCycle = HourCycle1
	}
	local Style = p3.style or "automatic"
	
	if Style ~= "automatic" and Style ~= "inline" then
		error("Facet UI.DateTimePicker: style is \"automatic\" (a field that opens the calendar) or \"inline\".", 0)
	end
	local IsNotInline = Style ~= "inline"
	
	if not IsNotInline and (p3.isPresented ~= nil or p3.onPresentedChange ~= nil) then
		error("Facet UI.DateTimePicker: an inline calendar is always shown: isPresented and onPresentedChange belong to the field.", 0)
	end
	if p3.placeholder ~= nil and type(p3.placeholder) ~= "string" then
		error("Facet UI.DateTimePicker: placeholder is a string.", 0)
	end
	local _ = function(p4, p5, p6)
		-- upvalues: CivilDateModule (upval)
		if p5 ~= nil then
			local ProblemResult = CivilDateModule.problem(p5, p6)
			
			if ProblemResult ~= nil then
				error(`Facet UI.DateTimePicker: {`{p4} {ProblemResult}.`}`, 0)
			end
		end
	end
	
	if IsRange then
		local ReadResult1 = ReadFunction(p3.range)
		
		if type(ReadResult1) ~= "table" then
			error("Facet UI.DateTimePicker: range is { start?, finish? } or a readable one.", 0)
		end
		local Start = ReadResult1.start
		
		if Start ~= nil then
			local ProblemResult = CivilDateModule.problem(Start, nil)
			
			if ProblemResult ~= nil then
				error(`Facet UI.DateTimePicker: {`range.start {ProblemResult}.`}`, 0)
			end
		end
		local Finish = ReadResult1.finish
		
		if Finish ~= nil then
			local ProblemResult = CivilDateModule.problem(Finish, nil)
			
			if ProblemResult ~= nil then
				error(`Facet UI.DateTimePicker: {`range.finish {ProblemResult}.`}`, 0)
			end
		end
	else
		local ReadResult1 = ReadFunction(p3.value)
		
		if ReadResult1 ~= nil then
			local ProblemResult = CivilDateModule.problem(ReadResult1, IsTime)
			
			if ProblemResult ~= nil then
				error(`Facet UI.DateTimePicker: {`value {ProblemResult}.`}`, 0)
			end
		end
	end
	local ReadResult2, ReadResult2_2 = ReadFunction(p3.min)
	
	if ReadResult2 ~= nil then
		local ProblemResult = CivilDateModule.problem(ReadResult2, ReadResult2_2)
		
		if ProblemResult ~= nil then
			error(`Facet UI.DateTimePicker: {`min {ProblemResult}.`}`, 0)
		end
	end
	local ReadResult3, ReadResult2_3 = ReadFunction(p3.max)
	
	if ReadResult3 ~= nil then
		local ProblemResult = CivilDateModule.problem(ReadResult3, ReadResult2_3)
		
		if ProblemResult ~= nil then
			error(`Facet UI.DateTimePicker: {`max {ProblemResult}.`}`, 0)
		end
	end
	local ReadResult21, ReadResult2_1 = ReadFunction(p3.referenceDate)
	
	if ReadResult21 ~= nil then
		local ProblemResult = CivilDateModule.problem(ReadResult21, ReadResult2_1)
		
		if ProblemResult ~= nil then
			error(`Facet UI.DateTimePicker: {`referenceDate {ProblemResult}.`}`, 0)
		end
	end
	local Presets = {}
	
	if p3.presets ~= nil then
		if type(p3.presets) ~= "table" then
			error("Facet UI.DateTimePicker: presets is a list of { id, label, range = function(today) }.", 0)
		end
		local t = {}
		
		for i1, preset in p3.presets do
			if type(preset) ~= "table" or type(preset.id) ~= "string" or type(preset.label) ~= "string" or type(preset.range) ~= "function" then
				error(`Facet UI.DateTimePicker: {`presets[{i1}] is \{ id = string, label = string, range = function(today) }.`}`, 0)
			end
			for i2 in preset do
				if type(i2) ~= "string" or not config1[i2] then
					error(`Facet UI.DateTimePicker: {`presets[{i1}]: unknown key '{tostring(i2)}'.`}`, 0)
				end
			end
			if t[preset.id] then
				error(`Facet UI.DateTimePicker: {`presets repeats the id '{preset.id}'.`}`, 0)
			end
			t[preset.id] = true
			table.insert(Presets, preset)
		end
	end
	p2.check("DateTimePicker", {
		label = p3.label,
		requiredMark = p3.requiredMark,
		hint = p3.hint,
		errorText = p3.errorText,
		controlSize = p3.controlSize,
		appearance = p3.appearance,
		corners = p3.corners
	})
	
	return {
		isRange = IsRange,
		withTime = IsTime,
		draft = IsDraft,
		proposeSingle = OnChange,
		proposeRange = OnRangeChange,
		hasProposer = HasOnRangeChange,
		minuteStep = MinuteStep,
		weekStart = WeekStart,
		months = Months,
		weekdays = Weekdays,
		locale = Locale,
		hourCycle = HourCycle1,
		overlay = IsNotInline,
		presets = Presets,
		clock = p3.clock or CivilDateModule.systemClock()
	}
end