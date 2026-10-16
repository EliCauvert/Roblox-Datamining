local HttpService = game:GetService("HttpService")

return function(Input) --[[ Line: 3 | Named "encodeUserIds" ]]
	-- upvalues: HttpService (copy)
	if Input == nil then
		return "[]"
	else
		local Success, Result = pcall(function() --[[ Line: 8 ]]
			-- upvalues: HttpService (upval), Input (copy)
			return HttpService:JSONEncode(Input)
		end)
		
		return if Success then Result else "[]"
	end
end