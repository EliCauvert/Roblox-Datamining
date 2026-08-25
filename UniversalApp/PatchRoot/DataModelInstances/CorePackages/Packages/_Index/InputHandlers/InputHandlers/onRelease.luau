local _ = require(script.Parent.Parent.FocusNavigation)
local handleInputModule = require(script.Parent.handleInput)

return function(p0)
	-- upvalues: handleInputModule (ref)
	return handleInputModule({ onRelease = p0 })
end