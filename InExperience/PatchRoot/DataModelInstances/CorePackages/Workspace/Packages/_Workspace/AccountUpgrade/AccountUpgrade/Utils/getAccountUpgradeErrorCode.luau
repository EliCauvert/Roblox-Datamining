local HttpService = game:GetService("HttpService")

return function(p1) --[[ Line: 12 | Named "getAccountUpgradeErrorCode" ]]
	-- upvalues: HttpService (copy)
	local Success, Result = pcall(function() --[[ Line: 13 ]]
		-- upvalues: HttpService (upval), p1 (copy)
		return HttpService:JSONDecode(p1.Body)
	end)
	
	return if Success and type(Result) == "table" then Result.errors and (Result.errors[1] and Result.errors[1].code) else nil
end