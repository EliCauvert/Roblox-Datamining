local _ = require(script.Parent.Parent.FocusNavigation)
local handleInputModule = require(script.Parent.handleInput)

return function(p1, p2, p3)
	-- upvalues: handleInputModule (ref)
	return handleInputModule({
		hold = { durationSeconds = p1, onComplete = p2, onStep = p3 }
	})
end