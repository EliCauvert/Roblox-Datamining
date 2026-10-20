local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local TimeUnit = require(CorePackages.Workspace.Packages.Time).TimeUnit
local _DateTime = require(CorePackages.Workspace.Packages.Time).DateTime

local function getCurrentDate()
	-- upvalues: _DateTime (copy), TimeUnit (copy), ArgCheckModule (copy)
	local Values = _DateTime.now():GetValues()
	
	return {
		[TimeUnit.Months] = ArgCheckModule.isNonNegativeNumber(Values.Month, "current month in BirthdayPicker"),
		[TimeUnit.Days] = ArgCheckModule.isNonNegativeNumber(Values.Day, "current day in BirthdayPicker"),
		[TimeUnit.Years] = ArgCheckModule.isNonNegativeNumber(Values.Year, "current year in BirthdayPicker")
	}
end

local function getCurrentDateWithOffset(p1)
	-- upvalues: _DateTime (copy), TimeUnit (copy), ArgCheckModule (copy)
	local Values = _DateTime.fromUnixTimestamp(_DateTime.now():GetUnixTimestamp() + p1):GetValues()
	
	return {
		[TimeUnit.Months] = ArgCheckModule.isNonNegativeNumber(Values.Month, "current month in BirthdayPicker"),
		[TimeUnit.Days] = ArgCheckModule.isNonNegativeNumber(Values.Day, "current day in BirthdayPicker"),
		[TimeUnit.Years] = ArgCheckModule.isNonNegativeNumber(Values.Year, "current year in BirthdayPicker")
	}
end

local t = {}

return {
	ReasonDateInvalid = {
		IsFutureDate = "IsFutureDate",
		IsInvalidDayOfMonth = "IsInvalidDayOfMonth"
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
			[TimeUnit.Months] = 1,
			[TimeUnit.Days] = 2,
			[TimeUnit.Years] = 3
		},
		["es-es"] = {
			[TimeUnit.Days] = 1,
			[TimeUnit.Months] = 2,
			[TimeUnit.Years] = 3
		},
		["fr-fr"] = {
			[TimeUnit.Days] = 1,
			[TimeUnit.Months] = 2,
			[TimeUnit.Years] = 3
		},
		["de-de"] = {
			[TimeUnit.Days] = 1,
			[TimeUnit.Months] = 2,
			[TimeUnit.Years] = 3
		},
		["pt-br"] = {
			[TimeUnit.Days] = 1,
			[TimeUnit.Months] = 2,
			[TimeUnit.Years] = 3
		},
		["zh-cn"] = {
			[TimeUnit.Years] = 1,
			[TimeUnit.Months] = 2,
			[TimeUnit.Days] = 3
		},
		["zh-cjv"] = {
			[TimeUnit.Years] = 1,
			[TimeUnit.Months] = 2,
			[TimeUnit.Days] = 3
		},
		["zh-tw"] = {
			[TimeUnit.Years] = 1,
			[TimeUnit.Months] = 2,
			[TimeUnit.Days] = 3
		},
		["ko-kr"] = {
			[TimeUnit.Years] = 1,
			[TimeUnit.Months] = 2,
			[TimeUnit.Days] = 3
		},
		["ja-jp"] = {
			[TimeUnit.Years] = 1,
			[TimeUnit.Months] = 2,
			[TimeUnit.Days] = 3
		},
		["it-it"] = {
			[TimeUnit.Days] = 1,
			[TimeUnit.Months] = 2,
			[TimeUnit.Years] = 3
		},
		["ru-ru"] = {
			[TimeUnit.Days] = 1,
			[TimeUnit.Months] = 2,
			[TimeUnit.Years] = 3
		},
		["id-id"] = {
			[TimeUnit.Days] = 1,
			[TimeUnit.Months] = 2,
			[TimeUnit.Years] = 3
		},
		["vi-vn"] = {
			[TimeUnit.Days] = 1,
			[TimeUnit.Months] = 2,
			[TimeUnit.Years] = 3
		},
		["th-th"] = {
			[TimeUnit.Days] = 1,
			[TimeUnit.Months] = 2,
			[TimeUnit.Years] = 3
		},
		["tr-tr"] = {
			[TimeUnit.Days] = 1,
			[TimeUnit.Months] = 2,
			[TimeUnit.Years] = 3
		}
	}, {
		__index = function(p1, _)
			return p1["en-us"]
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
		["ja-jp"] = "Suffix",
		["th-th"] = "Prefix"
	}, {
		__index = function(_, _): string
			return "None"
		end
	}),
	GetFormattedDayString = function(p1, p2, p3, String)
		-- upvalues: TimeUnit (copy)
		return p1:GetFormattedString(TimeUnit.Days, p2, p3, String)
	end,
	GetFormattedYearString = function(p1, p2, p3, String)
		-- upvalues: TimeUnit (copy)
		return p1:GetFormattedString(TimeUnit.Years, p2, p3, String)
	end,
	GetFormattedString = function(p1, Days, p2, Text, p3)
		-- upvalues: ArgCheckModule (copy), TimeUnit (copy)
		ArgCheckModule.isNotNil(Days, "timeUnit passed into DateHelper:GetFormattedString")
		ArgCheckModule.isNotNil(Text, "affix passed into DateHelper:GetFormattedString")
		local String = ArgCheckModule.isType(tostring(p2), "string", "dateValue passed into DateHelper:GetFormattedString")
		local DayAffixTypeEntry = if Days == TimeUnit.Days then p1.DayAffixType[p3] elseif Days == TimeUnit.Years then p1.YearAffixType[p3] else nil
		
		return if DayAffixTypeEntry == "Prefix" then Text .. String elseif DayAffixTypeEntry == "Suffix" then String .. Text else String
	end,
	GetFormattedFullString = function(p1, p2, p3, p4, p5, p6, p7, p8): string
		-- upvalues: ArgCheckModule (copy), TimeUnit (copy)
		local String = ArgCheckModule.isType(p7, "string", "divider passed into DateHelper:GetFormattedFullString")
		local String1 = ArgCheckModule.isType(p8, "string", "localeKey passed into DateHelper:GetFormattedFullString")
		local DateTypeOrderEntry = p1.DateTypeOrder[String1]
		local Text = ""
		local config = {
			[DateTypeOrderEntry[TimeUnit.Months]] = ArgCheckModule.isType(p2, "string", "localizedMonthString passed into DateHelper:GetFormattedFullString"),
			[DateTypeOrderEntry[TimeUnit.Days]] = p1:GetFormattedDayString(p3, p4, String1),
			[DateTypeOrderEntry[TimeUnit.Years]] = p1:GetFormattedYearString(p5, p6, String1)
		}
		
		for i, value in ipairs(config) do
			Text ..= value
			
			if i < #config then
				Text ..= String
			end
		end
		return Text
	end,
	isLeapYear = function(_, p9: number): boolean
		return p9 % 4 == 0 and (p9 % 100 ~= 0 or p9 % 400 == 0)
	end,
	_isFutureDate = function(_, p9, p10, p11, p12): boolean
		-- upvalues: TimeUnit (copy)
		return p9[TimeUnit.Years] < p12 or (p12 == p9[TimeUnit.Years] and p9[TimeUnit.Months] < p10 or p12 == p9[TimeUnit.Years] and p10 == p9[TimeUnit.Months] and p9[TimeUnit.Days] < p11)
	end,
	isFutureDate = function(p9, p10, p11, p12)
		-- upvalues: getCurrentDate (copy)
		return p9:_isFutureDate(getCurrentDate(), p10, p11, p12)
	end,
	isRecentOrFutureDate = function(p9, p10, p11, p12)
		-- upvalues: getCurrentDateWithOffset (copy)
		return p9:_isFutureDate(getCurrentDateWithOffset(-172800), p10, p11, p12)
	end,
	getLastDayOfTheMonthInYear = function(p9, Key: number, p10)
		-- upvalues: t (copy)
		if t[Key] and t[Key][p10] then
			return t[Key][p10]
		end
		local v1 = nil
		if Key == 2 then
			v1 = if p9:isLeapYear(p10) then 29 else 28
		elseif Key % 2 == 0 and Key < 7 or Key % 2 == 1 and Key > 7 then
			v1 = 30
		else
			v1 = 31
		end
		if not t[Key] then
			t[Key] = {}
		end
		t[Key][p10] = v1
		
		return v1
	end,
	isInvalidDayOfTheMonth = function(p9, p10, p11, p12): boolean
		return p9:getLastDayOfTheMonthInYear(p10, p12) < p11
	end,
	isValidDate = function(p9, p10, p11, p12)
		if p9:isRecentOrFutureDate(p10, p11, p12) then
			return false, p9.ReasonDateInvalid.IsFutureDate
		elseif p9:isInvalidDayOfTheMonth(p10, p11, p12) then
			return false, p9.ReasonDateInvalid.IsInvalidDayOfMonth
		else
			return true, nil
		end
	end
}