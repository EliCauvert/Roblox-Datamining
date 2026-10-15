local httpService = game:GetService("HttpService")
local httpClientModule = require(script:FindFirstAncestor("Gifting").Parent.HttpClient)

return function(p1)
	-- upvalues: httpClientModule (ref), httpService (ref)
	p1 = p1 or {}
	local var1 = nil
	local var2 = 0
	
	return {
		network = httpClientModule.createMockNetwork({
			fallback = function(p2)
				-- upvalues: var1 (write), var2 (write), p1 (ref), httpService (copy)
				var1 = p2
				var2 += 1
				
				return if p1.statusCode == nil then p1.responseBody or {} else {
					statusCode = p1.statusCode,
					responseBody = httpService:JSONEncode(p1.responseBody or {})
				}
			end
		}),
		getLastRequest = function()
			-- upvalues: var1 (write)
			return var1
		end,
		getLastBody = function()
			-- upvalues: var1 (write), httpService (copy)
			return if var1 == nil or var1.body == nil then nil else httpService:JSONDecode(var1.body)
		end,
		getRequestCount = function()
			-- upvalues: var2 (write)
			return var2
		end
	}
end