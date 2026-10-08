local parent = script:FindFirstAncestor("UserSearch").Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)

local var1 = function(p1, p2)
	-- upvalues: dashModule (ref)
	return dashModule.slice(p1, p2 + 1)
end

return function(p1)
	-- upvalues: reactModule (ref), var1 (ref)
	local users = p1.users or {}
	local var2, var3 = reactModule.useState(0)
	local var4, var5 = reactModule.useState(users)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var1 (copy), users (ref), var2 (ref), var3 (ref)
		var5(var1(users, var2))
		var3(#users)
	end, { #users })
	
	return var4
end