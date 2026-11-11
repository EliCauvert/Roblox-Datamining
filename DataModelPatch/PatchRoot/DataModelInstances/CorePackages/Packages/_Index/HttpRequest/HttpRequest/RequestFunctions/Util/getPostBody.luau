local HttpService = game:GetService("HttpService")

return function(Input, p1)
	-- upvalues: HttpService (copy)
	if p1 == "POST" or p1 == "PATCH" then
		if type(Input) == "table" then
			return HttpService:JSONEncode(Input)
		end
		if type(Input) == "string" then
			return Input
		end
		error("Expected postBody to be a string or table")
	end
	return nil
end