local Parent = script:FindFirstAncestor("Time").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local TimeUnitModule = require(script.Parent.TimeUnit)
local DateTimeModule = require(script.Parent.DateTime)
local GetFFlagSignUpBirthdayPickerRequireManualSelectionFunction = require(Parent.SharedFlags).GetFFlagSignUpBirthdayPickerRequireManualSelection

local function getCurrentDate()
	-- upvalues: DateTimeModule (copy), TimeUnitModule (copy), ArgCheckModule (copy)
	local Values = DateTimeModule.now():GetValues()
	
	return {
		[TimeUnitModule.Months] = ArgCheckModule.isNonNegativeNumber(Values.Month, "current month in BirthdayPicker"),
		[TimeUnitModule.Days] = ArgCheckModule.isNonNegativeNumber(Values.Day, "current day in BirthdayPicker"),
		[TimeUnitModule.Years] = ArgCheckModule.isNonNegativeNumber(Values.Year, "current year in BirthdayPicker")
	}
end

local function getCurrentDateWithOffset(p1)
	-- upvalues: DateTimeModule (copy), TimeUnitModule (copy), ArgCheckModule (copy)
	local Values = DateTimeModule.fromUnixTimestamp(DateTimeModule.now():GetUnixTimestamp() + p1):GetValues()
	
	return {
		[TimeUnitModule.Months] = ArgCheckModule.isNonNegativeNumber(Values.Month, "current month in BirthdayPicker"),
		[TimeUnitModule.Days] = ArgCheckModule.isNonNegativeNumber(Values.Day, "current day in BirthdayPicker"),
		[TimeUnitModule.Years] = ArgCheckModule.isNonNegativeNumber(Values.Year, "current year in BirthdayPicker")
	}
end

local t = {}

local function generateCellDatas(p1, p2, p3)
	local List = {}
	
	for i = p1, p2, p3 or 1 do
		table.insert(List, { text = tostring(i), value = i })
	end
	return List
end

return {
	ReasonDateInvalid = {
		IsFutureDate = "IsFutureDate",
		IsInvalidDayOfMonth = "IsInvalidDayOfMonth",
		IsIncompleteDate = "IsIncompleteDate"
	},
	MonthsLocalizationKeys = {
		"CommonUI.Controls.Label.January", "CommonUI.Controls.Label.February",
		"CommonUI.Controls.Label.March", "CommonUI.Controls.Label.April",
		"CommonUI.Controls.Label.May", "CommonUI.Controls.Label.June",
		"CommonUI.Controls.Label.July", "CommonUI.Controls.Label.August",
		"CommonUI.Controls.Label.September", "CommonUI.Controls.Label.October",
		"CommonUI.Controls.Label.November", "CommonUI.Controls.Label.December"
	},
	DateTypeOrder = setmetatable({
		["en-us"] = {
			[TimeUnitModule.Months] = 1,
			[TimeUnitModule.Days] = 2,
			[TimeUnitModule.Years] = 3
		},
		["es-es"] = {
			[TimeUnitModule.Days] = 1,
			[TimeUnitModule.Months] = 2,
			[TimeUnitModule.Years] = 3
		},
		["fr-fr"] = {
			[TimeUnitModule.Days] = 1,
			[TimeUnitModule.Months] = 2,
			[TimeUnitModule.Years] = 3
		},
		["de-de"] = {
			[TimeUnitModule.Days] = 1,
			[TimeUnitModule.Months] = 2,
			[TimeUnitModule.Years] = 3
		},
		["pt-br"] = {
			[TimeUnitModule.Days] = 1,
			[TimeUnitModule.Months] = 2,
			[TimeUnitModule.Years] = 3
		},
		["zh-cn"] = {
			[TimeUnitModule.Years] = 1,
			[TimeUnitModule.Months] = 2,
			[TimeUnitModule.Days] = 3
		},
		["zh-cjv"] = {
			[TimeUnitModule.Years] = 1,
			[TimeUnitModule.Months] = 2,
			[TimeUnitModule.Days] = 3
		},
		["zh-tw"] = {
			[TimeUnitModule.Years] = 1,
			[TimeUnitModule.Months] = 2,
			[TimeUnitModule.Days] = 3
		},
		["ko-kr"] = {
			[TimeUnitModule.Years] = 1,
			[TimeUnitModule.Months] = 2,
			[TimeUnitModule.Days] = 3
		},
		["ja-jp"] = {
			[TimeUnitModule.Years] = 1,
			[TimeUnitModule.Months] = 2,
			[TimeUnitModule.Days] = 3
		},
		["it-it"] = {
			[TimeUnitModule.Days] = 1,
			[TimeUnitModule.Months] = 2,
			[TimeUnitModule.Years] = 3
		},
		["ru-ru"] = {
			[TimeUnitModule.Days] = 1,
			[TimeUnitModule.Months] = 2,
			[TimeUnitModule.Years] = 3
		},
		["id-id"] = {
			[TimeUnitModule.Days] = 1,
			[TimeUnitModule.Months] = 2,
			[TimeUnitModule.Years] = 3
		},
		["vi-vn"] = {
			[TimeUnitModule.Days] = 1,
			[TimeUnitModule.Months] = 2,
			[TimeUnitModule.Years] = 3
		},
		["th-th"] = {
			[TimeUnitModule.Days] = 1,
			[TimeUnitModule.Months] = 2,
			[TimeUnitModule.Years] = 3
		},
		["tr-tr"] = {
			[TimeUnitModule.Days] = 1,
			[TimeUnitModule.Months] = 2,
			[TimeUnitModule.Years] = 3
		}
	}, {
		__index = function(_, _)
			-- upvalues: TimeUnitModule (copy)
			return {
				[TimeUnitModule.Years] = 1,
				[TimeUnitModule.Months] = 2,
				[TimeUnitModule.Days] = 3
			}
		end
	}),
	DayAffixLocalizationKey = "CommonUI.Controls.Label.Day",
	DayAffixType = setmetatable({
		["zh-cn"] = "Suffix",
		["zh-tw"] = "Suffix",
		["ko-kr"] = "Suffix",
		["ja-jp"] = "Suffix"
	}, {
		__index = function(_, _): string
			return "None"
		end
	}),
	YearAffixLocalizationKey = "CommonUI.Controls.Label.Year",
	YearAffixType = setmetatable({
		["zh-cn"] = "Suffix",
		["zh-tw"] = "Suffix",
		["ko-kr"] = "Suffix",
		["ja-jp"] = "Suffix"
	}, {
		__index = function(_, _): string
			return "None"
		end
	}),
	GetFormattedDayString = function(p4, p5, p6, String)
		-- upvalues: TimeUnitModule (copy)
		return p4:GetFormattedString(TimeUnitModule.Days, p5, p6, String)
	end,
	GetFormattedYearString = function(p4, p5, p6, String)
		-- upvalues: TimeUnitModule (copy)
		return p4:GetFormattedString(TimeUnitModule.Years, p5, p6, String)
	end,
	GetFormattedString = function(p4, Days, p5, Text, p6)
		-- upvalues: ArgCheckModule (copy), TimeUnitModule (copy)
		ArgCheckModule.isNotNil(Days, "timeUnit passed into DateHelper:GetFormattedString")
		ArgCheckModule.isNotNil(Text, "affix passed into DateHelper:GetFormattedString")
		local String = ArgCheckModule.isType(tostring(p5), "string", "dateValue passed into DateHelper:GetFormattedString")
		local DayAffixTypeEntry = if Days == TimeUnitModule.Days then p4.DayAffixType[p6] elseif Days == TimeUnitModule.Years then p4.YearAffixType[p6] else nil
		
		return if DayAffixTypeEntry == "Prefix" then Text .. String elseif DayAffixTypeEntry == "Suffix" then String .. Text else String
	end,
	GetFormattedFullString = function(p4, p5, p6, p7, p8, p9, p10, p11): string
		-- upvalues: ArgCheckModule (copy), TimeUnitModule (copy)
		local String = ArgCheckModule.isType(p10, "string", "divider passed into DateHelper:GetFormattedFullString")
		local String1 = ArgCheckModule.isType(p11, "string", "localeKey passed into DateHelper:GetFormattedFullString")
		local DateTypeOrderEntry = p4.DateTypeOrder[String1]
		local Text = ""
		local config = {
			[DateTypeOrderEntry[TimeUnitModule.Months]] = ArgCheckModule.isType(p5, "string", "localizedMonthString passed into DateHelper:GetFormattedFullString"),
			[DateTypeOrderEntry[TimeUnitModule.Days]] = p4:GetFormattedDayString(p6, p7, String1),
			[DateTypeOrderEntry[TimeUnitModule.Years]] = p4:GetFormattedYearString(p8, p9, String1)
		}
		
		for i, value in ipairs(config) do
			Text ..= value
			
			if i < #config then
				Text ..= String
			end
		end
		return Text
	end,
	getCurrentDate = function(_)
		-- upvalues: getCurrentDate (copy)
		return (getCurrentDate())
	end,
	isLeapYear = function(_, p12: number): boolean
		return p12 % 4 == 0 and (p12 % 100 ~= 0 or p12 % 400 == 0)
	end,
	_isFutureDate = function(_, p12, p13, p14, p15): boolean
		-- upvalues: TimeUnitModule (copy)
		return p12[TimeUnitModule.Years] < p15 or (p15 == p12[TimeUnitModule.Years] and p12[TimeUnitModule.Months] < p13 or p15 == p12[TimeUnitModule.Years] and p13 == p12[TimeUnitModule.Months] and p12[TimeUnitModule.Days] < p14)
	end,
	isFutureDate = function(p12, p13, p14, p15)
		-- upvalues: getCurrentDate (copy)
		return p12:_isFutureDate(getCurrentDate(), p13, p14, p15)
	end,
	isRecentOrFutureDate = function(p12, p13, p14, p15)
		-- upvalues: getCurrentDateWithOffset (copy)
		return p12:_isFutureDate(getCurrentDateWithOffset(-172800), p13, p14, p15)
	end,
	getLastDayOfTheMonthInYear = function(p12, Key: number, p13)
		-- upvalues: t (copy)
		if t[Key] and t[Key][p13] then
			return t[Key][p13]
		end
		local v1 = nil
		if Key == 2 then
			v1 = if p12:isLeapYear(p13) then 29 else 28
		elseif Key % 2 == 0 and Key < 7 or Key % 2 == 1 and Key > 7 then
			v1 = 30
		else
			v1 = 31
		end
		if not t[Key] then
			t[Key] = {}
		end
		t[Key][p13] = v1
		
		return v1
	end,
	isInvalidDayOfTheMonth = function(p12, p13, p14, p15): boolean
		return p12:getLastDayOfTheMonthInYear(p13, p15) < p14
	end,
	isValidDate = function(p12, p13, p14, p15)
		-- upvalues: GetFFlagSignUpBirthdayPickerRequireManualSelectionFunction (copy)
		if GetFFlagSignUpBirthdayPickerRequireManualSelectionFunction() and (p13 == nil or p14 == nil or p15 == nil) then
			return false, p12.ReasonDateInvalid.IsIncompleteDate
		elseif p12:isRecentOrFutureDate(p13, p14, p15) then
			return false, p12.ReasonDateInvalid.IsFutureDate
		elseif p12:isInvalidDayOfTheMonth(p13, p14, p15) then
			return false, p12.ReasonDateInvalid.IsInvalidDayOfMonth
		else
			return true, nil
		end
	end,
	generateMonthCellDatas = function(_)
		-- upvalues: generateCellDatas (copy)
		return (generateCellDatas(1, 12))
	end,
	generateDayCellDatas = function(_)
		-- upvalues: generateCellDatas (copy)
		return (generateCellDatas(1, 31))
	end,
	generateYearCellDatas = function(_, p12, p13: number)
		-- upvalues: getCurrentDate (copy), TimeUnitModule (copy), generateCellDatas (copy)
		local CurrentDate = getCurrentDate()
		
		return (generateCellDatas(p13 or CurrentDate[TimeUnitModule.Years], p12 or p13 - 100, -1))
	end
}