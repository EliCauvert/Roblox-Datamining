local Parent = script.Parent

return require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	LastSavedSort = require(Parent.LastSavedSort),
	CurrentSort = require(Parent.CurrentSort),
	EntryPage = require(Parent.EntryPage),
	CharacterUpdatesLocked = require(Parent.CharacterUpdatesLocked)
})