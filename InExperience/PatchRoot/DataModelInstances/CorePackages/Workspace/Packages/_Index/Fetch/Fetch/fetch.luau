local parent = script.Parent.Parent
local error = require(parent.LuauPolyfill).Error
local promiseModule = require(parent.Promise)
local response = require(script.Parent.Response).Response
local request = require(script.Parent.Request).Request

local function _(p0)
	-- upvalues: response (ref)
	return response.new(p0.Body, {
		status = p0.StatusCode,
		statusText = p0.StatusMessage,
		headers = p0.Headers
	})
end

return function(p1)
	-- upvalues: promiseModule (ref), request (ref), error (ref), response (ref)
	return function(p2, p3)
		-- upvalues: promiseModule (copy), request (copy), error (copy), p1 (ref), response (copy)
		return promiseModule.new(function(p4, p5)
			-- upvalues: request (copy), p2 (ref), p3 (ref), error (copy), p1 (copy), response (copy)
			local ok, status = pcall(function()
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
				}):Start(function(p6, p7)
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