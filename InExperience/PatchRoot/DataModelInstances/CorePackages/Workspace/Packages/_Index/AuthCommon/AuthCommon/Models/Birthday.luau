local Parent = script:FindFirstAncestor("AuthCommon").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local _DateTime = require(Parent.Time).DateTime
local t = {}
local BirthdayModule = { [t] = true }

function BirthdayModule.new(Values) --[[ Line: 20 ]]
	-- upvalues: ArgCheckModule (copy), BirthdayModule (copy)
	local config = { Month = 1, Day = 1, Year = 1970 }
	
	if Values then
		config.Month = Values.Month or config.Month
		config.Day = Values.Day or config.Day
		config.Year = Values.Year or config.Year
		ArgCheckModule.isNonNegativeNumber(config.Month, "month in Birthday constructor")
		ArgCheckModule.isNonNegativeNumber(config.Day, "day in Birthday constructor")
		ArgCheckModule.isNonNegativeNumber(config.Year, "year in Birthday constructor")
	end
	setmetatable(config, BirthdayModule)
	
	return config
end

function BirthdayModule:IsUnder13(): boolean --[[ Line: 41 ]]
	-- upvalues: BirthdayModule (copy), _DateTime (copy)
	local NewBirthday = BirthdayModule.new(_DateTime.now():GetValues())
	
	return NewBirthday.Year - 13 < self.Year or self.Year >= NewBirthday.Year - 13 and (NewBirthday.Month < self.Month or NewBirthday.Month == self.Month and NewBirthday.Day < self.Day)
end

function BirthdayModule.GetAgeInYears(p1, p2) --[[ Line: 52 ]]
	-- upvalues: _DateTime (copy), BirthdayModule (copy)
	local NewBirthday = BirthdayModule.new(if p2 then p2 else _DateTime.now():GetValues())
	
	return if NewBirthday.Month < p1.Month or NewBirthday.Month == p1.Month and NewBirthday.Day < p1.Day then NewBirthday.Year - p1.Year - 1 else NewBirthday.Year - p1.Year
end

function BirthdayModule:FormatForEndpoint(): string --[[ Line: 63 ]]
	return self.Year .. "-" .. self.Month .. "-" .. self.Day .. "T12:00:00.000Z"
end

function BirthdayModule:ToString(p1): string --[[ Line: 67 ]]
	local P6 = p1 or " "
	
	return self.Month .. P6 .. self.Day .. P6 .. self.Year
end

function BirthdayModule:is(): boolean --[[ Line: 73 ]]
	-- upvalues: t (copy)
	return type(self) == "table" and self[t] == true
end

BirthdayModule.__index = BirthdayModule

return BirthdayModule