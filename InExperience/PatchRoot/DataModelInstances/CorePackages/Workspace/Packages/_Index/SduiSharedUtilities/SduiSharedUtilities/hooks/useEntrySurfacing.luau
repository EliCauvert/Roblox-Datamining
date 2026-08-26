local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getSduiApiStoreModule = require(sduiSharedUtilities.getSduiApiStore)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), getSduiApiStoreModule (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useCallback(function(p4)
		-- upvalues: p2 (ref), p1 (ref), getSduiApiStoreModule (copy), p3 (ref)
		local entrySurfacing = getSduiApiStoreModule().getEntrySurfacing(p1, if p2 then `{p1}_{p2}` else nil, p4)
		
		return entrySurfacing and entrySurfacing[p3]
	end, { p1, p2, p3 }))
end