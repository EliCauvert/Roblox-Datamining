local CorePackages = game:GetService("CorePackages")
local Birthday = require(CorePackages.Workspace.Packages.AuthCommon).Models.Birthday
local DateHelper = require(CorePackages.Workspace.Packages.Time).DateHelper
local InputValidityModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.Authentication.Enum.InputValidity)

local function _()
	-- upvalues: InputValidityModule (copy)
	return {
		birthday = nil,
		birthdayValid = InputValidityModule.Invalid
	}
end

local _ = function(Birthday)
	-- upvalues: DateHelper (copy), InputValidityModule (copy)
	return if DateHelper:isValidDate(Birthday.Month, Birthday.Day, Birthday.Year) then {
		birthday = Birthday,
		birthdayValid = InputValidityModule.Valid
	} else {
		birthday = nil,
		birthdayValid = InputValidityModule.Invalid
	}
end

local _ = function(p1: number): boolean
	return p1 ~= nil and (p1 >= 1 and p1 <= 99)
end

return {
	buildBirthdayFromAge = function(p1: number, p2)
		-- upvalues: InputValidityModule (copy), Birthday (copy), DateHelper (copy)
		if p1 == nil or (p1 < 1 or p1 > 99) then
			return {
				birthday = nil,
				birthdayValid = InputValidityModule.Invalid
			}
		end
		local NewBirthday = Birthday.new({ Year = p2.Year - p1, Month = p2.Month, Day = p2.Day })
		
		if NewBirthday.Month == 2 and NewBirthday.Day == 29 and not DateHelper:isLeapYear(NewBirthday.Year) then
			NewBirthday.Day = 28
		end
		return if DateHelper:isValidDate(NewBirthday.Month, NewBirthday.Day, NewBirthday.Year) then {
			birthday = NewBirthday,
			birthdayValid = InputValidityModule.Valid
		} else {
			birthday = nil,
			birthdayValid = InputValidityModule.Invalid
		}
	end,
	buildBirthdayFromAgeMonth = function(p1: number, Month, p2)
		-- upvalues: InputValidityModule (copy), Birthday (copy), DateHelper (copy)
		if p1 ~= nil and (p1 >= 1 and p1 <= 99) then
			local YearDelta = p2.Year - p1
			local NewBirthday = Birthday.new({
				Year = YearDelta,
				Month = Month,
				Day = DateHelper:getLastDayOfTheMonthInYear(Month, YearDelta)
			})
			
			return if DateHelper:isValidDate(NewBirthday.Month, NewBirthday.Day, NewBirthday.Year) then {
				birthday = NewBirthday,
				birthdayValid = InputValidityModule.Valid
			} else {
				birthday = nil,
				birthdayValid = InputValidityModule.Invalid
			}
		else
			return {
				birthday = nil,
				birthdayValid = InputValidityModule.Invalid
			}
		end
	end,
	buildBirthdayFromMonthYear = function(Month, Year, p1)
		-- upvalues: InputValidityModule (copy), Birthday (copy), DateHelper (copy)
		if Year == nil or Year < p1.Year - 100 or p1.Year < Year then
			return {
				birthday = nil,
				birthdayValid = InputValidityModule.Invalid
			}
		else
			local NewBirthday = Birthday.new({
				Year = Year,
				Month = Month,
				Day = DateHelper:getLastDayOfTheMonthInYear(Month, Year)
			})
			
			return if DateHelper:isValidDate(NewBirthday.Month, NewBirthday.Day, NewBirthday.Year) then {
				birthday = NewBirthday,
				birthdayValid = InputValidityModule.Valid
			} else {
				birthday = nil,
				birthdayValid = InputValidityModule.Invalid
			}
		end
	end
}