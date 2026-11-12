local HttpService = game:GetService("HttpService")
local _ = require(script:FindFirstAncestor("DataHydration").Moments.MomentsStoreTypes)

return function(p1)
	-- upvalues: HttpService (copy)
	local ErrorMessage = if type(p1) == "table" then p1.errorMessage else nil
	
	if type(ErrorMessage) ~= "string" then
		return nil
	end
	local FoundAt: number? = string.find(ErrorMessage, "{", 1, true)
	
	if FoundAt == nil then
		return nil
	end
	local Success, Result = pcall(HttpService.JSONDecode, HttpService, (string.sub(ErrorMessage, FoundAt)))
	
	if Success and type(Result) == "table" then
		local LimitSeconds = Result.limitSeconds
		
		return if Result.errorCode == "MomentsDailyLimitReached" and type(LimitSeconds) == "number" then {
			limitSeconds = LimitSeconds,
			resetsAt = if type(Result.resetsAt) == "string" then Result.resetsAt else nil
		} else nil
	else
		return nil
	end
end