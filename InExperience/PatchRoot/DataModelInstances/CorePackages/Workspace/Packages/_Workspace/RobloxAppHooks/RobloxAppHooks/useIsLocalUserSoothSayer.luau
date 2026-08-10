local parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useSignalState = require(parent.SignalsReact).useSignalState
local fFlagUseSignalsForIsLocalUserSoothsayer = require(parent.SharedFlags).FFlagUseSignalsForIsLocalUserSoothsayer
local var0 = if fFlagUseSignalsForIsLocalUserSoothsayer then require(parent.IsLocalUserSoothsayerStore).GetIsLocalUserSoothsayerStore else nil

return function() --[[ line: 11 ]]
	-- upvalues: fFlagUseSignalsForIsLocalUserSoothsayer (ref), useSignalState (ref), var0 (ref), useSelector (ref)
	return if fFlagUseSignalsForIsLocalUserSoothsayer then useSignalState(var0(false).getIsLocalUserSoothsayer) else useSelector(function(p0) --[[ line: 15 ]]
		return p0.IsLocalUserSoothsayer
	end)
end