local Parent = script.Parent.Parent

return {
	React = require(Parent.React),
	Roact = require(Parent.Roact),
	Rodux = require(Parent.Rodux),
	RoactRodux = require(Parent.RoactRodux),
	Dash = require(Parent.Dash),
	Hooks = {
		useNavigation = require(Parent.Navigation).useNavigation,
		useLocalization = require(Parent.Localization).Hooks.useLocalization,
		useDidUpdate = require(Parent.RoactUtils).Hooks.useDidUpdate,
		dependencyArray = require(Parent.RoactUtils).Hooks.dependencyArray
	},
	UIBlox = require(Parent.UIBlox),
	SharedFlags = require(Parent.SharedFlags),
	LocalizationProvider = require(Parent.Localization).LocalizationProvider,
	RoactNavigation = require(Parent.RoactNavigation)
}