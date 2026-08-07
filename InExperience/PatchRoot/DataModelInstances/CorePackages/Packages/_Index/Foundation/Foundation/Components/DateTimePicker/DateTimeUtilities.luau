local foundation = script:FindFirstAncestor("Foundation")
local localizationService = require(foundation.Utility.Wrappers).Services.LocalizationService
local translatorModule = require(foundation.Utility.Localization.Translator)
local t = {
	[1] = translatorModule:FormatByKey("CommonUI.Controls.Label.January"),
	[2] = translatorModule:FormatByKey("CommonUI.Controls.Label.February"),
	[3] = translatorModule:FormatByKey("CommonUI.Controls.Label.March"),
	[4] = translatorModule:FormatByKey("CommonUI.Controls.Label.April"),
	[5] = translatorModule:FormatByKey("CommonUI.Controls.Label.May"),
	[6] = translatorModule:FormatByKey("CommonUI.Controls.Label.June"),
	[7] = translatorModule:FormatByKey("CommonUI.Controls.Label.July"),
	[8] = translatorModule:FormatByKey("CommonUI.Controls.Label.August"),
	[9] = translatorModule:FormatByKey("CommonUI.Controls.Label.September"),
	[10] = translatorModule:FormatByKey("CommonUI.Controls.Label.October"),
	[11] = translatorModule:FormatByKey("CommonUI.Controls.Label.November"),
	[12] = translatorModule:FormatByKey("CommonUI.Controls.Label.December")
}
local t_1 = {
	[1] = translatorModule:FormatByKey("CommonUI.Controls.Label.SundayAbbreviated"),
	[2] = translatorModule:FormatByKey("CommonUI.Controls.Label.MondayAbbreviated"),
	[3] = translatorModule:FormatByKey("CommonUI.Controls.Label.TuesdayAbbreviated"),
	[4] = translatorModule:FormatByKey("CommonUI.Controls.Label.WednesdayAbbreviated"),
	[5] = translatorModule:FormatByKey("CommonUI.Controls.Label.ThursdayAbbreviated"),
	[6] = translatorModule:FormatByKey("CommonUI.Controls.Label.FridayAbbreviated"),
	[7] = translatorModule:FormatByKey("CommonUI.Controls.Label.SaturdayAbbreviated")
}

local function getDaysInMonth(p0, p1) --[[ line: 34 ]]
	return if p0 == 2 and (p1 % 4 == 0 and p1 % 100 ~= 0 or p1 % 400 == 0) then 29 else ({
		31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
	})[p0]
end

local function getHoursAndMinutesFromString(a) --[[ line: 104 ]]
	local var6 = a:gsub("%s+", "")
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

return {
	DATE_COMPOSITE_TOKEN = "L",
	TIME_COMPOSITE_TOKEN = "LT",
	formatLocalTime = function(p2, p3) --[[ line: 229 ]]
		-- upvalues: localizationService (ref)
		local l = p2:FormatLocalTime("L", localizationService.RobloxLocaleId)
		
		if p3 then
			l ..= ", " .. p2:FormatLocalTime("LT", localizationService.RobloxLocaleId)
		end
		return l
	end,
	getDaysInMonth = getDaysInMonth,
	getFirstDayOfWeek = function(p4, p5) --[[ line: 48 ]]
		local dateTime = DateTime.fromLocalTime(p5, p4, 1)
		
		return if dateTime then tonumber(dateTime:FormatLocalTime("d", "en-us")) or 0 else 0
	end,
	getLastDayOfWeek = function(p6, p7) --[[ line: 60 ]]
		-- upvalues: getDaysInMonth (ref)
		local dateTime = DateTime.fromLocalTime(p7, p6, getDaysInMonth(p6, p7))
		
		return if dateTime then tonumber(dateTime:FormatLocalTime("d", "en-us")) or 0 else 0
	end,
	getNextMonthInfo = function(p8, p9) --[[ line: 222 ]]
		if p8 == 12 then
			return 1, p9 + 1
		end
		return p8 + 1, p9
	end,
	getPrevMonthInfo = function(p10, p11) --[[ line: 215 ]]
		if p10 == 1 then
			return 12, p11 - 1
		end
		return p10 - 1, p11
	end,
	isDateWithinRange = function(p12, p13) --[[ line: 84 ]]
		local var17 = p13.startDate:ToLocalTime()
		local unixTimestamp = DateTime.fromLocalTime(var17.Year, var17.Month, var17.Day).UnixTimestamp
		local var18 = p13.endDate:ToLocalTime()
		local unixTimestamp_1 = DateTime.fromLocalTime(var18.Year, var18.Month, var18.Day).UnixTimestamp
		local var19 = p12:ToLocalTime()
		local unixTimestamp_2 = DateTime.fromLocalTime(var19.Year, var19.Month, var19.Day).UnixTimestamp
		
		return unixTimestamp <= unixTimestamp_2 and unixTimestamp_2 <= unixTimestamp_1
	end,
	getDateTimeFromText = function(p14) --[[ line: 159 ]]
		-- upvalues: getHoursAndMinutesFromString (ref)
		local var22, var23
		local _ = nil
		local _ = nil
		
		if string.find(p14, ",") then
			local var20, var21 = p14:match("^([^,]+),%s*(.+)$")
			var22 = var20
			var23 = var21
		else
			var22 = p14
			var23 = "00:00"
		end
		if not var22 or not var23 then
			return nil
		end
		local var24 = var22:gsub("%s+", "")
		local var25, var26 = getHoursAndMinutesFromString(var23)
		
		if var22 then
			local var27 = var24:find("[/%.%-]")
			local ok, status = pcall(function() --[[ line: 183 ]]
				-- upvalues: var27 (ref), var24 (ref), var25 (ref), var26 (ref)
				if var27 == 3 then
					local var28, var29, var30 = var24:match("^(%d%d)[/%.%-](%d%d)[/%.%-](%d%d%d%d)$")
					
					return DateTime.fromLocalTime(tonumber(var30), tonumber(var28), tonumber(var29), var25, var26, 0)
				elseif var27 == 5 then
					local var31, var32, var33 = var24:match("^(%d%d%d%d)[/%.%-](%d%d)[/%.%-](%d%d)$")
					
					return DateTime.fromLocalTime(tonumber(var31), tonumber(var32), tonumber(var33), var25, var26, 0)
				end
				error("Invalid date format: " .. var24)
			end)
			
			if not ok or not status then
				return nil
			end
			if os.date("*t", status.UnixTimestamp).isdst then
				status = DateTime.fromUnixTimestamp(status.UnixTimestamp - 3600)
			end
			return status
		end
	end,
	monthMap = t,
	roundDownToNearestMinute = function(value) --[[ line: 78 ]]
		local var34 = value:ToLocalTime()
		
		return DateTime.fromLocalTime(var34.Year, var34.Month, var34.Day, var34.Hour, var34.Minute, 0)
	end,
	roundToStartOfDay = function(value) --[[ line: 72 ]]
		local var35 = value:ToLocalTime()
		
		return DateTime.fromLocalTime(var35.Year, var35.Month, var35.Day).UnixTimestamp
	end,
	weekdays = t_1
}