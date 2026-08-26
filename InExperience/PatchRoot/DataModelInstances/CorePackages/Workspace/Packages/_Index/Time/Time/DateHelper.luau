local parent = script:FindFirstAncestor("Time").Parent
local argCheckModule = require(parent.ArgCheck)
local timeUnitModule = require(script.Parent.TimeUnit)
local dateTimeModule = require(script.Parent.DateTime)
local getFFlagSignUpBirthdayPickerRequireManualSelection = require(parent.SharedFlags).GetFFlagSignUpBirthdayPickerRequireManualSelection
local t = {
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
			[timeUnitModule.Months] = 1,
			[timeUnitModule.Days] = 2,
			[timeUnitModule.Years] = 3
		},
		["es-es"] = {
			[timeUnitModule.Days] = 1,
			[timeUnitModule.Months] = 2,
			[timeUnitModule.Years] = 3
		},
		["fr-fr"] = {
			[timeUnitModule.Days] = 1,
			[timeUnitModule.Months] = 2,
			[timeUnitModule.Years] = 3
		},
		["de-de"] = {
			[timeUnitModule.Days] = 1,
			[timeUnitModule.Months] = 2,
			[timeUnitModule.Years] = 3
		},
		["pt-br"] = {
			[timeUnitModule.Days] = 1,
			[timeUnitModule.Months] = 2,
			[timeUnitModule.Years] = 3
		},
		["zh-cn"] = {
			[timeUnitModule.Years] = 1,
			[timeUnitModule.Months] = 2,
			[timeUnitModule.Days] = 3
		},
		["zh-cjv"] = {
			[timeUnitModule.Years] = 1,
			[timeUnitModule.Months] = 2,
			[timeUnitModule.Days] = 3
		},
		["zh-tw"] = {
			[timeUnitModule.Years] = 1,
			[timeUnitModule.Months] = 2,
			[timeUnitModule.Days] = 3
		},
		["ko-kr"] = {
			[timeUnitModule.Years] = 1,
			[timeUnitModule.Months] = 2,
			[timeUnitModule.Days] = 3
		},
		["ja-jp"] = {
			[timeUnitModule.Years] = 1,
			[timeUnitModule.Months] = 2,
			[timeUnitModule.Days] = 3
		},
		["it-it"] = {
			[timeUnitModule.Days] = 1,
			[timeUnitModule.Months] = 2,
			[timeUnitModule.Years] = 3
		},
		["ru-ru"] = {
			[timeUnitModule.Days] = 1,
			[timeUnitModule.Months] = 2,
			[timeUnitModule.Years] = 3
		},
		["id-id"] = {
			[timeUnitModule.Days] = 1,
			[timeUnitModule.Months] = 2,
			[timeUnitModule.Years] = 3
		},
		["vi-vn"] = {
			[timeUnitModule.Days] = 1,
			[timeUnitModule.Months] = 2,
			[timeUnitModule.Years] = 3
		},
		["th-th"] = {
			[timeUnitModule.Days] = 1,
			[timeUnitModule.Months] = 2,
			[timeUnitModule.Years] = 3
		},
		["tr-tr"] = {
			[timeUnitModule.Days] = 1,
			[timeUnitModule.Months] = 2,
			[timeUnitModule.Years] = 3
		}
	}, {
		__index = function(_, _)
			-- upvalues: timeUnitModule (ref)
			return {
				[timeUnitModule.Years] = 1,
				[timeUnitModule.Months] = 2,
				[timeUnitModule.Days] = 3
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
		__index = function(_, _)
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
		__index = function(_, _)
			return "None"
		end
	}),
	GetFormattedDayString = function(p1, p2, p3, p4)
		-- upvalues: timeUnitModule (ref)
		return p1:GetFormattedString(timeUnitModule.Days, p2, p3, p4)
	end,
	GetFormattedYearString = function(p1, p2, p3, p4)
		-- upvalues: timeUnitModule (ref)
		return p1:GetFormattedString(timeUnitModule.Years, p2, p3, p4)
	end,
	GetFormattedString = function(p1, p2, p3, p4, p5)
		-- upvalues: argCheckModule (ref), timeUnitModule (ref)
		argCheckModule.isNotNil(p2, "timeUnit passed into DateHelper:GetFormattedString")
		argCheckModule.isNotNil(p4, "affix passed into DateHelper:GetFormattedString")
		local string = argCheckModule.isType(tostring(p3), "string", "dateValue passed into DateHelper:GetFormattedString")
		local var1 = nil
		
		if p2 == timeUnitModule.Days then
			var1 = p1.DayAffixType[p5]
		elseif p2 == timeUnitModule.Years then
			var1 = p1.YearAffixType[p5]
		end
		return if var1 == "Prefix" then p4 .. string elseif var1 == "Suffix" then string .. p11 else string
	end,
	GetFormattedFullString = function(p1, p2, p3, p4, p5, p6, p7, p8)
		-- upvalues: argCheckModule (ref), timeUnitModule (ref)
		local string = argCheckModule.isType(p2, "string", "localizedMonthString passed into DateHelper:GetFormattedFullString")
		local string_1 = argCheckModule.isType(p7, "string", "divider passed into DateHelper:GetFormattedFullString")
		local string_2 = argCheckModule.isType(p8, "string", "localeKey passed into DateHelper:GetFormattedFullString")
		string_2 = p1.DateTypeOrder[string_2]
		local var1 = ""
		local t = {
			[string_2[timeUnitModule.Months]] = string,
			[string_2[timeUnitModule.Days]] = p1:GetFormattedDayString(p3, p4, string_2),
			[string_2[timeUnitModule.Years]] = p1:GetFormattedYearString(p5, p6, string_2)
		}
		
		for i, v in ipairs(t) do
			var1 ..= v
			
			if i < #t then
				var1 ..= string_1
			end
		end
		return var1
	end
}
local _ = { Prefix = "Prefix", Suffix = "Suffix", None = "None" }

local function getCurrentDate()
	-- upvalues: dateTimeModule (ref), timeUnitModule (ref), argCheckModule (ref)
	local values = dateTimeModule.now():GetValues()
	
	return {
		[timeUnitModule.Months] = argCheckModule.isNonNegativeNumber(values.Month, "current month in BirthdayPicker"),
		[timeUnitModule.Days] = argCheckModule.isNonNegativeNumber(values.Day, "current day in BirthdayPicker"),
		[timeUnitModule.Years] = argCheckModule.isNonNegativeNumber(values.Year, "current year in BirthdayPicker")
	}
end

function t.getCurrentDate(_)
	-- upvalues: getCurrentDate (ref)
	return getCurrentDate()
end

local function getCurrentDateWithOffset(value)
	-- upvalues: dateTimeModule (ref), timeUnitModule (ref), argCheckModule (ref)
	local values = dateTimeModule.fromUnixTimestamp(dateTimeModule.now():GetUnixTimestamp() + value):GetValues()
	
	return {
		[timeUnitModule.Months] = argCheckModule.isNonNegativeNumber(values.Month, "current month in BirthdayPicker"),
		[timeUnitModule.Days] = argCheckModule.isNonNegativeNumber(values.Day, "current day in BirthdayPicker"),
		[timeUnitModule.Years] = argCheckModule.isNonNegativeNumber(values.Year, "current year in BirthdayPicker")
	}
end

function t.isLeapYear(_, p9)
	return p9 % 4 == 0 and (if p9 % 100 == 0 then p9 % 400 == 0 else true)
end

local t_1 = {}

function t._isFutureDate(_, p9, p10, p11, p12)
	-- upvalues: timeUnitModule (ref)
	return p9[timeUnitModule.Years] < p12 or (p12 == p9[timeUnitModule.Years] and p9[timeUnitModule.Months] < p10 or p12 == p9[timeUnitModule.Years] and p10 == p9[timeUnitModule.Months] and p9[timeUnitModule.Days] < p11)
end

function t.isFutureDate(p9, p10, p11, p12)
	-- upvalues: getCurrentDate (ref)
	return p9:_isFutureDate(getCurrentDate(), p10, p11, p12)
end

function t.isRecentOrFutureDate(p9, p10, p11, p12)
	-- upvalues: getCurrentDateWithOffset (ref)
	return p9:_isFutureDate(getCurrentDateWithOffset(-172800), p10, p11, p12)
end

function t.getLastDayOfTheMonthInYear(p9, p10, p11)
	-- upvalues: t_1 (ref)
	if t_1[p10] and t_1[p10][p11] then
		return t_1[p10][p11]
	end
	local _ = nil
	local var2 = if p10 == 2 then if p9:isLeapYear(p11) then 29 else 28 elseif p10 % 2 == 0 and p10 < 7 or p10 % 2 == 1 and p10 > 7 then 30 else 31
	
	if not t_1[p10] then
		t_1[p10] = {}
	end
	t_1[p10][p11] = var2
	
	return var2
end

function t.isInvalidDayOfTheMonth(p9, p10, p11, p12)
	return p9:getLastDayOfTheMonthInYear(p10, p12) < p11
end

function t.isValidDate(p9, p10, p11, p12)
	-- upvalues: getFFlagSignUpBirthdayPickerRequireManualSelection (ref)
	if getFFlagSignUpBirthdayPickerRequireManualSelection() and (p10 == nil or p11 == nil or p12 == nil) then
		return false, p9.ReasonDateInvalid.IsIncompleteDate
	elseif p9:isRecentOrFutureDate(p10, p11, p12) then
		return false, p9.ReasonDateInvalid.IsFutureDate
	elseif p9:isInvalidDayOfTheMonth(p10, p11, p12) then
		return false, p9.ReasonDateInvalid.IsInvalidDayOfMonth
	end
	return true, nil
end

local function generateCellDatas(p9, p10, p11)
	local t = {}
	
	for i = p9, p10, p11 or 1 do
		table.insert(t, { text = tostring(i), value = i })
	end
	return t
end

function t.generateMonthCellDatas(_)
	-- upvalues: generateCellDatas (ref)
	return generateCellDatas(1, 12)
end

function t.generateDayCellDatas(_)
	-- upvalues: generateCellDatas (ref)
	return generateCellDatas(1, 31)
end

function t.generateYearCellDatas(_, p12, p13)
	-- upvalues: getCurrentDate (ref), timeUnitModule (ref), generateCellDatas (ref)
	return generateCellDatas(p13 or getCurrentDate()[timeUnitModule.Years], p12 or p13 - 100, -1)
end

return t