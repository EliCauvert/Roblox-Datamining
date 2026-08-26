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

return function(p1)
	-- upvalues: getOverlayStoreModule (ref), signalsReactModule (ref), fFlagSupportViewingUserProfileOnOSAModule (ref), reactModule (ref), t (ref), cryoModule (ref), fFlagAppChatShowOSAOnPageEntry (ref), providerContainer (ref)
	local union
	local var1 = getOverlayStoreModule(false)
	local var2 = signalsReactModule.useSignalState(var1.getCurrentOverlay)
	local var3 = if fFlagSupportViewingUserProfileOnOSAModule then signalsReactModule.useSignalState(var1.getOverlayDefaultProps) else nil
	local var4 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		var1.dismissOverlay()
	end, {})
	local overlayType = var2 and var2.overlayType
	local var5 = overlayType and t[overlayType]
	
	if not var5 then
		return nil
	elseif fFlagSupportViewingUserProfileOnOSAModule then
		union = cryoModule.Dictionary.union
		union = union(var3 or {}, var2.overlayProps or {})
	else
		union = table.clone
		union = union(var2.overlayProps or {})
	end
	if fFlagAppChatShowOSAOnPageEntry then
		local onClose = union.onClose
		
		function union.onClose()
			-- upvalues: onClose (ref), var4 (ref)
			if onClose then
				onClose()
			end
			var4()
		end
	else
		union.onClose = var4
	end
	union.hasBackdrop = true
	union.disablePortal = false
	local var6 = reactModule.createElement(var5, union)
	
	return if p1.providers and #p1.providers > 0 then reactModule.createElement(providerContainer, { providers = p1.providers }, { Overlay = var6 }) else var6
end