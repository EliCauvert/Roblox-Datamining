local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local UsePreviousFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.usePrevious
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local Common = Modules.AvatarExperience.Common
local NamedRefConstantsModule = require(Common.NamedRefConstants)
local NamedRefsContextModule = require(Common.Context.NamedRefsContext)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local ResultsListModule = require(Modules.AvatarExperience.Catalog.Components.Search.ResultsList)
local config = {
	[AvatarScreen.ProfilePictureEditorEmotes] = true,
	[AvatarScreen.AvatarEditor] = true,
	[AvatarScreen.Catalog] = true
}

return function(Gui)
	-- upvalues: ReactModule (copy), NamedRefsContextModule (copy), UseNavigationFunction (copy), UseStyleFunction (copy), Signal (copy), UseAvatarRouteFunction (copy), UsePreviousFunction (copy), AvatarScreen (copy), config (copy), NamedRefConstantsModule (copy), Focusable (copy), ResultsListModule (copy), ConstantsModule (copy)
	local UseContextResult = ReactModule.useContext(NamedRefsContextModule)
	local UseNavigationResult = UseNavigationFunction()
	local UseStyleResult = UseStyleFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Signal (upval)
		return Signal.new()
	end, {})
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UsePreviousResult = UsePreviousFunction(UseAvatarRouteResult)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UsePreviousResult (copy), UseAvatarRouteResult (copy), AvatarScreen (upval), UseStateResult (copy), UseStateResult2 (copy), config (upval)
		if not UsePreviousResult or not UseAvatarRouteResult then return end
		local Name = if UseAvatarRouteResult and UseAvatarRouteResult.opaque then UseAvatarRouteResult.opaque.name else nil
		local Name1 = if UsePreviousResult and UsePreviousResult.opaque then UsePreviousResult.opaque.name else nil
		
		if Name == AvatarScreen.SearchLandingFocusedWidgetPage and not UseStateResult then
			UseStateResult2(true)
			
			return
		end
		if Name1 == AvatarScreen.SearchLandingFocusedWidgetPage and Name and config[Name] and UseStateResult then
			UseStateResult2(false)
		end
	end, {
		UsePreviousResult,
		UseAvatarRouteResult,
		UseNavigationResult,
		UseStateResult
	})
	local Theme = UseStyleResult.Theme
	
	return ReactModule.createElement(Focusable.Frame, {
		BorderSizePixel = 0,
		BackgroundTransparency = Theme.BackgroundDefault.Transparency or 1,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		Size = UDim2.new(1, 0, 1, 0),
		ref = Gui.defaultChildRef,
		restorePreviousChildFocus = UseStateResult,
		defaultChild = UseRefResult,
		NextSelectionRight = Gui.NextSelectionRight
	}, {
		ResultsList = ReactModule.createElement(ResultsListModule, {
			fromSearch = false,
			showCloseIcon = false,
			frameRef = UseContextResult[AvatarScreen.SearchLandingFocusedWidgetPage .. NamedRefConstantsModule.ItemsList],
			navBarRef = UseRefResult,
			analyticsContext = ConstantsModule.AnalyticsContext[AvatarScreen.SearchLandingFocusedWidgetPage],
			searchUuid = Gui.searchUuid,
			widgetRequestId = Gui.searchUuid,
			scrollingFrameRef = UseRefResult1,
			onCloseFocusedWidget = Gui.onCloseFocusedWidget,
			onRetry = function() end,
			NextSelectionUp = Gui.NextSelectionUp,
			backToTopSignal = UseMemoResult,
			multiTryOnBottomBarRef = Gui.multiTryOnBottomBarRef,
			itemDetailsPeekViewRefs = Gui.itemDetailsPeekViewRefs
		})
	})
end