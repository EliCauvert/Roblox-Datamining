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
local fFlagSduiChartsSupport = require(parent.SharedFlags).FFlagSduiChartsSupport
local fFlagLuaAppSduiPageEntryScrollAway = require(parent.SharedFlags).FFlagLuaAppSduiPageEntryScrollAway
local fFlagLuaAppSduiStickyHeaderScrollAway = require(parent.SharedFlags).FFlagLuaAppSduiStickyHeaderScrollAway
local fFlagSduiSrpScrollAway = require(parent.SharedFlags).FFlagSduiSrpScrollAway
local fFlagLuaAppSduiVideoThumbnail = require(parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail

local function SduiPageEntryPoint(p0, p1) --[[ line: 154 ]]
	-- upvalues: useTokens (ref), useDispatch (ref), fFlagSduiPageEntryUseSharedHooks (ref), useComponentConfigModule (ref), reactModule (ref), getSduiApiStoreModule (ref), signalsReactModule (ref), fFlagSduiUseSharedUiStatusHook (ref), useUiStatusModule (ref), uiStatus (ref), dataHydrationTypes (ref), fFlagSduiPageEntryPointResolvedSlot (ref), useComponentLifecycleTimingModule (ref), useLocalAnalyticsDataModule (ref), useStatefulRefModule (ref), fFlagSignalsNavP3Dispatch (ref), var7 (ref), navigateBack (ref), reactFocusNavigationModule (ref), useCloseWithBackButton (ref), fFlagLuaAppSduiPageEntryPointSnackbar (ref), usePageEntrySnackbarModule (ref), fFlagSduiChartsSupport (ref), useDataUpdatedTimestampModule (ref), useCreateClientBindingSduiContextModule (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEventDetailsSupport (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref), fFlagLuaAppSduiVideoThumbnail (ref), getSduiComponentWrapper (ref), fFlagSduiSrpScrollAway (ref), sduiPageNavigationHeaderModule (ref), compositionTags (ref), navButtonType (ref), fFlagLuaAppSduiPageEntryScrollAway (ref), foundationModule (ref), loading (ref), sduiPageErrorStateModule (ref), reactRobloxModule (ref), snackbar (ref), coreGuiService (ref)
	local var28, var29
	local appPage = p0.appPage
	local configKey = p0.configKey or appPage
	local var22 = `SduiPageEntryPoint-{configKey}`
	local pageTimer = p0.pageTimer
	local var23 = useTokens()
	local var24 = useDispatch()
	local var25 = if fFlagSduiPageEntryUseSharedHooks then useComponentConfigModule(configKey, p0.identifier) else signalsReactModule.useSignalState(reactModule.useCallback(function(p2) --[[ line: 168 ]]
		-- upvalues: getSduiApiStoreModule (copy), configKey (ref), p0 (ref)
		return getSduiApiStoreModule().getRootConfig(configKey, p2, p0.identifier)
	end, { configKey, p0.identifier }))
	local var26 = signalsReactModule.useSignalState(reactModule.useCallback(function(p3) --[[ line: 175 ]]
		-- upvalues: getSduiApiStoreModule (copy), configKey (ref)
		return getSduiApiStoreModule().getTitle(configKey, p3)
	end, { configKey })) or p0.pageTitle
	local _ = nil
	local _ = nil
	
	if fFlagSduiUseSharedUiStatusHook then
		local var30 = useUiStatusModule(configKey)
		var28 = var30 == uiStatus.Loading
		local _ = var30 == uiStatus.Error
	else
		local var27 = signalsReactModule.useSignalState(getSduiApiStoreModule().getData(configKey).status)
		var28 = var27 == dataHydrationTypes.DataStatus.NotReady
		var29 = var27 == dataHydrationTypes.DataStatus.Failed
	end
	local var31 = fFlagSduiPageEntryPointResolvedSlot and (p0.resolvedSlot ~= nil and (not var28 and not var29))
	
	if fFlagSduiPageEntryUseSharedHooks then
		local var32 = useComponentLifecycleTimingModule
		local var33 = pageTimer
		local _ = true
		local var34 = typeof(var25)
		local _ = var34 == "table" and ((if var34 == "table" then fFlagSduiPageEntryPointResolvedSlot else nil) and var31)
		var32(var33, u381)
	else
		reactModule.useEffect(function() --[[ line: 202 ]]
			-- upvalues: pageTimer (ref)
			if pageTimer then
				pageTimer.logComponentMounted()
			end
		end, { pageTimer })
		reactModule.useEffect(function() --[[ line: 209 ]]
			-- upvalues: pageTimer (ref), var25 (write), fFlagSduiPageEntryPointResolvedSlot (copy), var31 (ref)
			if pageTimer and (var25 or fFlagSduiPageEntryPointResolvedSlot and var31) then
				pageTimer.logComponentReady()
			end
		end, {
			pageTimer,
			var25,
			if fFlagSduiPageEntryPointResolvedSlot then var31 else nil
		})
	end
	local var38, var39
	local var35 = if fFlagSduiPageEntryUseSharedHooks then useLocalAnalyticsDataModule(configKey, appPage, p0.additionalAnalyticsData) else reactModule.useMemo(function() --[[ line: 224 ]]
		-- upvalues: configKey (ref), appPage (ref)
		return { configKey = configKey, appPage = appPage }
	end, { configKey, appPage })
	local _ = nil
	local _ = nil
	
	if fFlagSduiPageEntryUseSharedHooks then
		local var40, var41 = useStatefulRefModule(p1)
		var38 = var40
		var39 = var41
	else
		local var36, var37 = reactModule.useState(nil)
		var38 = var36
		var39 = var37
		reactModule.useRef(var38).current = var38
	end
	local createElement_1
	local var42 = reactModule.useCallback(function() --[[ line: 241 ]]
		-- upvalues: p0 (ref), fFlagSignalsNavP3Dispatch (copy), var7 (copy), var24 (ref), navigateBack (copy)
		if p0.onCloseActivated then
			p0.onCloseActivated()
			
			return
		elseif fFlagSignalsNavP3Dispatch then
			var7.back()
			
			return
		end
		var24(navigateBack())
	end, { var24, p0.onCloseActivated })
	local _, var43 = reactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior(var39)
	local var44 = useCloseWithBackButton(var43, var42)
	local var45 = if fFlagLuaAppSduiPageEntryPointSnackbar then usePageEntrySnackbarModule(configKey) else nil
	local var46 = if fFlagSduiChartsSupport then useDataUpdatedTimestampModule(configKey, p0.identifier) else nil
	local var47, var48 = reactModule.useState(nil)
	local var49 = useCreateClientBindingSduiContextModule(appPage, var47, nil, if fFlagSduiChartsSupport then var46 else nil, if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then configKey else nil, nil, p0.routeName, if fFlagLuaAppSduiStickyHeaderScrollAway then p0.scrollAway else nil, if fFlagLuaAppSduiVideoThumbnail then p0.videoPlaybackContext else nil)
	local var50 = var38 == nil
	local var51 = reactModule.useMemo(function() --[[ line: 280 ]]
		-- upvalues: var25 (write), getSduiComponentWrapper (copy), reactModule (copy), var22 (ref), var49 (ref), var35 (ref), p0 (ref), fFlagLuaAppSduiStickyHeaderScrollAway (copy), fFlagSduiSrpScrollAway (copy), fFlagSduiChartsSupport (copy)
		return if var25 == nil then nil else reactModule.createElement(getSduiComponentWrapper(var25), {
			debugName = var22,
			componentConfig = var25,
			sduiContext = var49,
			localAnalyticsData = var35,
			extraLocalProps = {
				pageBottomPadding = p0.pageBottomPadding,
				feedTopMargin = if fFlagLuaAppSduiStickyHeaderScrollAway then p0.feedTopMargin else nil,
				scrollingFrameRef = p0.scrollingFrameRef,
				onScrollDirectionChanged = if fFlagSduiSrpScrollAway then p0.onScrollDirectionChanged else nil,
				defaultContentTag = p0.contentTag,
				defaultStickyContentTag = if fFlagSduiChartsSupport then p0.stickyContentTag else nil
			}
		})
	end, {
		var25, var22, var49, var35, p0.contentTag,
		if fFlagSduiChartsSupport then p0.stickyContentTag else nil,
		p0.pageBottomPadding,
		if fFlagLuaAppSduiStickyHeaderScrollAway then p0.feedTopMargin else nil,
		p0.scrollingFrameRef,
		if fFlagSduiSrpScrollAway then p0.onScrollDirectionChanged else nil
	})
	local var52 = p0.scrollingFrameRef ~= nil
	local createElement = reactModule.createElement
	local var53 = "Frame"
	local t = {
		[reactModule.Tag] = p0.layoutTag,
		Size = UDim2.new(1, 0, if var52 then 0 else 1, 0),
		AutomaticSize = if var52 then Enum.AutomaticSize.Y else nil,
		BorderSizePixel = 0,
		BackgroundTransparency = if p0.backgroundStyle then p0.backgroundStyle.Transparency else 0,
		BackgroundColor3 = if p0.backgroundStyle then p0.backgroundStyle.Color3 else var23.Color.Surface.Surface_0.Color3,
		ref = var44,
		ClipsDescendants = if fFlagSduiExperienceDetailsSupport and p0.clipsDescendantsOverride ~= nil then p0.clipsDescendantsOverride else true
	}
	local t_1 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		PageTopPadding = if fFlagSduiChartsSupport and p0.pageTopPadding and p0.pageTopPadding > 0 then reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, p0.pageTopPadding) }) else nil
	}
	
	if var50 then
		createElement_1 = nil
	elseif p0.includeNavigationHeaderBar then
		local var58
		createElement_1 = reactModule.createElement
		local var56 = sduiPageNavigationHeaderModule
		local t_2 = {
			layoutOrder = 1,
			title = var26,
			contentTag = p0.headerContentTag or compositionTags.ContentRegion.Header,
			renderUtilities = p0.renderUtilities,
			navButtonType = p0.navButtonType or navButtonType.back,
			closeCallback = var42
		}
		
		if fFlagLuaAppSduiStickyHeaderScrollAway then
			var58 = p0.scrollAway ~= nil
			var58 = nil
		else
			var58 = if fFlagLuaAppSduiPageEntryScrollAway then p0.scrollAwayHeader else nil
		end
		t_2.scrollAwayHeader = var58
		createElement_1 = createElement_1(var56, t_2)
	else
		createElement_1 = nil
	end
	local var59
	t_1.PageHeader = createElement_1
	
	if var28 then
		var59 = if p0.loadingSlot then p0.loadingSlot else reactModule.createElement(foundationModule.View, { Size = UDim2.new(1, 0, 1, 0) }, reactModule.createElement(loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}))
	elseif var29 then
		var59 = if p0.errorSlot then p0.errorSlot else reactModule.createElement(sduiPageErrorStateModule, { refresh = p0.refresh })
	else
		var59 = reactModule.createElement
		var59 = var59("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, if var52 then 0 else 1, 0),
			AutomaticSize = if var52 then Enum.AutomaticSize.Y else nil,
			ref = var48
		}, {
			UIFlexItem = if var52 then nil else reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			Content = if var50 then nil elseif fFlagSduiPageEntryPointResolvedSlot and p0.resolvedSlot then p0.resolvedSlot else var51
		})
	end
	t_1.PageBody = var59
	t_1.SnackbarPortal = if var45 and var45.snackbarConfig then reactRobloxModule.createPortal({
		SduiSnackbarScreenGui = reactModule.createElement("ScreenGui", {
			IgnoreGuiInset = true,
			DisplayOrder = p0.snackbarPortalLayoutOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			Snackbar = reactModule.createElement(snackbar, {
				title = var45.snackbarConfig.title,
				icon = var45.snackbarConfig.icon,
				Position = UDim2.new(0.5, 0, 1, -var23.Padding.XLarge),
				AnchorPoint = Vector2.new(0.5, 1),
				AutomaticSize = Enum.AutomaticSize.XY,
				onClose = var45.onDismiss
			})
		})
	}, coreGuiService) else nil
	
	return createElement(var53, t, t_1)
end

return if fFlagSduiPageEntryUseSharedHooks then reactModule.memo(reactModule.forwardRef(SduiPageEntryPoint)) else reactModule.memo(SduiPageEntryPoint)