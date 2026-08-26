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

local function getDaysInMonth(p1, p2)
	return if p1 == 2 and (p2 % 4 == 0 and p2 % 100 ~= 0 or p2 % 400 == 0) then 29 else ({
		31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
	})[p1]
end

local function getHoursAndMinutesFromString(a)
	local var1 = a:gsub("%s+", "")
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

return {
	formatLocalTime = function(p1, p2)
		-- upvalues: localizationService (ref)
		local l = p1:FormatLocalTime("L", localizationService.RobloxLocaleId)
		
		if p2 then
			l ..= ", " .. p2:FormatLocalTime("LT", localizationService.RobloxLocaleId)
		end
		return l
	end,
	getDateTimeFromText = function(p1)
		-- upvalues: getHoursAndMinutesFromString (ref)
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
		local var6, var7 = getHoursAndMinutesFromString(var2)
		
		if var1 then
			local var8 = var5:find("[/%.%-]")
			local ok, status = pcall(function()
				-- upvalues: var8 (ref), var5 (ref), var6 (ref), var7 (ref)
				if var8 == 3 then
					local var9, var10, var11 = var5:match("^(%d%d)[/%.%-](%d%d)[/%.%-](%d%d%d%d)$")
					
					return DateTime.fromLocalTime(tonumber(var11), tonumber(var9), tonumber(var10), var6, var7, 0)
				elseif var8 == 5 then
					local var12, var13, var14 = var5:match("^(%d%d%d%d)[/%.%-](%d%d)[/%.%-](%d%d)$")
					
					return DateTime.fromLocalTime(tonumber(var12), tonumber(var13), tonumber(var14), var6, var7, 0)
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
	getFirstDayOfWeek = function(p1, p2)
		local dateTime = DateTime.fromLocalTime(p2, p1, 1)
		
		return if dateTime then tonumber(dateTime:FormatLocalTime("d", "en-us")) or 0 else 0
	end,
	getLastDayOfWeek = function(p1, p2)
		-- upvalues: getDaysInMonth (ref)
		local dateTime = DateTime.fromLocalTime(p2, p1, getDaysInMonth(p1, p2))
		
		return if dateTime then tonumber(dateTime:FormatLocalTime("d", "en-us")) or 0 else 0
	end,
	getNextMonthInfo = function(p1, p2)
		if p1 == 12 then
			return 1, p2 + 1
		end
		return p1 + 1, p2
	end,
	getPrevMonthInfo = function(p1, p2)
		if p1 == 1 then
			return 12, p2 - 1
		end
		return p1 - 1, p2
	end,
	isDateWithinRange = function(p1, p2)
		local var1 = p2.startDate:ToLocalTime()
		local unixTimestamp = DateTime.fromLocalTime(var1.Year, var1.Month, var1.Day).UnixTimestamp
		local var2 = p2.endDate:ToLocalTime()
		local unixTimestamp_1 = DateTime.fromLocalTime(var2.Year, var2.Month, var2.Day).UnixTimestamp
		local var3 = p1:ToLocalTime()
		local unixTimestamp_2 = DateTime.fromLocalTime(var3.Year, var3.Month, var3.Day).UnixTimestamp
		
		return unixTimestamp <= unixTimestamp_2 and unixTimestamp_2 <= unixTimestamp_1
	end,
	monthMap = t,
	roundDownToNearestMinute = function(value)
		local var1 = value:ToLocalTime()
		
		return DateTime.fromLocalTime(var1.Year, var1.Month, var1.Day, var1.Hour, var1.Minute, 0)
	end,
	roundToStartOfDay = function(value)
		local var1 = value:ToLocalTime()
		
		return DateTime.fromLocalTime(var1.Year, var1.Month, var1.Day).UnixTimestamp
	end,
	toLocalTime = function(p1)
		return p1:ToLocalTime()
	end,
	weekdays = t_1
}