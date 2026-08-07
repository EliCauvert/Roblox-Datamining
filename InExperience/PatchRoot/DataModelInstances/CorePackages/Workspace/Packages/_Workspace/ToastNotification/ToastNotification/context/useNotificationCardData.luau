local parent = script.Parent
local reactModule = require(parent.Parent.Parent.React)
local notificationCardContextModule = require(parent.NotificationCardContext)

return function() --[[ line: 7 | named "useNotificationCardData" ]]
	-- upvalues: reactModule (ref), notificationCardContextModule (ref)
	return reactModule.useContext(notificationCardContextModule)
end