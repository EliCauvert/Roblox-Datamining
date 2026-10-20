local _ = require(script.Parent.Parent.FocusNavigation)
local HandleInputModule = require(script.Parent.handleInput)

return function(OnPress)
	-- upvalues: HandleInputModule (copy)
	return HandleInputModule({ onPress = OnPress })
end