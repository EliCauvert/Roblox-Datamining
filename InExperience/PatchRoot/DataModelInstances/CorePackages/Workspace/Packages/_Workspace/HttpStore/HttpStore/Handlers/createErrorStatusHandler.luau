local parent = script.Parent.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local _ = require(parent_1.InternalHttpStore)
local _ = require(parent.Types)

return function(p0) --[[ line: 11 | named "createErrorStatusHandler" ]]
	-- upvalues: signalsModule (ref)
	return function(p1) --[[ line: 12 ]]
		-- upvalues: signalsModule (copy), p0 (ref)
		return signalsModule.createComputed(function(p2) --[[ line: 13 ]]
			-- upvalues: p1 (ref), p0 (copy)
			local var1 = p1(p2)
			
			if var1.status == "Success" then
				local statusCode = var1.response.StatusCode
				
				if p0[statusCode] ~= nil then
					p0[statusCode](var1)
				end
			end
			return var1
		end)
	end
end