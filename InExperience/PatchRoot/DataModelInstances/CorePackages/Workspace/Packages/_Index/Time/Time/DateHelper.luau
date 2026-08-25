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
	GetFormattedDayString = function(p0, p1, p2, p3)
		-- upvalues: timeUnitModule (ref)
		return p0:GetFormattedString(timeUnitModule.Days, p1, p2, p3)
	end,
	GetFormattedYearString = function(p4, p5, p6, p7)
		-- upvalues: timeUnitModule (ref)
		return p4:GetFormattedString(timeUnitModule.Years, p5, p6, p7)
	end,
	GetFormattedString = function(p8, p9, p10, p11, p12)
		-- upvalues: argCheckModule (ref), timeUnitModule (ref)
		argCheckModule.isNotNil(p9, "timeUnit passed into DateHelper:GetFormattedString")
		argCheckModule.isNotNil(p11, "affix passed into DateHelper:GetFormattedString")
		local string = argCheckModule.isType(tostring(p10), "string", "dateValue passed into DateHelper:GetFormattedString")
		local var9 = nil
		
		if p9 == timeUnitModule.Days then
			var9 = p8.DayAffixType[p12]
		elseif p9 == timeUnitModule.Years then
			var9 = p8.YearAffixType[p12]
		end
		return if var9 == "Prefix" then p11 .. string elseif var9 == "Suffix" then string .. p11 else string
	end,
	GetFormattedFullString = function(p13, p14, p15, p16, p17, p18, p19, p20)
		-- upvalues: argCheckModule (ref), timeUnitModule (ref)
		local string = argCheckModule.isType(p14, "string", "localizedMonthString passed into DateHelper:GetFormattedFullString")
		local string_1 = argCheckModule.isType(p19, "string", "divider passed into DateHelper:GetFormattedFullString")
		local string_2 = argCheckModule.isType(p20, "string", "localeKey passed into DateHelper:GetFormattedFullString")
		string_2 = p13.DateTypeOrder[string_2]
		local var13 = ""
		local t = {
			[string_2[timeUnitModule.Months]] = string,
			[string_2[timeUnitModule.Days]] = p13:GetFormattedDayString(p15, p16, string_2),
			[string_2[timeUnitModule.Years]] = p13:GetFormattedYearString(p17, p18, string_2)
		}
		
		for i, v in ipairs(t) do
			var13 ..= v
			
			if i < #t then
				var13 ..= string_1
			end
		end
		return var13
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

function t.isLeapYear(_, p21)
	return p21 % 4 == 0 and (if p21 % 100 == 0 then p21 % 400 == 0 else true)
end

local t_1 = {}

function t._isFutureDate(_, p22, p23, p24, p25)
	-- upvalues: timeUnitModule (ref)
	return p22[timeUnitModule.Years] < p25 or (p25 == p22[timeUnitModule.Years] and p22[timeUnitModule.Months] < p23 or p25 == p22[timeUnitModule.Years] and p23 == p22[timeUnitModule.Months] and p22[timeUnitModule.Days] < p24)
end

function t.isFutureDate(p26, p27, p28, p29)
	-- upvalues: getCurrentDate (ref)
	return p26:_isFutureDate(getCurrentDate(), p27, p28, p29)
end

function t.isRecentOrFutureDate(p30, p31, p32, p33)
	-- upvalues: getCurrentDateWithOffset (ref)
	return p30:_isFutureDate(getCurrentDateWithOffset(-172800), p31, p32, p33)
end

function t.getLastDayOfTheMonthInYear(p34, p35, p36)
	-- upvalues: t_1 (ref)
	if t_1[p35] and t_1[p35][p36] then
		return t_1[p35][p36]
	end
	local _ = nil
	local var17 = if p35 == 2 then if p34:isLeapYear(p36) then 29 else 28 elseif p35 % 2 == 0 and p35 < 7 or p35 % 2 == 1 and p35 > 7 then 30 else 31
	
	if not t_1[p35] then
		t_1[p35] = {}
	end
	t_1[p35][p36] = var17
	
	return var17
end

function t.isInvalidDayOfTheMonth(p37, p38, p39, p40)
	return p37:getLastDayOfTheMonthInYear(p38, p40) < p39
end

function t.isValidDate(p41, p42, p43, p44)
	-- upvalues: getFFlagSignUpBirthdayPickerRequireManualSelection (ref)
	if getFFlagSignUpBirthdayPickerRequireManualSelection() and (p42 == nil or p43 == nil or p44 == nil) then
		return false, p41.ReasonDateInvalid.IsIncompleteDate
	elseif p41:isRecentOrFutureDate(p42, p43, p44) then
		return false, p41.ReasonDateInvalid.IsFutureDate
	elseif p41:isInvalidDayOfTheMonth(p42, p43, p44) then
		return false, p41.ReasonDateInvalid.IsInvalidDayOfMonth
	end
	return true, nil
end

local function generateCellDatas(p45, p46, p47)
	local t = {}
	
	for i = p45, p46, p47 or 1 do
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

function t.generateYearCellDatas(_, p48, p49)
	-- upvalues: getCurrentDate (ref), timeUnitModule (ref), generateCellDatas (ref)
	return generateCellDatas(p49 or getCurrentDate()[timeUnitModule.Years], p48 or p49 - 100, -1)
end

return t