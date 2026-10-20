local AuthSignup = script:FindFirstAncestor("AuthSignup")
local ReactModule = require(AuthSignup.Parent.React)
local BuildValidatedBirthdayModule = require(AuthSignup.Util.buildValidatedBirthday)

local function _(p1, p2): boolean
	return if p1 == nil or p2 == nil then p1 == p2 else p1.Month == p2.Month and p1.Day == p2.Day and p1.Year == p2.Year
end

return function(p1)
	-- upvalues: ReactModule (copy), BuildValidatedBirthdayModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	
	return UseStateResult, (ReactModule.useCallback(function(p2, p3, p4)
		-- upvalues: BuildValidatedBirthdayModule (upval), p1 (copy), UseRefResult (copy), UseStateResult2 (copy)
		local ValidatedBirthdayModule = BuildValidatedBirthdayModule(p2, p3, p4, p1)
		local Current = UseRefResult.current
		
		if not (if Current == nil or ValidatedBirthdayModule == nil then Current == ValidatedBirthdayModule else Current.Month == ValidatedBirthdayModule.Month and (Current.Day == ValidatedBirthdayModule.Day and Current.Year == ValidatedBirthdayModule.Year)) then
			UseRefResult.current = ValidatedBirthdayModule
			UseStateResult2(ValidatedBirthdayModule)
			
			return
		end
	end, { p1 }))
end