local httpService = game:GetService("HttpService")
local _ = require(script.Parent.types)

local function toLowerKeyedHeaders(p0) --[[ line: 13 ]]
	if typeof(p0) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in p0 do
		t[tostring(i):lower()] = tostring(v)
	end
	return t
end

return function() --[[ line: 24 | named "createRequestInternalNetwork" ]]
	-- upvalues: httpService (ref), toLowerKeyedHeaders (ref)
	return {
		request = function(p1, p2) --[[ line: 25 ]]
			-- upvalues: httpService (copy), toLowerKeyedHeaders (copy)
			local var3 = httpService:RequestInternal({
				Url = p1.url,
				Method = p1.method,
				Headers = p1.headers,
				Body = p1.body,
				OnMessage = p1.onMessage
			})
			local var4 = false
			var3:Start(function(p3, p4) --[[ line: 42 ]]
				-- upvalues: var4 (write), p2 (ref), toLowerKeyedHeaders (copy)
				if var4 then return end
				var4 = true
				
				if not p3 or typeof(p4) ~= "table" then
					p2(false, tostring(if p4 then p4.StatusMessage else "RequestInternal failed"))
					
					return
				end
				local t = nil
				
				if typeof(p4.Stats) == "table" then
					t = {}
					
					for i, v in p4.Stats do
						if typeof(i) == "string" and typeof(v) == "number" then
							t[i] = v
						end
					end
				end
				p2(true, {
					statusCode = tonumber(p4.StatusCode) or 0,
					responseBody = p4.Body,
					headers = toLowerKeyedHeaders(p4.Headers),
					httpError = p4.HttpError,
					stats = t
				})
			end)
			
			return function() --[[ line: 70 ]]
				-- upvalues: var4 (write), var3 (ref)
				if var4 then
					return
				end
				var4 = true
				pcall(function() --[[ line: 75 ]]
					-- upvalues: var3 (copy)
					var3:Cancel()
				end)
			end
		end
	}
end