local httpService = game:GetService("HttpService")
local _ = require(script.Parent.types)

local function toLowerKeyedHeaders(p0) --[[ line: 8 ]]
	if typeof(p0) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in p0 do
		t[tostring(i):lower()] = tostring(v)
	end
	return t
end

return function() --[[ line: 19 | named "createRequestAsyncNetwork" ]]
	-- upvalues: httpService (ref), toLowerKeyedHeaders (ref)
	return {
		request = function(p1, p2) --[[ line: 20 ]]
			-- upvalues: httpService (copy), toLowerKeyedHeaders (copy)
			assert(p1.onMessage == nil, "createRequestAsyncNetwork does not support onMessage; use createRequestInternalNetwork")
			local var3 = false
			task.spawn(function() --[[ line: 31 ]]
				-- upvalues: httpService (copy), p1 (ref), var3 (write), p2 (ref), toLowerKeyedHeaders (copy)
				local ok, status = pcall(function() --[[ line: 32 ]]
					-- upvalues: httpService (copy), p1 (copy)
					return httpService:RequestAsync({
						Url = p1.url,
						Method = p1.method,
						Headers = p1.headers,
						Body = p1.body
					})
				end)
				
				if var3 then return end
				var3 = true
				
				if ok then
					p2(true, {
						statusCode = tonumber(status.StatusCode) or 0,
						responseBody = status.Body,
						headers = toLowerKeyedHeaders(status.Headers)
					})
					
					return
				end
				p2(false, tostring(status))
			end)
			
			return function() --[[ line: 58 ]]
				-- upvalues: var3 (write)
				var3 = true
			end
		end
	}
end