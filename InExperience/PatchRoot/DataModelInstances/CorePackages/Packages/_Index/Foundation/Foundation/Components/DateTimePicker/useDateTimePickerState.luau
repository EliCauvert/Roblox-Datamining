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

return function(p1)
	-- upvalues: dateTimePickerVariantModule (ref), reactModule (ref), dateTimeRangeSelectionUtilitiesModule (ref), dateTimeParsingUtilitiesModule (ref), guiService (ref), dateTimeCalendarViewUtilitiesModule (ref), dateTimeUtilitiesModule (ref), dateTimeEqualityUtilitiesModule (ref)
	local variant = p1.variant or dateTimePickerVariantModule.Single
	local var1 = if variant ~= dateTimePickerVariantModule.Dual then variant == dateTimePickerVariantModule.DualWithPresets else true
	local var2 = variant == dateTimePickerVariantModule.DualWithPresets
	local var3 = variant == dateTimePickerVariantModule.SingleWithTime
	local var4, var5 = reactModule.useState(false)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), dateTimeRangeSelectionUtilitiesModule (copy), var1 (ref)
		local defaultDates = p1.defaultDates
		
		return if defaultDates == nil then nil else dateTimeRangeSelectionUtilitiesModule.normalizeDates({ acceptsDateRange = var1, dates = defaultDates })
	end, { p1.defaultDates, var1 })
	local var8, var9 = reactModule.useState(if var7 then dateTimeParsingUtilitiesModule.formatInputText({ dates = var7, variant = variant }) else "")
	local var10 = reactModule.useRef(var8)
	var10.current = var8
	local var11, var12 = reactModule.useState(function()
		-- upvalues: var7 (ref)
		return var7
	end)
	local var13 = reactModule.useRef(var11)
	var13.current = var11
	local var14, var15 = reactModule.useState(nil)
	local var16, var17 = reactModule.useState(function()
		-- upvalues: var7 (ref)
		return var7
	end)
	local var18 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5(false)
	end, {})
	local var19 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5(true)
	end, {})
	local var20 = reactModule.useCallback(function()
		-- upvalues: guiService (copy), var19 (ref)
		if guiService.ViewportDisplaySize ~= Enum.DisplaySize.Small then
			var19()
		end
	end, { var19, guiService.ViewportDisplaySize })
	local var21 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var12 (ref), var13 (ref), var17 (ref), var15 (ref)
		var12(p2)
		var13.current = p2
		
		if p3 and p3.asApplied then
			var17(p2)
		end
		if p3 and p3.anchor then
			var15(p3.anchor)
		end
	end, {})
	
	local function _(p2)
		-- upvalues: dateTimeCalendarViewUtilitiesModule (copy), p1 (ref)
		return DateTime.fromUnixTimestamp(dateTimeCalendarViewUtilitiesModule.resolveAnchorDate(p2, p1.referenceDate).UnixTimestamp)
	end
	
	local var22 = reactModule.useRef(nil)
	local var23 = reactModule.useCallback(function(p2)
		-- upvalues: var9 (ref), var22 (ref), var21 (ref), dateTimeCalendarViewUtilitiesModule (copy), p1 (ref), var1 (ref), dateTimeParsingUtilitiesModule (copy), dateTimeUtilitiesModule (copy)
		var9(p2)
		
		if var22.current ~= nil then
			local current = var22.current
			var22.current = nil
			
			if p2 == current then return end
		end
		local function clearDraftToReference()
			-- upvalues: var21 (copy), dateTimeCalendarViewUtilitiesModule (copy), p1 (copy)
			var21({}, {
				asApplied = true,
				anchor = DateTime.fromUnixTimestamp(dateTimeCalendarViewUtilitiesModule.resolveAnchorDate(nil, p1.referenceDate).UnixTimestamp)
			})
		end
		
		if p2:match("^%s*$") then
			clearDraftToReference()
			p1.onChanged(nil)
			
			return
		elseif var1 then
			local var24, var25 = dateTimeParsingUtilitiesModule.parseDualInputEndpoints(p2)
			p1.onChanged(var24, var25)
			local var26 = dateTimeParsingUtilitiesModule.parseInputToDraftDates(p2, p1.selectableDateRange)
			
			if var26 then
				var21(var26, { asApplied = true, anchor = var26[1] })
				
				return
			end
			clearDraftToReference()
			
			return
		else
			local var27 = dateTimeParsingUtilitiesModule.parseDateTimeFromText(dateTimeParsingUtilitiesModule.trimInputText(p2))
			
			if var27 and (p1.selectableDateRange == nil or dateTimeUtilitiesModule.isDateWithinRange(var27, p1.selectableDateRange)) then
				var21({ var27 }, { asApplied = true, anchor = var27 })
				p1.onChanged(var27)
				
				return
			end
			clearDraftToReference()
			p1.onChanged(var27)
		end
	end, {
		p1.onChanged, var1, var3, p1.referenceDate, p1.selectableDateRange, var21
	})
	local var24 = reactModule.useCallback(function(_)
		-- upvalues: var1 (ref), var10 (ref), dateTimeParsingUtilitiesModule (copy), p1 (ref), variant (ref), var13 (ref), dateTimeEqualityUtilitiesModule (copy), var22 (ref), var9 (ref)
		if not var1 then return end
		local current = var10.current
		local var25 = dateTimeParsingUtilitiesModule.parseInputToDraftDates(current, p1.selectableDateRange)
		
		if not var25 then return end
		local var26 = dateTimeParsingUtilitiesModule.formatInputText({ dates = var25, variant = variant })
		
		if var26 == current then return end
		local current_1 = var13.current
		
		if current_1 and current_1[1] and (current_1[2] and dateTimeEqualityUtilitiesModule.isSameDay(current_1[1], var25[1])) and dateTimeEqualityUtilitiesModule.isSameDay(current_1[2], var25[2]) then
			var22.current = var26
			var9(var26)
			p1.onChanged(var25[1], var25[2])
			
			return
		end
	end, { var1, p1.onChanged, p1.selectableDateRange, variant })
	local var25 = reactModule.useCallback(function(p2)
		-- upvalues: dateTimeRangeSelectionUtilitiesModule (copy), var13 (ref), var21 (ref)
		var21(dateTimeRangeSelectionUtilitiesModule.selectRangeEndpoint(var13.current, p2))
	end, { var21 })
	local var26 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), dateTimeEqualityUtilitiesModule (copy), var21 (ref)
		if p1.selectableDateRange and not dateTimeEqualityUtilitiesModule.isRangeWithinSelectableRange(p2, p1.selectableDateRange) then
			return
		end
		var21({ p2.startDate, p2.endDate }, { anchor = p2.startDate })
	end, { p1.selectableDateRange, var21 })
	local var27 = reactModule.useCallback(function(p2)
		-- upvalues: var13 (ref), var21 (ref)
		local current = var13.current
		local var28 = if current then current[1] else nil
		local var29 = if current then current[2] else nil
		local var30 = p2[1]
		local var31 = p2[2]
		
		if current and var30 and (var28 and var28.UnixTimestamp == var30.UnixTimestamp) and not var29 == not var31 and (not var29 or not var31 or var29.UnixTimestamp == var31.UnixTimestamp) then
			return
		end
		var21(p2)
	end, { var21 })
	local var28 = reactModule.useCallback(function()
		-- upvalues: var21 (ref), var16 (ref), dateTimeCalendarViewUtilitiesModule (copy), p1 (ref)
		var21(var16, {
			anchor = DateTime.fromUnixTimestamp(dateTimeCalendarViewUtilitiesModule.resolveAnchorDate(var16, p1.referenceDate).UnixTimestamp)
		})
	end, { var16, p1.referenceDate, var21 })
	local var29 = reactModule.useCallback(function()
		-- upvalues: var28 (ref), var18 (ref)
		var28()
		var18()
	end, { var28, var18 })
	local var30 = reactModule.useCallback(function()
		-- upvalues: var28 (ref)
		var28()
	end, { var28 })
	local var31 = reactModule.useCallback(function(p2)
		-- upvalues: var21 (ref), var1 (ref), dateTimeUtilitiesModule (copy), var22 (ref), var9 (ref), p1 (ref), var3 (ref)
		local var32 = p2[1]
		
		if not var32 then return end
		var21(p2, { anchor = var32 })
		local _ = nil
		
		if var1 then
			local var33 = p2[2]
			local text = dateTimeUtilitiesModule.formatLocalTime(var32) .. " - " .. (if var33 then dateTimeUtilitiesModule.formatLocalTime(var33) else "")
			var22.current = text
			var9(text)
			p1.onChanged(var32, var33)
			
			return
		end
		local var34 = dateTimeUtilitiesModule.formatLocalTime(var32, var3)
		var22.current = var34
		var9(var34)
		p1.onChanged(var32)
	end, { p1.onChanged, var1, var3, var21 })
	local var32 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), var2 (ref), var18 (ref), var17 (ref), var31 (ref)
		local current = var13.current
		
		if current then
			if var2 and (not current[1] or not current[2]) then
				var18()
				
				return
			end
			var17(current)
			var31(current)
		end
		var18()
	end, { var18, var31, var2 })
	local var33 = false
	
	if var11 then
		local var34 = var11[1]
		local var35 = var11[2]
		
		if var2 or var1 then
			var33 = if var34 ~= nil then if var35 ~= nil then var35.UnixTimestamp < var34.UnixTimestamp else true else true
		elseif variant == dateTimePickerVariantModule.Single or var3 then
			local _ = var34 == nil
		end
	elseif var2 then
		var33 = true
	end
	return {
		closeDateTimePicker = var18,
		isOpen = var4,
		onFocusGained = var20,
		onFocusLost = var24,
		showDateTimePicker = var19,
		textInputRef = var6,
		selectedDates = var11,
		inputText = var8,
		updateInputText = var23,
		viewAnchorDate = var14,
		onDayActivated = var25,
		onPresetSelected = var26,
		onSelectedDatesChanged = var27,
		onApply = var32,
		onCancel = var29,
		onReset = var30,
		isApplyButtonDisabled = var33,
		isResetButtonDisabled = if var2 or var3 then dateTimeEqualityUtilitiesModule.areDatesEqual(var11, var16) else true
	}
end