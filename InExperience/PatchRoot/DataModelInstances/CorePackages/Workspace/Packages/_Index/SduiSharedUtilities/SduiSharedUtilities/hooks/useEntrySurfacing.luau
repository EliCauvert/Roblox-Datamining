local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetSduiApiStoreModule = require(SduiSharedUtilities.getSduiApiStore)

return function(p1, p2, p3) --[[ Line: 14 | Named "useEntrySurfacing" ]]
	-- upvalues: ReactModule (copy), GetSduiApiStoreModule (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalState((ReactModule.useCallback(function(p4) --[[ Line: 15 ]]
		-- upvalues: p2 (copy), p1 (copy), GetSduiApiStoreModule (upval), p3 (copy)
		local EntrySurfacing = GetSduiApiStoreModule().getEntrySurfacing(p1, if p2 then `{p1}_{p2}` else nil, p4)
		
		return EntrySurfacing and EntrySurfacing[p3]
	end, { p1, p2, p3 })))
end