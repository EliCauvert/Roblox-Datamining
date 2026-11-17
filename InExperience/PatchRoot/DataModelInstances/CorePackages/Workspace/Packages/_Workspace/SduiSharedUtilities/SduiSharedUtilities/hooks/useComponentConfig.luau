local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local GetSduiApiStoreModule = require(SduiSharedUtilities.getSduiApiStore)
local FFlagSduiSignalStateNoStaleRead = require(Parent.SharedFlags).FFlagSduiSignalStateNoStaleRead

return function(p1, p2)
	-- upvalues: ReactModule (copy), GetSduiApiStoreModule (copy), FFlagSduiSignalStateNoStaleRead (copy), SduiCoreSystemModule (copy), SignalsReactModule (copy)
	local UseResult = ReactModule.useCallback(function(p3)
		-- upvalues: p2 (copy), p1 (copy), GetSduiApiStoreModule (upval)
		return GetSduiApiStoreModule().getRootConfig(p1, p3, if p2 then `{p1}_{p2}` else nil)
	end, { p1, p2 })
	
	return if FFlagSduiSignalStateNoStaleRead then SduiCoreSystemModule.useCurrentSignalState(UseResult) else SignalsReactModule.useSignalState(UseResult)
end