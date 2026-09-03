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
local dataHydrationTypes = dataHydrationModule.DataHydrationTypes
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
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagSduiEventDetailsSupport = require(parent.SharedFlags).FFlagSduiEventDetailsSupport
local fFlagSduiPageEntryUseSharedHooks = require(parent.SharedFlags).FFlagSduiPageEntryUseSharedHooks
local fFlagSduiPageEntryPointResolvedSlot = require(parent.SharedFlags).FFlagSduiPageEntryPointResolvedSlot
local fFlagSduiUseSharedUiStatusHook = require(parent.SharedFlags).FFlagSduiUseSharedUiStatusHook
local fFlagLuaAppSduiPageEntryScrollAway = require(parent.SharedFlags).FFlagLuaAppSduiPageEntryScrollAway
local fFlagLuaAppSduiStickyHeaderScrollAway = require(parent.SharedFlags).FFlagLuaAppSduiStickyHeaderScrollAway
local fFlagSduiSrpScrollAway = require(parent.SharedFlags).FFlagSduiSrpScrollAway
local fFlagLuaAppSduiVideoThumbnail = require(parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail

local function SduiPageEntryPoint(p1, p2)
	-- upvalues: useTokens (ref), useDispatch (ref), fFlagSduiPageEntryUseSharedHooks (ref), useComponentConfigModule (ref), reactModule (ref), getSduiApiStoreModule (ref), signalsReactModule (ref), fFlagSduiUseSharedUiStatusHook (ref), useUiStatusModule (ref), uiStatus (ref), dataHydrationTypes (ref), fFlagSduiPageEntryPointResolvedSlot (ref), useComponentLifecycleTimingModule (ref), useLocalAnalyticsDataModule (ref), useStatefulRefModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateBack (ref), reactFocusNavigationModule (ref), useCloseWithBackButton (ref), fFlagLuaAppSduiPageEntryPointSnackbar (ref), usePageEntrySnackbarModule (ref), useDataUpdatedTimestampModule (ref), useCreateClientBindingSduiContextModule (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref), fFlagLuaAppSduiVideoThumbnail (ref), getSduiComponentWrapper (ref), fFlagSduiSrpScrollAway (ref), sduiPageNavigationHeaderModule (ref), compositionTags (ref), navButtonType (ref), fFlagLuaAppSduiPageEntryScrollAway (ref), foundationModule (ref), loading (ref), sduiPageErrorStateModule (ref), reactRobloxModule (ref), snackbar (ref), coreGuiService (ref)
	local var2, var3
	local appPage = p1.appPage
	local configKey = p1.configKey or appPage
	local var4 = `SduiPageEntryPoint-{configKey}`
	local pageTimer = p1.pageTimer
	local var5 = useTokens()
	local var6 = useDispatch()
	local var7 = if fFlagSduiPageEntryUseSharedHooks then useComponentConfigModule(configKey, p1.identifier) else signalsReactModule.useSignalState(reactModule.useCallback(function(p3)
		-- upvalues: getSduiApiStoreModule (copy), configKey (ref), p1 (ref)
		return getSduiApiStoreModule().getRootConfig(configKey, p3, p1.identifier)
	end, { configKey, p1.identifier }))
	local var8 = signalsReactModule.useSignalState(reactModule.useCallback(function(p3)
		-- upvalues: getSduiApiStoreModule (copy), configKey (ref)
		return getSduiApiStoreModule().getTitle(configKey, p3)
	end, { configKey })) or p1.pageTitle
	local _ = nil
	local _ = nil
	
	if fFlagSduiUseSharedUiStatusHook then
		local var9 = useUiStatusModule(configKey)
		var2 = var9 == uiStatus.Loading
		local _ = var9 == uiStatus.Error
	else
		local var10 = signalsReactModule.useSignalState(getSduiApiStoreModule().getData(configKey).status)
		var2 = var10 == dataHydrationTypes.DataStatus.NotReady
		var3 = var10 == dataHydrationTypes.DataStatus.Failed
	end
	local var11 = fFlagSduiPageEntryPointResolvedSlot and (p1.resolvedSlot ~= nil and (not var2 and not var3))
	
	if fFlagSduiPageEntryUseSharedHooks then
		local var12 = useComponentLifecycleTimingModule
		local var13 = pageTimer
		local _ = true
		local var14 = typeof(var7)
		local _ = var14 == "table" and ((if var14 == "table" then fFlagSduiPageEntryPointResolvedSlot else nil) and var11)
		var12(var13, u374)
	else
		reactModule.useEffect(function()
			-- upvalues: pageTimer (ref)
			if pageTimer then
				pageTimer.logComponentMounted()
			end
		end, { pageTimer })
		reactModule.useEffect(function()
			-- upvalues: pageTimer (ref), var7 (write), fFlagSduiPageEntryPointResolvedSlot (copy), var11 (ref)
			if pageTimer and (var7 or fFlagSduiPageEntryPointResolvedSlot and var11) then
				pageTimer.logComponentReady()
			end
		end, {
			pageTimer,
			var7,
			if fFlagSduiPageEntryPointResolvedSlot then var11 else nil
		})
	end
	local var15, var16
	local var17 = if fFlagSduiPageEntryUseSharedHooks then useLocalAnalyticsDataModule(configKey, appPage, p1.additionalAnalyticsData) else reactModule.useMemo(function()
		-- upvalues: configKey (ref), appPage (ref)
		return { configKey = configKey, appPage = appPage }
	end, { configKey, appPage })
	local _ = nil
	local _ = nil
	
	if fFlagSduiPageEntryUseSharedHooks then
		local var18, var19 = useStatefulRefModule(p2)
		var15 = var18
		var16 = var19
	else
		local var20, var21 = reactModule.useState(nil)
		var15 = var20
		var16 = var21
		reactModule.useRef(var15).current = var15
	end
	local createElement_1
	local var22 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var6 (ref), navigateBack (copy)
		if p1.onCloseActivated then
			p1.onCloseActivated()
			
			return
		elseif fFlagSignalsNavP3Dispatch then
			var1.back()
			
			return
		end
		var6(navigateBack())
	end, { var6, p1.onCloseActivated })
	local _, var23 = reactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior(var16)
	local var24 = useCloseWithBackButton(var23, var22)
	local var25 = if fFlagLuaAppSduiPageEntryPointSnackbar then usePageEntrySnackbarModule(configKey) else nil
	local var26 = useDataUpdatedTimestampModule(configKey, p1.identifier)
	local var27, var28 = reactModule.useState(nil)
	local var29 = useCreateClientBindingSduiContextModule(appPage, var27, nil, var26, if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then configKey else nil, nil, p1.routeName, if fFlagLuaAppSduiStickyHeaderScrollAway then p1.scrollAway else nil, if fFlagLuaAppSduiVideoThumbnail then p1.videoPlaybackContext else nil)
	local var30 = var15 == nil
	local var31 = reactModule.useMemo(function()
		-- upvalues: var7 (write), getSduiComponentWrapper (copy), reactModule (copy), var4 (ref), var29 (ref), var17 (ref), p1 (ref), fFlagLuaAppSduiStickyHeaderScrollAway (copy), fFlagSduiSrpScrollAway (copy)
		return if var7 == nil then nil else reactModule.createElement(getSduiComponentWrapper(var7), {
			debugName = var4,
			componentConfig = var7,
			sduiContext = var29,
			localAnalyticsData = var17,
			extraLocalProps = {
				pageBottomPadding = p1.pageBottomPadding,
				feedTopMargin = if fFlagLuaAppSduiStickyHeaderScrollAway then p1.feedTopMargin else nil,
				scrollingFrameRef = p1.scrollingFrameRef,
				onScrollDirectionChanged = if fFlagSduiSrpScrollAway then p1.onScrollDirectionChanged else nil,
				defaultContentTag = p1.contentTag,
				defaultStickyContentTag = p1.stickyContentTag
			}
		})
	end, {
		var7, var4, var29, var17, p1.contentTag, p1.stickyContentTag,
		p1.pageBottomPadding,
		if fFlagLuaAppSduiStickyHeaderScrollAway then p1.feedTopMargin else nil,
		p1.scrollingFrameRef,
		if fFlagSduiSrpScrollAway then p1.onScrollDirectionChanged else nil
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
		BackgroundColor3 = if p1.backgroundStyle then p1.backgroundStyle.Color3 else var5.Color.Surface.Surface_0.Color3,
		ref = var24,
		ClipsDescendants = if fFlagSduiExperienceDetailsSupport and p1.clipsDescendantsOverride ~= nil then p1.clipsDescendantsOverride else true
	}
	local t_1 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		PageTopPadding = if p1.pageTopPadding and p1.pageTopPadding > 0 then reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, p1.pageTopPadding) }) else nil
	}
	
	if var30 then
		createElement_1 = nil
	elseif p1.includeNavigationHeaderBar then
		local var34
		createElement_1 = reactModule.createElement
		local var35 = sduiPageNavigationHeaderModule
		local t_2 = {
			layoutOrder = 1,
			title = var8,
			contentTag = p1.headerContentTag or compositionTags.ContentRegion.Header,
			renderUtilities = p1.renderUtilities,
			navButtonType = p1.navButtonType or navButtonType.back,
			closeCallback = var22
		}
		
		if fFlagLuaAppSduiStickyHeaderScrollAway then
			var34 = p1.scrollAway ~= nil
			var34 = nil
		else
			var34 = if fFlagLuaAppSduiPageEntryScrollAway then p1.scrollAwayHeader else nil
		end
		t_2.scrollAwayHeader = var34
		createElement_1 = createElement_1(var35, t_2)
	else
		createElement_1 = nil
	end
	local var36
	t_1.PageHeader = createElement_1
	
	if var2 then
		var36 = if p1.loadingSlot then p1.loadingSlot else reactModule.createElement(foundationModule.View, { Size = UDim2.new(1, 0, 1, 0) }, reactModule.createElement(loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}))
	elseif var3 then
		var36 = if p1.errorSlot then p1.errorSlot else reactModule.createElement(sduiPageErrorStateModule, { refresh = p1.refresh })
	else
		var36 = reactModule.createElement
		var36 = var36("Frame", {
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
	t_1.PageBody = var36
	t_1.SnackbarPortal = if var25 and var25.snackbarConfig then reactRobloxModule.createPortal({
		SduiSnackbarScreenGui = reactModule.createElement("ScreenGui", {
			IgnoreGuiInset = true,
			DisplayOrder = p1.snackbarPortalLayoutOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			Snackbar = reactModule.createElement(snackbar, {
				title = var25.snackbarConfig.title,
				icon = var25.snackbarConfig.icon,
				Position = UDim2.new(0.5, 0, 1, -var5.Padding.XLarge),
				AnchorPoint = Vector2.new(0.5, 1),
				AutomaticSize = Enum.AutomaticSize.XY,
				onClose = var25.onDismiss
			})
		})
	}, coreGuiService) else nil
	
	return createElement(var33, t, t_1)
end

return if fFlagSduiPageEntryUseSharedHooks then reactModule.memo(reactModule.forwardRef(SduiPageEntryPoint)) else reactModule.memo(SduiPageEntryPoint)