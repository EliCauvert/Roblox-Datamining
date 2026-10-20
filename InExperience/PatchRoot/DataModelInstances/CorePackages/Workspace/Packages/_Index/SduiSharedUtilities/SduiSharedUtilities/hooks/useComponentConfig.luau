local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.SduiCoreSystem)
local GetSduiApiStoreModule = require(SduiSharedUtilities.getSduiApiStore)

return function(p1, p2)
	-- upvalues: ReactModule (copy), GetSduiApiStoreModule (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalState((ReactModule.useCallback(function(p3)
		-- upvalues: p2 (copy), p1 (copy), GetSduiApiStoreModule (upval)
		return GetSduiApiStoreModule().getRootConfig(p1, p3, if p2 then `{p1}_{p2}` else nil)
	end, { p1, p2 })))
end