local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.Parent.React)
local NotificationCardContextModule = require(Parent.NotificationCardContext)
local _ = require(Parent1.type)

return function(p1)
	-- upvalues: ReactModule (copy), NotificationCardContextModule (copy)
	local UseContextResult = ReactModule.useContext(NotificationCardContextModule)
	
	return if p1 then UseContextResult.state and UseContextResult.state.visualItems and UseContextResult.state.visualItems[p1] or {} else UseContextResult.state
end