local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useEventConnection = require(parent.ReactUtils).useEventConnection
local sendAXCounterV2 = require(parent.AvatarExperienceAnalytics).sendAXCounterV2
local respawnChoiceDialogModule = require(avatarSwitcher.Components.Modals.RespawnChoiceDialog)
local respawnLaterDialogModule = require(avatarSwitcher.Components.Modals.RespawnLaterDialog)
local getAvatarSwitcherStoreModule = require(avatarSwitcher.Stores.getAvatarSwitcherStore)
local respawnAvatarModule = require(avatarSwitcher.Utils.respawnAvatar)
local constantsModule = require(avatarSwitcher.Constants)
local fFlagAvatarSwitcherCounters = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherCounters

return function(p0)
	-- upvalues: signalsReactModule (ref), getAvatarSwitcherStoreModule (ref), reactModule (ref), useEventConnection (ref), fFlagAvatarSwitcherCounters (ref), sendAXCounterV2 (ref), constantsModule (ref), respawnAvatarModule (ref), respawnChoiceDialogModule (ref), respawnLaterDialogModule (ref)
	local var8 = signalsReactModule.useSignalState(getAvatarSwitcherStoreModule)
	local var9 = signalsReactModule.useSignalState(var8.getRespawnPromptShown)
	local var10, var11 = reactModule.useState(function()
		-- upvalues: p0 (ref)
		local respawnBehaviour, _ = p0.getRespawnBehaviour()
		
		return respawnBehaviour
	end)
	useEventConnection(p0.respawnBehaviorChangedEvent.Event, var11, {})
	local var12 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), p0 (ref), fFlagAvatarSwitcherCounters (copy), sendAXCounterV2 (copy), constantsModule (copy), respawnAvatarModule (copy)
		var8.toggleRespawnPrompt(false)
		p0.toggleWindow()
		
		if fFlagAvatarSwitcherCounters then
			sendAXCounterV2(constantsModule.Counters.ConfirmRespawn)
		end
		var8.switchAvatar()
		respawnAvatarModule(p0.getRespawnBehaviour)
	end, { p0.getRespawnBehaviour, p0.toggleWindow })
	local var13 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), p0 (ref), fFlagAvatarSwitcherCounters (copy), sendAXCounterV2 (copy), constantsModule (copy), var10 (ref)
		var8.toggleRespawnPrompt(false)
		p0.toggleWindow()
		
		if fFlagAvatarSwitcherCounters then
			sendAXCounterV2(constantsModule.Counters.DeferRespawn, { respawnEnabled = tostring(var10) })
		end
		var8.switchAvatar()
	end, { p0.toggleWindow })
	local var14 = reactModule.useCallback(function()
		-- upvalues: fFlagAvatarSwitcherCounters (copy), sendAXCounterV2 (copy), constantsModule (copy), var8 (ref)
		if fFlagAvatarSwitcherCounters then
			sendAXCounterV2(constantsModule.Counters.CancelSwitchAvatar)
		end
		var8.toggleRespawnPrompt(false)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		RespawnChoiceDialog = var9 and (var10 and reactModule.createElement(respawnChoiceDialogModule, { onConfirm = var12, onDefer = var13, onClose = var14 })),
		RespawnLaterDialog = var9 and (not var10 and reactModule.createElement(respawnLaterDialogModule, { onDefer = var13, onClose = var14 }))
	})
end