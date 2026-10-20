local EnumScreensModule = require(script:FindFirstAncestor("AppChat").EnumScreens)
local GetCurrentRouteModule = require(script.Parent.getCurrentRoute)

return function(p1): boolean
	-- upvalues: GetCurrentRouteModule (copy), EnumScreensModule (copy)
	local v1 = p1
	while v1 and v1._dangerouslyGetParent do
		local DangerouslyGetParentResult = v1._dangerouslyGetParent()
		
		if not DangerouslyGetParentResult then break end
		v1 = DangerouslyGetParentResult
	end
	local CurrentRouteModule = if v1 then GetCurrentRouteModule(v1.state) else nil
	
	return CurrentRouteModule ~= nil and CurrentRouteModule.routeName == EnumScreensModule.ChatConversation
end