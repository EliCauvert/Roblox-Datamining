local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local Parent = AvatarSwitcher.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local SendAXCounterV2Function = require(Parent.AvatarExperienceAnalytics).sendAXCounterV2
local RespawnChoiceDialogModule = require(AvatarSwitcher.Components.Modals.RespawnChoiceDialog)
local RespawnLaterDialogModule = require(AvatarSwitcher.Components.Modals.RespawnLaterDialog)
local GetAvatarSwitcherStoreModule = require(AvatarSwitcher.Stores.getAvatarSwitcherStore)
local RespawnAvatarModule = require(AvatarSwitcher.Utils.respawnAvatar)
local ConstantsModule = require(AvatarSwitcher.Constants)
local FFlagAvatarSwitcherCounters = require(Parent.AvatarExperienceFlags).FFlagAvatarSwitcherCounters

return function(p1)
	-- upvalues: SignalsReactModule (copy), GetAvatarSwitcherStoreModule (copy), ReactModule (copy), UseEventConnectionFunction (copy), FFlagAvatarSwitcherCounters (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), RespawnAvatarModule (copy), RespawnChoiceDialogModule (copy), RespawnLaterDialogModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetAvatarSwitcherStoreModule)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseSignalStateResult.getRespawnPromptShown)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: p1 (copy)
		local RespawnBehaviour, _ = p1.getRespawnBehaviour()
		
		return RespawnBehaviour
	end)
	UseEventConnectionFunction(p1.respawnBehaviorChangedEvent.Event, UseStateResult2, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseSignalStateResult (copy), p1 (copy), FFlagAvatarSwitcherCounters (upval), SendAXCounterV2Function (upval), ConstantsModule (upval), RespawnAvatarModule (upval)
		UseSignalStateResult.toggleRespawnPrompt(false)
		p1.toggleWindow()
		
		if FFlagAvatarSwitcherCounters then
			SendAXCounterV2Function(ConstantsModule.Counters.ConfirmRespawn)
		end
		UseSignalStateResult.switchAvatar()
		RespawnAvatarModule(p1.getRespawnBehaviour)
	end, { p1.getRespawnBehaviour, p1.toggleWindow })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseSignalStateResult (copy), p1 (copy), FFlagAvatarSwitcherCounters (upval), SendAXCounterV2Function (upval), ConstantsModule (upval), UseStateResult (copy)
		UseSignalStateResult.toggleRespawnPrompt(false)
		p1.toggleWindow()
		
		if FFlagAvatarSwitcherCounters then
			SendAXCounterV2Function(ConstantsModule.Counters.DeferRespawn, { respawnEnabled = tostring(UseStateResult) })
		end
		UseSignalStateResult.switchAvatar()
	end, { p1.toggleWindow })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: FFlagAvatarSwitcherCounters (upval), SendAXCounterV2Function (upval), ConstantsModule (upval), UseSignalStateResult (copy)
		if FFlagAvatarSwitcherCounters then
			SendAXCounterV2Function(ConstantsModule.Counters.CancelSwitchAvatar)
		end
		UseSignalStateResult.toggleRespawnPrompt(false)
	end, {})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		RespawnChoiceDialog = UseSignalStateResult1 and (UseStateResult and ReactModule.createElement(RespawnChoiceDialogModule, {
			onConfirm = UseResult,
			onDefer = UseResult1,
			onClose = UseResult2
		})),
		RespawnLaterDialog = UseSignalStateResult1 and (not UseStateResult and ReactModule.createElement(RespawnLaterDialogModule, { onDefer = UseResult1, onClose = UseResult2 }))
	})
end