local httpService = game:GetService("HttpService")
local getHeadersModule = require(script.Parent.Util.getHeaders)
local getPostBodyModule = require(script.Parent.Util.getPostBody)

return function(p0, p1, p2)
	-- upvalues: httpService (ref), getPostBodyModule (ref), getHeadersModule (ref)
	return {
		Start = function(_, p3)
			-- upvalues: httpService (copy), p0 (ref), p1 (ref), getPostBodyModule (copy), p2 (ref), getHeadersModule (copy)
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), p0 (copy), p1 (copy), getPostBodyModule (copy), p2 (copy), getHeadersModule (copy)
				return httpService:RequestAsync({
					Url = p0,
					Method = p1,
					Body = getPostBodyModule(p2.postBody, p1),
					Headers = getHeadersModule(p2.headers, p1)
				})
			end)
			p3(ok, status)
		end,
		Cancel = function() end
	}
end