local httpService = game:GetService("HttpService")
local cryoModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.Cryo)

return function(p1)
	-- upvalues: cryoModule (ref), httpService (ref)
	return cryoModule.Dictionary.map(p1, function(p2, p3)
		-- upvalues: httpService (copy)
		if type(p2) ~= "table" then
			return tostring(p2), p3
		end
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p2 (ref)
			return httpService:JSONEncode(p2)
		end)
		
		if ok then
			return status, p3
		end
		return "", p3
	end)
end