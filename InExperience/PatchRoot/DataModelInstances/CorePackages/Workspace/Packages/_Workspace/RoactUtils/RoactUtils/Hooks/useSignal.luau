local parent = script:FindFirstAncestor("RoactUtils").Parent
local reactModule = require(parent.React)
local _ = require(parent.AppCommonLib)

return function(value, p0) --[[ line: 15 | named "useSignal" ]]
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function() --[[ line: 16 ]]
		-- upvalues: value (ref), p0 (ref)
		if value then
			assert(value ~= nil, "signal is not nil")
			local var1 = value:connect(p0)
			
			return function() --[[ line: 23 ]]
				-- upvalues: var1 (ref)
				var1:disconnect()
			end
		end
	end, { value, p0 })
end