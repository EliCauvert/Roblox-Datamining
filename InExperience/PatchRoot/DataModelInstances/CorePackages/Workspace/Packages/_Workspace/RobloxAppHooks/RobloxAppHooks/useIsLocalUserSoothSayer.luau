local Parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FFlagUseSignalsForIsLocalUserSoothsayer = require(Parent.SharedFlags).FFlagUseSignalsForIsLocalUserSoothsayer
local GetIsLocalUserSoothsayerStore = if FFlagUseSignalsForIsLocalUserSoothsayer then require(Parent.IsLocalUserSoothsayerStore).GetIsLocalUserSoothsayerStore else nil

return function() --[[ Line: 11 ]]
	-- upvalues: FFlagUseSignalsForIsLocalUserSoothsayer (copy), UseSignalStateFunction (copy), GetIsLocalUserSoothsayerStore (copy), UseSelectorFunction (copy)
	return if FFlagUseSignalsForIsLocalUserSoothsayer then UseSignalStateFunction(GetIsLocalUserSoothsayerStore(false).getIsLocalUserSoothsayer) else UseSelectorFunction(function(p1) --[[ Line: 15 ]]
		return p1.IsLocalUserSoothsayer
	end)
end