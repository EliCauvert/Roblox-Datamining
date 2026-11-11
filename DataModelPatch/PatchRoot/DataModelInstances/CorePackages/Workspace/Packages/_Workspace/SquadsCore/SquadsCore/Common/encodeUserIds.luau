local HttpService = game:GetService("HttpService")

return function(Input)
	-- upvalues: HttpService (copy)
	if Input == nil then
		return "[]"
	else
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), Input (copy)
			return HttpService:JSONEncode(Input)
		end)
		
		return if Success then Result else "[]"
	end
end