local httpService = game:GetService("HttpService")
local promiseModule = require(game:GetService("CorePackages").Packages.Promise)
local extreme = Enum.ThrottlingPriority.Extreme
local applicationJson = Enum.HttpContentType.ApplicationJson

return function(p1)
	-- upvalues: httpService (ref), applicationJson (ref), extreme (ref), promiseModule (ref)
	local function doHttpPost(p2, p3)
		-- upvalues: httpService (copy), applicationJson (copy), extreme (copy), p1 (ref)
		local postBody = nil
		assert(p3.postBody, "Expected a postBody to be specified with this request")
		
		if type(p3.postBody) == "table" then
			postBody = httpService:JSONEncode(p3.postBody)
		elseif type(p3.postBody) == "string" then
			postBody = p3.postBody
		else
			error("Expected postBody to be a string or table")
		end
		if not p3.contentType then
			p3.contentType = applicationJson
		end
		if not p3.throttlingPriority then
			p3.throttlingPriority = extreme
		end
		return function()
			-- upvalues: p1 (copy), p2 (ref), postBody (write), p3 (ref)
			return p1:PostAsyncFullUrl(p2, postBody, p3.throttlingPriority, p3.contentType)
		end
	end
	
	local function _(p2)
		-- upvalues: p1 (ref), extreme (copy)
		return function()
			-- upvalues: p1 (copy), p2 (ref), extreme (copy)
			return p1:GetAsyncFullUrl(p2, extreme)
		end
	end
	
	return function(p2, p3, p4)
		-- upvalues: doHttpPost (ref), p1 (ref), extreme (copy), promiseModule (copy), httpService (copy)
		assert(type(p2) == "string", "Expected url to be a string")
		assert(type(p3) == "string", "Expected requestMethod to be a string")
		assert(not p4 or type(p4) == "table", "Expected options to be a table")
		p3 = string.upper(p3)
		local var1 = nil
		
		if p3 == "POST" then
			var1 = doHttpPost(p2, p4)
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
				spawn(function()
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
				end)
				
				return
			end
			p6()
		end)
	end
end