local httpService = game:GetService("HttpService")
local cryoModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.Cryo)

return function(p0) --[[ line: 6 | named "formatEventStreamFields" ]]
	-- upvalues: cryoModule (ref), httpService (ref)
	return cryoModule.Dictionary.map(p0, function(p1, p2) --[[ line: 7 ]]
		-- upvalues: httpService (copy)
		if type(p1) ~= "table" then
			return tostring(p1), p2
		end
		local ok, status = pcall(function() --[[ line: 9 ]]
			-- upvalues: httpService (copy), p1 (ref)
			return httpService:JSONEncode(p1)
		end)
		
		if ok then
			return status, p2
		end
		return "", p2
	end)
end