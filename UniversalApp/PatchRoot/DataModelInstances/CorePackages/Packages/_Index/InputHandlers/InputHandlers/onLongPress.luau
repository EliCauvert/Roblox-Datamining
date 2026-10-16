local _ = require(script.Parent.Parent.FocusNavigation)
local HandleInputModule = require(script.Parent.handleInput)

return function(DurationSeconds, OnComplete, OnStep) --[[ Line: 7 | Named "onLongPress" ]]
	-- upvalues: HandleInputModule (copy)
	return HandleInputModule({
		hold = {
			durationSeconds = DurationSeconds,
			onComplete = OnComplete,
			onStep = OnStep
		}
	})
end