local Parent = script.Parent.Parent

return {
	Mock = require(Parent.LuaSocialLibrariesDeps).Mock,
	UIBlox = require(Parent.UIBlox),
	UnitTestHelpers = require(Parent.UnitTestHelpers),
	Roact = require(Parent.Roact),
	Dash = require(Parent.Dash),
	Rodux = require(Parent.Rodux),
	RoactRodux = require(Parent.RoactRodux),
	RoactNavigation = require(Parent.RoactNavigation),
	ReactRoblox = require(Parent.ReactRoblox),
	LocalizationProvider = require(Parent.Localization).LocalizationProvider,
	RobloxAppLocales = require(Parent.RobloxAppLocales),
	GraphQLServer = require(Parent.GraphQLServer),
	ApolloClient = require(Parent.ApolloClient),
	BuilderIcons = require(Parent.BuilderIcons),
	SharedFlags = require(Parent.SharedFlags)
}