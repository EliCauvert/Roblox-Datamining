local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local parent = avatarExperienceSave.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)

return if game:DefineFastFlag("FFlagAXFixAvatarSaveContext", false) then reactModule.createContext({
	getHistorySignal = signalsModule.createSignal({}),
	getCurrentHistoryIndexSignal = signalsModule.createSignal(0),
	updateHistoryIndexAndGetCharacterData = function(_)
		return nil
	end,
	getLastSuccessfullySavedStateSignal = signalsModule.createSignal({}),
	getSaveEligibilityStatusSignal = signalsModule.createSignal(require(avatarExperienceSave.Enums.SaveStatusEnum).AlreadySaved),
	autoSaveNextNewSaveData = function()
		return nil
	end,
	trySaveAvatar = function()
		return nil
	end
}) else reactModule.createContext(nil)