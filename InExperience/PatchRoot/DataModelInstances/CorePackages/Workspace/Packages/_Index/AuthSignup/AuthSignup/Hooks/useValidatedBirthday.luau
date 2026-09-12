local authSignup = script:FindFirstAncestor("AuthSignup")
local reactModule = require(authSignup.Parent.React)
local buildValidatedBirthdayModule = require(authSignup.Util.buildValidatedBirthday)

local function _(p1, p2)
	return if p1 == nil or p2 == nil then p1 == p2 else p1.Month == p2.Month and (p1.Day == p2.Day and p1.Year == p2.Year)
end

return function(p1)
	-- upvalues: reactModule (ref), buildValidatedBirthdayModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = reactModule.useRef(nil)
	
	return var1, reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: buildValidatedBirthdayModule (copy), p1 (ref), var3 (ref), var2 (ref)
		local var4
		local var5 = buildValidatedBirthdayModule(p2, p3, p4, p1)
		local current = var3.current
		
		if current == nil or var5 == nil then
			var4 = current == var5
			var4 = nil
		else
			var4 = current.Month == var5.Month and (current.Day == var5.Day and current.Year == var5.Year)
		end
		if var4 then
			return
		end
		var3.current = var5
		var2(var5)
	end, { p1 })
end