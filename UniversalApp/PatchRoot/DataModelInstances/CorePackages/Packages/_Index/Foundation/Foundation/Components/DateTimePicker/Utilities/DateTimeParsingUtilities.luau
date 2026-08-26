local dateTimeEqualityUtilitiesModule = require(script.Parent.DateTimeEqualityUtilities)
local dateTimePickerVariantModule = require(script:FindFirstAncestor("Foundation").Enums.DateTimePickerVariant)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

local function parseTimeFromText(value)
	local var1 = value:gsub("%s+", "")
	local match = string.match(var1, "^%d%d?:%d%d[AP]M$")
	
	if not string.match(var1, "^%d%d:%d%d$") and not match then
		return nil
	end
	local var2
	local _ = nil
	local _ = nil
	
	if match then
		local match_1, match_2 = string.match(var1, "^(%d%d?):(%d%d)[AP]M$")
		var2 = tonumber(match_1)
		local var3 = tonumber(match_2)
		
		if not var2 or not var3 or (var2 < 1 or var2 > 12) or (var3 < 0 or var3 > 59) then
			return nil
		elseif string.sub(var1, -2) == "PM" and var2 ~= 12 then
			return var2 + 12, var3
		elseif string.sub(var1, -2) == "AM" and var2 == 12 then
			return 0, var3
		end
		return var2, var3
	else
		local match_1, match_2 = string.match(var1, "^(%d%d?):(%d%d)$")
		var2 = tonumber(match_1)
		var2 = tonumber(match_2)
		
		if var2 and var2 and (var2 >= 0 and var2 <= 23) and (var2 >= 0 and var2 <= 59) then
			return var2, var2
		end
		return nil
	end
end

local function adjustForDaylightSaving(p1)
	local dateString = os.date("*t", p1.UnixTimestamp)
	
	return if dateString and dateString.isdst then DateTime.fromUnixTimestamp(p1.UnixTimestamp - 3600) else p1
end

local function parseDateTimeFromText(p1)
	-- upvalues: parseTimeFromText (ref), adjustForDaylightSaving (ref)
	local var1, var2
	local _ = nil
	local _ = nil
	
	if string.find(p1, ",") then
		local var3, var4 = p1:match("^([^,]+),%s*(.+)$")
		var1 = var3
		var2 = var4
	else
		var1 = p1
		var2 = "00:00"
	end
	if not var1 or not var2 then
		return nil
	end
	local var5 = var1:gsub("%s+", "")
	local var6, var7 = parseTimeFromText(var2)
	
	if var6 == nil or var7 == nil then
		return nil
	end
	local var8 = var5:find("[/%.%-]")
	local ok, status = pcall(function()
		-- upvalues: var8 (ref), var5 (ref), var6 (ref), var7 (ref)
		if var8 == 3 then
			local var9, var10, var11 = var5:match("^(%d%d)[/%.%-](%d%d)[/%.%-](%d%d%d%d)$")
			
			return DateTime.fromLocalTime(tonumber(var11), tonumber(var9), tonumber(var10), var6, var7, 0)
		elseif var8 == 5 then
			local var12, var13, var14 = var13:match("^(%d%d%d%d)[/%.%-](%d%d)[/%.%-](%d%d)$")
			
			return DateTime.fromLocalTime(tonumber(var12), tonumber(var13), tonumber(var14), var14, var7, 0)
		end
		error("Invalid date format: " .. var19)
	end)
	
	return if ok and status then adjustForDaylightSaving(status) else nil
end

return {
	adjustForDaylightSaving = adjustForDaylightSaving,
	formatInputText = function(p1)
		-- upvalues: dateTimePickerVariantModule (ref), dateTimeUtilitiesModule (ref)
		local var1 = p1.dates[1]
		
		if not var1 then
			return ""
		elseif if p1.variant ~= dateTimePickerVariantModule.Dual then p1.variant == dateTimePickerVariantModule.DualWithPresets else true then
			local var2 = p1.dates[2]
			
			return `{dateTimeUtilitiesModule.formatLocalTime(var1)} - {if var2 then dateTimeUtilitiesModule.formatLocalTime(var2) else ""}`
		end
		return dateTimeUtilitiesModule.formatLocalTime(var1, p1.variant == dateTimePickerVariantModule.SingleWithTime)
	end,
	parseDateTimeFromText = parseDateTimeFromText,
	parseDualInputEndpoints = function(p2)
		-- upvalues: parseDateTimeFromText (ref)
		local var3 = p2:split(" - ")
		local var4 = if var3[1] then parseDateTimeFromText(var3[1]:gsub("^%s*(.-)%s*$", "%1")) else nil
		
		if var3[2] then
			return var4, parseDateTimeFromText(var3[2]:gsub("^%s*(.-)%s*$", "%1"))
		end
		return var4, nil
	end,
	parseInputToDraftDates = function(p2, p3)
		-- upvalues: parseDateTimeFromText (ref), dateTimeUtilitiesModule (ref), dateTimeEqualityUtilitiesModule (ref)
		if #p2:split(" - ") ~= 2 then
			return nil
		end
		local var3 = p2:split(" - ")
		local var4 = if var3[1] then parseDateTimeFromText(var3[1]:gsub("^%s*(.-)%s*$", "%1")) else nil
		local var5 = if var3[2] then parseDateTimeFromText(var3[2]:gsub("^%s*(.-)%s*$", "%1")) else nil
		
		if not var4 or not var5 then
			return nil
		elseif dateTimeUtilitiesModule.roundToStartOfDay(var5) < dateTimeUtilitiesModule.roundToStartOfDay(var4) then
			local var6 = var5
			var5 = var4
			var4 = var6
		end
		return if p3 and not dateTimeEqualityUtilitiesModule.isRangeWithinSelectableRange({ startDate = var4, endDate = var5 }, p3) then nil else { var4, var5 }
	end,
	trimInputText = function(a)
		return a:gsub("^%s*(.-)%s*$", "%1")
	end
}