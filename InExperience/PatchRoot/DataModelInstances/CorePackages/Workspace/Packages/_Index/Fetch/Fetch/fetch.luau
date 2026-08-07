local parent = script.Parent.Parent
local error = require(parent.LuauPolyfill).Error
local promiseModule = require(parent.Promise)
local response = require(script.Parent.Response).Response
local request = require(script.Parent.Request).Request

local function _(p0) --[[ line: 34 | named "parseResponse" ]]
	-- upvalues: response (ref)
	return response.new(p0.Body, {
		status = p0.StatusCode,
		statusText = p0.StatusMessage,
		headers = p0.Headers
	})
end

return function(p1) --[[ line: 44 | named "buildFetch" ]]
	-- upvalues: promiseModule (ref), request (ref), error (ref), response (ref)
	return function(p2, p3) --[[ line: 45 | named "fetch" ]]
		-- upvalues: promiseModule (copy), request (copy), error (copy), p1 (ref), response (copy)
		return promiseModule.new(function(p4, p5) --[[ line: 46 ]]
			-- upvalues: request (copy), p2 (ref), p3 (ref), error (copy), p1 (copy), response (copy)
			local ok, status = pcall(function() --[[ line: 47 ]]
				-- upvalues: request (copy), p2 (copy), p3 (copy)
				return request.new(p2, p3)
			end)
			
			if ok then
				p1:RequestInternal({
					Url = status.url,
					Method = status.method,
					Body = status.body,
					Headers = status.headers.headerList,
					CachePolicy = status.cache
				}):Start(function(p6, p7) --[[ line: 66 ]]
					-- upvalues: status (ref), p5 (ref), error (copy), response (copy), p4 (ref)
					if p6 then
						p4(response.new(p7.Body, {
							status = p7.StatusCode,
							statusText = p7.StatusMessage,
							headers = p7.Headers
						}))
						
						return
					end
					status.signal:fire()
					p5(error.new(p7.ErrorMessage))
				end)
				
				return
			end
			p5(error.new(status))
		end)
	end
end