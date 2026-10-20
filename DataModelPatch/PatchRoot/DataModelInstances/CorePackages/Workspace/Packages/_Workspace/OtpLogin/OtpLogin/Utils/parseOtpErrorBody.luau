local HttpService = game:GetService("HttpService")

return function(Input)
	-- upvalues: HttpService (copy)
	if not Input then
		return nil
	end
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), Input (copy)
		return HttpService:JSONDecode(Input)
	end)
	
	if Success and type(Result) == "table" and Result.errors and type(Result.errors) == "table" then
		local Error = Result.errors[1]
		
		if Error and Error.code and Error.code > 0 then
			return Error.code
		end
	end
	return nil
end