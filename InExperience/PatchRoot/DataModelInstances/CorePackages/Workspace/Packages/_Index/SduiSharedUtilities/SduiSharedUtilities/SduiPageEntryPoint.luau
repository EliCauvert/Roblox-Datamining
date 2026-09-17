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
local fFlagLuaAppSduiStickyHeaderScrollAway = require(parent.SharedFlags).FFlagLuaAppSduiStickyHeaderScrollAway
local fFlagSduiSrpScrollAway = require(parent.SharedFlags).FFlagSduiSrpScrollAway
local fFlagLuaAppSduiVideoThumbnail = require(parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail

local function SduiPageEntryPoint(p1, p2)
	-- upvalues: useTokens (ref), useDispatch (ref), fFlagSduiPageEntryUseSharedHooks (ref), useComponentConfigModule (ref), reactModule (ref), getSduiApiStoreModule (ref), signalsReactModule (ref), useUiStatusModule (ref), uiStatus (ref), fFlagSduiPageEntryPointResolvedSlot (ref), useComponentLifecycleTimingModule (ref), useLocalAnalyticsDataModule (ref), useStatefulRefModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateBack (ref), reactFocusNavigationModule (ref), useCloseWithBackButton (ref), fFlagLuaAppSduiPageEntryPointSnackbar (ref), usePageEntrySnackbarModule (ref), useDataUpdatedTimestampModule (ref), useCreateClientBindingSduiContextModule (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref), fFlagLuaAppSduiVideoThumbnail (ref), getSduiComponentWrapper (ref), fFlagLuaAppMediaGalleryGamepadSupport (ref), fFlagSduiSrpScrollAway (ref), sduiPageNavigationHeaderModule (ref), compositionTags (ref), navButtonType (ref), foundationModule (ref), loading (ref), sduiPageErrorStateModule (ref), reactRobloxModule (ref), snackbar (ref), coreGuiService (ref)
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
		var11(var12, u344)
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
	local createElement_1
	local var21 = reactModule.useCallback(function()
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
	local _, var22 = reactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior(var15)
	local var23 = useCloseWithBackButton(var22, var21)
	local var24 = if fFlagLuaAppSduiPageEntryPointSnackbar then usePageEntrySnackbarModule(configKey) else nil
	local var25 = useDataUpdatedTimestampModule(configKey, p1.identifier)
	local var26, var27 = reactModule.useState(nil)
	local var28 = useCreateClientBindingSduiContextModule(appPage, var26, nil, var25, configKey, nil, p1.routeName, if fFlagLuaAppSduiStickyHeaderScrollAway then p1.scrollAway else nil, if fFlagLuaAppSduiVideoThumbnail then p1.videoPlaybackContext else nil)
	local var29 = var14 == nil
	local var30 = reactModule.useMemo(function()
		-- upvalues: var5 (write), getSduiComponentWrapper (copy), reactModule (copy), var2 (ref), var28 (ref), var16 (ref), p1 (ref), fFlagLuaAppSduiStickyHeaderScrollAway (copy), fFlagLuaAppMediaGalleryGamepadSupport (copy), fFlagSduiSrpScrollAway (copy)
		return if var5 == nil then nil else reactModule.createElement(getSduiComponentWrapper(var5), {
			debugName = var2,
			componentConfig = var5,
			sduiContext = var28,
			localAnalyticsData = var16,
			extraLocalProps = {
				pageBottomPadding = p1.pageBottomPadding,
				feedTopMargin = if fFlagLuaAppSduiStickyHeaderScrollAway then p1.feedTopMargin else nil,
				scrollingFrameRef = p1.scrollingFrameRef,
				scrollToSelectionRevealOnly = if fFlagLuaAppMediaGalleryGamepadSupport then p1.scrollToSelectionRevealOnly else nil,
				onScrollDirectionChanged = if fFlagSduiSrpScrollAway then p1.onScrollDirectionChanged else nil,
				defaultContentTag = p1.contentTag,
				defaultStickyContentTag = p1.stickyContentTag
			}
		})
	end, {
		var5, var2, var28, var16, p1.contentTag, p1.stickyContentTag,
		p1.pageBottomPadding,
		if fFlagLuaAppSduiStickyHeaderScrollAway then p1.feedTopMargin else nil,
		p1.scrollingFrameRef,
		if fFlagLuaAppMediaGalleryGamepadSupport then p1.scrollToSelectionRevealOnly else nil,
		if fFlagSduiSrpScrollAway then p1.onScrollDirectionChanged else nil
	})
	local var31 = p1.scrollingFrameRef ~= nil
	local createElement = reactModule.createElement
	local var32 = "Frame"
	local t = {
		[reactModule.Tag] = p1.layoutTag,
		Size = UDim2.new(1, 0, if var31 then 0 else 1, 0),
		AutomaticSize = if var31 then Enum.AutomaticSize.Y else nil,
		BorderSizePixel = 0,
		BackgroundTransparency = if p1.backgroundStyle then p1.backgroundStyle.Transparency else 0,
		BackgroundColor3 = if p1.backgroundStyle then p1.backgroundStyle.Color3 else var3.Color.Surface.Surface_0.Color3,
		ref = var23,
		ClipsDescendants = p1.clipsDescendantsOverride ~= nil or p1.clipsDescendantsOverride
	}
	local t_1 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		PageTopPadding = if p1.pageTopPadding and p1.pageTopPadding > 0 then reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, p1.pageTopPadding) }) else nil
	}
	
	if var29 then
		createElement_1 = nil
	elseif p1.includeNavigationHeaderBar then
		local scrollAwayHeader
		createElement_1 = reactModule.createElement
		local var33 = sduiPageNavigationHeaderModule
		local t_2 = {
			layoutOrder = 1,
			title = var6,
			contentTag = p1.headerContentTag or compositionTags.ContentRegion.Header,
			renderUtilities = p1.renderUtilities,
			navButtonType = p1.navButtonType or navButtonType.back,
			closeCallback = var21
		}
		
		if fFlagLuaAppSduiStickyHeaderScrollAway then
			scrollAwayHeader = p1.scrollAway ~= nil
			scrollAwayHeader = nil
		else
			scrollAwayHeader = p1.scrollAwayHeader
		end
		t_2.scrollAwayHeader = scrollAwayHeader
		createElement_1 = createElement_1(var33, t_2)
	else
		createElement_1 = nil
	end
	local var34
	t_1.PageHeader = createElement_1
	
	if var8 then
		var34 = if p1.loadingSlot then p1.loadingSlot else reactModule.createElement(foundationModule.View, { Size = UDim2.new(1, 0, 1, 0) }, reactModule.createElement(loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}))
	elseif var9 then
		var34 = if p1.errorSlot then p1.errorSlot else reactModule.createElement(sduiPageErrorStateModule, { refresh = p1.refresh })
	else
		var34 = reactModule.createElement
		var34 = var34("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, if var31 then 0 else 1, 0),
			AutomaticSize = if var31 then Enum.AutomaticSize.Y else nil,
			ref = var27
		}, {
			UIFlexItem = if var31 then nil else reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			Content = if var29 then nil elseif fFlagSduiPageEntryPointResolvedSlot and p1.resolvedSlot then p1.resolvedSlot else var30
		})
	end
	t_1.PageBody = var34
	t_1.SnackbarPortal = if var24 and var24.snackbarConfig then reactRobloxModule.createPortal({
		SduiSnackbarScreenGui = reactModule.createElement("ScreenGui", {
			IgnoreGuiInset = true,
			DisplayOrder = p1.snackbarPortalLayoutOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			Snackbar = reactModule.createElement(snackbar, {
				title = var24.snackbarConfig.title,
				icon = var24.snackbarConfig.icon,
				Position = UDim2.new(0.5, 0, 1, -var3.Padding.XLarge),
				AnchorPoint = Vector2.new(0.5, 1),
				AutomaticSize = Enum.AutomaticSize.XY,
				onClose = var24.onDismiss
			})
		})
	}, coreGuiService) else nil
	
	return createElement(var32, t, t_1)
end

return if fFlagSduiPageEntryUseSharedHooks then reactModule.memo(reactModule.forwardRef(SduiPageEntryPoint)) else reactModule.memo(SduiPageEntryPoint)