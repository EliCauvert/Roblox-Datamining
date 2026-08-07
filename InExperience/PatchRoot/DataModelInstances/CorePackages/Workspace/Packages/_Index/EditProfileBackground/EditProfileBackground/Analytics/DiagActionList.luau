local eventNamesModule = require(script.Parent.Enums.EventNames)

return {
	[eventNamesModule.EditProfileBackgroundOpened] = {
		name = game:DefineFastString("EditProfileBackgroundOpened", "EditProfileBackgroundOpened")
	},
	[eventNamesModule.EditProfileBackgroundLoadingStage] = {
		name = game:DefineFastString("EditProfileBackgroundLoadingStage", "EditProfileBackgroundLoadingStage")
	},
	[eventNamesModule.BackgroundSelected] = {
		name = game:DefineFastString("BackgroundSelected", "BackgroundSelected")
	},
	[eventNamesModule.EditProfileBackgroundFailure] = {
		name = game:DefineFastString("EditProfileBackgroundFailure", "EditProfileBackgroundFailure")
	}
}