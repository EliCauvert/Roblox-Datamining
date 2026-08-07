local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getSduiApiStoreModule = require(sduiSharedUtilities.getSduiApiStore)

return function(p0, p1, p2) --[[ line: 14 | named "useEntrySurfacing" ]]
	-- upvalues: reactModule (ref), getSduiApiStoreModule (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useCallback(function(p3) --[[ line: 15 ]]
		-- upvalues: p1 (ref), p0 (ref), getSduiApiStoreModule (copy), p2 (ref)
		local entrySurfacing = getSduiApiStoreModule().getEntrySurfacing(p0, if p1 then `{p0}_{p1}` else nil, p3)
		
		return entrySurfacing and entrySurfacing[p2]
	end, { p0, p1, p2 }))
end