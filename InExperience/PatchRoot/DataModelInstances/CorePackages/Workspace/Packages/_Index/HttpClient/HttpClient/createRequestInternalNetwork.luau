local httpService = game:GetService("HttpService")
local _ = require(script.Parent.types)
local fFlagHttpClientRetryExtensionsModule = require(script.Parent.Flags.FFlagHttpClientRetryExtensions)

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

return function(p2)
	-- upvalues: fFlagHttpClientRetryExtensionsModule (ref), httpService (ref), toLowerKeyedHeaders (ref)
	local var1 = if fFlagHttpClientRetryExtensionsModule then p2 ~= nil and p2.transportFailuresAsResponses else nil
	
	return {
		request = function(p3, p4)
			-- upvalues: httpService (copy), fFlagHttpClientRetryExtensionsModule (copy), var1 (ref), toLowerKeyedHeaders (copy)
			local var2 = httpService:RequestInternal({
				Url = p3.url,
				Method = p3.method,
				Headers = p3.headers,
				Body = p3.body,
				OnMessage = p3.onMessage,
				Priority = if fFlagHttpClientRetryExtensionsModule then p3.priority else nil
			})
			local var3 = false
			var2:Start(function(p5, p6)
				-- upvalues: var3 (write), fFlagHttpClientRetryExtensionsModule (copy), var1 (copy), p4 (ref), toLowerKeyedHeaders (copy)
				if var3 then return end
				var3 = true
				
				if typeof(p6) == "table" and (p5 or fFlagHttpClientRetryExtensionsModule and var1) then
					local i
					local t = nil
					
					if typeof(p6.Stats) == "table" then
						t = {}
						
						for i, v in p6.Stats do
							if typeof(i) == "string" and typeof(v) == "number" then
								t[i] = v
							elseif i == "WasRequestRetried" and typeof(v) == "boolean" then
								t[i] = if v then 1 else 0
							end
						end
					end
					local var4 = p4
					local var5 = true
					local t_1 = {
						statusCode = tonumber(p6.StatusCode) or 0,
						responseBody = p6.Body,
						headers = toLowerKeyedHeaders(p6.Headers),
						httpError = p6.HttpError,
						stats = t
					}
					i = if fFlagHttpClientRetryExtensionsModule and var1 then not p5 else nil
					t_1.wasTransportFailure = i
					var4(var5, t_1)
					
					return
				elseif fFlagHttpClientRetryExtensionsModule and var1 then
					p4(false, tostring(p6 or "RequestInternal failed"))
					
					return
				end
				p4(false, tostring(if p6 then p6.StatusMessage else "RequestInternal failed"))
			end)
			
			return function()
				-- upvalues: var3 (write), var2 (ref)
				if var3 then
					return
				end
				var3 = true
				pcall(function()
					-- upvalues: var2 (copy)
					var2:Cancel()
				end)
			end
		end
	}
end