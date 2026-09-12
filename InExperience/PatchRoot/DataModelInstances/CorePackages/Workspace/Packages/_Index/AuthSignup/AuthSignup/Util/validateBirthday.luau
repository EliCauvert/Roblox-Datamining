local parent = script:FindFirstAncestor("AuthSignup").Parent
local birthday = require(parent.AuthCommon).Models.Birthday
local dateHelper = require(parent.Time).DateHelper

return function(p1, p2, p3, p4)
	-- upvalues: dateHelper (ref), birthday (ref)
	local var1, _ = dateHelper:isValidDate(p1, p2, p3)
	
	if birthday.new({ Month = p1, Day = p2, Year = p3 }):GetAgeInYears() < p4 then
		var1 = false
	end
	return var1
end