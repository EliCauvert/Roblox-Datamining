local coreGuiService = game:GetService("CoreGui")
local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactRobloxModule = require(parent.ReactRoblox)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local loading = foundationModule.Loading
local useTokens = foundationModule.Hooks.useTokens
local dataHydrationModule = require(parent.DataHydration)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var7 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local useCloseWithBackButton = require(parent.AppBlox).useCloseWithBackButton
local signalsReactModule = require(parent.SignalsReact)
local collectionViewsModule = require(parent.CollectionViews)
local getSduiComponentWrapper = require(parent.SduiCoreSystem).getSduiComponentWrapper
local compositionTags = require(parent.AppComposition).CompositionTags
local getSduiApiStoreModule = require(sduiSharedUtilities.getSduiApiStore)
local _ = require(sduiSharedUtilities.SduiLoadTimer)
local sduiPageNavigationHeaderModule = require(sduiSharedUtilities.SduiPageNavigationHeader)
local useCreateClientBindingSduiContextModule = require(sduiSharedUtilities.useCreateClientBindingSduiContext)
local navButtonType = require(sduiSharedUtilities.SduiIntegrationTypes).NavButtonType
local sduiPageErrorStateModule = require(sduiSharedUtilities.SduiPageErrorState)
local dataHydrationTypes = dataHydrationModule.DataHydrationTypes
local usePageSideMargin = collectionViewsModule.usePageSideMargin
local usePageEntrySnackbarModule = require(sduiSharedUtilities.usePageEntrySnackbar)
local useComponentLifecycleTimingModule = require(sduiSharedUtilities.hooks.useComponentLifecycleTiming)
local useLocalAnalyticsDataModule = require(sduiSharedUtilities.hooks.useLocalAnalyticsData)
local useStatefulRefModule = require(sduiSharedUtilities.hooks.useStatefulRef)
local useComponentConfigModule = require(sduiSharedUtilities.hooks.useComponentConfig)
local useUiStatusModule = require(sduiSharedUtilities.hooks.useUiStatus)
local useDataUpdatedTimestampModule = require(sduiSharedUtilities.hooks.useDataUpdatedTimestamp)
local uiStatus = require(sduiSharedUtilities.SduiIntegrationTypes).UiStatus
local snackbar = foundationModule.Snackbar
local fFlagLuaAppSduiBadgeDetailsComponents = require(parent.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents
local fFlagSduiFeedOptionalScrollingFrameFix = require(parent.SharedFlags).FFlagSduiFeedOptionalScrollingFrameFix
local fFlagLuaAppSduiPageEntryPointSnackbar = require(parent.SharedFlags).FFlagLuaAppSduiPageEntryPointSnackbar
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagSduiEventDetailsSupport = require(parent.SharedFlags).FFlagSduiEventDetailsSupport
local fFlagSduiPageEntryUseSharedHooks = require(parent.SharedFlags).FFlagSduiPageEntryUseSharedHooks
local fFlagLuaAppCompositionSduiEnabled = require(parent.SharedFlags).FFlagLuaAppCompositionSduiEnabled
local fFlagSduiUseSharedUiStatusHook = require(parent.SharedFlags).FFlagSduiUseSharedUiStatusHook
local fFlagSduiChartsSupport = require(parent.SharedFlags).FFlagSduiChartsSupport
local fFlagSduiPageEntryCustomSlots = require(parent.SharedFlags).FFlagSduiPageEntryCustomSlots
local fFlagLuaAppSduiPageEntryScrollAway = require(parent.SharedFlags).FFlagLuaAppSduiPageEntryScrollAway
local fFlagLuaAppSduiRouteName = require(parent.SharedFlags).FFlagLuaAppSduiRouteName

local function SduiPageEntryPoint(p0, p1) --[[ line: 143 ]]
	-- upvalues: useTokens (ref), useDispatch (ref), fFlagSduiPageEntryUseSharedHooks (ref), useComponentConfigModule (ref), reactModule (ref), getSduiApiStoreModule (ref), fFlagLuaAppSduiBadgeDetailsComponents (ref), signalsReactModule (ref), fFlagSduiUseSharedUiStatusHook (ref), useUiStatusModule (ref), uiStatus (ref), dataHydrationTypes (ref), useComponentLifecycleTimingModule (ref), useLocalAnalyticsDataModule (ref), useStatefulRefModule (ref), fFlagSignalsNavP3Dispatch (ref), var7 (ref), navigateBack (ref), reactFocusNavigationModule (ref), useCloseWithBackButton (ref), fFlagLuaAppSduiPageEntryPointSnackbar (ref), usePageEntrySnackbarModule (ref), fFlagSduiChartsSupport (ref), useDataUpdatedTimestampModule (ref), useCreateClientBindingSduiContextModule (ref), fFlagLuaAppCompositionSduiEnabled (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagLuaAppSduiRouteName (ref), usePageSideMargin (ref), getSduiComponentWrapper (ref), fFlagSduiFeedOptionalScrollingFrameFix (ref), sduiPageNavigationHeaderModule (ref), compositionTags (ref), navButtonType (ref), fFlagLuaAppSduiPageEntryScrollAway (ref), fFlagSduiPageEntryCustomSlots (ref), foundationModule (ref), loading (ref), sduiPageErrorStateModule (ref), reactRobloxModule (ref), snackbar (ref), coreGuiService (ref)
	local var29, var30
	local appPage = p0.appPage
	local configKey = p0.configKey or appPage
	local var23 = `SduiPageEntryPoint-{configKey}`
	local pageTimer = p0.pageTimer
	local var24 = useTokens()
	local var25 = useDispatch()
	local var26 = if fFlagSduiPageEntryUseSharedHooks then useComponentConfigModule(configKey, p0.identifier) else signalsReactModule.useSignalState(reactModule.useCallback(function(p2) --[[ line: 157 ]]
		-- upvalues: getSduiApiStoreModule (copy), configKey (ref), fFlagLuaAppSduiBadgeDetailsComponents (copy), p0 (ref)
		return getSduiApiStoreModule().getRootConfig(configKey, p2, if fFlagLuaAppSduiBadgeDetailsComponents then p0.identifier else nil)
	end, {
		configKey,
		if fFlagLuaAppSduiBadgeDetailsComponents then p0.identifier else nil
	}))
	local var27 = signalsReactModule.useSignalState(reactModule.useCallback(function(p3) --[[ line: 168 ]]
		-- upvalues: getSduiApiStoreModule (copy), configKey (ref)
		return getSduiApiStoreModule().getTitle(configKey, p3)
	end, { configKey })) or p0.pageTitle
	local _ = nil
	local _ = nil
	
	if fFlagSduiUseSharedUiStatusHook then
		local var31 = useUiStatusModule(configKey)
		var29 = var31 == uiStatus.Loading
		local _ = var31 == uiStatus.Error
	else
		local var28 = signalsReactModule.useSignalState(getSduiApiStoreModule().getData(configKey).status)
		var29 = var28 == dataHydrationTypes.DataStatus.NotReady
		var30 = var28 == dataHydrationTypes.DataStatus.Failed
	end
	if fFlagSduiPageEntryUseSharedHooks then
		useComponentLifecycleTimingModule(pageTimer, typeof(var26) == "table")
	else
		reactModule.useEffect(function() --[[ line: 188 ]]
			-- upvalues: pageTimer (ref)
			if pageTimer then
				pageTimer.logComponentMounted()
			end
		end, { pageTimer })
		reactModule.useEffect(function() --[[ line: 194 ]]
			-- upvalues: pageTimer (ref), var26 (write)
			if pageTimer and var26 then
				pageTimer.logComponentReady()
			end
		end, { pageTimer, var26 })
	end
	local var35, var36
	local var32 = if fFlagSduiPageEntryUseSharedHooks then useLocalAnalyticsDataModule(configKey, appPage, p0.additionalAnalyticsData) else reactModule.useMemo(function() --[[ line: 203 ]]
		-- upvalues: configKey (ref), appPage (ref)
		return { configKey = configKey, appPage = appPage }
	end, { configKey, appPage })
	local _ = nil
	local _ = nil
	
	if fFlagSduiPageEntryUseSharedHooks then
		local var37, var38 = useStatefulRefModule(p1)
		var35 = var37
		var36 = var38
	else
		local var33, var34 = reactModule.useState(nil)
		var35 = var33
		var36 = var34
		reactModule.useRef(var35).current = var35
	end
	local var50
	local var39 = reactModule.useCallback(function() --[[ line: 220 ]]
		-- upvalues: p0 (ref), fFlagSignalsNavP3Dispatch (copy), var7 (copy), var25 (ref), navigateBack (copy)
		if p0.onCloseActivated then
			p0.onCloseActivated()
			
			return
		elseif fFlagSignalsNavP3Dispatch then
			var7.back()
			
			return
		end
		var25(navigateBack())
	end, { var25, p0.onCloseActivated })
	local _, var40 = reactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior(var36)
	local var41 = useCloseWithBackButton(var40, var39)
	local var42 = if fFlagLuaAppSduiPageEntryPointSnackbar then usePageEntrySnackbarModule(configKey) else nil
	local var43 = if fFlagSduiChartsSupport then useDataUpdatedTimestampModule(configKey, p0.identifier) else nil
	local var44, var45 = reactModule.useState(nil)
	local var46 = useCreateClientBindingSduiContextModule(appPage, var44, if not fFlagLuaAppCompositionSduiEnabled then 0 else nil, if fFlagSduiChartsSupport then var43 else nil, if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then configKey else nil, nil, if fFlagLuaAppSduiRouteName then p0.routeName else nil)
	local var47 = var35 == nil
	local var48 = if not fFlagLuaAppCompositionSduiEnabled then usePageSideMargin(var35) else nil
	local var49 = reactModule.useMemo(function() --[[ line: 261 ]]
		-- upvalues: var26 (write), getSduiComponentWrapper (copy), reactModule (copy), var23 (ref), var46 (ref), var32 (ref), fFlagSduiFeedOptionalScrollingFrameFix (copy), p0 (ref), fFlagLuaAppCompositionSduiEnabled (copy), fFlagSduiChartsSupport (copy)
		return if var26 == nil then nil else reactModule.createElement(getSduiComponentWrapper(var26), {
			debugName = var23,
			componentConfig = var26,
			sduiContext = var46,
			localAnalyticsData = var32,
			extraLocalProps = if fFlagSduiFeedOptionalScrollingFrameFix then {
				pageBottomPadding = p0.pageBottomPadding,
				scrollingFrameRef = p0.scrollingFrameRef,
				defaultContentTag = if fFlagLuaAppCompositionSduiEnabled then p0.contentTag else nil,
				defaultStickyContentTag = if fFlagSduiChartsSupport then p0.stickyContentTag else nil
			} else nil
		})
	end, {
		var26, var23, var46, var32,
		if fFlagLuaAppCompositionSduiEnabled then p0.contentTag else nil,
		if fFlagSduiChartsSupport then p0.stickyContentTag else nil,
		if fFlagLuaAppCompositionSduiEnabled then p0.pageBottomPadding else nil,
		if fFlagLuaAppCompositionSduiEnabled then p0.scrollingFrameRef else nil
	})
	
	if fFlagSduiFeedOptionalScrollingFrameFix then
		var50 = p0.scrollingFrameRef ~= nil
		var50 = nil
	else
		var50 = nil
	end
	local createElement_1
	local createElement = reactModule.createElement
	local var51 = "Frame"
	local t = {
		[reactModule.Tag] = if fFlagLuaAppCompositionSduiEnabled then p0.layoutTag else nil,
		Size = UDim2.new(1, 0, if var50 then 0 else 1, 0),
		AutomaticSize = if var50 then Enum.AutomaticSize.Y else nil,
		BorderSizePixel = 0,
		BackgroundTransparency = if fFlagLuaAppSduiBadgeDetailsComponents and p0.backgroundStyle then p0.backgroundStyle.Transparency else 0,
		BackgroundColor3 = if fFlagLuaAppSduiBadgeDetailsComponents and p0.backgroundStyle then p0.backgroundStyle.Color3 else var24.Color.Surface.Surface_0.Color3,
		ref = var41,
		ClipsDescendants = if fFlagSduiExperienceDetailsSupport and p0.clipsDescendantsOverride ~= nil then p0.clipsDescendantsOverride else true
	}
	local t_1 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		PageTopPadding = if fFlagSduiChartsSupport and p0.pageTopPadding and p0.pageTopPadding > 0 then reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, p0.pageTopPadding) }) else nil,
		PageHeader = if var47 then nil elseif p0.includeNavigationHeaderBar then reactModule.createElement(sduiPageNavigationHeaderModule, {
			layoutOrder = 1,
			title = var27,
			contentTag = if fFlagLuaAppCompositionSduiEnabled then p0.headerContentTag or compositionTags.ContentRegion.Header else nil,
			pageSideMargin = if not fFlagLuaAppCompositionSduiEnabled then var48 else nil,
			renderUtilities = if fFlagLuaAppSduiBadgeDetailsComponents then p0.renderUtilities else nil,
			navButtonType = p0.navButtonType or navButtonType.back,
			closeCallback = var39,
			scrollAwayHeader = if fFlagLuaAppSduiPageEntryScrollAway then p0.scrollAwayHeader else nil
		}) else nil
	}
	
	if fFlagSduiFeedOptionalScrollingFrameFix and var29 then
		createElement_1 = if fFlagSduiPageEntryCustomSlots and p0.loadingSlot then p0.loadingSlot else reactModule.createElement(foundationModule.View, { Size = UDim2.new(1, 0, 1, 0) }, reactModule.createElement(loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}))
	elseif not fFlagSduiFeedOptionalScrollingFrameFix or not var30 then
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, if p0.disableRootPadding or fFlagLuaAppCompositionSduiEnabled then 0 else var48 * -2, if var50 then 0 else 1, 0),
			AutomaticSize = if var50 then Enum.AutomaticSize.Y else nil,
			ref = var45
		}, {
			UIFlexItem = if fFlagSduiFeedOptionalScrollingFrameFix and var50 then nil else reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			Content = if var47 then nil elseif not fFlagSduiFeedOptionalScrollingFrameFix and var29 then if fFlagSduiFeedOptionalScrollingFrameFix or not var30 then var49 else reactModule.createElement(sduiPageErrorStateModule, { refresh = p0.refresh }) else reactModule.createElement(loading, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			})
		})
	createElement_1 = if fFlagSduiPageEntryCustomSlots and p0.errorSlot then p0.errorSlot else reactModule.createElement(sduiPageErrorStateModule, { refresh = p0.refresh })
	t_1.PageBody = createElement_1
	t_1.SnackbarPortal = if var42 and var42.snackbarConfig then reactRobloxModule.createPortal({
		SduiSnackbarScreenGui = reactModule.createElement("ScreenGui", {
			IgnoreGuiInset = true,
			DisplayOrder = p0.snackbarPortalLayoutOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			Snackbar = reactModule.createElement(snackbar, {
				title = var42.snackbarConfig.title,
				icon = var42.snackbarConfig.icon,
				Position = UDim2.new(0.5, 0, 1, -var24.Padding.XLarge),
				AnchorPoint = Vector2.new(0.5, 1),
				AutomaticSize = Enum.AutomaticSize.XY,
				onClose = var42.onDismiss
			})
		})
	}, coreGuiService) else nil
	
	return createElement(var51, t, t_1)
end

return if fFlagSduiPageEntryUseSharedHooks then reactModule.memo(reactModule.forwardRef(SduiPageEntryPoint)) else reactModule.memo(SduiPageEntryPoint)