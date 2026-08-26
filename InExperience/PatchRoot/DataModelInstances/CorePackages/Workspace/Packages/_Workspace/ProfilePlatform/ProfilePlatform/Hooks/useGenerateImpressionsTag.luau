local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(profilePlatform.Common.Enums)
local reactModule = require(profilePlatform.Parent.React)
local httpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: reactModule (ref), httpService (ref)
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), httpService (copy)
		return `ProfilePlatform_${p1}_${httpService:GenerateGUID()}`
	end, { p1 })
end