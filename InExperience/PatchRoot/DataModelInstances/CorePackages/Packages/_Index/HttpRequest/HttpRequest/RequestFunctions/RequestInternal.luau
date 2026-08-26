local httpService = game:GetService("HttpService")
local getHeadersModule = require(script.Parent.Util.getHeaders)
local getPostBodyModule = require(script.Parent.Util.getPostBody)

return function(p1, p2, p3)
	-- upvalues: httpService (ref), getPostBodyModule (ref), getHeadersModule (ref)
	return httpService:RequestInternal({
		Url = p1,
		Method = p2,
		Body = getPostBodyModule(p3.postBody, p2),
		Timeout = p3.timeout or 15000,
		CachePolicy = p3.cachePolicy or Enum.HttpCachePolicy.None,
		Priority = p3.priority or 0,
		Headers = getHeadersModule(p3.headers, p2),
		RequestType = p3.requestType or nil,
		AllowSandboxing = p3.allowSandboxing or nil
	})
end