local Parent = script.Parent.Parent
local Error = require(Parent.LuauPolyfill).Error
local PromiseModule = require(Parent.Promise)
local Response = require(script.Parent.Response).Response
local Request = require(script.Parent.Request).Request

local function _(p1) --[[ Line: 34 | Named "parseResponse" ]]
	-- upvalues: Response (copy)
	return Response.new(p1.Body, {
		status = p1.StatusCode,
		statusText = p1.StatusMessage,
		headers = p1.Headers
	})
end

return function(HttpService) --[[ Line: 44 | Named "buildFetch" ]]
	-- upvalues: PromiseModule (copy), Request (copy), Error (copy), Response (copy)
	return function(p1, p2) --[[ Line: 45 | Named "fetch" ]]
		-- upvalues: PromiseModule (upval), Request (upval), Error (upval), HttpService (copy), Response (upval)
		return PromiseModule.new(function(Callback1, Callback: (any) -> ()) --[[ Line: 46 ]]
			-- upvalues: Request (upval), p1 (copy), p2 (copy), Error (upval), HttpService (upval), Response (upval)
			local Success, Result = pcall(function() --[[ Line: 47 ]]
				-- upvalues: Request (upval), p1 (upval), p2 (upval)
				return Request.new(p1, p2)
			end)
			
			if Success then
				HttpService:RequestInternal({
					Url = Result.url,
					Method = Result.method,
					Body = Result.body,
					Headers = Result.headers.headerList,
					CachePolicy = Result.cache
				}):Start(function(p3, p4) --[[ Line: 66 ]]
					-- upvalues: Result (copy), Callback (copy), Error (upval), Response (upval), Callback1 (copy)
					if p3 then
						Callback1((Response.new(p4.Body, {
							status = p4.StatusCode,
							statusText = p4.StatusMessage,
							headers = p4.Headers
						})))
						
						return
					else
						Result.signal:fire()
						Callback(Error.new(p4.ErrorMessage))
					end
				end)
				
				return
			else
				Callback(Error.new(Result))
			end
		end)
	end
end