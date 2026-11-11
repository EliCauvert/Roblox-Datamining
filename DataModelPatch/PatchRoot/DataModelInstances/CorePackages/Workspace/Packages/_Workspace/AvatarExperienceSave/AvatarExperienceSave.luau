return {
	Context = {
		AvatarSaveContext = require(script.Context.AvatarSaveContext),
		AvatarSaveContextProvider = require(script.Context.AvatarSaveContextProvider),
		useAvatarSaveContext = require(script.Context.useAvatarSaveContext)
	},
	Components = {
		SaveButton = require(script.SaveButton.SaveButtonContainer)
	},
	Selectors = {
		selectCharacterData = require(script.Selectors.selectCharacterData)
	},
	Enums = { SaveStatusEnum = require(script.Enums.SaveStatusEnum) },
	["jest.config"] = script["jest.config"]
}