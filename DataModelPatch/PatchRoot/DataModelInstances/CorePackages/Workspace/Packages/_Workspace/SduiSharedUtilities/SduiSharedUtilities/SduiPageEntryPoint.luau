local CoreGui = game:GetService("CoreGui")
local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local ReactRobloxModule = require(Parent.ReactRoblox)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Loading = FoundationModule.Loading
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local UseCloseWithBackButtonFunction = require(Parent.AppBlox).useCloseWithBackButton
local SignalsReactModule = require(Parent.SignalsReact)
local GetSduiComponentWrapperFunction = require(Parent.SduiCoreSystem).getSduiComponentWrapper
local CompositionTags = require(Parent.AppComposition).CompositionTags
local GetSduiApiStoreModule = require(SduiSharedUtilities.getSduiApiStore)
local _ = require(SduiSharedUtilities.SduiLoadTimer)
local SduiPageNavigationHeaderModule = require(SduiSharedUtilities.SduiPageNavigationHeader)
local UseCreateClientBindingSduiContextModule = require(SduiSharedUtilities.useCreateClientBindingSduiContext)
local NavButtonType = require(SduiSharedUtilities.SduiIntegrationTypes).NavButtonType
local SduiPageErrorStateModule = require(SduiSharedUtilities.SduiPageErrorState)
local DataHydrationTypes = require(Parent.DataHydration).DataHydrationTypes
local UsePageEntrySnackbarModule = require(SduiSharedUtilities.usePageEntrySnackbar)
local UseComponentLifecycleTimingModule = require(SduiSharedUtilities.hooks.useComponentLifecycleTiming)
local UseLocalAnalyticsDataModule = require(SduiSharedUtilities.hooks.useLocalAnalyticsData)
local UseStatefulRefModule = require(SduiSharedUtilities.hooks.useStatefulRef)
local UseComponentConfigModule = require(SduiSharedUtilities.hooks.useComponentConfig)
local UseUiStatusModule = require(SduiSharedUtilities.hooks.useUiStatus)
local UseDataUpdatedTimestampModule = require(SduiSharedUtilities.hooks.useDataUpdatedTimestamp)
local UiStatus = require(SduiSharedUtilities.SduiIntegrationTypes).UiStatus
local Snackbar = FoundationModule.Snackbar
local FFlagLuaAppSduiPageEntryPointSnackbar = require(Parent.SharedFlags).FFlagLuaAppSduiPageEntryPointSnackbar
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local FFlagSduiEventDetailsSupport = require(Parent.SharedFlags).FFlagSduiEventDetailsSupport
local FFlagSduiPageEntryUseSharedHooks = require(Parent.SharedFlags).FFlagSduiPageEntryUseSharedHooks
local FFlagSduiUseSharedUiStatusHook = require(Parent.SharedFlags).FFlagSduiUseSharedUiStatusHook
local FFlagSduiChartsSupport = require(Parent.SharedFlags).FFlagSduiChartsSupport
local FFlagSduiPageEntryCustomSlots = require(Parent.SharedFlags).FFlagSduiPageEntryCustomSlots
local FFlagLuaAppSduiPageEntryScrollAway = require(Parent.SharedFlags).FFlagLuaAppSduiPageEntryScrollAway

local function SduiPageEntryPoint(p1, p2)
	-- upvalues: UseTokensFunction (copy), UseDispatchFunction (copy), FFlagSduiPageEntryUseSharedHooks (copy), UseComponentConfigModule (copy), ReactModule (copy), GetSduiApiStoreModule (copy), SignalsReactModule (copy), FFlagSduiUseSharedUiStatusHook (copy), UseUiStatusModule (copy), UiStatus (copy), DataHydrationTypes (copy), UseComponentLifecycleTimingModule (copy), UseLocalAnalyticsDataModule (copy), UseStatefulRefModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), ReactFocusNavigationModule (copy), UseCloseWithBackButtonFunction (copy), FFlagLuaAppSduiPageEntryPointSnackbar (copy), UsePageEntrySnackbarModule (copy), FFlagSduiChartsSupport (copy), UseDataUpdatedTimestampModule (copy), UseCreateClientBindingSduiContextModule (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagSduiEventDetailsSupport (copy), GetSduiComponentWrapperFunction (copy), SduiPageNavigationHeaderModule (copy), CompositionTags (copy), NavButtonType (copy), FFlagLuaAppSduiPageEntryScrollAway (copy), FFlagSduiPageEntryCustomSlots (copy), FoundationModule (copy), Loading (copy), SduiPageErrorStateModule (copy), ReactRobloxModule (copy), Snackbar (copy), CoreGui (copy)
	local AppPage = p1.appPage
	local ConfigKey = p1.configKey or AppPage
	local SduiPageEntryPointName: string = `SduiPageEntryPoint-{ConfigKey}`
	local PageTimer = p1.pageTimer
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseComponentConfigModuleResult = nil
	UseComponentConfigModuleResult = if FFlagSduiPageEntryUseSharedHooks then UseComponentConfigModule(ConfigKey, p1.identifier) else SignalsReactModule.useSignalState((ReactModule.useCallback(function(p3)
		-- upvalues: GetSduiApiStoreModule (upval), ConfigKey (copy), p1 (copy)
		return GetSduiApiStoreModule().getRootConfig(ConfigKey, p3, p1.identifier)
	end, { ConfigKey, p1.identifier })))
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p3)
		-- upvalues: GetSduiApiStoreModule (upval), ConfigKey (copy)
		return GetSduiApiStoreModule().getTitle(ConfigKey, p3)
	end, { ConfigKey }))) or p1.pageTitle
	local IsUseUiStatusModuleResultMatch1 = nil
	local IsUseUiStatusModuleResultMatch = nil
	
	if FFlagSduiUseSharedUiStatusHook then
		local UseUiStatusModuleResult = UseUiStatusModule(ConfigKey)
		IsUseUiStatusModuleResultMatch = UseUiStatusModuleResult == UiStatus.Loading
		IsUseUiStatusModuleResultMatch1 = UseUiStatusModuleResult == UiStatus.Error
	else
		local UseSignalStateResult1 = SignalsReactModule.useSignalState(GetSduiApiStoreModule().getData(ConfigKey).status)
		IsUseUiStatusModuleResultMatch = UseSignalStateResult1 == DataHydrationTypes.DataStatus.NotReady
		IsUseUiStatusModuleResultMatch1 = UseSignalStateResult1 == DataHydrationTypes.DataStatus.Failed
	end
	if FFlagSduiPageEntryUseSharedHooks then
		UseComponentLifecycleTimingModule(PageTimer, typeof(UseComponentConfigModuleResult) == "table")
	else
		ReactModule.useEffect(function()
			-- upvalues: PageTimer (copy)
			if PageTimer then
				PageTimer.logComponentMounted()
			end
		end, { PageTimer })
		ReactModule.useEffect(function()
			-- upvalues: PageTimer (copy), UseComponentConfigModuleResult (ref)
			if PageTimer and UseComponentConfigModuleResult then
				PageTimer.logComponentReady()
			end
		end, { PageTimer, UseComponentConfigModuleResult })
	end
	local UseLocalAnalyticsDataModuleResult = if FFlagSduiPageEntryUseSharedHooks then UseLocalAnalyticsDataModule(ConfigKey, AppPage, p1.additionalAnalyticsData) else ReactModule.useMemo(function()
		-- upvalues: ConfigKey (copy), AppPage (copy)
		return { configKey = ConfigKey, appPage = AppPage }
	end, { ConfigKey, AppPage })
	local UseStatefulRefModuleResult = nil
	local UseStatefulRefModuleResult2 = nil
	
	if FFlagSduiPageEntryUseSharedHooks then
		UseStatefulRefModuleResult, UseStatefulRefModuleResult2 = UseStatefulRefModule(p2)
	else
		UseStatefulRefModuleResult, UseStatefulRefModuleResult2 = ReactModule.useState(nil)
		ReactModule.useRef(UseStatefulRefModuleResult).current = UseStatefulRefModuleResult
	end
	local UseResult = ReactModule.useCallback(function()
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
	local UseCloseWithBackButtonResult = UseCloseWithBackButtonFunction(UseMostRecentOrDefaultFocusBehaviorResult2, UseResult)
	local UsePageEntrySnackbarModuleResult = if FFlagLuaAppSduiPageEntryPointSnackbar then UsePageEntrySnackbarModule(ConfigKey) else nil
	local UseDataUpdatedTimestampModuleResult = if FFlagSduiChartsSupport then UseDataUpdatedTimestampModule(ConfigKey, p1.identifier) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseCreateClientBindingSduiContextModuleResult = UseCreateClientBindingSduiContextModule(AppPage, UseStateResult, nil, if FFlagSduiChartsSupport then UseDataUpdatedTimestampModuleResult else nil, if FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport then ConfigKey else nil, nil, p1.routeName)
	local NoUseStatefulRefModuleResult = UseStatefulRefModuleResult == nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseComponentConfigModuleResult (ref), GetSduiComponentWrapperFunction (upval), ReactModule (upval), SduiPageEntryPointName (copy), UseCreateClientBindingSduiContextModuleResult (copy), UseLocalAnalyticsDataModuleResult (copy), p1 (copy), FFlagSduiChartsSupport (upval)
		return if UseComponentConfigModuleResult == nil then nil else ReactModule.createElement(GetSduiComponentWrapperFunction(UseComponentConfigModuleResult), {
			debugName = SduiPageEntryPointName,
			componentConfig = UseComponentConfigModuleResult,
			sduiContext = UseCreateClientBindingSduiContextModuleResult,
			localAnalyticsData = UseLocalAnalyticsDataModuleResult,
			extraLocalProps = {
				pageBottomPadding = p1.pageBottomPadding,
				scrollingFrameRef = p1.scrollingFrameRef,
				defaultContentTag = p1.contentTag,
				defaultStickyContentTag = if FFlagSduiChartsSupport then p1.stickyContentTag else nil
			}
		})
	end, {
		UseComponentConfigModuleResult, SduiPageEntryPointName,
		UseCreateClientBindingSduiContextModuleResult,
		UseLocalAnalyticsDataModuleResult, p1.contentTag,
		if FFlagSduiChartsSupport then p1.stickyContentTag else nil,
		p1.pageBottomPadding, p1.scrollingFrameRef
	})
	local HasScrollingFrameRef = p1.scrollingFrameRef ~= nil
	
	return ReactModule.createElement("Frame", {
		[ReactModule.Tag] = p1.layoutTag,
		Size = UDim2.new(1, 0, if HasScrollingFrameRef then 0 else 1, 0),
		AutomaticSize = if HasScrollingFrameRef then Enum.AutomaticSize.Y else nil,
		BorderSizePixel = 0,
		BackgroundTransparency = if p1.backgroundStyle then p1.backgroundStyle.Transparency else 0,
		BackgroundColor3 = if p1.backgroundStyle then p1.backgroundStyle.Color3 else UseTokensResult.Color.Surface.Surface_0.Color3,
		ref = UseCloseWithBackButtonResult,
		ClipsDescendants = not FFlagSduiExperienceDetailsSupport or p1.clipsDescendantsOverride == nil or p1.clipsDescendantsOverride
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		PageTopPadding = if FFlagSduiChartsSupport and p1.pageTopPadding and p1.pageTopPadding > 0 then ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, p1.pageTopPadding) }) else nil,
		PageHeader = if NoUseStatefulRefModuleResult then nil elseif p1.includeNavigationHeaderBar then ReactModule.createElement(SduiPageNavigationHeaderModule, {
			layoutOrder = 1,
			title = UseSignalStateResult,
			contentTag = p1.headerContentTag or CompositionTags.ContentRegion.Header,
			renderUtilities = p1.renderUtilities,
			navButtonType = p1.navButtonType or NavButtonType.back,
			closeCallback = UseResult,
			scrollAwayHeader = if FFlagLuaAppSduiPageEntryScrollAway then p1.scrollAwayHeader else nil
		}) else nil,
		PageBody = if IsUseUiStatusModuleResultMatch then if FFlagSduiPageEntryCustomSlots and p1.loadingSlot then p1.loadingSlot else ReactModule.createElement(FoundationModule.View, { Size = UDim2.new(1, 0, 1, 0) }, ReactModule.createElement(Loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		})) elseif IsUseUiStatusModuleResultMatch1 then if FFlagSduiPageEntryCustomSlots and p1.errorSlot then p1.errorSlot else ReactModule.createElement(SduiPageErrorStateModule, { refresh = p1.refresh }) else ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, if HasScrollingFrameRef then 0 else 1, 0),
			AutomaticSize = if HasScrollingFrameRef then Enum.AutomaticSize.Y else nil,
			ref = UseStateResult2
		}, {
			UIFlexItem = if HasScrollingFrameRef then nil else ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			Content = if NoUseStatefulRefModuleResult then nil else UseMemoResult
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
end

return if FFlagSduiPageEntryUseSharedHooks then ReactModule.memo(ReactModule.forwardRef(SduiPageEntryPoint)) else ReactModule.memo(SduiPageEntryPoint)