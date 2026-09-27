local httpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p1 (ref)
		return httpService:JSONDecode(p1.Body)
	end)
	
	return if ok and type(status) == "table" then status.errors and (status.errors[1] and status.errors[1].code) else nil
end