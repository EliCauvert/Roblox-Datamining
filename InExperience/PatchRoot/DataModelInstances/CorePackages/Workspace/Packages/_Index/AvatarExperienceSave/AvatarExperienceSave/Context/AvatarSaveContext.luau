local AvatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local Parent = AvatarExperienceSave.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SaveStatusEnumModule = require(AvatarExperienceSave.Enums.SaveStatusEnum)

return if game:DefineFastFlag("FFlagAXFixAvatarSaveContext", false) then ReactModule.createContext({
	getHistorySignal = SignalsModule.createSignal({}),
	getCurrentHistoryIndexSignal = SignalsModule.createSignal(0),
	updateHistoryIndexAndGetCharacterData = function(_) --[[ Line: 42 ]]
		return nil
	end,
	getLastSuccessfullySavedStateSignal = SignalsModule.createSignal({}),
	getSaveEligibilityStatusSignal = SignalsModule.createSignal(SaveStatusEnumModule.AlreadySaved),
	autoSaveNextNewSaveData = function() --[[ Line: 47 ]]
		return nil
	end,
	trySaveAvatar = function() --[[ Line: 50 ]]
		return nil
	end
}) else ReactModule.createContext(nil)