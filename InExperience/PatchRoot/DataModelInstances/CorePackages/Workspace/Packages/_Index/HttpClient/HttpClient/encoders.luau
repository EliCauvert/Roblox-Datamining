local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.types)

return {
	encodeJson = function(Input) --[[ Line: 8 ]]
		-- upvalues: HttpService (copy)
		return HttpService:JSONEncode(Input), "application/json"
	end,
	encodeRaw = function(p1) --[[ Line: 13 ]]
		return function(p2) --[[ Line: 14 ]]
			-- upvalues: p1 (copy)
			local ValueType = typeof(p2)
			
			if ValueType ~= "string" and ValueType ~= "buffer" then
				error(`encodeRaw: expected string or buffer body, got {ValueType}`)
			end
			return p2, p1
		end
	end
}