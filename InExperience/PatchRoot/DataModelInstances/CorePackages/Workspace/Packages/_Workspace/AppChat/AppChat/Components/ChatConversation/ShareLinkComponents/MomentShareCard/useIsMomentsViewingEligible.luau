local parent = script:FindFirstAncestor("AppChat").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getAppPolicyStore = require(parent.UniversalAppPolicy).GetAppPolicyStore
local fFlagEnableArgus = sharedFlagsModule.FFlagEnableArgus
local fFlagGuacMomentsFeatureList = sharedFlagsModule.FFlagGuacMomentsFeatureList
local var1 = if fFlagGuacMomentsFeatureList then require(parent.MomentsCommon.GetMomentsCapabilities) else nil
local var2 = if fFlagGuacMomentsFeatureList then nil else signalsModule.createComputed(function(p1)
	-- upvalues: getAppPolicyStore (ref)
	return getAppPolicyStore(false).getAppPolicy(p1).getDisplayMomentsMoreTabTile()
end)

return function()
	-- upvalues: signalsReactModule (ref), fFlagGuacMomentsFeatureList (ref), var1 (ref), var2 (ref), fFlagEnableArgus (ref)
	return fFlagEnableArgus and signalsReactModule.useSignalState(if fFlagGuacMomentsFeatureList then var1(false).getHasMomentsAccess else var2)
end