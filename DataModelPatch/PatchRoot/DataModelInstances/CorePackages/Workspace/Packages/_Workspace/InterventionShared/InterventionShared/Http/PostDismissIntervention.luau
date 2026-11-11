local Parent = script:FindFirstAncestor("InterventionShared").Parent
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local PromiseModule = require(Parent.Promise)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder

return function(Intervention_id)
	-- upvalues: UrlBuilder (copy), HttpService (copy), PromiseModule (copy), HttpRbxApiService (copy)
	local DismissInterventionResult = UrlBuilder.usermoderation.dismissIntervention()
	local Json = HttpService:JSONEncode({ intervention_id = Intervention_id })
	
	return PromiseModule.new(function(Callback1, Callback)
		-- upvalues: HttpRbxApiService (upval), DismissInterventionResult (copy), Json (copy), HttpService (upval)
		task.defer(function()
			-- upvalues: HttpRbxApiService (upval), DismissInterventionResult (upval), Json (upval), HttpService (upval), Callback1 (copy), Callback (copy)
			local Success, Result = pcall(function()
				-- upvalues: HttpRbxApiService (upval), DismissInterventionResult (upval), Json (upval)
				return HttpRbxApiService:PostAsyncFullUrl(DismissInterventionResult, Json, Enum.ThrottlingPriority.Default)
			end)
			
			if not Success then
				Callback({ error = "HTTP request failed", details = Result })
				
				return
			end
			local Success1, Result1 = pcall(function()
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