local parent = script:FindFirstAncestor("AuthCommon").Parent
local argCheckModule = require(parent.ArgCheck)
local dateTime = require(parent.Time).DateTime
local t = {}
local t_1 = {}
t[t_1] = true

function t.new(p0) --[[ line: 20 ]]
	-- upvalues: argCheckModule (ref), t (ref)
	local t_1 = { Month = 1, Day = 1, Year = 1970 }
	
	if p0 then
		t_1.Month = p0.Month or t_1.Month
		t_1.Day = p0.Day or t_1.Day
		t_1.Year = p0.Year or t_1.Year
		argCheckModule.isNonNegativeNumber(t_1.Month, "month in Birthday constructor")
		argCheckModule.isNonNegativeNumber(t_1.Day, "day in Birthday constructor")
		argCheckModule.isNonNegativeNumber(t_1.Year, "year in Birthday constructor")
	end
	setmetatable(t_1, t)
	
	return t_1
end

function t:IsUnder13() --[[ line: 41 ]]
	-- upvalues: t (ref), dateTime (ref)
	local var4 = t.new(dateTime.now():GetValues())
	
	return var4.Year - 13 < self.Year or (if self.Year < var4.Year - 13 then false elseif var4.Month >= self.Month then var4.Month == self.Month and var4.Day < self.Day else true)
end

function t:GetAgeInYears(p1) --[[ line: 52 ]]
	-- upvalues: dateTime (ref), t (ref)
	local var5 = t.new(p1 or dateTime.now():GetValues())
	
	return if var5.Month < self.Month or var5.Month == self.Month and var5.Day < self.Day then var5.Year - self.Year - 1 else var5.Year - self.Year
end

function t:FormatForEndpoint() --[[ line: 63 ]]
	return self.Year .. "-" .. self.Month .. "-" .. self.Day .. "T12:00:00.000Z"
end

function t:ToString(p2) --[[ line: 67 ]]
	p2 = p2 or " "
	
	return self.Month .. p2 .. self.Day .. p2 .. self.Year
end

function t:is() --[[ line: 73 ]]
	-- upvalues: t_1 (ref)
	return type(self) == "table" and self[t_1] == true
end

t.__index = t

return t