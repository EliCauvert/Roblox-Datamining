local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local momentShareCardViewModule = require(script.Parent.MomentShareCardView)
local useMomentShareCardViewModelModule = require(script.Parent.useMomentShareCardViewModel)

return function(p0)
	-- upvalues: useMomentShareCardViewModelModule (ref), reactModule (ref), momentShareCardViewModule (ref)
	return reactModule.createElement(momentShareCardViewModule, useMomentShareCardViewModelModule(p0))
end