local parent = script:FindFirstAncestor("InterventionShared").Parent
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local promiseModule = require(parent.Promise)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder

return function(p0)
	-- upvalues: urlBuilder (ref), httpService (ref), promiseModule (ref), httpRbxApiService (ref)
	local var3 = urlBuilder.usermoderation.dismissIntervention()
	local var4 = httpService:JSONEncode({ intervention_id = p0 })
	
	return promiseModule.new(function(p1, p2)
		-- upvalues: httpRbxApiService (copy), var3 (ref), var4 (ref), httpService (copy)
		task.defer(function()
			-- upvalues: httpRbxApiService (copy), var3 (copy), var4 (copy), httpService (copy), p1 (ref), p2 (ref)
			local ok, status = pcall(function()
				-- upvalues: httpRbxApiService (copy), var3 (copy), var4 (copy)
				return httpRbxApiService:PostAsyncFullUrl(var3, var4, Enum.ThrottlingPriority.Default)
			end)
			
			if not ok then
				p2({ error = "HTTP request failed", details = status })
				
				return
			end
			local ok_1, status_1 = pcall(function()
				-- upvalues: httpService (copy), status (ref)
				return httpService:JSONDecode(status)
			end)
			
			if ok_1 then
				p1(status_1)
				
				return
			end
			p2({
				error = "Failed to parse JSON response",
				details = status_1
			})
		end)
	end)
end