local parent = script.Parent.Parent
local userLibModule = require(parent.UserLib)

return {
	ToastNotificationsProtocol = require(parent.ToastNotificationsProtocol).ToastNotificationProtocol,
	React = require(parent.React),
	UIBlox = require(parent.UIBlox),
	UserLib = userLibModule,
	getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions,
	UserLibConstants = userLibModule.Utils.Constants
}