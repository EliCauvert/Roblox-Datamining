local ReactModule = require(game:GetService("CorePackages").Packages.React)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local NativePageWrapperModule = require(Modules.LuaApp.Components.NativePageWrapper)
local TransitionAnimationModule = require(Modules.LuaApp.Enum.TransitionAnimation)
local MapTransitionAnimationToNativeStringModule = require(Modules.LuaApp.mapTransitionAnimationToNativeString)
local WebViewWindowModule = require(Modules.LuaApp.Enum.WebViewWindow)
local AppWebViewModule = require(Modules.LuaApp.Components.WebView.AppWebView)

local function YouTubePageWrapper(ScreenGui)
	-- upvalues: MapTransitionAnimationToNativeStringModule (copy), TransitionAnimationModule (copy), HttpService (copy), ReactModule (copy), NativePageWrapperModule (copy), NotificationTypeModule (copy)
	local IsVisible = ScreenGui.isVisible
	local DisplayOrder = ScreenGui.DisplayOrder
	local Url = ScreenGui.url
	local Title = ScreenGui.title
	local TransitionAnimation = ScreenGui.transitionAnimation
	local MapTransitionAnimationToNativeStringModuleResult = MapTransitionAnimationToNativeStringModule(TransitionAnimation)
	assert(TransitionAnimation == nil or (TransitionAnimation == TransitionAnimationModule.None or MapTransitionAnimationToNativeStringModuleResult ~= nil), string.format("Unhandled transition animation: %q", (tostring(TransitionAnimation))))
	
	return ReactModule.createElement(NativePageWrapperModule, {
		isVisible = IsVisible,
		DisplayOrder = DisplayOrder,
		notificationData = HttpService:JSONEncode({
			url = Url,
			title = Title,
			animated = TransitionAnimation ~= TransitionAnimationModule.None,
			transitionAnimation = MapTransitionAnimationToNativeStringModuleResult
		}),
		notificationType = NotificationTypeModule.OPEN_YOUTUBE_VIDEO
	})
end

return if require(Modules.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews)() then function(ScreenGui)
	-- upvalues: ReactModule (copy), AppWebViewModule (copy), WebViewWindowModule (copy)
	return ReactModule.createElement(AppWebViewModule, {
		url = ScreenGui.url,
		title = ScreenGui.title,
		transitionAnimation = ScreenGui.transitionAnimation,
		windowType = WebViewWindowModule.Dialog,
		overlayProps = {
			isVisible = ScreenGui.isVisible,
			DisplayOrder = ScreenGui.DisplayOrder
		}
	})
end else YouTubePageWrapper