local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local providerContainer = require(parent.RoactUtils).Components.ProviderContainer
local groupOSADialogModule = require(appChat.Components.OSA.GroupOSADialog)
local getOverlayStoreModule = require(appChat.Stores.GetOverlayStore)
local fFlagSupportViewingUserProfileOnOSAModule = require(appChat.Flags.FFlagSupportViewingUserProfileOnOSA)
local fFlagAppChatShowOSAOnPageEntry = require(parent.SharedFlags).FFlagAppChatShowOSAOnPageEntry
local t = { GroupOSADialog = groupOSADialogModule }

return function(p0)
	-- upvalues: getOverlayStoreModule (ref), signalsReactModule (ref), fFlagSupportViewingUserProfileOnOSAModule (ref), reactModule (ref), t (ref), cryoModule (ref), fFlagAppChatShowOSAOnPageEntry (ref), providerContainer (ref)
	local union
	local var8 = getOverlayStoreModule(false)
	local var9 = signalsReactModule.useSignalState(var8.getCurrentOverlay)
	local var10 = if fFlagSupportViewingUserProfileOnOSAModule then signalsReactModule.useSignalState(var8.getOverlayDefaultProps) else nil
	local var11 = reactModule.useCallback(function()
		-- upvalues: var8 (ref)
		var8.dismissOverlay()
	end, {})
	local overlayType = var9 and var9.overlayType
	local var13 = overlayType and t[overlayType]
	
	if not var13 then
		return nil
	elseif fFlagSupportViewingUserProfileOnOSAModule then
		union = cryoModule.Dictionary.union
		union = union(var10 or {}, var9.overlayProps or {})
	else
		union = table.clone
		union = union(var9.overlayProps or {})
	end
	if fFlagAppChatShowOSAOnPageEntry then
		local onClose = union.onClose
		
		function union.onClose()
			-- upvalues: onClose (ref), var11 (ref)
			if onClose then
				onClose()
			end
			var11()
		end
	else
		union.onClose = var11
	end
	union.hasBackdrop = true
	union.disablePortal = false
	local var14 = reactModule.createElement(var13, union)
	
	return if p0.providers and #p0.providers > 0 then reactModule.createElement(providerContainer, { providers = p0.providers }, { Overlay = var14 }) else var14
end