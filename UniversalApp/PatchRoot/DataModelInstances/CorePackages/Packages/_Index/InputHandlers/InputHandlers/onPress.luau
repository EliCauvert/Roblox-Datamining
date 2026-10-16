local _ = require(script.Parent.Parent.FocusNavigation)
local HandleInputModule = require(script.Parent.handleInput)

return function(OnPress) --[[ Line: 7 | Named "onPress" ]]
	-- upvalues: HandleInputModule (copy)
	return HandleInputModule({ onPress = OnPress })
end