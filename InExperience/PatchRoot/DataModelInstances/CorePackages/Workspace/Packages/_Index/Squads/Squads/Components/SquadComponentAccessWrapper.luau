local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local react = require(squads.dependencies).React
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy

return function(p1)
	-- upvalues: react (ref), squadExternalContractContext (ref), useAppPolicy (ref)
	return if useAppPolicy(function(p2)
		return p2.getCanAccessParty()
	end) and react.useContext(squadExternalContractContext).useParentChannelHasSquadAccess(p1.parentChannelId) then p1.children else nil
end