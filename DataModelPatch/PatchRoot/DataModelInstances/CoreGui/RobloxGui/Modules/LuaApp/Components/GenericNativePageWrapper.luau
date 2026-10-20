local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local RoactModule = require(Modules.Common.Roact)
local NativePageWrapperModule = require(Modules.LuaApp.Components.NativePageWrapper)
local TransitionAnimationModule = require(Modules.LuaApp.Enum.TransitionAnimation)
local MapTransitionAnimationToNativeStringModule = require(Modules.LuaApp.mapTransitionAnimationToNativeString)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)

return function(ScreenGui)
	-- upvalues: MapTransitionAnimationToNativeStringModule (copy), TransitionAnimationModule (copy), WithLocalizationModule (copy), RoactModule (copy), NativePageWrapperModule (copy), HttpService (copy)
	local IsVisible = ScreenGui.isVisible
	local DisplayOrder = ScreenGui.DisplayOrder
	local TransitionAnimation = ScreenGui.transitionAnimation
	local TitleTextLocalizationKey = ScreenGui.titleTextLocalizationKey
	local MapTransitionAnimationToNativeStringModuleResult = MapTransitionAnimationToNativeStringModule(TransitionAnimation or "")
	assert(TransitionAnimation == nil or (TransitionAnimation == TransitionAnimationModule.None or MapTransitionAnimationToNativeStringModuleResult ~= nil), string.format("Unhandled transition animation: %q", (tostring(TransitionAnimation))))
	local IsNotTransitionAnimationMatch = TransitionAnimation ~= TransitionAnimationModule.None
	
	return if game:GetEngineFeature("SetWebViewTitle") then WithLocalizationModule({ titleText = TitleTextLocalizationKey })(function(p1)
		-- upvalues: RoactModule (upval), NativePageWrapperModule (upval), IsNotTransitionAnimationMatch (copy), MapTransitionAnimationToNativeStringModuleResult (copy), IsVisible (copy), DisplayOrder (copy), ScreenGui (copy)
		return RoactModule.createElement(NativePageWrapperModule, {
			titleText = p1.titleText,
			animated = IsNotTransitionAnimationMatch,
			transitionAnimation = MapTransitionAnimationToNativeStringModuleResult,
			isVisible = IsVisible,
			DisplayOrder = DisplayOrder,
			notificationType = ScreenGui.notificationType,
			onClose = ScreenGui.onClose
		})
	end) else RoactModule.createElement(NativePageWrapperModule, {
		isVisible = IsVisible,
		DisplayOrder = DisplayOrder,
		notificationData = HttpService:JSONEncode({
			animated = IsNotTransitionAnimationMatch,
			transitionAnimation = MapTransitionAnimationToNativeStringModuleResult
		}),
		notificationType = ScreenGui.notificationType,
		onClose = ScreenGui.onClose
	})
end