local interventionShared = script:FindFirstAncestor("InterventionShared")
local parent = interventionShared.Parent
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local promiseModule = require(parent.Promise)
local buildQueryStringModule = require(interventionShared.Utils.buildQueryString)

return function(p1)
	-- upvalues: urlBuilder (ref), buildQueryStringModule (ref), promiseModule (ref), httpRbxApiService (ref), httpService (ref)
	local text = urlBuilder.usermoderation.moderationDetail() .. buildQueryStringModule(p1)
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: httpRbxApiService (copy), text (ref), httpService (copy)
		task.defer(function()
			-- upvalues: httpRbxApiService (copy), text (copy), httpService (copy), p2 (ref), p3 (ref)
			local ok, status = pcall(function()
				-- upvalues: httpRbxApiService (copy), text (copy)
				return httpRbxApiService:GetAsyncFullUrl(text, Enum.ThrottlingPriority.Default)
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