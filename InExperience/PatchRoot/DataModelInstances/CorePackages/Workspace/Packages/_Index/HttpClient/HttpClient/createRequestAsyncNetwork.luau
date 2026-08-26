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
			assert(p2.onMessage == nil, "createRequestAsyncNetwork does not support onMessage; use createRequestInternalNetwork")
			local var1 = false
			task.spawn(function()
				-- upvalues: httpService (copy), p2 (ref), var1 (write), p3 (ref), toLowerKeyedHeaders (copy)
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p2 (copy)
					return httpService:RequestAsync({
						Url = p2.url,
						Method = p2.method,
						Headers = p2.headers,
						Body = p2.body
					})
				end)
				
				if var1 then return end
				var1 = true
				
				if ok then
					p3(true, {
						statusCode = tonumber(status.StatusCode) or 0,
						responseBody = status.Body,
						headers = toLowerKeyedHeaders(status.Headers)
					})
					
					return
				end
				p3(false, tostring(status))
			end)
			
			return function()
				-- upvalues: var1 (write)
				var1 = true
			end
		end
	}
end