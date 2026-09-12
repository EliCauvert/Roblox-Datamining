local birthday = require(script:FindFirstAncestor("AuthSignup").Parent.AuthCommon).Models.Birthday
local validateBirthdayModule = require(script.Parent.validateBirthday)

return function(p1, p2, p3, p4)
	-- upvalues: validateBirthdayModule (ref), birthday (ref)
	return if p1 == nil or p2 == nil or p3 == nil then nil elseif validateBirthdayModule(p1, p2, p3, p4) then birthday.new({ Month = p1, Day = p2, Year = p3 }) else nil
end