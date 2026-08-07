local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local react = require(squads.dependencies).React
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy

return function(p0) --[[ line: 16 ]]
	-- upvalues: react (ref), squadExternalContractContext (ref), useAppPolicy (ref)
	return if useAppPolicy(function(p1) --[[ line: 20 ]]
		return p1.getCanAccessParty()
	end) and react.useContext(squadExternalContractContext).useParentChannelHasSquadAccess(p0.parentChannelId) then p0.children else nil
end