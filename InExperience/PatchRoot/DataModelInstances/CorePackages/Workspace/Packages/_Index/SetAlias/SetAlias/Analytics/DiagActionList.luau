local EventNamesModule = require(script.Parent.Enums.EventNames)

return {
	[EventNamesModule.CustomizeNameModalOpened] = {
		name = game:DefineFastString("CustomizeNameModalOpened", "CustomizeNameModalOpened")
	},
	[EventNamesModule.CustomizeNameClearedInput] = {
		name = game:DefineFastString("CustomizeNameClearedInput", "CustomizeNameClearedInput")
	},
	[EventNamesModule.CustomizeNameMaximumCharLimitTyped] = {
		name = game:DefineFastString("CustomizeNameMaximumCharLimitTyped", "CustomizeNameMaximumCharLimitTyped")
	},
	[EventNamesModule.CustomizeNameModalClosed] = {
		name = game:DefineFastString("CustomizeNameModalClosed", "CustomizeNameModalClosed")
	},
	[EventNamesModule.CustomizeNameSaved] = {
		name = game:DefineFastString("CustomizeNameSaved", "CustomizeNameSaved")
	},
	[EventNamesModule.CustomizeNameSaveAttemptInvalidInput] = {
		name = game:DefineFastString("CustomizeNameSaveAttemptInvalidInput", "CustomizeNameSaveAttemptInvalidInput")
	}
}