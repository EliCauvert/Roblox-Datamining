local parent = script.Parent
local reactModule = require(parent.Parent.Parent.React)
local notificationCardContextModule = require(parent.NotificationCardContext)

return function()
	-- upvalues: reactModule (ref), notificationCardContextModule (ref)
	return reactModule.useContext(notificationCardContextModule)
end