local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.types)

local function toLowerKeyedHeaders(Headers)
	if typeof(Headers) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, header in Headers do
		t[tostring(i):lower()] = tostring(header)
	end
	return t
end

return function()
	-- upvalues: HttpService (copy), toLowerKeyedHeaders (copy)
	return {
		request = function(p1, Callback)
			-- upvalues: HttpService (upval), toLowerKeyedHeaders (upval)
			local RequestInternalResult = HttpService:RequestInternal({
				Url = p1.url,
				Method = p1.method,
				Headers = p1.headers,
				Body = p1.body,
				OnMessage = p1.onMessage
			})
			local Flag = false
			RequestInternalResult:Start(function(p2, p3)
				-- upvalues: Flag (ref), Callback (copy), toLowerKeyedHeaders (upval)
				if Flag then return end
				Flag = true
				
				if not p2 or typeof(p3) ~= "table" then
					Callback(false, (tostring(p3 and p3.StatusMessage or "RequestInternal failed")))
					
					return
				end
				local Stats = nil
				
				if typeof(p3.Stats) == "table" then
					Stats = {}
					
					for i, stat in p3.Stats do
						if typeof(i) == "string" and typeof(stat) == "number" then
							Stats[i] = stat
						elseif i == "WasRequestRetried" and typeof(stat) == "boolean" then
							Stats[i] = if stat then 1 else 0
						end
					end
				end
				Callback(true, {
					statusCode = tonumber(p3.StatusCode) or 0,
					responseBody = p3.Body,
					headers = toLowerKeyedHeaders(p3.Headers),
					httpError = p3.HttpError,
					stats = Stats
				})
			end)
			
			return function()
				-- upvalues: Flag (ref), RequestInternalResult (copy)
				if not Flag then
					Flag = true
					pcall(function()
						-- upvalues: RequestInternalResult (upval)
						RequestInternalResult:Cancel()
					end)
					
					return
				end
			end
		end
	}
end