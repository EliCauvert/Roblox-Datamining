local robloxAppHooks = script:FindFirstAncestor("RobloxAppHooks")
local appSystemInfo = require(robloxAppHooks.Parent.RoactServiceTags).AppSystemInfo
local useRoactServiceModule = require(robloxAppHooks.useRoactService)

return function()
	-- upvalues: useRoactServiceModule (ref), appSystemInfo (ref)
	return useRoactServiceModule(appSystemInfo)
end