local _ = require(script.Parent.Parent.FocusNavigation)
local handleInputModule = require(script.Parent.handleInput)

return function(p0, p1, p2) --[[ line: 7 | named "onLongPress" ]]
	-- upvalues: handleInputModule (ref)
	return handleInputModule({
		hold = { durationSeconds = p0, onComplete = p1, onStep = p2 }
	})
end