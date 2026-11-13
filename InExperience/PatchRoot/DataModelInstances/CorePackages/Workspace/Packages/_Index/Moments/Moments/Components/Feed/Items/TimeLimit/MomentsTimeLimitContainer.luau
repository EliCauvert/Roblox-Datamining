local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local MomentsTimeLimitViewModule = require(script.Parent.MomentsTimeLimitView)
local UseMomentsTimeLimitViewModelModule = require(script.Parent.useMomentsTimeLimitViewModel)

return function()
	-- upvalues: UseMomentsTimeLimitViewModelModule (copy), ReactModule (copy), MomentsTimeLimitViewModule (copy)
	return ReactModule.createElement(MomentsTimeLimitViewModule, (UseMomentsTimeLimitViewModelModule()))
end