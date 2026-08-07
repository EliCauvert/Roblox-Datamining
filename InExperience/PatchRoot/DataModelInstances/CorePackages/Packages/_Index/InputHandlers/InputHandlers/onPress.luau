local _ = require(script.Parent.Parent.FocusNavigation)
local handleInputModule = require(script.Parent.handleInput)

return function(p0) --[[ line: 7 | named "onPress" ]]
	-- upvalues: handleInputModule (ref)
	return handleInputModule({ onPress = p0 })
end