local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local SwipeableToastViewModule = require(script.Parent.SwipeableToastView)
local UseSwipeableToastViewModelModule = require(script.Parent.useSwipeableToastViewModel)

return function(p1)
	-- upvalues: UseSwipeableToastViewModelModule (copy), ReactModule (copy), SwipeableToastViewModule (copy)
	return ReactModule.createElement(SwipeableToastViewModule, (UseSwipeableToastViewModelModule(p1)))
end