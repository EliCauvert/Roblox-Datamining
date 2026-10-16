local Parent = script.Parent
local ReactModule = require(Parent.Parent.Parent.React)
local NotificationCardContextModule = require(Parent.NotificationCardContext)

return function() --[[ Line: 7 | Named "useNotificationCardData" ]]
	-- upvalues: ReactModule (copy), NotificationCardContextModule (copy)
	return (ReactModule.useContext(NotificationCardContextModule))
end