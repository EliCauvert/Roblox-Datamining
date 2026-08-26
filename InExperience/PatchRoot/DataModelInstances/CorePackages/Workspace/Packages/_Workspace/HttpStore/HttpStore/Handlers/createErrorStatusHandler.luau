local parent = script.Parent.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local _ = require(parent_1.InternalHttpStore)
local _ = require(parent.Types)

return function(p1)
	-- upvalues: signalsModule (ref)
	return function(p2)
		-- upvalues: signalsModule (copy), p1 (ref)
		return signalsModule.createComputed(function(p3)
			-- upvalues: p2 (ref), p1 (copy)
			local var1 = p2(p3)
			
			if var1.status == "Success" then
				local statusCode = var1.response.StatusCode
				
				if p1[statusCode] ~= nil then
					p1[statusCode](var1)
				end
			end
			return var1
		end)
	end
end