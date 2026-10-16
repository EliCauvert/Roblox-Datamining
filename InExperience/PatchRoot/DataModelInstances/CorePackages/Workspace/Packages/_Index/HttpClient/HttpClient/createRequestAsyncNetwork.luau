local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.types)

local function toLowerKeyedHeaders(Headers) --[[ Line: 8 ]]
	if typeof(Headers) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, header in Headers do
		t[tostring(i):lower()] = tostring(header)
	end
	return t
end

return function() --[[ Line: 19 | Named "createRequestAsyncNetwork" ]]
	-- upvalues: HttpService (copy), toLowerKeyedHeaders (copy)
	return {
		request = function(p1, Callback) --[[ Line: 20 ]]
			-- upvalues: HttpService (upval), toLowerKeyedHeaders (upval)
			assert(p1.onMessage == nil, "createRequestAsyncNetwork does not support onMessage; use createRequestInternalNetwork")
			local Flag = false
			task.spawn(function() --[[ Line: 31 ]]
				-- upvalues: HttpService (upval), p1 (copy), Flag (ref), Callback (copy), toLowerKeyedHeaders (upval)
				local Success, Result = pcall(function() --[[ Line: 32 ]]
					-- upvalues: HttpService (upval), p1 (upval)
					return HttpService:RequestAsync({
						Url = p1.url,
						Method = p1.method,
						Headers = p1.headers,
						Body = p1.body
					})
				end)
				
				if Flag then return end
				Flag = true
				
				if Success then
					Callback(true, {
						statusCode = tonumber(Result.StatusCode) or 0,
						responseBody = Result.Body,
						headers = toLowerKeyedHeaders(Result.Headers)
					})
					
					return
				else
					Callback(false, (tostring(Result)))
				end
			end)
			
			return function() --[[ Line: 58 ]]
				-- upvalues: Flag (ref)
				Flag = true
			end
		end
	}
end