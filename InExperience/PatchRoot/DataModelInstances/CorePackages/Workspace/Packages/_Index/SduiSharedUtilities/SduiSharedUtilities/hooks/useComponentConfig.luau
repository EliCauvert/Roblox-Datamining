local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.SduiCoreSystem)
local getSduiApiStoreModule = require(sduiSharedUtilities.getSduiApiStore)

return function(p0, p1) --[[ line: 10 | named "useComponentConfig" ]]
	-- upvalues: reactModule (ref), getSduiApiStoreModule (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useCallback(function(p2) --[[ line: 12 ]]
		-- upvalues: p1 (ref), p0 (ref), getSduiApiStoreModule (copy)
		return getSduiApiStoreModule().getRootConfig(p0, p2, if p1 then `{p0}_{p1}` else nil)
	end, { p0, p1 }))
end