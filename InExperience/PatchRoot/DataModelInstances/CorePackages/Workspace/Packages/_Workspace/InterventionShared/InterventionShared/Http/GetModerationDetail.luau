local InterventionShared = script:FindFirstAncestor("InterventionShared")
local Parent = InterventionShared.Parent
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local PromiseModule = require(Parent.Promise)
local BuildQueryStringModule = require(InterventionShared.Utils.buildQueryString)

return function(p1) --[[ Line: 20 | Named "GetModerationDetail" ]]
	-- upvalues: UrlBuilder (copy), BuildQueryStringModule (copy), PromiseModule (copy), HttpRbxApiService (copy), HttpService (copy)
	local Text = UrlBuilder.usermoderation.moderationDetail() .. BuildQueryStringModule(p1)
	
	return PromiseModule.new(function(Callback1, Callback) --[[ Line: 24 ]]
		-- upvalues: HttpRbxApiService (upval), Text (copy), HttpService (upval)
		task.defer(function() --[[ Line: 25 ]]
			-- upvalues: HttpRbxApiService (upval), Text (upval), HttpService (upval), Callback1 (copy), Callback (copy)
			local Success, Result = pcall(function() --[[ Line: 26 ]]
				-- upvalues: HttpRbxApiService (upval), Text (upval)
				return HttpRbxApiService:GetAsyncFullUrl(Text, Enum.ThrottlingPriority.Default)
			end)
			
			if not Success then
				Callback({ error = "HTTP request failed", details = Result })
				
				return
			end
			local Success1, Result1 = pcall(function() --[[ Line: 31 ]]
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			if Success1 then
				Callback1(Result1)
				
				return
			else
				Callback({
					error = "Failed to parse JSON response",
					details = Result1
				})
			end
		end)
	end)
end