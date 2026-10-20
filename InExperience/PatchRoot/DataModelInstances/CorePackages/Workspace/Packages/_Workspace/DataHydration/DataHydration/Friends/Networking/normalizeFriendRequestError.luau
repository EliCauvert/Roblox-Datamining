local HttpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: HttpService (copy)
	local StatusCode = if type(p1) == "table" then p1.StatusCode else nil
	local Code = nil
	local Body = if type(p1) == "table" then p1.Body else nil
	
	if type(Body) == "string" then
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, Body)
		
		if Success and type(Result) == "table" then
			local Errors = Result.errors
			
			if type(Errors) == "table" and Errors[1] then
				Code = Errors[1].code
			end
		end
	end
	return { statusCode = StatusCode, firstErrorCode = Code }
end