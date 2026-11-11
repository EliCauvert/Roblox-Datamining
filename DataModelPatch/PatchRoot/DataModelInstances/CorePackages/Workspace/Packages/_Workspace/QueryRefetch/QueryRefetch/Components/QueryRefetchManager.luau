local QueryRefetch = script:FindFirstAncestor("QueryRefetch")
local Parent = QueryRefetch.Parent
local ReactModule = require(Parent.React)
local UsePlatformNameQueryRefetchModule = require(QueryRefetch.Hooks.usePlatformNameQueryRefetch)
local NotificationService = game:GetService("NotificationService")
local RobloxEventReceiver = require(Parent.RobloxEventReceiver).RobloxEventReceiver

return function()
	-- upvalues: ReactModule (copy), RobloxEventReceiver (copy), NotificationService (copy), UsePlatformNameQueryRefetchModule (copy)
	UsePlatformNameQueryRefetchModule((ReactModule.useMemo(function()
		-- upvalues: RobloxEventReceiver (upval), NotificationService (upval)
		return RobloxEventReceiver.new(NotificationService)
	end, {})))
	
	return nil
end