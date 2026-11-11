local HttpService = game:GetService("HttpService")
local CryoModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.Cryo)

return function(p1)
	-- upvalues: CryoModule (copy), HttpService (copy)
	return CryoModule.Dictionary.map(p1, function(Input, p2)
		-- upvalues: HttpService (upval)
		if type(Input) ~= "table" then
			return tostring(Input), p2
		end
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), Input (copy)
			return HttpService:JSONEncode(Input)
		end)
		
		if Success then
			return Result, p2
		else
			return "", p2
		end
	end)
end