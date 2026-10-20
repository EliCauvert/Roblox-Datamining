local CoreGui = game:GetService("CoreGui")
local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local FoundationModule = require(Parent.Foundation)
local Loading = FoundationModule.Loading
local Snackbar = FoundationModule.Snackbar
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local VisibilityControl = require(Parent.AppNavBar).VisibilityControl
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local UseCloseWithBackButtonFunction = require(Parent.AppBlox).useCloseWithBackButton
local GetSduiComponentWrapperFunction = require(Parent.SduiCoreSystem).getSduiComponentWrapper
local Page = require(Parent.AppPageShell).Page
local Signal = require(Parent.AppCommonLib).Signal
local UseCreateClientBindingSduiContextModule = require(SduiSharedUtilities.useCreateClientBindingSduiContext)
local UiStatus = require(SduiSharedUtilities.SduiIntegrationTypes).UiStatus
local SduiPageErrorStateModule = require(SduiSharedUtilities.SduiPageErrorState)
local _ = require(SduiSharedUtilities.SduiLoadTimer)
local UseLocalAnalyticsDataModule = require(SduiSharedUtilities.hooks.useLocalAnalyticsData)
local UseStatefulRefModule = require(SduiSharedUtilities.hooks.useStatefulRef)
local UseComponentConfigModule = require(SduiSharedUtilities.hooks.useComponentConfig)
local UseUiStatusModule = require(SduiSharedUtilities.hooks.useUiStatus)
local UseDataUpdatedTimestampModule = require(SduiSharedUtilities.hooks.useDataUpdatedTimestamp)
local UseSduiPageContentModule = require(SduiSharedUtilities.hooks.useSduiPageContent)
local UsePageEntrySnackbarModule = require(SduiSharedUtilities.usePageEntrySnackbar)
local FFlagAppPageShellScrollToTopFocus = require(Parent.SharedFlags).FFlagAppPageShellScrollToTopFocus
local FFlagLuaAppsDefaultSelection = require(Parent.SharedFlags).FFlagLuaAppsDefaultSelection
local FFlagAppThemeHalloween2026HomeBackground = require(Parent.SharedFlags).FFlagAppThemeHalloween2026HomeBackground

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: UseTokensFunction (copy), UseDispatchFunction (copy), UseComponentConfigModule (copy), UseUiStatusModule (copy), UiStatus (copy), UseLocalAnalyticsDataModule (copy), ReactModule (copy), Signal (copy), UseStatefulRefModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), ReactFocusNavigationModule (copy), UseCloseWithBackButtonFunction (copy), FFlagAppPageShellScrollToTopFocus (copy), UsePageEntrySnackbarModule (copy), UseDataUpdatedTimestampModule (copy), UseCreateClientBindingSduiContextModule (copy), UseSduiPageContentModule (copy), FFlagLuaAppsDefaultSelection (copy), GetSduiComponentWrapperFunction (copy), FoundationModule (copy), Loading (copy), SduiPageErrorStateModule (copy), VisibilityControl (copy), Page (copy), FFlagAppThemeHalloween2026HomeBackground (copy), ReactRobloxModule (copy), Snackbar (copy), CoreGui (copy)
	local AppPage = p1.appPage
	local ConfigKey = p1.configKey or AppPage
	local SduiPageWrapperEntryPointName: string = `SduiPageWrapperEntryPoint-{ConfigKey}`
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseComponentConfigModuleResult = UseComponentConfigModule(ConfigKey, p1.stickyIdentifier)
	local UseUiStatusModuleResult = UseUiStatusModule(ConfigKey)
	local IsUseUiStatusModuleResultMatch = UseUiStatusModuleResult == UiStatus.Loading
	local IsUseUiStatusModuleResultMatch1 = UseUiStatusModuleResult == UiStatus.Error
	local UseLocalAnalyticsDataModuleResult = UseLocalAnalyticsDataModule(ConfigKey, AppPage, p1.additionalAnalyticsData)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Signal (upval)
		return Signal.new()
	end, {})
	local RefreshFunction = p1.refresh
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), RefreshFunction (copy)
		UseMemoResult:fire()
		
		return if RefreshFunction then RefreshFunction() else nil
	end, { UseMemoResult, RefreshFunction })
	local _, UseStatefulRefModuleResult2 = UseStatefulRefModule(p2)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval)
		if p1.onCloseActivated then
			p1.onCloseActivated()
			
			return
		end
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.back()
			
			return
		else
			UseDispatchResult(NavigateBackFunction())
		end
	end, { UseDispatchResult, p1.onCloseActivated })
	local _, UseMostRecentOrDefaultFocusBehaviorResult2 = ReactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior(UseStatefulRefModuleResult2)
	local UseCloseWithBackButtonResult = UseCloseWithBackButtonFunction(UseMostRecentOrDefaultFocusBehaviorResult2, if FFlagAppPageShellScrollToTopFocus and p1.handleBackButton == false then nil else UseResult1)
	local UsePageEntrySnackbarModuleResult = UsePageEntrySnackbarModule(ConfigKey)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseCreateClientBindingSduiContextModuleResult = UseCreateClientBindingSduiContextModule(AppPage, UseStateResult, nil, UseDataUpdatedTimestampModule(ConfigKey, p1.contentIdentifier), ConfigKey, nil, p1.routeName, p1.scrollAway, p1.videoPlaybackContext)
	local LocalStickyHeaderSlot = p1.localStickyHeaderSlot
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseComponentConfigModuleResult (copy), GetSduiComponentWrapperFunction (upval), ReactModule (upval), SduiPageWrapperEntryPointName (copy), UseCreateClientBindingSduiContextModuleResult (copy), UseLocalAnalyticsDataModuleResult (copy), LocalStickyHeaderSlot (copy)
		local Element = if p1.stickyIdentifier ~= nil and UseComponentConfigModuleResult ~= nil then ReactModule.createElement(GetSduiComponentWrapperFunction(UseComponentConfigModuleResult), {
			debugName = `{SduiPageWrapperEntryPointName}-sticky`,
			componentConfig = UseComponentConfigModuleResult,
			sduiContext = UseCreateClientBindingSduiContextModuleResult,
			localAnalyticsData = UseLocalAnalyticsDataModuleResult
		}) else nil
		
		if LocalStickyHeaderSlot == nil and Element == nil then
			return nil
		end
		local List = {}
		
		if LocalStickyHeaderSlot ~= nil then
			for _, value in LocalStickyHeaderSlot do
				table.insert(List, value)
			end
		end
		if Element ~= nil then
			table.insert(List, Element)
		end
		return List
	end, {
		p1.stickyIdentifier, UseComponentConfigModuleResult,
		UseCreateClientBindingSduiContextModuleResult,
		UseLocalAnalyticsDataModuleResult, SduiPageWrapperEntryPointName,
		LocalStickyHeaderSlot
	})
	local HasNextEntry: boolean = UseMemoResult1 ~= nil and next(UseMemoResult1) ~= nil
	local FeedTopMargin = p1.feedTopMargin
	local ScrollAway = p1.scrollAway
	local PageTopPadding = p1.pageTopPadding
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = if p1.backgroundStyle then p1.backgroundStyle.Transparency else 0,
		BackgroundColor3 = if p1.backgroundStyle then p1.backgroundStyle.Color3 else UseTokensResult.Color.Surface.Surface_0.Color3,
		ref = UseCloseWithBackButtonResult
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		PageBody = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			ref = UseStateResult2
		}, {
			UIFlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			Content = ReactModule.createElement(Page, {
				contentConfig = UseSduiPageContentModule({
					configKey = ConfigKey,
					contentIdentifier = p1.contentIdentifier,
					contentMode = p1.contentMode,
					sduiContext = UseCreateClientBindingSduiContextModuleResult,
					localAnalyticsData = UseLocalAnalyticsDataModuleResult,
					debugName = SduiPageWrapperEntryPointName,
					pageTimer = p1.pageTimer,
					refreshSignal = UseMemoResult,
					defaultFocusRef = if FFlagAppPageShellScrollToTopFocus and FFlagLuaAppsDefaultSelection then p1.defaultFocusRef else nil
				}),
				stickyHeaderSlot = UseMemoResult1,
				composition = p1.composition,
				chrome = ReactModule.useMemo(function()
					-- upvalues: PageTopPadding (copy), ScrollAway (copy), VisibilityControl (upval)
					local PageTopPadding1 = PageTopPadding or 0
					
					if PageTopPadding1 <= 0 then
						return nil
					end
					local HeaderHeightBinding = if ScrollAway then ScrollAway.headerHeightBinding else nil
					
					if HeaderHeightBinding == nil and ScrollAway and ScrollAway.scrollAwayHeight then
						local ScrollAwayHeight = ScrollAway.scrollAwayHeight
						HeaderHeightBinding = VisibilityControl.getHeaderBinding():map(function(p3)
							-- upvalues: ScrollAwayHeight (copy)
							return p3 * ScrollAwayHeight
						end)
					end
					return {
						height = PageTopPadding1,
						scrollAwayHeight = if ScrollAway then ScrollAway.scrollAwayHeight else nil,
						liveHeightBinding = HeaderHeightBinding
					}
				end, { PageTopPadding, ScrollAway }),
				stickyBackgroundStyle = FFlagAppThemeHalloween2026HomeBackground and p1.stickyBackgroundStyle or p1.backgroundStyle,
				onScrollToEnd = p1.onScrollToEnd,
				onScrollToEndThreshold = p1.onScrollToEndThreshold,
				onRefresh = if RefreshFunction then UseResult else nil,
				appEventName = AppPage,
				contentTopPadding = if HasNextEntry then p1.stickyBottomPadding else FeedTopMargin,
				stickyTopPadding = if HasNextEntry then p1.stickyTopPadding or FeedTopMargin else nil
			}),
			StateOverlay = if IsUseUiStatusModuleResultMatch then p1.loadingSlot or ReactModule.createElement(FoundationModule.View, { tag = "size-full", ZIndex = 2 }, ReactModule.createElement(Loading, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			})) elseif IsUseUiStatusModuleResultMatch1 then p1.errorSlot or ReactModule.createElement(SduiPageErrorStateModule, { refresh = p1.refresh }) else nil
		}),
		SnackbarPortal = if UsePageEntrySnackbarModuleResult and UsePageEntrySnackbarModuleResult.snackbarConfig then ReactRobloxModule.createPortal({
			SduiSnackbarScreenGui = ReactModule.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				DisplayOrder = p1.snackbarPortalLayoutOrder,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			}, {
				Snackbar = ReactModule.createElement(Snackbar, {
					title = UsePageEntrySnackbarModuleResult.snackbarConfig.title,
					icon = UsePageEntrySnackbarModuleResult.snackbarConfig.icon,
					Position = UDim2.new(0.5, 0, 1, -UseTokensResult.Padding.XLarge),
					AnchorPoint = Vector2.new(0.5, 1),
					AutomaticSize = Enum.AutomaticSize.XY,
					onClose = UsePageEntrySnackbarModuleResult.onDismiss
				})
			})
		}, CoreGui) else nil
	})
end))