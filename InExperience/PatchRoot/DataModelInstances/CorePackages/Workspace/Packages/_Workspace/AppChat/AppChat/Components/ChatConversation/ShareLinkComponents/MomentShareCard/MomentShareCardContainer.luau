local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local MomentShareCardViewModule = require(script.Parent.MomentShareCardView)
local UseMomentShareCardViewModelModule = require(script.Parent.useMomentShareCardViewModel)

return function(p1)
	-- upvalues: UseMomentShareCardViewModelModule (copy), ReactModule (copy), MomentShareCardViewModule (copy)
	return ReactModule.createElement(MomentShareCardViewModule, (UseMomentShareCardViewModelModule(p1)))
end