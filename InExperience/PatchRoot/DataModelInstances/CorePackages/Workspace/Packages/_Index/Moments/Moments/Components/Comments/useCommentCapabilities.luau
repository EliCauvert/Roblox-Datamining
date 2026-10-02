local parent = script:FindFirstAncestor("Moments").Parent
local momentsCommonModule = require(parent.MomentsCommon)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local getMomentsCapabilities = momentsCommonModule.Stores.GetMomentsCapabilities
local frozen = table.freeze({ canRead = true, canWrite = true, canReact = true })

return if sharedFlagsModule.FFlagMomentsComments or sharedFlagsModule.FFlagMomentsCommentsIxpEnabled then function()
	-- upvalues: getMomentsCapabilities (ref), signalsReactModule (ref)
	local var1 = getMomentsCapabilities(false)
	
	return {
		canRead = signalsReactModule.useSignalState(var1.getCanReadComments),
		canWrite = signalsReactModule.useSignalState(var1.getCanWriteComments),
		canReact = signalsReactModule.useSignalState(var1.getCanReactToComments)
	}
end else function()
	-- upvalues: frozen (ref)
	return frozen
end