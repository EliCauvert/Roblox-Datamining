local ReactModule = require(game:GetService("CorePackages").Packages.React)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local NativePageWrapperModule = require(Modules.LuaApp.Components.NativePageWrapper)
local TransitionAnimationModule = require(Modules.LuaApp.Enum.TransitionAnimation)
local MapTransitionAnimationToNativeStringModule = require(Modules.LuaApp.mapTransitionAnimationToNativeString)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local AppWebViewModule = require(Modules.LuaApp.Components.WebView.AppWebView)

local function NativePageWithUrlWrapper(ScreenGui)
	-- upvalues: MapTransitionAnimationToNativeStringModule (copy), TransitionAnimationModule (copy), HttpService (copy), ReactModule (copy), NativePageWrapperModule (copy), WithLocalizationModule (copy)
	local IsVisible = ScreenGui.isVisible
	local DisplayOrder = ScreenGui.DisplayOrder
	local Url = ScreenGui.url
	local Title = ScreenGui.title
	local TitleKey = ScreenGui.titleKey
	local TransitionAnimation = ScreenGui.transitionAnimation
	local NotificationType = ScreenGui.notificationType
	local OnClose = ScreenGui.onClose
	local MapTransitionAnimationToNativeStringModuleResult = MapTransitionAnimationToNativeStringModule(TransitionAnimation)
	assert(TransitionAnimation == nil or (TransitionAnimation == TransitionAnimationModule.None or MapTransitionAnimationToNativeStringModuleResult ~= nil), string.format("Unhandled transition animation: %q", (tostring(TransitionAnimation))))
	local IsNotTransitionAnimationMatch = TransitionAnimation ~= TransitionAnimationModule.None
	
	local function v19(Title)
		-- upvalues: HttpService (upval), Url (copy), IsNotTransitionAnimationMatch (copy), MapTransitionAnimationToNativeStringModuleResult (copy), ReactModule (upval), NativePageWrapperModule (upval), IsVisible (copy), DisplayOrder (copy), NotificationType (copy), OnClose (copy)
		return ReactModule.createElement(NativePageWrapperModule, {
			isVisible = IsVisible,
			DisplayOrder = DisplayOrder,
			notificationData = HttpService:JSONEncode({
				url = Url,
				title = Title,
				animated = IsNotTransitionAnimationMatch,
				transitionAnimation = MapTransitionAnimationToNativeStringModuleResult
			}),
			notificationType = NotificationType,
			onClose = OnClose
		})
	end
	
	return if TitleKey == nil or Title ~= nil then v19(Title) else WithLocalizationModule({ title = TitleKey })(function(p1)
		-- upvalues: v19 (copy)
		return v19(p1.title)
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
end else NativePageWithUrlWrapper