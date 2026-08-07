local parent = script.Parent.Parent
local userLibModule = require(parent.UserLib)

return {
	AppBlox = require(parent.AppBlox),
	Cryo = require(parent.Cryo),
	Dash = require(parent.Dash),
	LocalStorage = require(parent.LocalStorage),
	Rodux = require(parent.Rodux),
	Roact = require(parent.Roact),
	RoactRodux = require(parent.RoactRodux),
	RoactServices = require(parent.RoactServices),
	React = require(parent.React),
	ReactRoblox = require(parent.ReactRoblox),
	UIBlox = require(parent.UIBlox),
	Localization = require(parent.Localization),
	NotificationModalsManager = require(parent.NotificationModalsManager),
	RobloxAppHooks = require(parent.RobloxAppHooks),
	RobloxAppEnums = require(parent.RobloxAppEnums),
	RoactServiceTags = require(parent.RoactServiceTags),
	Hooks = {
		dependencyArray = require(parent.RoactUtils).Hooks.dependencyArray
	},
	LuauPolyfill = require(parent.LuauPolyfill),
	t = require(parent.t),
	ToastNotificationsProtocol = require(parent.ToastNotificationsProtocol).ToastNotificationProtocol,
	ToastNotificationProtocolEnums = require(parent.ToastNotificationsProtocol).ToastNotificationProtocolEnums,
	UserLib = userLibModule,
	getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions,
	UserLibConstants = userLibModule.Utils.Constants,
	Lumberyak = require(parent.Lumberyak),
	SharedFlags = require(parent.SharedFlags),
	Signal = require(parent.AppCommonLib).Signal
}