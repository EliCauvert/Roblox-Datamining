local HttpService = game:GetService("HttpService")
local GetHeadersModule = require(script.Parent.Util.getHeaders)
local GetPostBodyModule = require(script.Parent.Util.getPostBody)

return function(Url, Method, p1) --[[ Line: 6 ]]
	-- upvalues: HttpService (copy), GetPostBodyModule (copy), GetHeadersModule (copy)
	return {
		Start = function(_, Callback: (any, any) -> ()) --[[ Line: 8 ]]
			-- upvalues: HttpService (upval), Url (copy), Method (copy), GetPostBodyModule (upval), p1 (copy), GetHeadersModule (upval)
			local Success, Result = pcall(function() --[[ Line: 9 ]]
				-- upvalues: HttpService (upval), Url (upval), Method (upval), GetPostBodyModule (upval), p1 (upval), GetHeadersModule (upval)
				return HttpService:RequestAsync({
					Url = Url,
					Method = Method,
					Body = GetPostBodyModule(p1.postBody, Method),
					Headers = GetHeadersModule(p1.headers, Method)
				})
			end)
			Callback(Success, Result)
		end,
		Cancel = function() --[[ Line: 20 ]] end
	}
end