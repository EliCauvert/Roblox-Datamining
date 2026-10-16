local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local ReactModule = require(Parent.React)
local NetworkingSquadsModule = require(SquadsCore.Http.NetworkingSquads)
local NetworkStatus = require(SquadsCore.Http.RoduxNetworking).Enum.NetworkStatus
local SquadStateModule = require(SquadsCore.Enums.SquadState)
local UseCurrentSquadIdModule = require(SquadsCore.Hooks.useCurrentSquadId)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function() --[[ Line: 13 ]]
	-- upvalues: UseCurrentSquadIdModule (copy), ReactModule (copy), NetworkingSquadsModule (copy), UseSelectorFunction (copy), SquadStateModule (copy), NetworkStatus (copy)
	local UseCurrentSquadIdModuleResult = UseCurrentSquadIdModule() or ""
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p1) --[[ Line: 16 ]]
		-- upvalues: NetworkingSquadsModule (upval)
		return NetworkingSquadsModule.JoinSquad.getStatus(p1, {})
	end, {})))
	local UseSelectorResult1 = UseSelectorFunction((ReactModule.useCallback(function(p1) --[[ Line: 21 ]]
		-- upvalues: NetworkingSquadsModule (upval)
		return NetworkingSquadsModule.CreateOrJoinSquad.getStatus(p1, {})
	end, {})))
	local Idle = SquadStateModule.Idle
	
	if UseCurrentSquadIdModuleResult ~= "" then
		Idle = SquadStateModule.Active
		
		return Idle
	end
	if UseSelectorResult == NetworkStatus.Fetching or UseSelectorResult1 == NetworkStatus.Fetching then
		Idle = SquadStateModule.Initializing
	end
	return Idle
end