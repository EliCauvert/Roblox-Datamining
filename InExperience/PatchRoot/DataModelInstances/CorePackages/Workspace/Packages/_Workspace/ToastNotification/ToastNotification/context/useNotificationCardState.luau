local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.Parent.React)
local notificationCardContextModule = require(parent.NotificationCardContext)
local _ = require(parent_1.type)

return function(p0)
	-- upvalues: reactModule (ref), notificationCardContextModule (ref)
	local var2 = reactModule.useContext(notificationCardContextModule)
	
	return if p0 then var2.state and (var2.state.visualItems and (var2.state.visualItems[p0] or {})) else var2.state
end