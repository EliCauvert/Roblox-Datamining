local _ = require("./civil_date_types")
local FreezeModule = require("./freeze")

local function _(Value: number)
	return if type(Value) == "number" and Value == Value and Value % 1 == 0 and math.abs(Value) < 2147483648 then Value else nil
end

local config = {
	ENGLISH = FreezeModule({
		order = "mdy",
		separator = "/",
		hourCycle = 12,
		months = table.freeze({
			"January", "February", "March", "April", "May", "June", "July", "August",
			"September", "October", "November", "December"
		}),
		weekdays = table.freeze({
			"Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"
		})
	}),
	isLeap = function(p1: number): boolean
		return p1 % 4 == 0 and p1 % 100 ~= 0 or p1 % 400 == 0
	end
}
local list = {
	31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
}

function config.daysIn(Year, Month)
	-- upvalues: config (copy), list (copy)
	return if Month == 2 and config.isLeap(Year) then 29 else list[Month]
end

function config.problem(p1, Enabled)
	-- upvalues: config (copy)
	if type(p1) ~= "table" then
		return "is a { year, month, day } table"
	end
	local Year: number = p1.year
	local Year1 = if type(Year) == "number" and Year == Year and Year % 1 == 0 and math.abs(Year) < 2147483648 then Year else nil
	local Month: number = p1.month
	local Month1 = if type(Month) == "number" and Month == Month and Month % 1 == 0 and math.abs(Month) < 2147483648 then Month else nil
	local Day: number = p1.day
	local Day1 = if type(Day) == "number" and Day == Day and Day % 1 == 0 and math.abs(Day) < 2147483648 then Day else nil
	
	if Year1 == nil or Month1 == nil or Day1 == nil then
		return "has whole-number year, month and day"
	end
	local Hour: number = p1.hour
	local Hour1 = if type(Hour) == "number" and Hour == Hour and Hour % 1 == 0 and math.abs(Hour) < 2147483648 then Hour else nil
	local Minute: number = p1.minute
	local Minute1 = if type(Minute) == "number" and Minute == Minute and Minute % 1 == 0 and math.abs(Minute) < 2147483648 then Minute else nil
	
	if (p1.hour == nil or Hour1 ~= nil) and (p1.minute == nil or Minute1 ~= nil) then
		return if Month1 < 1 or Month1 > 12 or Day1 < 1 or config.daysIn(Year1, Month1) < Day1 then `names no calendar day ({Year1}-{Month1}-{Day1})` elseif Hour1 == nil == (Minute1 == nil) then if Hour1 == nil or Minute1 == nil or Hour1 >= 0 and Hour1 < 24 and Minute1 >= 0 and Minute1 < 60 then if Enabled == true and Hour1 == nil then "carries hour and minute when `time = true`" else nil else "has an hour 0..23 and a minute 0..59" else "gives hour and minute together or neither"
	else
		return "has an hour 0..23 and a minute 0..59"
	end
end

function config.toDays(p1): number
	local YearDelta = if p1.month <= 2 then p1.year - 1 else p1.year
	local v1 = (if YearDelta >= 0 then YearDelta else YearDelta - 399) // 400
	local YearDeltaDelta = YearDelta - v1 * 400
	
	return v1 * 146097 + (YearDeltaDelta * 365 + YearDeltaDelta // 4 - YearDeltaDelta // 100 + ((153 * ((p1.month + 9) % 12) + 2) // 5 + p1.day - 1)) - 719468
end

function config.fromDays(NewDays: number)
	local NewNewDays = NewDays + 719468
	local v1 = (if NewNewDays >= 0 then NewNewDays else NewNewDays - 146096) // 146097
	local NewNewDaysDelta = NewNewDays - v1 * 146097
	local NewNewDaysDeltaRatio = (NewNewDaysDelta - NewNewDaysDelta // 1460 + NewNewDaysDelta // 36524 - NewNewDaysDelta // 146096) // 365
	local NewNewDaysDeltaDelta = NewNewDaysDelta - (NewNewDaysDeltaRatio * 365 + NewNewDaysDeltaRatio // 4 - NewNewDaysDeltaRatio // 100)
	local NewNewDaysDeltaDeltaRatio = (NewNewDaysDeltaDelta * 5 + 2) // 153
	local NewNewNewDaysDeltaDelta = NewNewDaysDeltaDelta - (NewNewDaysDeltaDeltaRatio * 153 + 2) // 5 + 1
	local NewNewNewDaysDeltaDeltaRatio: number = if NewNewDaysDeltaDeltaRatio < 10 then NewNewDaysDeltaDeltaRatio + 3 else NewNewDaysDeltaDeltaRatio - 9
	
	return {
		year = NewNewDaysDeltaRatio + v1 * 400 + (if NewNewNewDaysDeltaDeltaRatio <= 2 then 1 else 0),
		month = NewNewNewDaysDeltaDeltaRatio,
		day = NewNewNewDaysDeltaDelta
	}
end

function config.dateOf(p1)
	return { year = p1.year, month = p1.month, day = p1.day }
end

function config.addDays(p1, p2)
	-- upvalues: config (copy)
	local FromDaysResult = config.fromDays(config.toDays(p1) + p2)
	local Minute = p1.minute
	FromDaysResult.hour = p1.hour
	FromDaysResult.minute = Minute
	
	return FromDaysResult
end

function config.addMonths(p1, p2)
	-- upvalues: config (copy)
	local NewYear = p1.year * 12 + (p1.month - 1) + p2
	local NewYearRatio = NewYear // 12
	local NewNewYear = NewYear % 12 + 1
	
	return {
		year = NewYearRatio,
		month = NewNewYear,
		day = math.min(p1.day, config.daysIn(NewYearRatio, NewNewYear)),
		hour = p1.hour,
		minute = p1.minute
	}
end

function config.compare(Finish, p1): number
	-- upvalues: config (copy)
	local Days = config.toDays(Finish)
	local Days1 = config.toDays(p1)
	
	return if Days < Days1 then -1 elseif Days1 < Days then 1 else 0
end

function config.same(p1, p2): boolean
	return if p1 == nil or p2 == nil then p1 == p2 else p1.year == p2.year and (p1.month == p2.month and (p1.day == p2.day and p1.hour == p2.hour)) and p1.minute == p2.minute
end

function config.weekday(p1): number
	-- upvalues: config (copy)
	return (config.toDays(p1) + 4) % 7 + 1
end

function config.monthGrid(Year, Month, p1)
	-- upvalues: config (copy)
	local config1 = { day = 1, year = Year, month = Month }
	local DaysDelta = config.toDays(config1) - (config.weekday(config1) - p1) % 7
	local FromDaysResults = {}
	
	for i = 0, 41 do
		table.insert(FromDaysResults, config.fromDays(DaysDelta + i))
	end
	return FromDaysResults
end

function config.within(p2, p3, p4): boolean
	-- upvalues: config (copy)
	return if p3 == nil then p4 == nil or config.compare(p2, p4) <= 0 else config.compare(p2, p3) >= 0 and (p4 == nil or config.compare(p2, p4) <= 0)
end

function config.clampRange(p2, p3, p4)
	-- upvalues: config (copy)
	local Start = p2.start
	local Finish = p2.finish
	
	if Start == nil or Finish == nil then
		return p2
	end
	if p4 ~= nil and config.compare(Start, p4) > 0 or p3 ~= nil and config.compare(Finish, p3) < 0 then
		return nil
	end
	if p3 ~= nil and config.compare(Start, p3) < 0 then
		Start = config.dateOf(p3)
	end
	if p4 ~= nil and config.compare(Finish, p4) > 0 then
		Finish = config.dateOf(p4)
	end
	return { start = Start, finish = Finish }
end

function config.fromUnix(Value: number, p2: number)
	-- upvalues: config (copy)
	local NewFloored = math.floor(Value) + p2 * 60
	local NewFlooredRatio = NewFloored // 86400
	local NewFlooredDelta = NewFloored - NewFlooredRatio * 86400
	local FromDaysResult = config.fromDays(NewFlooredRatio)
	FromDaysResult.hour = NewFlooredDelta // 3600
	FromDaysResult.minute = NewFlooredDelta % 3600 // 60
	
	return FromDaysResult
end

function config.toUnix(p2, p3)
	-- upvalues: config (copy)
	return config.toDays(p2) * 86400 + ((p2.hour or 0) * 60 + (p2.minute or 0) - p3) * 60
end

function config.systemClock(p2)
	-- upvalues: config (copy)
	return function()
		-- upvalues: p2 (copy), config (upval)
		local v1 = DateTime
		
		if p2 == nil and v1 ~= nil then
			local LocalTime = v1.now():ToLocalTime()
			
			return {
				year = LocalTime.Year,
				month = LocalTime.Month,
				day = LocalTime.Day,
				hour = LocalTime.Hour,
				minute = LocalTime.Minute
			}
		end
		local Timestamp = if v1 == nil then os.time() else v1.now().UnixTimestamp
		
		if p2 == nil then
			local DateInfo = os.date("*t", Timestamp)
			
			return {
				year = DateInfo.year,
				month = DateInfo.month,
				day = DateInfo.day,
				hour = DateInfo.hour,
				minute = DateInfo.min
			}
		else
			return config.fromUnix(Timestamp, p2)
		end
	end
end

local _ = function(p2, p3): string
	return string.format(`%0{p3}d`, p2)
end

function config.formatTime(p2, HourCycle): string
	if p2.hour == nil then
		return ""
	end
	local Formatted = string.format(`%0{2}d`, (assert(p2.minute)))
	
	if HourCycle == 24 then
		return `{string.format(`%0{2}d`, p2.hour)}:{Formatted}`
	else
		local HourRemainder = p2.hour % 12
		
		return `{if HourRemainder == 0 then 12 else HourRemainder}:{Formatted} {if p2.hour < 12 then "AM" else "PM"}`
	end
end

function config.format(p3, p4): string
	-- upvalues: config (copy)
	local P34 = p4 or config.ENGLISH
	local Order = P34.order or "mdy"
	local Separator = P34.separator or "/"
	local config1 = {
		m = string.format(`%0{2}d`, p3.month),
		d = string.format(`%0{2}d`, p3.day),
		y = string.format(`%0{4}d`, p3.year)
	}
	local Text = config1[string.sub(Order, 1, 1)] .. Separator .. config1[string.sub(Order, 2, 2)] .. Separator .. config1[string.sub(Order, 3, 3)]
	
	if p3.hour ~= nil then
		Text ..= " " .. config.formatTime(p3, P34.hourCycle or 12)
	end
	return Text
end

function config.parse(Text: string, p3, Enabled)
	-- upvalues: config (copy)
	local P35 = p3 or config.ENGLISH
	local Order = P35.order or "mdy"
	local Match, Match2, Match3, Match4 = string.match(Text, "^%s*(%d+)%D(%d+)%D(%d+)(.*)$")
	
	if Match == nil or Match2 == nil or Match3 == nil then
		return nil, "Enter a date like " .. config.format({ year = 2026, month = 12, day = 31 }, P35)
	end
	local list = { Match, Match2, Match3 }
	local t = {}
	local config1 = { m = "month", d = "day", y = "year" }
	
	for i = 1, 3 do
		local Entry = config1[string.sub(Order, i, i)]
		
		if Entry == "year" and #list[i] < 4 then
			return nil, "Enter a date like " .. config.format({ year = 2026, month = 12, day = 31 }, P35)
		end
		t[Entry] = assert((tonumber(list[i])))
	end
	local config2 = { year = t.year, month = t.month, day = t.day }
	local Replaced = string.gsub(string.gsub(Match4 or "", "^%s+", ""), "%s+$", "")
	
	if Replaced ~= "" then
		local Match1, Match2_1, Match3_1 = string.match(string.upper(Replaced), "^(%d%d?):(%d%d)%s*([AP]?M?)$")
		
		if Match1 == nil then
			return nil, "Enter a time like 9:30 AM or 21:30."
		end
		local Hour = assert((tonumber(Match1)))
		local Minute = assert((tonumber(Match2_1)))
		
		if Match3_1 == "AM" or Match3_1 == "PM" then
			if Hour < 1 or Hour > 12 then
				return nil, "A 12-hour time runs from 1 to 12."
			end
			Hour = Hour % 12 + (if Match3_1 == "PM" then 12 else 0)
		else
			if Match3_1 ~= "" then
				return nil, "Enter a time like 9:30 AM or 21:30."
			end
			if (P35.hourCycle or 12) == 12 and Hour >= 1 and Hour <= 12 then
				return nil, "Add AM or PM, or write the 24-hour time like 21:30."
			end
		end
		config2.hour = Hour
		config2.minute = Minute
	elseif Enabled == true then
		return nil, "Add a time, like 9:30 AM."
	end
	if config.problem(config2) == nil then
		return config2, nil
	else
		return nil, "That date is not on the calendar."
	end
end

return (FreezeModule(config))