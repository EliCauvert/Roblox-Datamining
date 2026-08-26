local httpService = game:GetService("HttpService")
local getHeadersModule = require(script.Parent.Util.getHeaders)
local getPostBodyModule = require(script.Parent.Util.getPostBody)

return function(p1, p2, p3)
	-- upvalues: httpService (ref), getPostBodyModule (ref), getHeadersModule (ref)
	return {
		Start = function(_, p4)
			-- upvalues: httpService (copy), p1 (ref), p2 (ref), getPostBodyModule (copy), p3 (ref), getHeadersModule (copy)
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), p1 (copy), p2 (copy), getPostBodyModule (copy), p3 (copy), getHeadersModule (copy)
				return httpService:RequestAsync({
					Url = p1,
					Method = p2,
					Body = getPostBodyModule(p3.postBody, p2),
					Headers = getHeadersModule(p3.headers, p2)
				})
			end)
			p4(ok, status)
		end,
		Cancel = function() end
	}
end