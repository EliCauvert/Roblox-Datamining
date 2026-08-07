local httpService = game:GetService("HttpService")
local getHeadersModule = require(script.Parent.Util.getHeaders)
local getPostBodyModule = require(script.Parent.Util.getPostBody)

return function(p0, p1, p2) --[[ line: 6 ]]
	-- upvalues: httpService (ref), getPostBodyModule (ref), getHeadersModule (ref)
	return httpService:RequestInternal({
		Url = p0,
		Method = p1,
		Body = getPostBodyModule(p2.postBody, p1),
		Timeout = p2.timeout or 15000,
		CachePolicy = p2.cachePolicy or Enum.HttpCachePolicy.None,
		Priority = p2.priority or 0,
		Headers = getHeadersModule(p2.headers, p1),
		RequestType = p2.requestType or nil,
		AllowSandboxing = p2.allowSandboxing or nil
	})
end