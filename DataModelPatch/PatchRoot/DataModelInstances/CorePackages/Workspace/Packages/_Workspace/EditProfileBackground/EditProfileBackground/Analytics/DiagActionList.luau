local EventNamesModule = require(script.Parent.Enums.EventNames)

return {
	[EventNamesModule.EditProfileBackgroundOpened] = {
		name = game:DefineFastString("EditProfileBackgroundOpened", "EditProfileBackgroundOpened")
	},
	[EventNamesModule.EditProfileBackgroundLoadingStage] = {
		name = game:DefineFastString("EditProfileBackgroundLoadingStage", "EditProfileBackgroundLoadingStage")
	},
	[EventNamesModule.BackgroundSelected] = {
		name = game:DefineFastString("BackgroundSelected", "BackgroundSelected")
	},
	[EventNamesModule.EditProfileBackgroundFailure] = {
		name = game:DefineFastString("EditProfileBackgroundFailure", "EditProfileBackgroundFailure")
	}
}