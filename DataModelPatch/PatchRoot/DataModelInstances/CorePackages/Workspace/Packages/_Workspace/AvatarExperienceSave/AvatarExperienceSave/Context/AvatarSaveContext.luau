local AvatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local Parent = AvatarExperienceSave.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SaveStatusEnumModule = require(AvatarExperienceSave.Enums.SaveStatusEnum)

return if game:DefineFastFlag("FFlagAXFixAvatarSaveContext", false) then ReactModule.createContext({
	getHistorySignal = SignalsModule.createSignal({}),
	getCurrentHistoryIndexSignal = SignalsModule.createSignal(0),
	updateHistoryIndexAndGetCharacterData = function(_)
		return nil
	end,
	getLastSuccessfullySavedStateSignal = SignalsModule.createSignal({}),
	getSaveEligibilityStatusSignal = SignalsModule.createSignal(SaveStatusEnumModule.AlreadySaved),
	autoSaveNextNewSaveData = function()
		return nil
	end,
	trySaveAvatar = function()
		return nil
	end
}) else ReactModule.createContext(nil)