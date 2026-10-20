local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UsePreviousFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.usePrevious
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local Common = Modules.AvatarExperience.Common
local NamedRefConstantsModule = require(Common.NamedRefConstants)
local NamedRefsContextModule = require(Common.Context.NamedRefsContext)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants
local FetchMySharedAvatarsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.FetchMySharedAvatars)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local ResultsListModule = require(Modules.AvatarExperience.Catalog.Components.Search.ResultsList)
local config = {
	[AvatarScreen.ProfilePictureEditorEmotes] = true,
	[AvatarScreen.AvatarEditor] = true,
	[AvatarScreen.Catalog] = true
}

return function(Gui)
	-- upvalues: ReactModule (copy), NamedRefsContextModule (copy), UseNavigationFunction (copy), UseStyleFunction (copy), Signal (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), UseAvatarRouteFunction (copy), UsePreviousFunction (copy), AvatarScreen (copy), config (copy), NamedRefConstantsModule (copy), FetchMySharedAvatarsModule (copy), NavigationUtilsModule (copy), Focusable (copy), ResultsListModule (copy), ConstantsModule (copy), WidgetConstants (copy)
	local UseContextResult = ReactModule.useContext(NamedRefsContextModule)
	local UseNavigationResult = UseNavigationFunction()
	local UseStyleResult = UseStyleFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Signal (upval)
		return Signal.new()
	end, {})
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UsePreviousResult = UsePreviousFunction(UseAvatarRouteResult)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UsePreviousResult (copy), UseAvatarRouteResult (copy), AvatarScreen (upval), UseStateResult (copy), UseStateResult2 (copy), config (upval)
		if not UsePreviousResult or not UseAvatarRouteResult then return end
		local Name = UseAvatarRouteResult.opaque and UseAvatarRouteResult.opaque.name
		local Name1 = UsePreviousResult.opaque and UsePreviousResult.opaque.name
		
		if Name == AvatarScreen.MySharedAvatars and not UseStateResult then
			UseStateResult2(true)
			
			return
		end
		if Name1 == AvatarScreen.MySharedAvatars and config[Name] and UseStateResult then
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
		ListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 0)
		}),
		ResultsList = ReactModule.createElement(ResultsListModule, {
			fromSearch = false,
			layoutOrder = 2,
			showCloseIcon = true,
			frameRef = UseContextResult[AvatarScreen.MySharedAvatars .. NamedRefConstantsModule.ItemsList],
			navBarRef = UseRefResult,
			analyticsContext = ConstantsModule.AnalyticsContext[AvatarScreen.MySharedAvatars],
			searchUuid = WidgetConstants.ContextWidgets.MySharedAvatars.RequestId,
			scrollingFrameRef = UseRefResult1,
			onCloseFocusedWidget = ReactModule.useCallback(function()
				-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy), AvatarScreen (upval)
				NavigationUtilsModule.closeMySharedAvatars(UseNavigationResult)
				UseNavigationResult.navigate(AvatarScreen.AvatarEditor)
			end, { UseNavigationResult }),
			onRetry = ReactModule.useCallback(function()
				-- upvalues: UseDispatchResult (copy), FetchMySharedAvatarsModule (upval), UseRoactServiceModuleResult (copy)
				UseDispatchResult(FetchMySharedAvatarsModule(UseRoactServiceModuleResult))
			end, { UseDispatchResult, UseRoactServiceModuleResult }),
			NextSelectionUp = Gui.NextSelectionUp,
			backToTopSignal = UseMemoResult,
			multiTryOnBottomBarRef = Gui.multiTryOnBottomBarRef,
			itemDetailsPeekViewRefs = Gui.itemDetailsPeekViewRefs
		})
	})
end