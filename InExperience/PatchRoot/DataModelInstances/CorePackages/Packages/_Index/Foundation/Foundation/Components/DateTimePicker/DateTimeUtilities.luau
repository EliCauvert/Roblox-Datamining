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

local function getDaysInMonth(p0, p1) --[[ line: 49 ]]
	return if p0 == 2 and (p1 % 4 == 0 and p1 % 100 ~= 0 or p1 % 400 == 0) then 29 else ({
		31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
	})[p0]
end

local function getHoursAndMinutesFromString(a) --[[ line: 118 ]]
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
	formatLocalTime = function(p2, p3) --[[ line: 243 ]]
		-- upvalues: localizationService (ref)
		local l = p2:FormatLocalTime("L", localizationService.RobloxLocaleId)
		
		if p3 then
			l ..= ", " .. p2:FormatLocalTime("LT", localizationService.RobloxLocaleId)
		end
		return l
	end,
	getDateTimeFromText = function(p4) --[[ line: 173 ]]
		-- upvalues: getHoursAndMinutesFromString (ref)
		local var17, var18
		local _ = nil
		local _ = nil
		
		if string.find(p4, ",") then
			local var15, var16 = p4:match("^([^,]+),%s*(.+)$")
			var17 = var15
			var18 = var16
		else
			var17 = p4
			var18 = "00:00"
		end
		if not var17 or not var18 then
			return nil
		end
		local var19 = var17:gsub("%s+", "")
		local var20, var21 = getHoursAndMinutesFromString(var18)
		
		if var17 then
			local var22 = var19:find("[/%.%-]")
			local ok, status = pcall(function() --[[ line: 197 ]]
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
			
			if not ok or not status then
				return nil
			end
			if os.date("*t", status.UnixTimestamp).isdst then
				status = DateTime.fromUnixTimestamp(status.UnixTimestamp - 3600)
			end
			return status
		end
	end,
	getDaysInMonth = getDaysInMonth,
	getFirstDayOfWeek = function(p5, p6) --[[ line: 68 ]]
		local dateTime = DateTime.fromLocalTime(p6, p5, 1)
		
		return if dateTime then tonumber(dateTime:FormatLocalTime("d", "en-us")) or 0 else 0
	end,
	getLastDayOfWeek = function(p7, p8) --[[ line: 80 ]]
		-- upvalues: getDaysInMonth (ref)
		local dateTime = DateTime.fromLocalTime(p8, p7, getDaysInMonth(p7, p8))
		
		return if dateTime then tonumber(dateTime:FormatLocalTime("d", "en-us")) or 0 else 0
	end,
	getNextMonthInfo = function(p9, p10) --[[ line: 236 ]]
		if p9 == 12 then
			return 1, p10 + 1
		end
		return p9 + 1, p10
	end,
	getPrevMonthInfo = function(p11, p12) --[[ line: 229 ]]
		if p11 == 1 then
			return 12, p12 - 1
		end
		return p11 - 1, p12
	end,
	isDateWithinRange = function(p13, p14) --[[ line: 104 ]]
		local var31 = p14.startDate:ToLocalTime()
		local unixTimestamp = DateTime.fromLocalTime(var31.Year, var31.Month, var31.Day).UnixTimestamp
		local var32 = p14.endDate:ToLocalTime()
		local unixTimestamp_1 = DateTime.fromLocalTime(var32.Year, var32.Month, var32.Day).UnixTimestamp
		local var33 = p13:ToLocalTime()
		local unixTimestamp_2 = DateTime.fromLocalTime(var33.Year, var33.Month, var33.Day).UnixTimestamp
		
		return unixTimestamp <= unixTimestamp_2 and unixTimestamp_2 <= unixTimestamp_1
	end,
	monthMap = t,
	roundDownToNearestMinute = function(value) --[[ line: 98 ]]
		local var34 = value:ToLocalTime()
		
		return DateTime.fromLocalTime(var34.Year, var34.Month, var34.Day, var34.Hour, var34.Minute, 0)
	end,
	roundToStartOfDay = function(value) --[[ line: 92 ]]
		local var35 = value:ToLocalTime()
		
		return DateTime.fromLocalTime(var35.Year, var35.Month, var35.Day).UnixTimestamp
	end,
	toLocalTime = function(p15) --[[ line: 63 ]]
		return p15:ToLocalTime()
	end,
	weekdays = t_1
}