local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local RoactModule = require(Modules.Common.Roact)
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local NativeHandshakeWrapperModule = require(Modules.LuaApp.Components.NativeHandshakeWrapper)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)

return require(game:GetService("CorePackages").Workspace.Packages.UniversalAppPolicy).RoactAppPolicy.connect(function(p1, _)
	return { shareTimeout = p1.getShareToAccountProviderTimeout() }
end)(function(p1)
	-- upvalues: WithLocalizationModule (copy), RoactModule (copy), NativeHandshakeWrapperModule (copy), HttpService (copy), NotificationTypeModule (copy)
	return WithLocalizationModule({
		title = "Feature.SocialShare.Action.Redirect",
		errorMessage = "Feature.SocialShare.Response.Error",
		errorSubMessage = "Feature.SocialShare.Response.Error.Subtext"
	})(function(p2)
		-- upvalues: RoactModule (upval), NativeHandshakeWrapperModule (upval), p1 (copy), HttpService (upval), NotificationTypeModule (upval)
		return RoactModule.createElement(NativeHandshakeWrapperModule, {
			responseType = "SDKShare",
			isVisible = p1.isVisible,
			DisplayOrder = p1.displayOrder,
			notificationData = HttpService:JSONEncode(p1.data),
			notificationType = NotificationTypeModule.SDK_SHARE,
			title = p2.title,
			errorMessage = p2.errorMessage,
			errorSubMessage = p2.errorSubMessage,
			dispatchTimeout = p1.shareTimeout
		})
	end)
end)