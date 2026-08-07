local eventNamesModule = require(script.Parent.Enums.EventNames)

return {
	[eventNamesModule.CustomizeNameModalOpened] = {
		name = game:DefineFastString("CustomizeNameModalOpened", "CustomizeNameModalOpened")
	},
	[eventNamesModule.CustomizeNameClearedInput] = {
		name = game:DefineFastString("CustomizeNameClearedInput", "CustomizeNameClearedInput")
	},
	[eventNamesModule.CustomizeNameMaximumCharLimitTyped] = {
		name = game:DefineFastString("CustomizeNameMaximumCharLimitTyped", "CustomizeNameMaximumCharLimitTyped")
	},
	[eventNamesModule.CustomizeNameModalClosed] = {
		name = game:DefineFastString("CustomizeNameModalClosed", "CustomizeNameModalClosed")
	},
	[eventNamesModule.CustomizeNameSaved] = {
		name = game:DefineFastString("CustomizeNameSaved", "CustomizeNameSaved")
	},
	[eventNamesModule.CustomizeNameSaveAttemptInvalidInput] = {
		name = game:DefineFastString("CustomizeNameSaveAttemptInvalidInput", "CustomizeNameSaveAttemptInvalidInput")
	}
}