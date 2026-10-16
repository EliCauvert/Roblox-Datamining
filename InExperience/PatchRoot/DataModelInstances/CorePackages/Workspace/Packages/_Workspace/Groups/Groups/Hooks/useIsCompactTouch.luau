local Groups = script:FindFirstAncestor("Groups")
local SignalsReactModule = require(Groups.Parent.SignalsReact)
local CommunityListRoutingModule = require(Groups.CommunityListRouting)

return function() --[[ Line: 7 | Named "useIsCompactTouch" ]]
	-- upvalues: SignalsReactModule (copy), CommunityListRoutingModule (copy)
	return SignalsReactModule.useSignalState(CommunityListRoutingModule.getIsCompactTouch)
end