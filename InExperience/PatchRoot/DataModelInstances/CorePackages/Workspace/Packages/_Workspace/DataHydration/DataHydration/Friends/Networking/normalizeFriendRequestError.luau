local httpService = game:GetService("HttpService")

return function(p0)
	-- upvalues: httpService (ref)
	local var1 = if type(p0) == "table" then p0.StatusCode else nil
	local code = nil
	local var2 = if type(p0) == "table" then p0.Body else nil
	
	if type(var2) == "string" then
		local ok, status = pcall(httpService.JSONDecode, httpService, var2)
		
		if ok and type(status) == "table" then
			local errors = status.errors
			
			if type(errors) == "table" and errors[1] then
				code = errors[1].code
			end
		end
	end
	return { statusCode = var1, firstErrorCode = code }
end