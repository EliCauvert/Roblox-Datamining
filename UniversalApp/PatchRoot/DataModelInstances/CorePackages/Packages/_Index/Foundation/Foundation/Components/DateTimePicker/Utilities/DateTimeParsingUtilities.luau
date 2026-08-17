local dateTimeEqualityUtilitiesModule = require(script.Parent.DateTimeEqualityUtilities)
local dateTimePickerVariantModule = require(script:FindFirstAncestor("Foundation").Enums.DateTimePickerVariant)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

local function parseTimeFromText(value) --[[ line: 18 ]]
	local var6 = value:gsub("%s+", "")
	local match = string.match(var6, "^%d%d?:%d%d[AP]M$")
	
	if not string.match(var6, "^%d%d:%d%d$") and not match then
		return nil
	end
	local var10
	local _ = nil
	local _ = nil
	
	if match then
		local match_1, match_2 = string.match(var6, "^(%d%d?):(%d%d)[AP]M$")
		var10 = tonumber(match_1)
		local var11 = tonumber(match_2)
		
		if not var10 or not var11 or (var10 < 1 or var10 > 12) or (var11 < 0 or var11 > 59) then
			return nil
		elseif string.sub(var6, -2) == "PM" and var10 ~= 12 then
			return var10 + 12, var11
		elseif string.sub(var6, -2) == "AM" and var10 == 12 then
			return 0, var11
		end
		return var10, var11
	else
		local match_1, match_2 = string.match(var6, "^(%d%d?):(%d%d)$")
		var10 = tonumber(match_1)
		var10 = tonumber(match_2)
		
		if var10 and var10 and (var10 >= 0 and var10 <= 23) and (var10 >= 0 and var10 <= 59) then
			return var10, var10
		end
		return nil
	end
end

local function adjustForDaylightSaving(p0) --[[ line: 68 ]]
	local dateString = os.date("*t", p0.UnixTimestamp)
	
	return if dateString and dateString.isdst then DateTime.fromUnixTimestamp(p0.UnixTimestamp - 3600) else p0
end

local function parseDateTimeFromText(p1) --[[ line: 83 ]]
	-- upvalues: parseTimeFromText (ref), adjustForDaylightSaving (ref)
	local var17, var18
	local _ = nil
	local _ = nil
	
	if string.find(p1, ",") then
		local var15, var16 = p1:match("^([^,]+),%s*(.+)$")
		var17 = var15
		var18 = var16
	else
		var17 = p1
		var18 = "00:00"
	end
	if not var17 or not var18 then
		return nil
	end
	local var19 = var17:gsub("%s+", "")
	local var20, var21 = parseTimeFromText(var18)
	
	if var20 == nil or var21 == nil then
		return nil
	end
	local var22 = var19:find("[/%.%-]")
	local ok, status = pcall(function() --[[ line: 105 ]]
		-- upvalues: var22 (ref), var19 (ref), var20 (ref), var21 (ref)
		if var22 == 3 then
			local var23, var24, var25 = var19:match("^(%d%d)[/%.%-](%d%d)[/%.%-](%d%d%d%d)$")
			
			return DateTime.fromLocalTime(tonumber(var25), tonumber(var23), tonumber(var24), var20, var21, 0)
		elseif var22 == 5 then
			local var26, var27, var28 = var19:match("^(%d%d%d%d)[/%.%-](%d%d)[/%.%-](%d%d)$")
			
			return DateTime.fromLocalTime(tonumber(var26), tonumber(var27), tonumber(var28), var20, var21, 0)
		end
		error("Invalid date format: " .. var19)
	end)
	
	return if ok and status then adjustForDaylightSaving(status) else nil
end

local function _(p2) --[[ line: 124 | named "trimEndpointText" ]]
	return p2:gsub("^%s*(.-)%s*$", "%1")
end

return {
	adjustForDaylightSaving = adjustForDaylightSaving,
	formatInputText = function(p3) --[[ line: 176 ]]
		-- upvalues: dateTimePickerVariantModule (ref), dateTimeUtilitiesModule (ref)
		local var29 = p3.dates[1]
		
		if not var29 then
			return ""
		elseif if p3.variant ~= dateTimePickerVariantModule.Dual then p3.variant == dateTimePickerVariantModule.DualWithPresets else true then
			local var30 = p3.dates[2]
			
			return `{dateTimeUtilitiesModule.formatLocalTime(var29)} - {if var30 then dateTimeUtilitiesModule.formatLocalTime(var30) else ""}`
		end
		return dateTimeUtilitiesModule.formatLocalTime(var29, p3.variant == dateTimePickerVariantModule.SingleWithTime)
	end,
	parseDateTimeFromText = parseDateTimeFromText,
	parseDualInputEndpoints = function(p4) --[[ line: 132 ]]
		-- upvalues: parseDateTimeFromText (ref)
		local var31 = p4:split(" - ")
		local var32 = if var31[1] then parseDateTimeFromText(var31[1]:gsub("^%s*(.-)%s*$", "%1")) else nil
		
		if var31[2] then
			return var32, parseDateTimeFromText(var31[2]:gsub("^%s*(.-)%s*$", "%1"))
		end
		return var32, nil
	end,
	parseInputToDraftDates = function(p5, p6) --[[ line: 145 ]]
		-- upvalues: parseDateTimeFromText (ref), dateTimeUtilitiesModule (ref), dateTimeEqualityUtilitiesModule (ref)
		if #p5:split(" - ") ~= 2 then
			return nil
		end
		local var33 = p5:split(" - ")
		local var34 = if var33[1] then parseDateTimeFromText(var33[1]:gsub("^%s*(.-)%s*$", "%1")) else nil
		local var35 = if var33[2] then parseDateTimeFromText(var33[2]:gsub("^%s*(.-)%s*$", "%1")) else nil
		
		if not var34 or not var35 then
			return nil
		elseif dateTimeUtilitiesModule.roundToStartOfDay(var35) < dateTimeUtilitiesModule.roundToStartOfDay(var34) then
			local var36 = var35
			var35 = var34
			var34 = var36
		end
		return if p6 and not dateTimeEqualityUtilitiesModule.isRangeWithinSelectableRange({ startDate = var34, endDate = var35 }, p6) then nil else { var34, var35 }
	end
}