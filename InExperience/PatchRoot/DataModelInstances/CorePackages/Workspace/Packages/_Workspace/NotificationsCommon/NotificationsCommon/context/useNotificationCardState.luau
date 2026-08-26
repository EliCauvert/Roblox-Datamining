local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.Parent.React)
local notificationCardContextModule = require(parent.NotificationCardContext)
local _ = require(parent_1.type)

return function(p1)
	-- upvalues: reactModule (ref), notificationCardContextModule (ref)
	local var1 = reactModule.useContext(notificationCardContextModule)
	
	return if p1 then var1.state and (var1.state.visualItems and (var1.state.visualItems[p1] or {})) else var1.state
end