local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local React = require(Squads.dependencies).React
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy

return function(p1) --[[ Line: 16 ]]
	-- upvalues: React (copy), SquadExternalContractContext (copy), UseAppPolicyFunction (copy)
	local UseParentChannelHasSquadAccessResult = React.useContext(SquadExternalContractContext).useParentChannelHasSquadAccess(p1.parentChannelId)
	
	return if UseAppPolicyFunction(function(p2) --[[ Line: 20 ]]
		return p2.getCanAccessParty()
	end) and UseParentChannelHasSquadAccessResult then p1.children else nil
end