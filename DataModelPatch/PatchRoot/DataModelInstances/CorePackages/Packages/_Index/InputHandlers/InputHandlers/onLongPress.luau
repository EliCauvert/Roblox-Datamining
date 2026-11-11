local _ = require(script.Parent.Parent.FocusNavigation)
local HandleInputModule = require(script.Parent.handleInput)

return function(DurationSeconds, OnComplete, OnStep)
	-- upvalues: HandleInputModule (copy)
	return HandleInputModule({
		hold = {
			durationSeconds = DurationSeconds,
			onComplete = OnComplete,
			onStep = OnStep
		}
	})
end