local Parent = script.Parent.Parent

return {
	Analytics = require(Parent.Analytics),
	CentralOverlay = require(Parent.CentralOverlay),
	Cryo = require(Parent.Cryo),
	Dash = require(Parent.Dash),
	Foundation = require(Parent.Foundation),
	LandingPage = require(Parent.LandingPage),
	Localization = require(Parent.Localization),
	React = require(Parent.React),
	RoactAppExperiment = require(Parent.RoactAppExperiment),
	RoactNavigation = require(Parent.RoactNavigation),
	Style = require(Parent.Style),
	UIBlox = require(Parent.UIBlox),
	UserLib = require(Parent.UserLib),
	PeekView = require(Parent.PeekView),
	Hooks = { useNavigation = require(Parent.Navigation).useNavigation },
	RoactRodux = require(Parent.RoactRodux),
	RoactUtils = require(Parent.RoactUtils),
	RobloxAppEnums = require(Parent.RobloxAppEnums),
	SharedFlags = require(Parent.SharedFlags),
	UniversalAppPolicy = require(Parent.UniversalAppPolicy),
	ExperimentLayers = require(Parent.ExperimentLayers),
	NavigationRodux = require(Parent.NavigationRodux)
}