local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local TModule = require(CorePackages.Packages.t)
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local ConstantsModule = require(Modules.Luobu.Constants)
local OpenExternalBrowserModule = require(Modules.LuaApp.openExternalBrowser)
local TencentHelpWrapper = require(CorePackages.Packages.Roact).PureComponent:extend("TencentHelpWrapper")
TencentHelpWrapper.validateProps = TModule.strictInterface({
	guiService = TModule.union(TModule.Instance, TModule.table),
	linking = TModule.table,
	openId = TModule.string,
	userId = TModule.string
})

function TencentHelpWrapper.render(p1)
	-- upvalues: UserInputService (copy), OpenExternalBrowserModule (copy)
	local Platform = UserInputService:GetPlatform()
	
	if Platform ~= Enum.Platform.IOS and Platform ~= Enum.Platform.Android then
		OpenExternalBrowserModule(p1.props.linking, (string.format("%s?sign=%s&uid=%s&c1=%s", "https://www.700chat.com/xv/web/static/chat/index.html", "37ef9b97d27505cf7010cde71be4b531abd89bc57750c3c8ec20dfdeab0d5d2d38342d82206c7c73b17486525a9637055bb161", p1.props.openId, p1.props.userId)))
		
		return
	end
	p1:broadcastNotification()
	
	return nil
end

function TencentHelpWrapper.broadcastNotification(p1)
	-- upvalues: NotificationTypeModule (copy), HttpService (copy), ConstantsModule (copy)
	p1.props.guiService:BroadcastNotification(HttpService:JSONEncode({ type = ConstantsModule.TENCENT_SMART_HELP_CENTER }), NotificationTypeModule.SDK_OPEN_URL)
end

return (RoactRoduxModule.connect(function(p1, _)
	return {
		userId = p1.LocalUserId,
		openId = p1.Luobu.MSDKAuth.openId
	}
end)((RoactServices.connect({ guiService = AppGuiService, linking = AppLinking })(TencentHelpWrapper))))