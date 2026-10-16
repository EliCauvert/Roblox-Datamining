local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local ProviderContainer = require(Parent.RoactUtils).Components.ProviderContainer
local GetOverlayStoreModule = require(AppChat.Stores.GetOverlayStore)
local FFlagSupportViewingUserProfileOnOSAModule = require(AppChat.Flags.FFlagSupportViewingUserProfileOnOSA)
local FFlagAppChatShowOSAOnPageEntry = require(Parent.SharedFlags).FFlagAppChatShowOSAOnPageEntry
local config = {
	GroupOSADialog = require(AppChat.Components.OSA.GroupOSADialog)
}

return function(p1) --[[ Line: 35 | Named "OverlayHost" ]]
	-- upvalues: GetOverlayStoreModule (copy), SignalsReactModule (copy), FFlagSupportViewingUserProfileOnOSAModule (copy), ReactModule (copy), config (copy), CryoModule (copy), FFlagAppChatShowOSAOnPageEntry (copy), ProviderContainer (copy)
	local OverlayStoreModule = GetOverlayStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(OverlayStoreModule.getCurrentOverlay)
	local UseSignalStateResult1 = if FFlagSupportViewingUserProfileOnOSAModule then SignalsReactModule.useSignalState(OverlayStoreModule.getOverlayDefaultProps) else nil
	local UseResult = ReactModule.useCallback(function() --[[ Line: 43 ]]
		-- upvalues: OverlayStoreModule (copy)
		OverlayStoreModule.dismissOverlay()
	end, {})
	local OverlayType = UseSignalStateResult and UseSignalStateResult.overlayType
	local Entry = OverlayType and config[OverlayType]
	
	if not Entry then
		return nil
	end
	local UnionResult = if FFlagSupportViewingUserProfileOnOSAModule then CryoModule.Dictionary.union(UseSignalStateResult1 or {}, UseSignalStateResult.overlayProps or {}) else table.clone(UseSignalStateResult.overlayProps or {})
	
	if FFlagAppChatShowOSAOnPageEntry then
		local OnCloseFunction = UnionResult.onClose
		
		function UnionResult.onClose() --[[ Line: 58 ]]
			-- upvalues: OnCloseFunction (copy), UseResult (copy)
			if OnCloseFunction then
				OnCloseFunction()
			end
			UseResult()
		end
	else
		UnionResult.onClose = UseResult
	end
	UnionResult.hasBackdrop = true
	UnionResult.disablePortal = false
	local Element = ReactModule.createElement(Entry, UnionResult)
	
	return if p1.providers and #p1.providers > 0 then ReactModule.createElement(ProviderContainer, { providers = p1.providers }, { Overlay = Element }) else Element
end