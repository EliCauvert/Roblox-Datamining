local HttpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: HttpService (copy)
	if p1 ~= nil and p1.errors ~= nil and p1.errors[1] and p1.errors[1].fieldData then
		local FieldData = p1.errors[1].fieldData
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), FieldData (copy)
			return HttpService:JSONDecode(FieldData)
		end)
		
		if Success then
			return Result.users or {}
		end
	end
	return {}
end