local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local ExternalNavigationHandlerModule = require(script.Parent.ExternalNavigationHandler)
local MapStateToPropsModule = require(script.Parent.mapStateToProps)
local MapDispatchToPropsModule = require(script.Parent.mapDispatchToProps)
local FFlagAppChatUseSignalsForExternalNavigationRequestModule = require(AppChat.Flags.FFlagAppChatUseSignalsForExternalNavigationRequest)
local UseSignalState = if FFlagAppChatUseSignalsForExternalNavigationRequestModule then require(Parent.SignalsReact).useSignalState else nil
local GetExternalNavigationRequestStoreModule = if FFlagAppChatUseSignalsForExternalNavigationRequestModule then require(AppChat.Stores.GetExternalNavigationRequestStore) else nil
local MemoResult = ReactModule.memo(function(p1)
	-- upvalues: GetExternalNavigationRequestStoreModule (copy), UseSignalState (copy), ReactModule (copy), ExternalNavigationHandlerModule (copy), CryoModule (copy)
	local ExternalNavigationRequestStoreModule = GetExternalNavigationRequestStoreModule(false)
	
	return ReactModule.createElement(ExternalNavigationHandlerModule, CryoModule.Dictionary.join(p1, UseSignalState(ExternalNavigationRequestStoreModule.getRequest), {
		completeExternalNavigation = ExternalNavigationRequestStoreModule.completeExternalNavigation
	}))
end)

return if FFlagAppChatUseSignalsForExternalNavigationRequestModule then MemoResult else RoactRoduxModule.connect(MapStateToPropsModule, MapDispatchToPropsModule)(ExternalNavigationHandlerModule)