local httpService = game:GetService("HttpService")
local promiseModule = require(script.Parent.Parent.Utility.Promise)
local extreme = Enum.ThrottlingPriority.Extreme
local applicationJson = Enum.HttpContentType.ApplicationJson

return function(p1)
	-- upvalues: applicationJson (ref), extreme (ref), promiseModule (ref), httpService (ref)
	local function _(p2, p3)
		-- upvalues: applicationJson (copy), extreme (copy), p1 (ref)
		assert(p3.postBody, "Expected a postBody to be specified with this request")
		assert(type(p3.postBody) == "string", "Expected postBody to be a string")
		
		if not p3.contentType then
			p3.contentType = applicationJson
		end
		if not p3.throttlingPriority then
			p3.throttlingPriority = extreme
		end
		return function()
			-- upvalues: p1 (copy), p2 (ref), p3 (ref)
			return p1:PostAsyncFullUrl(p2, p3.postBody, p3.throttlingPriority, p3.contentType)
		end
	end
	
	local _ = function(p2)
		-- upvalues: p1 (ref), extreme (copy)
		return function()
			-- upvalues: p1 (copy), p2 (ref), extreme (copy)
			return p1:GetAsyncFullUrl(p2, extreme)
		end
	end
	
	return function(p2, p3, p4)
		-- upvalues: applicationJson (copy), extreme (copy), p1 (ref), promiseModule (copy), httpService (copy)
		assert(type(p2) == "string", "Expected url to be a string")
		assert(type(p3) == "string", "Expected requestMethod to be a string")
		assert(not p4 or type(p4) == "table", "Expected options to be a table")
		p3 = string.upper(p3)
		local var1 = nil
		
		if p3 == "POST" then
			assert(p4.postBody, "Expected a postBody to be specified with this request")
			assert(type(p4.postBody) == "string", "Expected postBody to be a string")
			
			if not p4.contentType then
				p4.contentType = applicationJson
			end
			if not p4.throttlingPriority then
				p4.throttlingPriority = extreme
			end
			var1 = function()
				-- upvalues: p1 (copy), p2 (ref), p4 (ref)
				return p1:PostAsyncFullUrl(p2, p4.postBody, p4.throttlingPriority, p4.contentType)
			end
		elseif p3 == "GET" then
			var1 = function()
				-- upvalues: p1 (copy), p2 (ref), extreme (copy)
				return p1:GetAsyncFullUrl(p2, extreme)
			end
		else
			error(string.format("Unsupported requestMethod : %s", p3 or "nil"))
		end
		return promiseModule.new(function(p5, p6)
			-- upvalues: var1 (write), httpService (copy)
			if var1 then
				coroutine.wrap(function()
					-- upvalues: var1 (copy), httpService (copy), p5 (ref), p6 (ref)
					local ok, status = pcall(var1)
					
					if not ok then
						p6(status)
						
						return
					end
					local ok_1, status_1 = pcall(function()
						-- upvalues: httpService (copy), status (ref)
						return httpService:JSONDecode(status)
					end)
					
					if ok_1 then
						p5({ responseBody = status_1 })
						
						return
					end
					p6(status_1)
				end)()
				
				return
			end
			p6()
		end)
	end
end