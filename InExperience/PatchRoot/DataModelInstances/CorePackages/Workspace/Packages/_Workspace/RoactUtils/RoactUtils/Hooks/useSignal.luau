local parent = script:FindFirstAncestor("RoactUtils").Parent
local reactModule = require(parent.React)
local _ = require(parent.AppCommonLib)

return function(value, p1)
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function()
		-- upvalues: value (ref), p1 (ref)
		if value then
			assert(value ~= nil, "signal is not nil")
			local var1 = value:connect(p1)
			
			return function()
				-- upvalues: var1 (ref)
				var1:disconnect()
			end
		end
	end, { value, p1 })
end