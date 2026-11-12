local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local ReactModule = require(Parent1.React)
local AdLabel = require(Parent1.AdLabel).AdLabel
local EnhancedVideoStoreModule = require(Parent.Parent.EnhancedVideoStore)
local UseSignalStateFunction = require(Parent1.SignalsReact).useSignalState

return ReactModule.memo(function(p1)
	-- upvalues: EnhancedVideoStoreModule (copy), UseSignalStateFunction (copy), ReactModule (copy), AdLabel (copy)
	local EnhancedVideoStoreModuleResult = EnhancedVideoStoreModule(false)
	
	return ReactModule.createElement(AdLabel, {
		sendPauseEvent = p1.sendPauseEvent,
		adDisclosureText = UseSignalStateFunction(EnhancedVideoStoreModuleResult.getAdDisclosureText),
		showAdPreferencesUrl = UseSignalStateFunction(EnhancedVideoStoreModuleResult.getShowAdPreferencesUrl)
	})
end)