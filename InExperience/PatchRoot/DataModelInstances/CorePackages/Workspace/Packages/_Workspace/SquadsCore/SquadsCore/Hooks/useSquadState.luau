local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local reactModule = require(parent.React)
local networkingSquadsModule = require(squadsCore.Http.NetworkingSquads)
local networkStatus = require(squadsCore.Http.RoduxNetworking).Enum.NetworkStatus
local squadStateModule = require(squadsCore.Enums.SquadState)
local useCurrentSquadIdModule = require(squadsCore.Hooks.useCurrentSquadId)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

return function() --[[ line: 13 ]]
	-- upvalues: useCurrentSquadIdModule (ref), reactModule (ref), networkingSquadsModule (ref), useSelector (ref), squadStateModule (ref), networkStatus (ref)
	local var5 = useCurrentSquadIdModule() or ""
	local var6 = useSelector(reactModule.useCallback(function(p0) --[[ line: 16 ]]
		-- upvalues: networkingSquadsModule (copy)
		return networkingSquadsModule.JoinSquad.getStatus(p0, {})
	end, {}))
	local var7 = useSelector(reactModule.useCallback(function(p1) --[[ line: 21 ]]
		-- upvalues: networkingSquadsModule (copy)
		return networkingSquadsModule.CreateOrJoinSquad.getStatus(p1, {})
	end, {}))
	local idle = squadStateModule.Idle
	
	if var5 ~= "" then
		idle = squadStateModule.Active
		
		return idle
	elseif var6 == networkStatus.Fetching or var7 == networkStatus.Fetching then
		idle = squadStateModule.Initializing
	end
	return idle
end