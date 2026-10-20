local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.types)
local FFlagHttpClientMrRouterHeadersModule = require(script.Parent.Flags.FFlagHttpClientMrRouterHeaders)
local FFlagHttpClientRetryExtensionsModule = require(script.Parent.Flags.FFlagHttpClientRetryExtensions)
local MrRouterHeadersModule = if FFlagHttpClientMrRouterHeadersModule then require(script:FindFirstAncestor("HttpClient").Parent.MrRouterHeaders) else nil

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

return function(p1)
	-- upvalues: FFlagHttpClientRetryExtensionsModule (copy), FFlagHttpClientMrRouterHeadersModule (copy), MrRouterHeadersModule (ref), HttpService (copy), toLowerKeyedHeaders (copy)
	local TransportFailuresAsResponses = if FFlagHttpClientRetryExtensionsModule then p1 ~= nil and p1.transportFailuresAsResponses else nil
	
	return {
		request = function(p2, Callback)
			-- upvalues: FFlagHttpClientMrRouterHeadersModule (upval), MrRouterHeadersModule (upval), HttpService (upval), FFlagHttpClientRetryExtensionsModule (upval), TransportFailuresAsResponses (copy), toLowerKeyedHeaders (upval)
			local RequestInternalResult = HttpService:RequestInternal({
				Url = p2.url,
				Method = p2.method,
				Headers = if FFlagHttpClientMrRouterHeadersModule then MrRouterHeadersModule.injectMrRouterHeaders(p2.headers) else p2.headers,
				Body = p2.body,
				OnMessage = p2.onMessage,
				Priority = if FFlagHttpClientRetryExtensionsModule then p2.priority else nil
			})
			local Flag = false
			RequestInternalResult:Start(function(p3, p4)
				-- upvalues: Flag (ref), FFlagHttpClientRetryExtensionsModule (upval), TransportFailuresAsResponses (upval), Callback (copy), toLowerKeyedHeaders (upval)
				if Flag then return end
				Flag = true
				
				if typeof(p4) == "table" and (p3 or FFlagHttpClientRetryExtensionsModule and TransportFailuresAsResponses) then
					local Stats = nil
					
					if typeof(p4.Stats) == "table" then
						Stats = {}
						
						for i, stat in p4.Stats do
							if typeof(i) == "string" and typeof(stat) == "number" then
								Stats[i] = stat
							elseif i == "WasRequestRetried" and typeof(stat) == "boolean" then
								Stats[i] = if stat then 1 else 0
							end
						end
					end
					Callback(true, {
						statusCode = tonumber(p4.StatusCode) or 0,
						responseBody = p4.Body,
						headers = toLowerKeyedHeaders(p4.Headers),
						httpError = p4.HttpError,
						stats = Stats,
						wasTransportFailure = if FFlagHttpClientRetryExtensionsModule and TransportFailuresAsResponses then not p3 else nil
					})
					
					return
				elseif FFlagHttpClientRetryExtensionsModule and TransportFailuresAsResponses then
					Callback(false, (tostring(p4 or "RequestInternal failed")))
					
					return
				else
					Callback(false, (tostring(p4 and p4.StatusMessage or "RequestInternal failed")))
				end
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