local Parent = script:FindFirstAncestor("AppChat").Parent
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagEnableArgus = require(Parent.SharedFlags).FFlagEnableArgus
local GetMomentsCapabilitiesModule = require(Parent.MomentsCommon.GetMomentsCapabilities)

return function()
	-- upvalues: SignalsReactModule (copy), GetMomentsCapabilitiesModule (copy), FFlagEnableArgus (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetMomentsCapabilitiesModule(false).getHasMomentsAccess)
	
	return FFlagEnableArgus and UseSignalStateResult
end