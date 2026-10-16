local Birthday = require(script:FindFirstAncestor("AuthSignup").Parent.AuthCommon).Models.Birthday
local ValidateBirthdayModule = require(script.Parent.validateBirthday)

return function(Month, Day, Year, p1) --[[ Line: 10 | Named "buildValidatedBirthday" ]]
	-- upvalues: ValidateBirthdayModule (copy), Birthday (copy)
	return if Month == nil or Day == nil or Year == nil then nil elseif ValidateBirthdayModule(Month, Day, Year, p1) then Birthday.new({ Month = Month, Day = Day, Year = Year }) else nil
end