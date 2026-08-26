local parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useSignalState = require(parent.SignalsReact).useSignalState
local fFlagUseSignalsForIsLocalUserSoothsayer = require(parent.SharedFlags).FFlagUseSignalsForIsLocalUserSoothsayer
local var1 = if fFlagUseSignalsForIsLocalUserSoothsayer then require(parent.IsLocalUserSoothsayerStore).GetIsLocalUserSoothsayerStore else nil

return function()
	-- upvalues: fFlagUseSignalsForIsLocalUserSoothsayer (ref), useSignalState (ref), var1 (ref), useSelector (ref)
	return if fFlagUseSignalsForIsLocalUserSoothsayer then useSignalState(var1(false).getIsLocalUserSoothsayer) else useSelector(function(p1)
		return p1.IsLocalUserSoothsayer
	end)
end