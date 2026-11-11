local Parent = script.Parent.Parent

return {
	Analytics = require(Parent.Analytics),
	CentralOverlay = require(Parent.CentralOverlay),
	Foundation = require(Parent.Foundation),
	Localization = require(Parent.Localization),
	NavigationRodux = require(Parent.NavigationRodux),
	Promise = require(Parent.Promise),
	React = require(Parent.React),
	RoactRodux = require(Parent.RoactRodux),
	RoactServices = require(Parent.RoactServices),
	RoactServiceTags = require(Parent.RoactServiceTags),
	RobloxAppHooks = require(Parent.RobloxAppHooks),
	Style = require(Parent.Style),
	UIBlox = require(Parent.UIBlox),
	UrlBuilder = require(Parent.UrlBuilder),
	SharedFlags = require(Parent.SharedFlags)
}