local HttpService = game:GetService("HttpService")
local Guid = nil

return {
	Get = function(_)
		-- upvalues: Guid (ref), HttpService (copy)
		if Guid == nil then
			Guid = HttpService:GenerateGUID(false)
		end
		return Guid
	end,
	Refresh = function(_)
		-- upvalues: HttpService (copy), Guid (ref)
		local Guid1 = HttpService:GenerateGUID(false)
		Guid = Guid1
		
		return Guid1
	end
}