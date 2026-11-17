local Parent = script.Parent.Parent

return {
	AppCommonLib = require(Parent.AppCommonLib),
	ArgCheck = require(Parent.ArgCheck),
	AuthenticationStatus = require(Parent.AuthenticationStatus),
	CentralOverlay = require(Parent.CentralOverlay),
	Cryo = require(Parent.Cryo),
	FitFrame = require(Parent.FitFrame),
	Http = require(Parent.Http),
	Localization = require(Parent.Localization),
	Loggers = require(Parent.Loggers),
	NavigationRodux = require(Parent.NavigationRodux),
	React = require(Parent.React),
	Roact = require(Parent.Roact),
	RoactRodux = require(Parent.RoactRodux),
	RoactServices = require(Parent.RoactServices),
	RoactServiceTags = require(Parent.RoactServiceTags),
	RoactUtils = require(Parent.RoactUtils),
	RobloxAppAssets = require(Parent.RobloxAppAssets),
	RobloxAppEnums = require(Parent.RobloxAppEnums),
	RobloxAppHooks = require(Parent.RobloxAppHooks),
	SharedFlags = require(Parent.SharedFlags),
	t = require(Parent.t),
	UIBlox = require(Parent.UIBlox),
	Foundation = require(Parent.Foundation),
	UniversalAppPolicy = require(Parent.UniversalAppPolicy),
	Dash = require(Parent.Dash)
}