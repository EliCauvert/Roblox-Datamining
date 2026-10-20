local Parent = script:FindFirstAncestor("AuthSignup").Parent
local Birthday = require(Parent.AuthCommon).Models.Birthday
local DateHelper = require(Parent.Time).DateHelper

return function(Month, Day, Year, p1): boolean
	-- upvalues: DateHelper (copy), Birthday (copy)
	local IsValidDate, _ = DateHelper:isValidDate(Month, Day, Year)
	
	if Birthday.new({ Month = Month, Day = Day, Year = Year }):GetAgeInYears() < p1 then
		IsValidDate = false
	end
	return IsValidDate
end