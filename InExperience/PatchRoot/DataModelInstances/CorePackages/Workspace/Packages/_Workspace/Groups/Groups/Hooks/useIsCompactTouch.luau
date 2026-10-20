local Groups = script:FindFirstAncestor("Groups")
local SignalsReactModule = require(Groups.Parent.SignalsReact)
local CommunityListRoutingModule = require(Groups.CommunityListRouting)

return function()
	-- upvalues: SignalsReactModule (copy), CommunityListRoutingModule (copy)
	return SignalsReactModule.useSignalState(CommunityListRoutingModule.getIsCompactTouch)
end