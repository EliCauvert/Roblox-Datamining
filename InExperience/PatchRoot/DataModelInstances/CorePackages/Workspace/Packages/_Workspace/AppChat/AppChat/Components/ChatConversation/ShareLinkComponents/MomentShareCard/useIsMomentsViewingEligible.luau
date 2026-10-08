local parent = script:FindFirstAncestor("AppChat").Parent
local signalsReactModule = require(parent.SignalsReact)
local fFlagEnableArgus = require(parent.SharedFlags).FFlagEnableArgus
local getMomentsCapabilitiesModule = require(parent.MomentsCommon.GetMomentsCapabilities)

return function()
	-- upvalues: signalsReactModule (ref), getMomentsCapabilitiesModule (ref), fFlagEnableArgus (ref)
	return fFlagEnableArgus and signalsReactModule.useSignalState(getMomentsCapabilitiesModule(false).getHasMomentsAccess)
end