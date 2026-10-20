local Parent = script.Parent.Parent
local UserLibModule = require(Parent.UserLib)

return {
	AppBlox = require(Parent.AppBlox),
	Cryo = require(Parent.Cryo),
	Dash = require(Parent.Dash),
	LocalStorage = require(Parent.LocalStorage),
	Rodux = require(Parent.Rodux),
	Roact = require(Parent.Roact),
	RoactRodux = require(Parent.RoactRodux),
	RoactServices = require(Parent.RoactServices),
	React = require(Parent.React),
	ReactRoblox = require(Parent.ReactRoblox),
	UIBlox = require(Parent.UIBlox),
	Localization = require(Parent.Localization),
	NotificationModalsManager = require(Parent.NotificationModalsManager),
	RobloxAppHooks = require(Parent.RobloxAppHooks),
	RobloxAppEnums = require(Parent.RobloxAppEnums),
	RoactServiceTags = require(Parent.RoactServiceTags),
	Hooks = {
		dependencyArray = require(Parent.RoactUtils).Hooks.dependencyArray
	},
	LuauPolyfill = require(Parent.LuauPolyfill),
	t = require(Parent.t),
	ToastNotificationsProtocol = require(Parent.ToastNotificationsProtocol).ToastNotificationProtocol,
	ToastNotificationProtocolEnums = require(Parent.ToastNotificationsProtocol).ToastNotificationProtocolEnums,
	UserLib = UserLibModule,
	getRbxthumbWithTypeSizeAndOptions = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions,
	UserLibConstants = UserLibModule.Utils.Constants,
	Lumberyak = require(Parent.Lumberyak),
	SharedFlags = require(Parent.SharedFlags),
	Signal = require(Parent.AppCommonLib).Signal
}