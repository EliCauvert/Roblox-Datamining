local httpService = game:GetService("HttpService")
local promiseModule = require(game:GetService("CorePackages").Packages.Promise)
local extreme = Enum.ThrottlingPriority.Extreme
local applicationJson = Enum.HttpContentType.ApplicationJson

return function(p0)
	-- upvalues: httpService (ref), applicationJson (ref), extreme (ref), promiseModule (ref)
	local function doHttpPost(p1, p2)
		-- upvalues: httpService (copy), applicationJson (copy), extreme (copy), p0 (ref)
		local postBody = nil
		assert(p2.postBody, "Expected a postBody to be specified with this request")
		
		if type(p2.postBody) == "table" then
			postBody = httpService:JSONEncode(p2.postBody)
		elseif type(p2.postBody) == "string" then
			postBody = p2.postBody
		else
			error("Expected postBody to be a string or table")
		end
		if not p2.contentType then
			p2.contentType = applicationJson
		end
		if not p2.throttlingPriority then
			p2.throttlingPriority = extreme
		end
		return function()
			-- upvalues: p0 (copy), p1 (ref), postBody (write), p2 (ref)
			return p0:PostAsyncFullUrl(p1, postBody, p2.throttlingPriority, p2.contentType)
		end
	end
	
	local function _(p3)
		-- upvalues: p0 (ref), extreme (copy)
		return function()
			-- upvalues: p0 (copy), p3 (ref), extreme (copy)
			return p0:GetAsyncFullUrl(p3, extreme)
		end
	end
	
	return function(p4, p5, p6)
		-- upvalues: doHttpPost (ref), p0 (ref), extreme (copy), promiseModule (copy), httpService (copy)
		assert(type(p4) == "string", "Expected url to be a string")
		assert(type(p5) == "string", "Expected requestMethod to be a string")
		assert(not p6 or type(p6) == "table", "Expected options to be a table")
		p5 = string.upper(p5)
		local var3 = nil
		
		if p5 == "POST" then
			var3 = doHttpPost(p4, p6)
		elseif p5 == "GET" then
			var3 = function()
				-- upvalues: p0 (copy), p4 (ref), extreme (copy)
				return p0:GetAsyncFullUrl(p4, extreme)
			end
		else
			error(string.format("Unsupported requestMethod : %s", p5 or "nil"))
		end
		return promiseModule.new(function(p7, p8)
			-- upvalues: var3 (write), httpService (copy)
			if var3 then
				spawn(function()
					-- upvalues: var3 (copy), httpService (copy), p7 (ref), p8 (ref)
					local ok, status = pcall(var3)
					
					if not ok then
						p8(status)
						
						return
					end
					local ok_1, status_1 = pcall(function()
						-- upvalues: httpService (copy), status (ref)
						return httpService:JSONDecode(status)
					end)
					
					if ok_1 then
						p7({ responseBody = status_1 })
						
						return
					end
					p8(status_1)
				end)
				
				return
			end
			p8()
		end)
	end
end