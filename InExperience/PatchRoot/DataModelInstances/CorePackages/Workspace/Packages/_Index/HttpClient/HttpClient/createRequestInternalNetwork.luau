local httpService = game:GetService("HttpService")
local _ = require(script.Parent.types)

local function toLowerKeyedHeaders(p1)
	if typeof(p1) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in p1 do
		t[tostring(i):lower()] = tostring(v)
	end
	return t
end

return function()
	-- upvalues: httpService (ref), toLowerKeyedHeaders (ref)
	return {
		request = function(p2, p3)
			-- upvalues: httpService (copy), toLowerKeyedHeaders (copy)
			local var1 = httpService:RequestInternal({
				Url = p2.url,
				Method = p2.method,
				Headers = p2.headers,
				Body = p2.body,
				OnMessage = p2.onMessage
			})
			local var2 = false
			var1:Start(function(p4, p5)
				-- upvalues: var2 (write), p3 (ref), toLowerKeyedHeaders (copy)
				if var2 then return end
				var2 = true
				
				if not p4 or typeof(p5) ~= "table" then
					p3(false, tostring(if p5 then p5.StatusMessage else "RequestInternal failed"))
					
					return
				end
				local t = nil
				
				if typeof(p5.Stats) == "table" then
					t = {}
					
					for i, v in p5.Stats do
						if typeof(i) == "string" and typeof(v) == "number" then
							t[i] = v
						elseif i == "WasRequestRetried" and typeof(v) == "boolean" then
							t[i] = if v then 1 else 0
						end
					end
				end
				p3(true, {
					statusCode = tonumber(p5.StatusCode) or 0,
					responseBody = p5.Body,
					headers = toLowerKeyedHeaders(p5.Headers),
					httpError = p5.HttpError,
					stats = t
				})
			end)
			
			return function()
				-- upvalues: var2 (write), var1 (ref)
				if var2 then
					return
				end
				var2 = true
				pcall(function()
					-- upvalues: var1 (copy)
					var1:Cancel()
				end)
			end
		end
	}
end