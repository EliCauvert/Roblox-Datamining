local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local reactModule = require(parent.React)
local networkingSquadsModule = require(squadsCore.Http.NetworkingSquads)
local networkStatus = require(squadsCore.Http.RoduxNetworking).Enum.NetworkStatus
local squadStateModule = require(squadsCore.Enums.SquadState)
local useCurrentSquadIdModule = require(squadsCore.Hooks.useCurrentSquadId)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: useCurrentSquadIdModule (ref), reactModule (ref), networkingSquadsModule (ref), useSelector (ref), squadStateModule (ref), networkStatus (ref)
	local var1 = useCurrentSquadIdModule() or ""
	local var2 = useSelector(reactModule.useCallback(function(p1)
		-- upvalues: networkingSquadsModule (copy)
		return networkingSquadsModule.JoinSquad.getStatus(p1, {})
	end, {}))
	local var3 = useSelector(reactModule.useCallback(function(p1)
		-- upvalues: networkingSquadsModule (copy)
		return networkingSquadsModule.CreateOrJoinSquad.getStatus(p1, {})
	end, {}))
	local idle = squadStateModule.Idle
	
	if var1 ~= "" then
		idle = squadStateModule.Active
		
		return idle
	elseif var2 == networkStatus.Fetching or var3 == networkStatus.Fetching then
		idle = squadStateModule.Initializing
	end
	return idle
end