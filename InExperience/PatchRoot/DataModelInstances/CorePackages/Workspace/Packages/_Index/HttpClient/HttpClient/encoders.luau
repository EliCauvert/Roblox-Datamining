local httpService = game:GetService("HttpService")
local _ = require(script.Parent.types)

return {
	encodeJson = function(p1)
		-- upvalues: httpService (ref)
		return httpService:JSONEncode(p1), "application/json"
	end,
	encodeRaw = function(p1)
		return function(p2)
			-- upvalues: p1 (ref)
			local var1 = typeof(p2)
			
			if var1 ~= "string" and var1 ~= "buffer" then
				error(`encodeRaw: expected string or buffer body, got {var1}`)
			end
			return p2, p1
		end
	end
}