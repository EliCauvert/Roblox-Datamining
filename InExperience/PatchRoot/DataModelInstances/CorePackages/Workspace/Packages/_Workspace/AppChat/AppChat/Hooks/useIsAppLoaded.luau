local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)
local GetAppLoadedStoreModule = require(AppChat.Stores.GetAppLoadedStore)
local FFlagAppChatUseSignalsForAppLoadedModule = require(AppChat.Flags.FFlagAppChatUseSignalsForAppLoaded)

return function()
	-- upvalues: FFlagAppChatUseSignalsForAppLoadedModule (copy), UseSignalStateFunction (copy), GetAppLoadedStoreModule (copy), UseSelectorFunction (copy), GetDeepValueModule (copy)
	return if FFlagAppChatUseSignalsForAppLoadedModule then UseSignalStateFunction(GetAppLoadedStoreModule(false).getAppLoaded) else UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueModule (upval)
		return GetDeepValueModule(p1, "ChatAppReducer.AppLoaded") or false
	end)
end