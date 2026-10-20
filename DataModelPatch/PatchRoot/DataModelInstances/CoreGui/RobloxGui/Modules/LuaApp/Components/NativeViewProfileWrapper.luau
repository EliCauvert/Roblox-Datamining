local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local NativePageWrapperModule = require(Modules.LuaApp.Components.NativePageWrapper)
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local AppWebViewModule = require(Modules.LuaApp.Components.WebView.AppWebView)
local GetFFlagEnableUnifiedStaticWebViewsModule = require(Modules.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews)
local NativeViewProfileWrapper = RoactModule.PureComponent:extend("NativeViewProfileWrapper")

function NativeViewProfileWrapper.render(p1)
	-- upvalues: RoactModule (copy), NativePageWrapperModule (copy), NotificationTypeModule (copy), WithLocalizationModule (copy)
	local IsVisible = p1.props.isVisible
	local DisplayOrder = p1.props.DisplayOrder
	local Url = p1.props.url
	local OnClose = p1.props.onClose
	
	local function v12(p2)
		-- upvalues: RoactModule (upval), NativePageWrapperModule (upval), IsVisible (copy), DisplayOrder (copy), Url (copy), NotificationTypeModule (upval), OnClose (copy)
		return if game:GetEngineFeature("SetWebViewTitle") then RoactModule.createElement(NativePageWrapperModule, {
			titleText = p2.titleText,
			isVisible = IsVisible,
			DisplayOrder = DisplayOrder,
			url = Url,
			notificationType = NotificationTypeModule.VIEW_PROFILE,
			onClose = OnClose
		}) else RoactModule.createElement(NativePageWrapperModule, {
			titleText = p2.titleText,
			isVisible = IsVisible,
			DisplayOrder = DisplayOrder,
			notificationData = Url,
			notificationType = NotificationTypeModule.VIEW_PROFILE,
			onClose = OnClose
		})
	end
	
	return WithLocalizationModule({ titleText = "CommonUI.Features.Label.Profile" })(function(p2)
		-- upvalues: v12 (copy)
		return v12(p2)
	end)
end

return if GetFFlagEnableUnifiedStaticWebViewsModule() then function(ScreenGui)
	-- upvalues: RoactModule (copy), AppWebViewModule (copy)
	return RoactModule.createElement(AppWebViewModule, {
		titleKey = "CommonUI.Features.Label.Profile",
		url = ScreenGui.url,
		windowCloseCallback = ScreenGui.onClose,
		overlayProps = {
			isVisible = ScreenGui.isVisible,
			DisplayOrder = ScreenGui.DisplayOrder
		}
	})
end else NativeViewProfileWrapper