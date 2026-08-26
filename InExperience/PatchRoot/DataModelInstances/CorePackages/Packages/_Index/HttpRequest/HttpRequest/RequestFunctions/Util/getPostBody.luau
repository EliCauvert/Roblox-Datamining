local httpService = game:GetService("HttpService")

return function(p1, p2)
	-- upvalues: httpService (ref)
	if p2 == "POST" or p2 == "PATCH" then
		if type(p1) == "table" then
			return httpService:JSONEncode(p1)
		elseif type(p1) == "string" then
			return p1
		end
		error("Expected postBody to be a string or table")
	end
	return nil
end