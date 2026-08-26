local parent = script:FindFirstAncestor("InterventionShared").Parent
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local promiseModule = require(parent.Promise)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder

return function(p1)
	-- upvalues: urlBuilder (ref), httpService (ref), promiseModule (ref), httpRbxApiService (ref)
	local var1 = urlBuilder.usermoderation.dismissIntervention()
	local var2 = httpService:JSONEncode({ intervention_id = p1 })
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: httpRbxApiService (copy), var1 (ref), var2 (ref), httpService (copy)
		task.defer(function()
			-- upvalues: httpRbxApiService (copy), var1 (copy), var2 (copy), httpService (copy), p2 (ref), p3 (ref)
			local ok, status = pcall(function()
				-- upvalues: httpRbxApiService (copy), var1 (copy), var2 (copy)
				return httpRbxApiService:PostAsyncFullUrl(var1, var2, Enum.ThrottlingPriority.Default)
			end)
			
			if not ok then
				p3({ error = "HTTP request failed", details = status })
				
				return
			end
			local ok_1, status_1 = pcall(function()
				-- upvalues: httpService (copy), status (ref)
				return httpService:JSONDecode(status)
			end)
			
			if ok_1 then
				p2(status_1)
				
				return
			end
			p3({
				error = "Failed to parse JSON response",
				details = status_1
			})
		end)
	end)
end