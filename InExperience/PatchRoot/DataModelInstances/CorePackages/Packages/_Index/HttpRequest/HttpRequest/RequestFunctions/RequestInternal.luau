local HttpService = game:GetService("HttpService")
local GetHeadersModule = require(script.Parent.Util.getHeaders)
local GetPostBodyModule = require(script.Parent.Util.getPostBody)

return function(Url, Method, p1)
	-- upvalues: HttpService (copy), GetPostBodyModule (copy), GetHeadersModule (copy)
	return HttpService:RequestInternal({
		Url = Url,
		Method = Method,
		Body = GetPostBodyModule(p1.postBody, Method),
		Timeout = p1.timeout or 15000,
		CachePolicy = p1.cachePolicy or Enum.HttpCachePolicy.None,
		Priority = p1.priority or 0,
		Headers = GetHeadersModule(p1.headers, Method),
		RequestType = p1.requestType or nil,
		AllowSandboxing = p1.allowSandboxing or nil
	})
end