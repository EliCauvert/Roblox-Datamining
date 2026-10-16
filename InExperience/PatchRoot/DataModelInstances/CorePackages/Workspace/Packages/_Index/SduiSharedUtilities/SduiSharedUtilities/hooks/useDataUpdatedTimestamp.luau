local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetSduiApiStoreModule = require(SduiSharedUtilities.getSduiApiStore)

return function(p1, p2) --[[ Line: 7 | Named "useDataUpdatedTimestamp" ]]
	-- upvalues: ReactModule (copy), GetSduiApiStoreModule (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalState((ReactModule.useCallback(function(p3) --[[ Line: 8 ]]
		-- upvalues: p2 (copy), p1 (copy), GetSduiApiStoreModule (upval)
		return GetSduiApiStoreModule().getDataUpdatedTimestamp(p1, p3, if p2 then `{p1}_{p2}` else nil)
	end, { p1, p2 })))
end