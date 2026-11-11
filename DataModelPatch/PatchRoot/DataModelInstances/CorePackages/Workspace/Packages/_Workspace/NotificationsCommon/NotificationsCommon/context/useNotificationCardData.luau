local Parent = script.Parent
local ReactModule = require(Parent.Parent.Parent.React)
local NotificationCardContextModule = require(Parent.NotificationCardContext)

return function()
	-- upvalues: ReactModule (copy), NotificationCardContextModule (copy)
	return (ReactModule.useContext(NotificationCardContextModule))
end