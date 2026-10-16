local HttpService = game:GetService("HttpService")
local HttpClientModule = require(script:FindFirstAncestor("Gifting").Parent.HttpClient)

return function(p1) --[[ Line: 30 | Named "makeGiftingNetwork" ]]
	-- upvalues: HttpClientModule (copy), HttpService (copy)
	local P0 = p1 or {}
	local v1 = nil
	local Count = 0
	
	return {
		network = HttpClientModule.createMockNetwork({
			fallback = function(p2) --[[ Line: 36 ]]
				-- upvalues: v1 (ref), Count (ref), P0 (copy), HttpService (upval)
				v1 = p2
				Count += 1
				
				return if P0.statusCode == nil then P0.responseBody or {} else {
					statusCode = P0.statusCode,
					responseBody = HttpService:JSONEncode(P0.responseBody or {})
				}
			end
		}),
		getLastRequest = function() --[[ Line: 52 ]]
			-- upvalues: v1 (ref)
			return v1
		end,
		getLastBody = function() --[[ Line: 55 ]]
			-- upvalues: v1 (ref), HttpService (upval)
			local v2 = v1
			
			return if v2 == nil or v2.body == nil then nil else HttpService:JSONDecode(v2.body)
		end,
		getRequestCount = function() --[[ Line: 62 ]]
			-- upvalues: Count (ref)
			return Count
		end
	}
end