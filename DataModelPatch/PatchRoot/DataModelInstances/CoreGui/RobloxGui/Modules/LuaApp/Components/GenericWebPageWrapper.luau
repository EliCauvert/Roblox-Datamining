local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local TransitionAnimationModule = require(Modules.LuaApp.Enum.TransitionAnimation)
local MapTransitionAnimationToNativeStringModule = require(Modules.LuaApp.mapTransitionAnimationToNativeString)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local NativePageWrapperModule = require(Modules.LuaApp.Components.NativePageWrapper)
local AppWebViewModule = require(Modules.LuaApp.Components.WebView.AppWebView)
local WebViewStateTracker = require(CorePackages.Workspace.Packages.WebViewUtils).WebViewStateTracker
local FFlagEnableWebViewStateTracker = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableWebViewStateTracker
local EnableWebViewStateTrackerInGenericWebPageWrapper = game:DefineFastFlag("EnableWebViewStateTrackerInGenericWebPageWrapper", false)

local function GenericWebPageWrapper(ScreenGui)
	-- upvalues: MapTransitionAnimationToNativeStringModule (copy), TransitionAnimationModule (copy), FFlagEnableWebViewStateTracker (copy), EnableWebViewStateTrackerInGenericWebPageWrapper (copy), ReactModule (copy), WebViewStateTracker (copy), HttpService (copy), NativePageWrapperModule (copy), NotificationTypeModule (copy), WithLocalizationModule (copy)
	local IsVisible = ScreenGui.isVisible
	local DisplayOrder = ScreenGui.DisplayOrder
	local Url = ScreenGui.url
	local TitleKey = ScreenGui.titleKey
	local Title = ScreenGui.title
	local SearchParams = ScreenGui.searchParams
	local TransitionAnimation = ScreenGui.transitionAnimation
	local MapTransitionAnimationToNativeStringModuleResult = MapTransitionAnimationToNativeStringModule(TransitionAnimation)
	assert(TransitionAnimation == nil or (TransitionAnimation == TransitionAnimationModule.None or MapTransitionAnimationToNativeStringModuleResult ~= nil), string.format("Unhandled transition animation: %q", (tostring(TransitionAnimation))))
	local IsNotTransitionAnimationMatch = TransitionAnimation ~= TransitionAnimationModule.None
	
	if FFlagEnableWebViewStateTracker and EnableWebViewStateTrackerInGenericWebPageWrapper then
		ReactModule.useEffect(function()
			-- upvalues: WebViewStateTracker (upval), Url (copy), Title (copy), IsVisible (copy)
			WebViewStateTracker.markOpen(Url, Title, IsVisible)
		end, {})
		ReactModule.useEffect(function()
			-- upvalues: WebViewStateTracker (upval), Url (copy), Title (copy), IsVisible (copy)
			WebViewStateTracker.updateMetadata(Url, Title, IsVisible)
		end, { Url, Title, IsVisible })
	end
	local function v23()
		-- upvalues: WebViewStateTracker (upval), ScreenGui (copy)
		WebViewStateTracker.markClosed()
		
		if ScreenGui.onClose then
			ScreenGui.onClose()
		end
	end
	
	local function v24(Title)
		-- upvalues: HttpService (upval), Url (copy), SearchParams (copy), IsNotTransitionAnimationMatch (copy), MapTransitionAnimationToNativeStringModuleResult (copy), ReactModule (upval), NativePageWrapperModule (upval), IsVisible (copy), DisplayOrder (copy), NotificationTypeModule (upval), FFlagEnableWebViewStateTracker (upval), EnableWebViewStateTrackerInGenericWebPageWrapper (upval), v23 (copy), ScreenGui (copy)
		return ReactModule.createElement(NativePageWrapperModule, {
			isVisible = IsVisible,
			DisplayOrder = DisplayOrder,
			notificationData = HttpService:JSONEncode({
				url = Url,
				title = Title,
				searchParams = SearchParams,
				animated = IsNotTransitionAnimationMatch,
				transitionAnimation = MapTransitionAnimationToNativeStringModuleResult
			}),
			notificationType = NotificationTypeModule.OPEN_CUSTOM_WEBVIEW,
			onClose = if FFlagEnableWebViewStateTracker and EnableWebViewStateTrackerInGenericWebPageWrapper then v23 else ScreenGui.onClose
		})
	end
	
	return if TitleKey == nil or Title ~= nil then v24(Title) else WithLocalizationModule({ title = TitleKey })(function(p1)
		-- upvalues: v24 (copy)
		return v24(p1.title)
	end)
end

return if require(Modules.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews)() then function(ScreenGui)
	-- upvalues: ReactModule (copy), AppWebViewModule (copy)
	return ReactModule.createElement(AppWebViewModule, {
		url = ScreenGui.url,
		title = ScreenGui.title,
		titleKey = ScreenGui.titleKey,
		searchParams = ScreenGui.searchParams,
		transitionAnimation = ScreenGui.transitionAnimation,
		windowCloseCallback = ScreenGui.onClose,
		overlayProps = {
			isVisible = ScreenGui.isVisible,
			DisplayOrder = ScreenGui.DisplayOrder
		}
	})
end else GenericWebPageWrapper