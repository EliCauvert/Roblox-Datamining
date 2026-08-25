local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(profilePlatform.Common.Enums)
local reactModule = require(profilePlatform.Parent.React)
local httpService = game:GetService("HttpService")

return function(p0)
	-- upvalues: reactModule (ref), httpService (ref)
	return reactModule.useMemo(function()
		-- upvalues: p0 (ref), httpService (copy)
		return `ProfilePlatform_${p0}_${httpService:GenerateGUID()}`
	end, { p0 })
end