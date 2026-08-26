local parent = script:FindFirstAncestor("AuthCommon").Parent
local argCheckModule = require(parent.ArgCheck)
local dateTime = require(parent.Time).DateTime
local t = {}
local t_1 = {}
t[t_1] = true

function t.new(p1)
	-- upvalues: argCheckModule (ref), t (ref)
	local t_1 = { Month = 1, Day = 1, Year = 1970 }
	
	if p1 then
		t_1.Month = p1.Month or t_1.Month
		t_1.Day = p1.Day or t_1.Day
		t_1.Year = p1.Year or t_1.Year
		argCheckModule.isNonNegativeNumber(t_1.Month, "month in Birthday constructor")
		argCheckModule.isNonNegativeNumber(t_1.Day, "day in Birthday constructor")
		argCheckModule.isNonNegativeNumber(t_1.Year, "year in Birthday constructor")
	end
	setmetatable(t_1, t)
	
	return t_1
end

function t:IsUnder13()
	-- upvalues: t (ref), dateTime (ref)
	local var1 = t.new(dateTime.now():GetValues())
	
	return var1.Year - 13 < self.Year or (if self.Year < var1.Year - 13 then false elseif var1.Month >= self.Month then var1.Month == self.Month and var1.Day < self.Day else true)
end

function t:GetAgeInYears(p1)
	-- upvalues: dateTime (ref), t (ref)
	local var1 = t.new(p1 or dateTime.now():GetValues())
	
	return if var1.Month < self.Month or var1.Month == self.Month and var1.Day < self.Day then var1.Year - self.Year - 1 else var1.Year - self.Year
end

function t:FormatForEndpoint()
	return self.Year .. "-" .. self.Month .. "-" .. self.Day .. "T12:00:00.000Z"
end

function t:ToString(p1)
	p1 = p1 or " "
	
	return self.Month .. p2 .. self.Day .. p2 .. self.Year
end

function t:is()
	-- upvalues: t_1 (ref)
	return type(self) == "table" and self[t_1] == true
end

t.__index = t

return t