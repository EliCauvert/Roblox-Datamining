local Foundation = script:FindFirstAncestor("Foundation")
local LocalizationService = require(Foundation.Utility.Wrappers).Services.LocalizationService
local TranslatorModule = require(Foundation.Utility.Localization.Translator)

local function getDaysInMonth(p1, p2: number)
	local list = {
		31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
	}
	
	return if p1 == 2 and (p2 % 4 == 0 and p2 % 100 ~= 0 or p2 % 400 == 0) then 29 else list[p1]
end

local function getHoursAndMinutesFromString(Text: string)
	local S: string = Text:gsub("%s+", "")
	local Match: string? = string.match(S, "^%d%d?:%d%d[AP]M$")
	
	if not string.match(S, "^%d%d:%d%d$") and not Match then
		return nil
	elseif Match then
		local Match1, Match2 = string.match(S, "^(%d%d?):(%d%d)[AP]M$")
		local Number: number? = tonumber(Match1)
		local Number1: number? = tonumber(Match2)
		
		if not Number or not Number1 or Number < 1 or Number > 12 or Number1 < 0 or Number1 > 59 then
			return nil
		elseif string.sub(S, -2) == "PM" and Number ~= 12 then
			return Number + 12, Number1
		elseif string.sub(S, -2) == "AM" and Number == 12 then
			return 0, Number1
		else
			return Number, Number1
		end
	else
		local Match1, Match2_1 = string.match(S, "^(%d%d?):(%d%d)$")
		local Number2: number? = tonumber(Match1)
		local Number3: number? = tonumber(Match2_1)
		
		if Number2 and Number3 and Number2 >= 0 and Number2 <= 23 and Number3 >= 0 and Number3 <= 59 then
			return Number2, Number3
		else
			return nil
		end
	end
end

return {
	formatLocalTime = function(p1, p2)
		-- upvalues: LocalizationService (copy)
		local L = p1:FormatLocalTime("L", LocalizationService.RobloxLocaleId)
		
		if p2 then
			L ..= ", " .. p1:FormatLocalTime("LT", LocalizationService.RobloxLocaleId)
		end
		return L
	end,
	getDateTimeFromText = function(Text: string)
		-- upvalues: getHoursAndMinutesFromString (copy)
		local S = nil
		local S2 = nil
		if string.find(Text, ",") then
			S, S2 = Text:match("^([^,]+),%s*(.+)$")
		else
			S = Text
			S2 = "00:00"
		end
		if not S or not S2 then
			return nil
		end
		local S1: string = S:gsub("%s+", "")
		local HoursAndMinutesFromString, HoursAndMinutesFromString2 = getHoursAndMinutesFromString(S2)
		
		if S then
			local v1 = S1:find("[/%.%-]")
			local Success, Result = pcall(function()
				-- upvalues: v1 (copy), S1 (copy), HoursAndMinutesFromString (copy), HoursAndMinutesFromString2 (copy)
				if v1 == 3 then
					local DDDD, DDDD2, DDDD3 = S1:match("^(%d%d)[/%.%-](%d%d)[/%.%-](%d%d%d%d)$")
					
					return DateTime.fromLocalTime(tonumber(DDDD3), tonumber(DDDD), tonumber(DDDD2), HoursAndMinutesFromString, HoursAndMinutesFromString2, 0)
				elseif v1 ~= 5 then
					error("Invalid date format: " .. S1)
					
					return
				else
					local DD, DD2, DD3 = S1:match("^(%d%d%d%d)[/%.%-](%d%d)[/%.%-](%d%d)$")
					
					return DateTime.fromLocalTime(tonumber(DD), tonumber(DD2), tonumber(DD3), HoursAndMinutesFromString, HoursAndMinutesFromString2, 0)
				end
			end)
			
			if Success and Result then
				if os.date("*t", Result.UnixTimestamp).isdst then
					Result = DateTime.fromUnixTimestamp(Result.UnixTimestamp - 3600)
				end
				return Result
			end
		end
		return nil
	end,
	getDaysInMonth = getDaysInMonth,
	getFirstDayOfWeek = function(p1, p2): number
		local _DateTime = DateTime.fromLocalTime(p2, p1, 1)
		
		return _DateTime and tonumber((_DateTime:FormatLocalTime("d", "en-us"))) or 0
	end,
	getLastDayOfWeek = function(p1, p2): number
		-- upvalues: getDaysInMonth (copy)
		local _DateTime = DateTime.fromLocalTime(p2, p1, (getDaysInMonth(p1, p2)))
		
		return _DateTime and tonumber((_DateTime:FormatLocalTime("d", "en-us"))) or 0
	end,
	getNextMonthInfo = function(p1: number, p2: number)
		if p1 == 12 then
			return 1, p2 + 1
		else
			return p1 + 1, p2
		end
	end,
	getPrevMonthInfo = function(p1: number, p2: number)
		if p1 == 1 then
			return 12, p2 - 1
		else
			return p1 - 1, p2
		end
	end,
	isDateWithinRange = function(p1, p2): boolean
		local LocalTime = p2.startDate:ToLocalTime()
		local UnixTimestamp = DateTime.fromLocalTime(LocalTime.Year, LocalTime.Month, LocalTime.Day).UnixTimestamp
		local LocalTime1 = p2.endDate:ToLocalTime()
		local UnixTimestamp1 = DateTime.fromLocalTime(LocalTime1.Year, LocalTime1.Month, LocalTime1.Day).UnixTimestamp
		local LocalTime2 = p1:ToLocalTime()
		local UnixTimestamp2 = DateTime.fromLocalTime(LocalTime2.Year, LocalTime2.Month, LocalTime2.Day).UnixTimestamp
		
		return UnixTimestamp <= UnixTimestamp2 and UnixTimestamp2 <= UnixTimestamp1
	end,
	monthMap = {
		[1] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.January"),
		[2] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.February"),
		[3] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.March"),
		[4] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.April"),
		[5] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.May"),
		[6] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.June"),
		[7] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.July"),
		[8] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.August"),
		[9] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.September"),
		[10] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.October"),
		[11] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.November"),
		[12] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.December")
	},
	roundDownToNearestMinute = function(p1)
		local LocalTime = p1:ToLocalTime()
		
		return DateTime.fromLocalTime(LocalTime.Year, LocalTime.Month, LocalTime.Day, LocalTime.Hour, LocalTime.Minute, 0)
	end,
	roundToStartOfDay = function(p1)
		local LocalTime = p1:ToLocalTime()
		
		return DateTime.fromLocalTime(LocalTime.Year, LocalTime.Month, LocalTime.Day).UnixTimestamp
	end,
	toLocalTime = function(p1)
		return (p1:ToLocalTime())
	end,
	weekdays = {
		[1] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.SundayAbbreviated"),
		[2] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.MondayAbbreviated"),
		[3] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.TuesdayAbbreviated"),
		[4] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.WednesdayAbbreviated"),
		[5] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.ThursdayAbbreviated"),
		[6] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.FridayAbbreviated"),
		[7] = TranslatorModule:FormatByKey("CommonUI.Controls.Label.SaturdayAbbreviated")
	}
}