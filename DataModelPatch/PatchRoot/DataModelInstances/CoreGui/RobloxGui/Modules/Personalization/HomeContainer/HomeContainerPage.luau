local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Packages.Dash)
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local View = FoundationModule.View
local Tabs = FoundationModule.Tabs
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local _ = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local _ = require(CorePackages.Workspace.Packages.Navigation)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UsePageSideMarginFunction = require(CorePackages.Workspace.Packages.CollectionViews).usePageSideMargin
local AppNotificationService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppNotificationService
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local PersonalizationTopBarModule = require(game:GetService("CoreGui").RobloxGui.Modules.Personalization.PersonalizationTopBar)
local CompositionTags = require(CorePackages.Workspace.Packages.AppComposition).CompositionTags
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local VisibilityControl = AppNavBarModule.VisibilityControl
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagAppIaHomeSubTabAnalytics = SharedFlagsModule.FFlagAppIaHomeSubTabAnalytics
local FFlagAppIaStatusBar = SharedFlagsModule.FFlagAppIaStatusBar
local FFlagLuaAppChartsStickyHeader = SharedFlagsModule.FFlagLuaAppChartsStickyHeader
local FFlagLuaAppCompositionHome = SharedFlagsModule.FFlagLuaAppCompositionHome
local FFlagLuaAppCompositionHomeHeaderFullBleed = SharedFlagsModule.FFlagLuaAppCompositionHomeHeaderFullBleed
local AppIaHomeSubTabFrame = game:DefineFastFlag("AppIaHomeSubTabFrame", false)
local AppIaHomeSubTabUnderlineFix = game:DefineFastFlag("AppIaHomeSubTabUnderlineFix", false)
local AppIaHomeSubTabFrame1 = game:DefineFastFlag("AppIaHomeSubTabScrollAwayFix", false) and AppIaHomeSubTabFrame
local AppIaHomeSubTabScrollAwayFixDefaultHeight = game:DefineFastFlag("AppIaHomeSubTabScrollAwayFixDefaultHeight", false)
local v1 = require(script.Parent.createHomeSubTabNavigator)()
local Config = if FFlagAppIaHomeSubTabAnalytics then {
	[AppPage.Home] = Enum.AppShellActionType.TapHomePageTab,
	[AppPage.Games] = Enum.AppShellActionType.TapGamePageTab
} else nil

local function _(p1)
	local State = p1.state
	
	return State.routes[State.index].routeName
end

local function v35(p1)
	-- upvalues: DisplayModule (copy)
	return DisplayModule.GetDisplayStore(p1).getTopBarHeight(p1)
end

local ForwardRefResult = ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseLocalizationFunction (copy), FFlagAppIaHomeSubTabAnalytics (copy), UseRoactServiceFunction (copy), AppNotificationService (copy), ReactModule (copy), Config (copy), AppIaHomeSubTabUnderlineFix (copy), AppPage (copy), UseDesignTokensFunction (copy), UseSelectorFunction (copy), FormFactor (copy), FillBehavior (copy), FFlagLuaAppCompositionHome (copy), UsePageSideMarginFunction (copy), FFlagAppIaStatusBar (copy), AppIaHomeSubTabFrame1 (copy), UseSignalStateFunction (copy), v35 (copy), UseTokensFunction (copy), AppIaHomeSubTabScrollAwayFixDefaultHeight (copy), FFlagLuaAppChartsStickyHeader (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), VisibilityControl (copy), AppIaHomeSubTabFrame (copy), View (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), FFlagLuaAppCompositionHomeHeaderFullBleed (copy), CompositionTags (copy), PersonalizationTopBarModule (copy), Tabs (copy), InputSize (copy), v1 (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		Charts = "CommonUI.Features.Label.Charts",
		ForYou = "CommonUI.Features.Label.ForYou"
	})
	local UseRoactServiceResult = if FFlagAppIaHomeSubTabAnalytics then UseRoactServiceFunction(AppNotificationService) else nil
	local State = p1.navigation.state
	local RouteName = State.routes[State.index].routeName
	local UseResult = ReactModule.useCallback(function(RouteName1)
		-- upvalues: FFlagAppIaHomeSubTabAnalytics (upval), RouteName (copy), p1 (copy), Config (upval), UseRoactServiceResult (copy)
		if not FFlagAppIaHomeSubTabAnalytics then
			p1.navigation.navigate(RouteName1)
		elseif RouteName1 == RouteName then return end
		p1.navigation.navigate(RouteName1)
		local Entry = Config[RouteName1]
		
		if Entry then
			UseRoactServiceResult:ActionTaken(Entry)
			
			return
		end
	end, {
		p1.navigation,
		if FFlagAppIaHomeSubTabAnalytics then UseRoactServiceResult else nil
	})
	local UseMemoResult = if AppIaHomeSubTabUnderlineFix then ReactModule.useMemo(function()
		-- upvalues: AppPage (upval), UseLocalizationResult (copy)
		return {
			{ id = AppPage.Home, text = UseLocalizationResult.ForYou },
			{ id = AppPage.Games, text = UseLocalizationResult.Charts }
		}
	end, {
		UseLocalizationResult.ForYou,
		UseLocalizationResult.Charts
	}) else {
		{ id = AppPage.Home, text = UseLocalizationResult.ForYou },
		{ id = AppPage.Games, text = UseLocalizationResult.Charts }
	}
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Fill = if UseSelectorFunction(function(p2)
		return p2.FormFactor
	end) == FormFactor.COMPACT then FillBehavior.Fill else FillBehavior.Fit
	local UsePageSideMarginResult = if FFlagLuaAppCompositionHome then nil else UsePageSideMarginFunction()
	local UseSelectorResult = if FFlagAppIaStatusBar then UseSelectorFunction(function(p2)
		return p2.TopBar.statusBarHeight
	end) else nil
	local UseSignalStateResult = if AppIaHomeSubTabFrame1 then UseSignalStateFunction(v35) else nil
	local YOffset = nil
	local UseStateResult2_1 = nil
	local UseResult1 = nil
	local v2 = nil
	local Callback = nil
	local UseResult2 = nil
	local MapResult = nil
	local v3 = nil
	local MapResult1 = nil
	
	if AppIaHomeSubTabFrame1 then
		local UseTokensResult = UseTokensFunction()
		local UseStateResult, UseStateResult2 = ReactModule.useState(if AppIaHomeSubTabScrollAwayFixDefaultHeight then UseTokensResult.Padding.Medium * 2 + UseTokensResult.Size.Size_600 else 0)
		UseResult2 = ReactModule.useCallback(function(Frame)
			-- upvalues: UseStateResult2 (copy)
			if Frame then
				UseStateResult2(Frame.AbsoluteSize.Y)
			end
		end, {})
		YOffset = UseSignalStateResult + UseStateResult
		local UseSelectorResult1 = if FFlagAppIaStatusBar then UseSelectorResult else 0
		v3 = UseSignalStateResult - UseSelectorResult1
		
		if FFlagLuaAppChartsStickyHeader then
			v2, Callback = ReactModule.useBinding(0)
		end
		ReactModule.useEffect(function()
			-- upvalues: Callback (ref), YOffset (ref)
			if Callback then
				Callback(YOffset)
			end
		end, { YOffset })
		MapResult = if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then VisibilityControl.getHeaderBinding():map(function(p2): UDim2
			-- upvalues: UseSelectorResult1 (copy), UseSignalStateResult (copy)
			return UDim2.new(0, 0, 0, UseSelectorResult1 + p2 * (UseSignalStateResult - UseSelectorResult1))
		end) else UDim2.new(0, 0, 0, UseSignalStateResult)
		MapResult1 = VisibilityControl.getHeaderBinding():map(function(p2): UDim2
			-- upvalues: UseSelectorResult1 (copy), UseSignalStateResult (copy), UseStateResult (copy)
			return UDim2.new(0, 0, 0, UseSelectorResult1 + p2 * (UseSignalStateResult - UseSelectorResult1) + UseStateResult)
		end)
	elseif FFlagAppIaScrollAway then
		YOffset, UseStateResult2_1 = ReactModule.useState(0)
		
		if FFlagLuaAppChartsStickyHeader then
			v2, Callback = ReactModule.useBinding(0)
		end
		UseResult1 = ReactModule.useCallback(function(Frame: Frame)
			-- upvalues: UseStateResult2_1 (ref), FFlagLuaAppChartsStickyHeader (upval), Callback (ref)
			UseStateResult2_1(Frame.AbsoluteSize.Y)
			
			if FFlagLuaAppChartsStickyHeader then
				Callback(Frame.AbsoluteSize.Y)
			end
		end, {})
	end
	return ReactModule.createElement(if AppIaHomeSubTabFrame then "Frame" else View, {
		BackgroundColor3 = if AppIaHomeSubTabFrame then UseDesignTokensResult.LuaApps.App.Page.BackgroundColor else nil,
		BackgroundTransparency = if AppIaHomeSubTabFrame then UseDesignTokensResult.LuaApps.App.Page.BackgroundTransparency else nil,
		BorderSizePixel = if AppIaHomeSubTabFrame then 0 else nil,
		Size = if AppIaHomeSubTabFrame then UDim2.fromScale(1, 1) else nil,
		backgroundStyle = if AppIaHomeSubTabFrame then nil else {
			Color3 = UseDesignTokensResult.LuaApps.App.Page.BackgroundColor,
			Transparency = UseDesignTokensResult.LuaApps.App.Page.BackgroundTransparency
		},
		tag = if AppIaHomeSubTabFrame then nil else { ["size-full"] = true, col = not FFlagAppIaScrollAway },
		ref = Ref
	}, {
		UIListLayout = if AppIaHomeSubTabFrame and not FFlagAppIaScrollAway then ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}) else nil,
		HeaderFocusRoot = ReactModule.createElement(FocusNavigableSurfaceWrapper, {
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.HeaderView,
			frameProps = {
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = if AppIaHomeSubTabFrame then -1 else nil,
				Size = UDim2.fromScale(1, 0),
				ZIndex = 2,
				[ReactModule.Tag] = if FFlagLuaAppCompositionHomeHeaderFullBleed then nil elseif FFlagLuaAppCompositionHome then CompositionTags.ContentRegion.Header else nil
			}
		}, {
			StatusBarBackground = if FFlagAppIaStatusBar then ReactModule.createElement(if AppIaHomeSubTabFrame then "Frame" else View, {
				ZIndex = 2,
				BackgroundColor3 = if AppIaHomeSubTabFrame then UseDesignTokensResult.LuaApps.App.Page.BackgroundColor else nil,
				BorderSizePixel = if AppIaHomeSubTabFrame then 0 else nil,
				backgroundStyle = if AppIaHomeSubTabFrame then nil else {
					Transparency = 0,
					Color3 = UseDesignTokensResult.LuaApps.App.Page.BackgroundColor
				},
				Size = UDim2.new(1, 0, 0, UseSelectorResult)
			}) else nil,
			HeaderBackground = if AppIaHomeSubTabFrame1 then ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 0,
				AnchorPoint = Vector2.new(0, 1),
				BackgroundColor3 = UseDesignTokensResult.LuaApps.App.Page.BackgroundColor,
				Position = MapResult1,
				Size = UDim2.new(1, 0, 0, YOffset)
			}) else nil,
			Header = ReactModule.createElement(if AppIaHomeSubTabFrame then "Frame" else View, {
				AutomaticSize = if AppIaHomeSubTabFrame1 or not AppIaHomeSubTabFrame then nil else Enum.AutomaticSize.Y,
				BackgroundColor3 = if AppIaHomeSubTabFrame then UseDesignTokensResult.LuaApps.App.Page.BackgroundColor else nil,
				BackgroundTransparency = if AppIaHomeSubTabFrame1 then 1 else nil,
				BorderSizePixel = if AppIaHomeSubTabFrame then 0 else nil,
				Size = if AppIaHomeSubTabFrame1 then UDim2.new(1, 0, 0, YOffset) elseif AppIaHomeSubTabFrame then UDim2.fromScale(1, 0) else nil,
				[ReactModule.Change.AbsoluteSize] = if AppIaHomeSubTabFrame1 or not AppIaHomeSubTabFrame or not FFlagAppIaScrollAway then nil else UseResult1,
				[ReactModule.Tag] = if AppIaHomeSubTabFrame and (FFlagLuaAppCompositionHomeHeaderFullBleed and FFlagLuaAppCompositionHome) then CompositionTags.ContentRegion.Header else nil,
				tag = if AppIaHomeSubTabFrame then nil elseif FFlagLuaAppCompositionHomeHeaderFullBleed and FFlagLuaAppCompositionHome then `col size-full-0 auto-y {CompositionTags.ContentRegion.Header}` else "col size-full-0 auto-y",
				backgroundStyle = if AppIaHomeSubTabFrame then nil else {
					Transparency = 0,
					Color3 = UseDesignTokensResult.LuaApps.App.Page.BackgroundColor
				},
				onAbsoluteSizeChanged = if AppIaHomeSubTabFrame or not FFlagAppIaScrollAway then nil else UseResult1
			}, {
				UIListLayout = if AppIaHomeSubTabFrame1 or not AppIaHomeSubTabFrame then nil else ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				AppHeaderBar = ReactModule.createElement(if AppIaHomeSubTabFrame then "Frame" else View, {
					LayoutOrder = 1,
					AutomaticSize = if AppIaHomeSubTabFrame1 or not AppIaHomeSubTabFrame then nil else Enum.AutomaticSize.Y,
					BackgroundTransparency = if AppIaHomeSubTabFrame then 1 else nil,
					Position = if AppIaHomeSubTabFrame1 then UDim2.fromScale(0, 0) else nil,
					Size = if AppIaHomeSubTabFrame1 then UDim2.new(1, 0, 0, UseSignalStateResult) elseif AppIaHomeSubTabFrame then UDim2.fromScale(1, 0) else nil,
					tag = if AppIaHomeSubTabFrame then nil else "size-full-0 auto-y"
				}, {
					PersonalizationTopBar = ReactModule.createElement(PersonalizationTopBarModule, {
						sideMarginOverride = if FFlagLuaAppCompositionHome then 0 else nil
					})
				}),
				SubTabs = ReactModule.createElement(if AppIaHomeSubTabFrame then "Frame" else View, {
					AutomaticSize = if AppIaHomeSubTabFrame then Enum.AutomaticSize.Y else nil,
					BackgroundTransparency = if AppIaHomeSubTabFrame then 1 else nil,
					Position = if AppIaHomeSubTabFrame1 then MapResult else nil,
					Size = if AppIaHomeSubTabFrame then UDim2.fromScale(1, 0) else nil,
					tag = if AppIaHomeSubTabFrame then nil else "size-full-0 auto-y",
					LayoutOrder = 2,
					ref = if AppIaHomeSubTabFrame1 then UseResult2 else nil,
					[ReactModule.Change.AbsoluteSize] = if AppIaHomeSubTabFrame1 then UseResult2 else nil
				}, {
					UIPadding = if FFlagLuaAppCompositionHome then nil else ReactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, UsePageSideMarginResult),
						PaddingRight = UDim.new(0, UsePageSideMarginResult)
					}),
					Tabs = ReactModule.createElement(Tabs, {
						activeTabId = RouteName,
						onActivated = UseResult,
						tabs = UseMemoResult,
						size = InputSize.Medium,
						fillBehavior = Fill
					})
				})
			})
		}),
		HomeSubTabNavigator = ReactModule.createElement(v1, {
			navigation = p1.navigation,
			screenProps = if FFlagAppIaScrollAway then {
				headerHeight = YOffset,
				headerHeightBinding = if FFlagLuaAppChartsStickyHeader then v2 else nil,
				scrollAwayHeight = if AppIaHomeSubTabFrame1 then v3 else nil,
				subTabsBottomBinding = if AppIaHomeSubTabFrame1 then MapResult1 else nil
			} else nil
		})
	})
end)
ForwardRefResult.router = v1.router

return ForwardRefResult