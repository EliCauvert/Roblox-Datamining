local groups = script:FindFirstAncestor("Groups")
local signalsReactModule = require(groups.Parent.SignalsReact)
local communityListRoutingModule = require(groups.CommunityListRouting)

return function()
	-- upvalues: signalsReactModule (ref), communityListRoutingModule (ref)
	return signalsReactModule.useSignalState(communityListRoutingModule.getIsCompactTouch)
end