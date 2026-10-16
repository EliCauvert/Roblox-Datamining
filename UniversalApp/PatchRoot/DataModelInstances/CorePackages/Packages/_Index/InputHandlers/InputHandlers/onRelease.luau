local _ = require(script.Parent.Parent.FocusNavigation)
local HandleInputModule = require(script.Parent.handleInput)

return function(OnRelease) --[[ Line: 7 | Named "onRelease" ]]
	-- upvalues: HandleInputModule (copy)
	return HandleInputModule({ onRelease = OnRelease })
end