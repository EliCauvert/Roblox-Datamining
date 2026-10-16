local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(ProfilePlatform.Common.Enums)
local ReactModule = require(ProfilePlatform.Parent.React)
local HttpService = game:GetService("HttpService")

return function(p1) --[[ Line: 10 ]]
	-- upvalues: ReactModule (copy), HttpService (copy)
	return ReactModule.useMemo(function(): string --[[ Line: 11 ]]
		-- upvalues: p1 (copy), HttpService (upval)
		return `ProfilePlatform_${p1}_${HttpService:GenerateGUID()}`
	end, { p1 })
end