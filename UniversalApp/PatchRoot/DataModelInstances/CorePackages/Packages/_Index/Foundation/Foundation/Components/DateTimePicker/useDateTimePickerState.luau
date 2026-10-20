local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local DateTimeCalendarViewUtilitiesModule = require(script.Parent.Utilities.DateTimeCalendarViewUtilities)
local DateTimeEqualityUtilitiesModule = require(script.Parent.Utilities.DateTimeEqualityUtilities)
local DateTimeParsingUtilitiesModule = require(script.Parent.Utilities.DateTimeParsingUtilities)
local _ = require(script.Parent.DateTimePickerProps)
local DateTimeRangeSelectionUtilitiesModule = require(script.Parent.Utilities.DateTimeRangeSelectionUtilities)
local DateTimeUtilitiesModule = require(script.Parent.DateTimeUtilities)
local DateTimePickerVariantModule = require(Foundation.Enums.DateTimePickerVariant)
local _ = require(Foundation.Components.Types)
local GuiService = require(Foundation.Utility.Wrappers.Services).GuiService

return function(p1)
	-- upvalues: DateTimePickerVariantModule (copy), ReactModule (copy), DateTimeRangeSelectionUtilitiesModule (copy), DateTimeParsingUtilitiesModule (copy), GuiService (copy), DateTimeCalendarViewUtilitiesModule (copy), DateTimeUtilitiesModule (copy), DateTimeEqualityUtilitiesModule (copy)
	local Variant = p1.variant or DateTimePickerVariantModule.Single
	local IsVariantMatch: boolean = Variant == DateTimePickerVariantModule.Dual or Variant == DateTimePickerVariantModule.DualWithPresets
	local IsVariantMatch1 = Variant == DateTimePickerVariantModule.DualWithPresets
	local IsVariantMatch2 = Variant == DateTimePickerVariantModule.SingleWithTime
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), DateTimeRangeSelectionUtilitiesModule (upval), IsVariantMatch (copy)
		local DefaultDates = p1.defaultDates
		
		return if DefaultDates == nil then nil else DateTimeRangeSelectionUtilitiesModule.normalizeDates({ acceptsDateRange = IsVariantMatch, dates = DefaultDates })
	end, { p1.defaultDates, IsVariantMatch })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(if UseMemoResult then DateTimeParsingUtilitiesModule.formatInputText({ dates = UseMemoResult, variant = Variant }) else "")
	local UseRefResult1 = ReactModule.useRef(UseStateResult1)
	UseRefResult1.current = UseStateResult1
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(function()
		-- upvalues: UseMemoResult (copy)
		return UseMemoResult
	end)
	local UseRefResult2 = ReactModule.useRef(UseStateResult3)
	UseRefResult2.current = UseStateResult3
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(function()
		-- upvalues: UseMemoResult (copy)
		return UseMemoResult
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: GuiService (upval), UseResult1 (copy)
		if GuiService.ViewportDisplaySize ~= Enum.DisplaySize.Small then
			UseResult1()
		end
	end, { UseResult1, GuiService.ViewportDisplaySize })
	local UseResult3 = ReactModule.useCallback(function(Current, p2)
		-- upvalues: UseStateResult2_2 (copy), UseRefResult2 (copy), UseStateResult2_4 (copy), UseStateResult2_3 (copy)
		UseStateResult2_2(Current)
		UseRefResult2.current = Current
		
		if p2 and p2.asApplied then
			UseStateResult2_4(Current)
		end
		if p2 and p2.anchor then
			UseStateResult2_3(p2.anchor)
		end
	end, {})
	
	local function _(p2)
		-- upvalues: DateTimeCalendarViewUtilitiesModule (upval), p1 (copy)
		return DateTime.fromUnixTimestamp(DateTimeCalendarViewUtilitiesModule.resolveAnchorDate(p2, p1.referenceDate).UnixTimestamp)
	end
	
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseResult4 = ReactModule.useCallback(function(Current)
		-- upvalues: UseStateResult2_1 (copy), UseRefResult3 (copy), UseResult3 (copy), DateTimeCalendarViewUtilitiesModule (upval), p1 (copy), IsVariantMatch (copy), DateTimeParsingUtilitiesModule (upval), DateTimeUtilitiesModule (upval)
		UseStateResult2_1(Current)
		
		if UseRefResult3.current ~= nil then
			UseRefResult3.current = nil
			
			if Current == UseRefResult3.current then return end
		end
		local function clearDraftToReference()
			-- upvalues: UseResult3 (upval), DateTimeCalendarViewUtilitiesModule (upval), p1 (upval)
			UseResult3({}, {
				asApplied = true,
				anchor = DateTime.fromUnixTimestamp(DateTimeCalendarViewUtilitiesModule.resolveAnchorDate(nil, p1.referenceDate).UnixTimestamp)
			})
		end
		
		if Current:match("^%s*$") then
			clearDraftToReference()
			p1.onChanged(nil)
			
			return
		end
		if IsVariantMatch then
			local ParseDualInputEndpointsResult, ParseDualInputEndpointsResult2 = DateTimeParsingUtilitiesModule.parseDualInputEndpoints(Current)
			p1.onChanged(ParseDualInputEndpointsResult, ParseDualInputEndpointsResult2)
			local ParseInputToDraftDatesResult = DateTimeParsingUtilitiesModule.parseInputToDraftDates(Current, p1.selectableDateRange)
			
			if ParseInputToDraftDatesResult then
				UseResult3(ParseInputToDraftDatesResult, {
					asApplied = true,
					anchor = ParseInputToDraftDatesResult[1]
				})
				
				return
			else
				clearDraftToReference()
				
				return
			end
		else
			local ParseDateTimeFromTextResult = DateTimeParsingUtilitiesModule.parseDateTimeFromText(DateTimeParsingUtilitiesModule.trimInputText(Current))
			
			if ParseDateTimeFromTextResult and (p1.selectableDateRange == nil or DateTimeUtilitiesModule.isDateWithinRange(ParseDateTimeFromTextResult, p1.selectableDateRange)) then
				UseResult3({ ParseDateTimeFromTextResult }, { asApplied = true, anchor = ParseDateTimeFromTextResult })
				p1.onChanged(ParseDateTimeFromTextResult)
				
				return
			else
				clearDraftToReference()
				p1.onChanged(ParseDateTimeFromTextResult)
			end
		end
	end, {
		p1.onChanged, IsVariantMatch, IsVariantMatch2, p1.referenceDate,
		p1.selectableDateRange, UseResult3
	})
	local UseResult5 = ReactModule.useCallback(function(_)
		-- upvalues: IsVariantMatch (copy), UseRefResult1 (copy), DateTimeParsingUtilitiesModule (upval), p1 (copy), Variant (copy), UseRefResult2 (copy), DateTimeEqualityUtilitiesModule (upval), UseRefResult3 (copy), UseStateResult2_1 (copy)
		if not IsVariantMatch then return end
		local Current = UseRefResult1.current
		local ParseInputToDraftDatesResult = DateTimeParsingUtilitiesModule.parseInputToDraftDates(Current, p1.selectableDateRange)
		
		if not ParseInputToDraftDatesResult then return end
		local FormatInputTextResult = DateTimeParsingUtilitiesModule.formatInputText({ dates = ParseInputToDraftDatesResult, variant = Variant })
		
		if FormatInputTextResult == Current then return end
		local Current1 = UseRefResult2.current
		
		if Current1 and Current1[1] and Current1[2] and DateTimeEqualityUtilitiesModule.isSameDay(Current1[1], ParseInputToDraftDatesResult[1]) and DateTimeEqualityUtilitiesModule.isSameDay(Current1[2], ParseInputToDraftDatesResult[2]) then
			UseRefResult3.current = FormatInputTextResult
			UseStateResult2_1(FormatInputTextResult)
			p1.onChanged(ParseInputToDraftDatesResult[1], ParseInputToDraftDatesResult[2])
			
			return
		end
	end, {
		IsVariantMatch,
		p1.onChanged,
		p1.selectableDateRange,
		Variant
	})
	local UseResult6 = ReactModule.useCallback(function(p2)
		-- upvalues: DateTimeRangeSelectionUtilitiesModule (upval), UseRefResult2 (copy), UseResult3 (copy)
		UseResult3((DateTimeRangeSelectionUtilitiesModule.selectRangeEndpoint(UseRefResult2.current, p2)))
	end, { UseResult3 })
	local UseResult7 = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), DateTimeEqualityUtilitiesModule (upval), UseResult3 (copy)
		if not p1.selectableDateRange or DateTimeEqualityUtilitiesModule.isRangeWithinSelectableRange(p2, p1.selectableDateRange) then
			UseResult3({ p2.startDate, p2.endDate }, { anchor = p2.startDate })
			
			return
		end
	end, { p1.selectableDateRange, UseResult3 })
	local UseResult8 = ReactModule.useCallback(function(Entry)
		-- upvalues: UseRefResult2 (copy), UseResult3 (copy)
		local Current = UseRefResult2.current
		local CurrentEntry = if Current then Current[1] else nil
		local CurrentEntry1 = if Current then Current[2] else nil
		local Entry1 = Entry[1]
		local Entry2 = Entry[2]
		
		if not Current or not Entry1 or not CurrentEntry or CurrentEntry.UnixTimestamp ~= Entry1.UnixTimestamp or not CurrentEntry1 ~= not Entry2 or CurrentEntry1 and Entry2 and CurrentEntry1.UnixTimestamp ~= Entry2.UnixTimestamp then
			UseResult3(Entry)
			
			return
		end
	end, { UseResult3 })
	local UseResult9 = ReactModule.useCallback(function()
		-- upvalues: UseResult3 (copy), UseStateResult5 (copy), DateTimeCalendarViewUtilitiesModule (upval), p1 (copy)
		UseResult3(UseStateResult5, {
			anchor = DateTime.fromUnixTimestamp(DateTimeCalendarViewUtilitiesModule.resolveAnchorDate(UseStateResult5, p1.referenceDate).UnixTimestamp)
		})
	end, { UseStateResult5, p1.referenceDate, UseResult3 })
	local UseResult10 = ReactModule.useCallback(function()
		-- upvalues: UseResult9 (copy), UseResult (copy)
		UseResult9()
		UseResult()
	end, { UseResult9, UseResult })
	local UseResult11 = ReactModule.useCallback(function()
		-- upvalues: UseResult9 (copy)
		UseResult9()
	end, { UseResult9 })
	local UseResult12 = ReactModule.useCallback(function(Entry)
		-- upvalues: UseResult3 (copy), IsVariantMatch (copy), DateTimeUtilitiesModule (upval), UseRefResult3 (copy), UseStateResult2_1 (copy), p1 (copy), IsVariantMatch2 (copy)
		local Entry1 = Entry[1]
		
		if not Entry1 then return end
		UseResult3(Entry, { anchor = Entry1 })
		
		if IsVariantMatch then
			local Entry2 = Entry[2]
			local Text = DateTimeUtilitiesModule.formatLocalTime(Entry1) .. " - " .. (if Entry2 then DateTimeUtilitiesModule.formatLocalTime(Entry2) else "")
			UseRefResult3.current = Text
			UseStateResult2_1(Text)
			p1.onChanged(Entry1, Entry2)
			
			return
		else
			local FormatLocalTimeResult = DateTimeUtilitiesModule.formatLocalTime(Entry1, IsVariantMatch2)
			UseRefResult3.current = FormatLocalTimeResult
			UseStateResult2_1(FormatLocalTimeResult)
			p1.onChanged(Entry1)
		end
	end, {
		p1.onChanged,
		IsVariantMatch,
		IsVariantMatch2,
		UseResult3
	})
	local UseResult13 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), IsVariantMatch1 (copy), UseResult (copy), UseStateResult2_4 (copy), UseResult12 (copy)
		local Current = UseRefResult2.current
		
		if Current then
			if IsVariantMatch1 and (not Current[1] or not Current[2]) then
				UseResult()
				
				return
			end
			UseStateResult2_4(Current)
			UseResult12(Current)
		end
		UseResult()
	end, { UseResult, UseResult12, IsVariantMatch1 })
	local IsApplyButtonDisabled = false
	
	if UseStateResult3 then
		local UseStateResultEntry = UseStateResult3[1]
		local UseStateResultEntry1 = UseStateResult3[2]
		
		if IsVariantMatch1 or IsVariantMatch then
			IsApplyButtonDisabled = UseStateResultEntry == nil or (UseStateResultEntry1 == nil or UseStateResultEntry1.UnixTimestamp < UseStateResultEntry.UnixTimestamp)
		elseif Variant == DateTimePickerVariantModule.Single or IsVariantMatch2 then
			IsApplyButtonDisabled = UseStateResultEntry == nil
		end
	elseif IsVariantMatch1 then
		IsApplyButtonDisabled = true
	end
	return {
		closeDateTimePicker = UseResult,
		isOpen = UseStateResult,
		onFocusGained = UseResult2,
		onFocusLost = UseResult5,
		showDateTimePicker = UseResult1,
		textInputRef = UseRefResult,
		selectedDates = UseStateResult3,
		inputText = UseStateResult1,
		updateInputText = UseResult4,
		viewAnchorDate = UseStateResult4,
		onDayActivated = UseResult6,
		onPresetSelected = UseResult7,
		onSelectedDatesChanged = UseResult8,
		onApply = UseResult13,
		onCancel = UseResult10,
		onReset = UseResult11,
		isApplyButtonDisabled = IsApplyButtonDisabled,
		isResetButtonDisabled = not IsVariantMatch1 and not IsVariantMatch2 or DateTimeEqualityUtilitiesModule.areDatesEqual(UseStateResult3, UseStateResult5)
	}
end