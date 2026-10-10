local enumScreensModule = require(script:FindFirstAncestor("AppChat").EnumScreens)
local getCurrentRouteModule = require(script.Parent.getCurrentRoute)

return function(p1)
	-- upvalues: getCurrentRouteModule (ref), enumScreensModule (ref)
	local var1 = p1
	while var1 and var1._dangerouslyGetParent do
		local var2 = var1._dangerouslyGetParent()
		
		if not var2 then break end
		var1 = var2
	end
	local var3 = if var1 then getCurrentRouteModule(var1.state) else nil
	
	return var3 ~= nil and var3.routeName == enumScreensModule.ChatConversation
end