local httpService = game:GetService("HttpService")
local promiseModule = require(script.Parent.Parent.Utility.Promise)
local extreme = Enum.ThrottlingPriority.Extreme
local applicationJson = Enum.HttpContentType.ApplicationJson

return function(p0) --[[ line: 9 ]]
	-- upvalues: applicationJson (ref), extreme (ref), promiseModule (ref), httpService (ref)
	local function _(p1, p2) --[[ line: 11 | named "doHttpPost" ]]
		-- upvalues: applicationJson (copy), extreme (copy), p0 (ref)
		assert(p2.postBody, "Expected a postBody to be specified with this request")
		assert(type(p2.postBody) == "string", "Expected postBody to be a string")
		
		if not p2.contentType then
			p2.contentType = applicationJson
		end
		if not p2.throttlingPriority then
			p2.throttlingPriority = extreme
		end
		return function() --[[ line: 23 ]]
			-- upvalues: p0 (copy), p1 (ref), p2 (ref)
			return p0:PostAsyncFullUrl(p1, p2.postBody, p2.throttlingPriority, p2.contentType)
		end
	end
	
	local _ = function(p3) --[[ line: 33 | named "doHttpGet" ]]
		-- upvalues: p0 (ref), extreme (copy)
		return function() --[[ line: 34 ]]
			-- upvalues: p0 (copy), p3 (ref), extreme (copy)
			return p0:GetAsyncFullUrl(p3, extreme)
		end
	end
	
	return function(p4, p5, p6) --[[ line: 47 ]]
		-- upvalues: applicationJson (copy), extreme (copy), p0 (ref), promiseModule (copy), httpService (copy)
		assert(type(p4) == "string", "Expected url to be a string")
		assert(type(p5) == "string", "Expected requestMethod to be a string")
		assert(not p6 or type(p6) == "table", "Expected options to be a table")
		p5 = string.upper(p5)
		local var2 = nil
		
		if p5 == "POST" then
			assert(p6.postBody, "Expected a postBody to be specified with this request")
			assert(type(p6.postBody) == "string", "Expected postBody to be a string")
			
			if not p6.contentType then
				p6.contentType = applicationJson
			end
			if not p6.throttlingPriority then
				p6.throttlingPriority = extreme
			end
			var2 = function() --[[ line: 23 ]]
				-- upvalues: p0 (copy), p4 (ref), p6 (ref)
				return p0:PostAsyncFullUrl(p4, p6.postBody, p6.throttlingPriority, p6.contentType)
			end
		elseif p5 == "GET" then
			var2 = function() --[[ line: 34 ]]
				-- upvalues: p0 (copy), p4 (ref), extreme (copy)
				return p0:GetAsyncFullUrl(p4, extreme)
			end
		else
			error(string.format("Unsupported requestMethod : %s", p5 or "nil"))
		end
		return promiseModule.new(function(p7, p8) --[[ line: 62 ]]
			-- upvalues: var2 (write), httpService (copy)
			if var2 then
				coroutine.wrap(function() --[[ line: 64 ]]
					-- upvalues: var2 (copy), httpService (copy), p7 (ref), p8 (ref)
					local ok, status = pcall(var2)
					
					if not ok then
						p8(status)
						
						return
					end
					local ok_1, status_1 = pcall(function() --[[ line: 68 ]]
						-- upvalues: httpService (copy), status (ref)
						return httpService:JSONDecode(status)
					end)
					
					if ok_1 then
						p7({ responseBody = status_1 })
						
						return
					end
					p8(status_1)
				end)()
				
				return
			end
			p8()
		end)
	end
end