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

return function(p1)
	-- upvalues: signalsReactModule (ref), getAvatarSwitcherStoreModule (ref), reactModule (ref), useEventConnection (ref), fFlagAvatarSwitcherCounters (ref), sendAXCounterV2 (ref), constantsModule (ref), respawnAvatarModule (ref), respawnChoiceDialogModule (ref), respawnLaterDialogModule (ref)
	local var1 = signalsReactModule.useSignalState(getAvatarSwitcherStoreModule)
	local var2 = signalsReactModule.useSignalState(var1.getRespawnPromptShown)
	local var3, var4 = reactModule.useState(function()
		-- upvalues: p1 (ref)
		local respawnBehaviour, _ = p1.getRespawnBehaviour()
		
		return respawnBehaviour
	end)
	useEventConnection(p1.respawnBehaviorChangedEvent.Event, var4, {})
	local var5 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), p1 (ref), fFlagAvatarSwitcherCounters (copy), sendAXCounterV2 (copy), constantsModule (copy), respawnAvatarModule (copy)
		var1.toggleRespawnPrompt(false)
		p1.toggleWindow()
		
		if fFlagAvatarSwitcherCounters then
			sendAXCounterV2(constantsModule.Counters.ConfirmRespawn)
		end
		var1.switchAvatar()
		respawnAvatarModule(p1.getRespawnBehaviour)
	end, { p1.getRespawnBehaviour, p1.toggleWindow })
	local var6 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), p1 (ref), fFlagAvatarSwitcherCounters (copy), sendAXCounterV2 (copy), constantsModule (copy), var3 (ref)
		var1.toggleRespawnPrompt(false)
		p1.toggleWindow()
		
		if fFlagAvatarSwitcherCounters then
			sendAXCounterV2(constantsModule.Counters.DeferRespawn, { respawnEnabled = tostring(var3) })
		end
		var1.switchAvatar()
	end, { p1.toggleWindow })
	local var7 = reactModule.useCallback(function()
		-- upvalues: fFlagAvatarSwitcherCounters (copy), sendAXCounterV2 (copy), constantsModule (copy), var1 (ref)
		if fFlagAvatarSwitcherCounters then
			sendAXCounterV2(constantsModule.Counters.CancelSwitchAvatar)
		end
		var1.toggleRespawnPrompt(false)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		RespawnChoiceDialog = var2 and (var3 and reactModule.createElement(respawnChoiceDialogModule, { onConfirm = var5, onDefer = var6, onClose = var7 })),
		RespawnLaterDialog = var2 and (not var3 and reactModule.createElement(respawnLaterDialogModule, { onDefer = var6, onClose = var7 }))
	})
end