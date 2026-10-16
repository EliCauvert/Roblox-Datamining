local RobloxAppHooks = script:FindFirstAncestor("RobloxAppHooks")
local AppSystemInfo = require(RobloxAppHooks.Parent.RoactServiceTags).AppSystemInfo
local UseRoactServiceModule = require(RobloxAppHooks.useRoactService)

return function() --[[ Line: 6 | Named "useSystemInfo" ]]
	-- upvalues: UseRoactServiceModule (copy), AppSystemInfo (copy)
	return UseRoactServiceModule(AppSystemInfo)
end