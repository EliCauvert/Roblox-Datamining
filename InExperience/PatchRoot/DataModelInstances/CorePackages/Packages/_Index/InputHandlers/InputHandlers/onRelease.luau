local _ = require(script.Parent.Parent.FocusNavigation)
local handleInputModule = require(script.Parent.handleInput)

return function(p1)
	-- upvalues: handleInputModule (ref)
	return handleInputModule({ onRelease = p1 })
end