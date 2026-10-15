local coreGuiService = game:GetService("CoreGui")
local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactRobloxModule = require(parent.ReactRoblox)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local loading = foundationModule.Loading
local useTokens = foundationModule.Hooks.useTokens
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local useCloseWithBackButton = require(parent.AppBlox).useCloseWithBackButton
local signalsReactModule = require(parent.SignalsReact)
local getSduiComponentWrapper = require(parent.SduiCoreSystem).getSduiComponentWrapper
local compositionTags = require(parent.AppComposition).CompositionTags
local getSduiApiStoreModule = require(sduiSharedUtilities.getSduiApiStore)
local _ = require(sduiSharedUtilities.SduiLoadTimer)
local sduiPageNavigationHeaderModule = require(sduiSharedUtilities.SduiPageNavigationHeader)
local useCreateClientBindingSduiContextModule = require(sduiSharedUtilities.useCreateClientBindingSduiContext)
local navButtonType = require(sduiSharedUtilities.SduiIntegrationTypes).NavButtonType
local sduiPageErrorStateModule = require(sduiSharedUtilities.SduiPageErrorState)
local usePageEntrySnackbarModule = require(sduiSharedUtilities.usePageEntrySnackbar)
local useComponentLifecycleTimingModule = require(sduiSharedUtilities.hooks.useComponentLifecycleTiming)
local useLocalAnalyticsDataModule = require(sduiSharedUtilities.hooks.useLocalAnalyticsData)
local useStatefulRefModule = require(sduiSharedUtilities.hooks.useStatefulRef)
local useComponentConfigModule = require(sduiSharedUtilities.hooks.useComponentConfig)
local useUiStatusModule = require(sduiSharedUtilities.hooks.useUiStatus)
local useDataUpdatedTimestampModule = require(sduiSharedUtilities.hooks.useDataUpdatedTimestamp)
local uiStatus = require(sduiSharedUtilities.SduiIntegrationTypes).UiStatus
local snackbar = foundationModule.Snackbar
local fFlagLuaAppSduiPageEntryPointSnackbar = require(parent.SharedFlags).FFlagLuaAppSduiPageEntryPointSnackbar
local fFlagSduiPageEntryUseSharedHooks = require(parent.SharedFlags).FFlagSduiPageEntryUseSharedHooks
local fFlagLuaAppMediaGalleryGamepadSupport = require(parent.SharedFlags).FFlagLuaAppMediaGalleryGamepadSupport
local fFlagSduiPageEntryPointResolvedSlot = require(parent.SharedFlags).FFlagSduiPageEntryPointResolvedSlot
local fFlagSduiSrpScrollAway = require(parent.SharedFlags).FFlagSduiSrpScrollAway
local fFlagAppThemeHalloween2026HomeBackground = require(parent.SharedFlags).FFlagAppThemeHalloween2026HomeBackground
local fFlagSduiVerticalFeedScrollTelemetry = require(parent.SharedFlags).FFlagSduiVerticalFeedScrollTelemetry
local fFlagLuaAppSduiVideoThumbnail = require(parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local fFlagLuaAppOneByTwoHoverIdleAutoplay = require(parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay

local function SduiPageEntryPoint(p1, p2)
	-- upvalues: useTokens (ref), useDispatch (ref), fFlagSduiPageEntryUseSharedHooks (ref), useComponentConfigModule (ref), reactModule (ref), getSduiApiStoreModule (ref), signalsReactModule (ref), useUiStatusModule (ref), uiStatus (ref), fFlagSduiPageEntryPointResolvedSlot (ref), useComponentLifecycleTimingModule (ref), useLocalAnalyticsDataModule (ref), useStatefulRefModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateBack (ref), reactFocusNavigationModule (ref), useCloseWithBackButton (ref), fFlagLuaAppSduiPageEntryPointSnackbar (ref), usePageEntrySnackbarModule (ref), useDataUpdatedTimestampModule (ref), useCreateClientBindingSduiContextModule (ref), fFlagLuaAppSduiVideoThumbnail (ref), fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), getSduiComponentWrapper (ref), fFlagLuaAppMediaGalleryGamepadSupport (ref), fFlagSduiSrpScrollAway (ref), fFlagSduiVerticalFeedScrollTelemetry (ref), fFlagAppThemeHalloween2026HomeBackground (ref), sduiPageNavigationHeaderModule (ref), compositionTags (ref), navButtonType (ref), foundationModule (ref), loading (ref), sduiPageErrorStateModule (ref), reactRobloxModule (ref), snackbar (ref), coreGuiService (ref)
	local appPage = p1.appPage
	local configKey = p1.configKey or appPage
	local var2 = `SduiPageEntryPoint-{configKey}`
	local pageTimer = p1.pageTimer
	local var3 = useTokens()
	local var4 = useDispatch()
	local var5 = if fFlagSduiPageEntryUseSharedHooks then useComponentConfigModule(configKey, p1.identifier) else signalsReactModule.useSignalState(reactModule.useCallback(function(p3)
		-- upvalues: getSduiApiStoreModule (copy), configKey (ref), p1 (ref)
		return getSduiApiStoreModule().getRootConfig(configKey, p3, p1.identifier)
	end, { configKey, p1.identifier }))
	local var6 = signalsReactModule.useSignalState(reactModule.useCallback(function(p3)
		-- upvalues: getSduiApiStoreModule (copy), configKey (ref)
		return getSduiApiStoreModule().getTitle(configKey, p3)
	end, { configKey })) or p1.pageTitle
	local var7 = useUiStatusModule(configKey)
	local var8 = var7 == uiStatus.Loading
	local var9 = var7 == uiStatus.Error
	local var10 = fFlagSduiPageEntryPointResolvedSlot and (p1.resolvedSlot ~= nil and (not var8 and not var9))
	
	if fFlagSduiPageEntryUseSharedHooks then
		local var11 = useComponentLifecycleTimingModule
		local var12 = pageTimer
		local _ = true
		local var13 = typeof(var5)
		local _ = var13 == "table" and ((if var13 == "table" then fFlagSduiPageEntryPointResolvedSlot else nil) and var10)
		var11(var12, u357)
	else
		reactModule.useEffect(function()
			-- upvalues: pageTimer (ref)
			if pageTimer then
				pageTimer.logComponentMounted()
			end
		end, { pageTimer })
		reactModule.useEffect(function()
			-- upvalues: pageTimer (ref), var5 (write), fFlagSduiPageEntryPointResolvedSlot (copy), var10 (ref)
			if pageTimer and (var5 or fFlagSduiPageEntryPointResolvedSlot and var10) then
				pageTimer.logComponentReady()
			end
		end, {
			pageTimer,
			var5,
			if fFlagSduiPageEntryPointResolvedSlot then var10 else nil
		})
	end
	local var14, var15
	local var16 = if fFlagSduiPageEntryUseSharedHooks then useLocalAnalyticsDataModule(configKey, appPage, p1.additionalAnalyticsData) else reactModule.useMemo(function()
		-- upvalues: configKey (ref), appPage (ref)
		return { configKey = configKey, appPage = appPage }
	end, { configKey, appPage })
	local _ = nil
	local _ = nil
	
	if fFlagSduiPageEntryUseSharedHooks then
		local var17, var18 = useStatefulRefModule(p2)
		var14 = var17
		var15 = var18
	else
		local var19, var20 = reactModule.useState(nil)
		var14 = var19
		var15 = var20
		reactModule.useRef(var14).current = var14
	end
	local var21
	local var22 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var4 (ref), navigateBack (copy)
		if p1.onCloseActivated then
			p1.onCloseActivated()
			
			return
		elseif fFlagSignalsNavP3Dispatch then
			var1.back()
			
			return
		end
		var4(navigateBack())
	end, { var4, p1.onCloseActivated })
	local _, var23 = reactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior(var15)
	local var24 = useCloseWithBackButton(var23, var22)
	local var25 = if fFlagLuaAppSduiPageEntryPointSnackbar then usePageEntrySnackbarModule(configKey) else nil
	local var26 = useDataUpdatedTimestampModule(configKey, p1.identifier)
	local var27, var28 = reactModule.useState(nil)
	local var29 = useCreateClientBindingSduiContextModule(appPage, var27, nil, var26, configKey, nil, p1.routeName, p1.scrollAway, if fFlagLuaAppSduiVideoThumbnail or fFlagLuaAppOneByTwoHoverIdleAutoplay then p1.videoPlaybackContext else nil)
	local var30 = var14 == nil
	local var31 = reactModule.useMemo(function()
		-- upvalues: var5 (write), getSduiComponentWrapper (copy), reactModule (copy), var2 (ref), var29 (ref), var16 (ref), p1 (ref), fFlagLuaAppMediaGalleryGamepadSupport (copy), fFlagSduiSrpScrollAway (copy), fFlagSduiVerticalFeedScrollTelemetry (copy), fFlagAppThemeHalloween2026HomeBackground (copy)
		return if var5 == nil then nil else reactModule.createElement(getSduiComponentWrapper(var5), {
			debugName = var2,
			componentConfig = var5,
			sduiContext = var29,
			localAnalyticsData = var16,
			extraLocalProps = {
				pageBottomPadding = p1.pageBottomPadding,
				feedTopMargin = p1.feedTopMargin,
				scrollingFrameRef = p1.scrollingFrameRef,
				scrollToSelectionRevealOnly = if fFlagLuaAppMediaGalleryGamepadSupport then p1.scrollToSelectionRevealOnly else nil,
				onScrollDirectionChanged = if fFlagSduiSrpScrollAway then p1.onScrollDirectionChanged else nil,
				defaultContentTag = p1.contentTag,
				defaultStickyContentTag = p1.stickyContentTag,
				scrollPerformanceIntervalName = if fFlagSduiVerticalFeedScrollTelemetry then p1.scrollPerformanceIntervalName else nil,
				backgroundStyle = if fFlagAppThemeHalloween2026HomeBackground then p1.feedBackgroundStyle else nil
			}
		})
	end, {
		var5, var2, var29, var16, p1.contentTag, p1.stickyContentTag,
		p1.pageBottomPadding, p1.feedTopMargin, p1.scrollingFrameRef,
		if fFlagLuaAppMediaGalleryGamepadSupport then p1.scrollToSelectionRevealOnly else nil,
		if fFlagSduiSrpScrollAway then p1.onScrollDirectionChanged else nil,
		if fFlagSduiVerticalFeedScrollTelemetry then p1.scrollPerformanceIntervalName else nil,
		if fFlagAppThemeHalloween2026HomeBackground then p1.feedBackgroundStyle else nil
	})
	local var32 = p1.scrollingFrameRef ~= nil
	local createElement = reactModule.createElement
	local var33 = "Frame"
	local t = {
		[reactModule.Tag] = p1.layoutTag,
		Size = UDim2.new(1, 0, if var32 then 0 else 1, 0),
		AutomaticSize = if var32 then Enum.AutomaticSize.Y else nil,
		BorderSizePixel = 0,
		BackgroundTransparency = if p1.backgroundStyle then p1.backgroundStyle.Transparency else 0,
		BackgroundColor3 = if p1.backgroundStyle then p1.backgroundStyle.Color3 else var3.Color.Surface.Surface_0.Color3,
		ref = var24,
		ClipsDescendants = p1.clipsDescendantsOverride ~= nil or p1.clipsDescendantsOverride
	}
	local t_1 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		PageTopPadding = if p1.pageTopPadding and p1.pageTopPadding > 0 then reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, p1.pageTopPadding) }) else nil,
		PageHeader = if var30 then nil elseif p1.includeNavigationHeaderBar then reactModule.createElement(sduiPageNavigationHeaderModule, {
			layoutOrder = 1,
			title = var6,
			contentTag = p1.headerContentTag or compositionTags.ContentRegion.Header,
			renderUtilities = p1.renderUtilities,
			navButtonType = p1.navButtonType or navButtonType.back,
			closeCallback = var22,
			scrollAwayHeader = p1.scrollAway ~= nil
		}) else nil
	}
	
	if var8 then
		var21 = if p1.loadingSlot then p1.loadingSlot else reactModule.createElement(foundationModule.View, { Size = UDim2.new(1, 0, 1, 0) }, reactModule.createElement(loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}))
	elseif var9 then
		var21 = if p1.errorSlot then p1.errorSlot else reactModule.createElement(sduiPageErrorStateModule, { refresh = p1.refresh })
	else
		var21 = reactModule.createElement
		var21 = var21("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, if var32 then 0 else 1, 0),
			AutomaticSize = if var32 then Enum.AutomaticSize.Y else nil,
			ref = var28
		}, {
			UIFlexItem = if var32 then nil else reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			Content = if var30 then nil elseif fFlagSduiPageEntryPointResolvedSlot and p1.resolvedSlot then p1.resolvedSlot else var31
		})
	end
	t_1.PageBody = var21
	t_1.SnackbarPortal = if var25 and var25.snackbarConfig then reactRobloxModule.createPortal({
		SduiSnackbarScreenGui = reactModule.createElement("ScreenGui", {
			IgnoreGuiInset = true,
			DisplayOrder = p1.snackbarPortalLayoutOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			Snackbar = reactModule.createElement(snackbar, {
				title = var25.snackbarConfig.title,
				icon = var25.snackbarConfig.icon,
				Position = UDim2.new(0.5, 0, 1, -var3.Padding.XLarge),
				AnchorPoint = Vector2.new(0.5, 1),
				AutomaticSize = Enum.AutomaticSize.XY,
				onClose = var25.onDismiss
			})
		})
	}, coreGuiService) else nil
	
	return createElement(var33, t, t_1)
end

return if fFlagSduiPageEntryUseSharedHooks then reactModule.memo(reactModule.forwardRef(SduiPageEntryPoint)) else reactModule.memo(SduiPageEntryPoint)