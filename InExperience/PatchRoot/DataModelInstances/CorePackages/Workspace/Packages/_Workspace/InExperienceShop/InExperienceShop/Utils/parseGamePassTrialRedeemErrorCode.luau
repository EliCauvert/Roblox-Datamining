local HttpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: HttpService (copy)
	if typeof(p1) ~= "table" then
		return nil
	end
	local ErrorMessage: string = p1.errorMessage
	
	if type(ErrorMessage) ~= "string" then
		return nil
	end
	local FoundAt: number? = string.find(ErrorMessage, "{", 1, true)
	
	if FoundAt == nil then
		return nil
	else
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, (string.sub(ErrorMessage, FoundAt)))
		
		return if Success and type(Result) == "table" and type(Result.errorCode) == "string" then Result.errorCode else nil
	end
end