local Parent = script.Parent.Parent

return {
	Dash = require(Parent.Dash),
	Roact = require(Parent.Roact),
	RoactNavigation = require(Parent.RoactNavigation),
	RoactRodux = require(Parent.RoactRodux),
	Rodux = require(Parent.Rodux),
	t = require(Parent.t),
	UIBlox = require(Parent.UIBlox),
	LocalizationProvider = require(Parent.Localization).LocalizationProvider,
	withLocalization = require(Parent.Localization).withLocalization,
	llama = require(Parent.LuaSocialLibrariesDeps).llama
}