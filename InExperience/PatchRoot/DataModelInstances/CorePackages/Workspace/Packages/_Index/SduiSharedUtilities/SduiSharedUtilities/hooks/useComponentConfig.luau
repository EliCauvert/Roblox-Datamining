local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.SduiCoreSystem)
local getSduiApiStoreModule = require(sduiSharedUtilities.getSduiApiStore)

return function(p1, p2)
	-- upvalues: reactModule (ref), getSduiApiStoreModule (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useCallback(function(p3)
		-- upvalues: p2 (ref), p1 (ref), getSduiApiStoreModule (copy)
		return getSduiApiStoreModule().getRootConfig(p1, p3, if p2 then `{p1}_{p2}` else nil)
	end, { p1, p2 }))
end