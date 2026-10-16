local HttpService = game:GetService("HttpService")
local Guid = ""

return {
	Get = function(_) --[[ Line: 7 ]]
		-- upvalues: Guid (ref), HttpService (copy)
		if Guid == "" then
			Guid = HttpService:GenerateGUID(false)
		end
		return Guid
	end,
	Refresh = function(_) --[[ Line: 14 ]]
		-- upvalues: Guid (ref), HttpService (copy)
		Guid = HttpService:GenerateGUID(false)
		
		return Guid
	end
}