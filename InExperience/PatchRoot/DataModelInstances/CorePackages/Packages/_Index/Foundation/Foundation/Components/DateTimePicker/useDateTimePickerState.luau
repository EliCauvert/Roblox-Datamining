local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local dateTimeCalendarViewUtilitiesModule = require(script.Parent.Utilities.DateTimeCalendarViewUtilities)
local dateTimeEqualityUtilitiesModule = require(script.Parent.Utilities.DateTimeEqualityUtilities)
local dateTimeParsingUtilitiesModule = require(script.Parent.Utilities.DateTimeParsingUtilities)
local _ = require(script.Parent.DateTimePickerProps)
local dateTimeRangeSelectionUtilitiesModule = require(script.Parent.Utilities.DateTimeRangeSelectionUtilities)
local dateTimeUtilitiesModule = require(script.Parent.DateTimeUtilities)
local dateTimePickerVariantModule = require(foundation.Enums.DateTimePickerVariant)
local _ = require(foundation.Components.Types)
local guiService = require(foundation.Utility.Wrappers.Services).GuiService

return function(p0) --[[ line: 65 | named "useDateTimePickerState" ]]
	-- upvalues: dateTimePickerVariantModule (ref), reactModule (ref), dateTimeRangeSelectionUtilitiesModule (ref), dateTimeParsingUtilitiesModule (ref), guiService (ref), dateTimeCalendarViewUtilitiesModule (ref), dateTimeUtilitiesModule (ref), dateTimeEqualityUtilitiesModule (ref)
	local variant = p0.variant or dateTimePickerVariantModule.Single
	local var9 = if variant ~= dateTimePickerVariantModule.Dual then variant == dateTimePickerVariantModule.DualWithPresets else true
	local var10 = variant == dateTimePickerVariantModule.DualWithPresets
	local var11 = variant == dateTimePickerVariantModule.SingleWithTime
	local var12, var13 = reactModule.useState(false)
	local var14 = reactModule.useRef(nil)
	local var15 = reactModule.useMemo(function() --[[ line: 76 ]]
		-- upvalues: p0 (ref), dateTimeRangeSelectionUtilitiesModule (copy), var9 (ref)
		local defaultDates = p0.defaultDates
		
		return if defaultDates == nil then nil else dateTimeRangeSelectionUtilitiesModule.normalizeDates({ acceptsDateRange = var9, dates = defaultDates })
	end, { p0.defaultDates, var9 })
	local var16, var17 = reactModule.useState(if var15 then dateTimeParsingUtilitiesModule.formatInputText({ dates = var15, variant = variant }) else "")
	local var18 = reactModule.useRef(var16)
	var18.current = var16
	local var19, var20 = reactModule.useState(function() --[[ line: 97 ]]
		-- upvalues: var15 (ref)
		return var15
	end)
	local var21 = reactModule.useRef(var19)
	var21.current = var19
	local var22, var23 = reactModule.useState(nil)
	local var24, var25 = reactModule.useState(function() --[[ line: 106 ]]
		-- upvalues: var15 (ref)
		return var15
	end)
	local var26 = reactModule.useCallback(function() --[[ line: 110 ]]
		-- upvalues: var13 (ref)
		var13(false)
	end, {})
	local var27 = reactModule.useCallback(function() --[[ line: 114 ]]
		-- upvalues: var13 (ref)
		var13(true)
	end, {})
	local var28 = reactModule.useCallback(function() --[[ line: 118 ]]
		-- upvalues: guiService (copy), var27 (ref)
		if guiService.ViewportDisplaySize ~= Enum.DisplaySize.Small then
			var27()
		end
	end, { var27, guiService.ViewportDisplaySize })
	local var29 = reactModule.useCallback(function(p1, p2) --[[ line: 125 ]]
		-- upvalues: var20 (ref), var21 (ref), var25 (ref), var23 (ref)
		var20(p1)
		var21.current = p1
		
		if p2 and p2.asApplied then
			var25(p1)
		end
		if p2 and p2.anchor then
			var23(p2.anchor)
		end
	end, {})
	
	local function _(p3) --[[ line: 137 | named "resolvedViewAnchor" ]]
		-- upvalues: dateTimeCalendarViewUtilitiesModule (copy), p0 (ref)
		return DateTime.fromUnixTimestamp(dateTimeCalendarViewUtilitiesModule.resolveAnchorDate(p3, p0.referenceDate).UnixTimestamp)
	end
	
	local var30 = reactModule.useRef(nil)
	local var31 = reactModule.useCallback(function(p4) --[[ line: 145 ]]
		-- upvalues: var17 (ref), var30 (ref), var29 (ref), dateTimeCalendarViewUtilitiesModule (copy), p0 (ref), var9 (ref), dateTimeParsingUtilitiesModule (copy), dateTimeUtilitiesModule (copy)
		var17(p4)
		
		if var30.current ~= nil then
			local current = var30.current
			var30.current = nil
			
			if p4 == current then return end
		end
		local function clearDraftToReference() --[[ line: 157 ]]
			-- upvalues: var29 (copy), dateTimeCalendarViewUtilitiesModule (copy), p0 (copy)
			var29({}, {
				asApplied = true,
				anchor = DateTime.fromUnixTimestamp(dateTimeCalendarViewUtilitiesModule.resolveAnchorDate(nil, p0.referenceDate).UnixTimestamp)
			})
		end
		
		if p4:match("^%s*$") then
			clearDraftToReference()
			p0.onChanged(nil)
			
			return
		elseif var9 then
			local var45, var46 = dateTimeParsingUtilitiesModule.parseDualInputEndpoints(p4)
			p0.onChanged(var45, var46)
			local var47 = dateTimeParsingUtilitiesModule.parseInputToDraftDates(p4, p0.selectableDateRange)
			
			if var47 then
				var29(var47, { asApplied = true, anchor = var47[1] })
				
				return
			end
			clearDraftToReference()
			
			return
		else
			local var48 = dateTimeParsingUtilitiesModule.parseDateTimeFromText(dateTimeParsingUtilitiesModule.trimInputText(p4))
			
			if var48 and (p0.selectableDateRange == nil or dateTimeUtilitiesModule.isDateWithinRange(var48, p0.selectableDateRange)) then
				var29({ var48 }, { asApplied = true, anchor = var48 })
				p0.onChanged(var48)
				
				return
			end
			clearDraftToReference()
			p0.onChanged(var48)
		end
	end, {
		p0.onChanged, var9, var11, p0.referenceDate, p0.selectableDateRange, var29
	})
	local var32 = reactModule.useCallback(function(_) --[[ line: 206 ]]
		-- upvalues: var9 (ref), var18 (ref), dateTimeParsingUtilitiesModule (copy), p0 (ref), variant (ref), var21 (ref), dateTimeEqualityUtilitiesModule (copy), var30 (ref), var17 (ref)
		if not var9 then return end
		local current = var18.current
		local var49 = dateTimeParsingUtilitiesModule.parseInputToDraftDates(current, p0.selectableDateRange)
		
		if not var49 then return end
		local var50 = dateTimeParsingUtilitiesModule.formatInputText({ dates = var49, variant = variant })
		
		if var50 == current then return end
		local current_1 = var21.current
		
		if current_1 and current_1[1] and (current_1[2] and dateTimeEqualityUtilitiesModule.isSameDay(current_1[1], var49[1])) and dateTimeEqualityUtilitiesModule.isSameDay(current_1[2], var49[2]) then
			var30.current = var50
			var17(var50)
			p0.onChanged(var49[1], var49[2])
			
			return
		end
	end, { var9, p0.onChanged, p0.selectableDateRange, variant })
	local var33 = reactModule.useCallback(function(p5) --[[ line: 245 ]]
		-- upvalues: dateTimeRangeSelectionUtilitiesModule (copy), var21 (ref), var29 (ref)
		var29(dateTimeRangeSelectionUtilitiesModule.selectRangeEndpoint(var21.current, p5))
	end, { var29 })
	local var34 = reactModule.useCallback(function(p6) --[[ line: 250 ]]
		-- upvalues: p0 (ref), dateTimeEqualityUtilitiesModule (copy), var29 (ref)
		if p0.selectableDateRange and not dateTimeEqualityUtilitiesModule.isRangeWithinSelectableRange(p6, p0.selectableDateRange) then
			return
		end
		var29({ p6.startDate, p6.endDate }, { anchor = p6.startDate })
	end, { p0.selectableDateRange, var29 })
	local var35 = reactModule.useCallback(function(p7) --[[ line: 261 ]]
		-- upvalues: var21 (ref), var29 (ref)
		local current = var21.current
		local var51 = if current then current[1] else nil
		local var52 = if current then current[2] else nil
		local var53 = p7[1]
		local var54 = p7[2]
		
		if current and var53 and (var51 and var51.UnixTimestamp == var53.UnixTimestamp) and not var52 == not var54 and (not var52 or not var54 or var52.UnixTimestamp == var54.UnixTimestamp) then
			return
		end
		var29(p7)
	end, { var29 })
	local var36 = reactModule.useCallback(function() --[[ line: 284 ]]
		-- upvalues: var29 (ref), var24 (ref), dateTimeCalendarViewUtilitiesModule (copy), p0 (ref)
		var29(var24, {
			anchor = DateTime.fromUnixTimestamp(dateTimeCalendarViewUtilitiesModule.resolveAnchorDate(var24, p0.referenceDate).UnixTimestamp)
		})
	end, { var24, p0.referenceDate, var29 })
	local var37 = reactModule.useCallback(function() --[[ line: 290 ]]
		-- upvalues: var36 (ref), var26 (ref)
		var36()
		var26()
	end, { var36, var26 })
	local var38 = reactModule.useCallback(function() --[[ line: 295 ]]
		-- upvalues: var36 (ref)
		var36()
	end, { var36 })
	local var39 = reactModule.useCallback(function(p8) --[[ line: 299 ]]
		-- upvalues: var29 (ref), var9 (ref), dateTimeUtilitiesModule (copy), var30 (ref), var17 (ref), p0 (ref), var11 (ref)
		local var55 = p8[1]
		
		if not var55 then return end
		var29(p8, { anchor = var55 })
		local _ = nil
		
		if var9 then
			local var56 = p8[2]
			local text = dateTimeUtilitiesModule.formatLocalTime(var55) .. " - " .. (if var56 then dateTimeUtilitiesModule.formatLocalTime(var56) else "")
			var30.current = text
			var17(text)
			p0.onChanged(var55, var56)
			
			return
		end
		local var58 = dateTimeUtilitiesModule.formatLocalTime(var55, var11)
		var30.current = var58
		var17(var58)
		p0.onChanged(var55)
	end, { p0.onChanged, var9, var11, var29 })
	local var40 = reactModule.useCallback(function() --[[ line: 323 ]]
		-- upvalues: var21 (ref), var10 (ref), var26 (ref), var25 (ref), var39 (ref)
		local current = var21.current
		
		if current then
			if var10 and (not current[1] or not current[2]) then
				var26()
				
				return
			end
			var25(current)
			var39(current)
		end
		var26()
	end, { var26, var39, var10 })
	local var41 = false
	
	if var19 then
		local var42 = var19[1]
		local var43 = var19[2]
		
		if var10 or var9 then
			var41 = if var42 ~= nil then if var43 ~= nil then var43.UnixTimestamp < var42.UnixTimestamp else true else true
		elseif variant == dateTimePickerVariantModule.Single or var11 then
			local _ = var42 == nil
		end
	elseif var10 then
		var41 = true
	end
	return {
		closeDateTimePicker = var26,
		isOpen = var12,
		onFocusGained = var28,
		onFocusLost = var32,
		showDateTimePicker = var27,
		textInputRef = var14,
		selectedDates = var19,
		inputText = var16,
		updateInputText = var31,
		viewAnchorDate = var22,
		onDayActivated = var33,
		onPresetSelected = var34,
		onSelectedDatesChanged = var35,
		onApply = var40,
		onCancel = var37,
		onReset = var38,
		isApplyButtonDisabled = var41,
		isResetButtonDisabled = if var10 or var11 then dateTimeEqualityUtilitiesModule.areDatesEqual(var19, var24) else true
	}
end