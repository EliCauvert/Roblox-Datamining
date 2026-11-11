local Parent = script.Parent.Parent
local UserLibModule = require(Parent.UserLib)

return {
	ToastNotificationsProtocol = require(Parent.ToastNotificationsProtocol).ToastNotificationProtocol,
	React = require(Parent.React),
	UIBlox = require(Parent.UIBlox),
	UserLib = UserLibModule,
	getRbxthumbWithTypeSizeAndOptions = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions,
	UserLibConstants = UserLibModule.Utils.Constants
}