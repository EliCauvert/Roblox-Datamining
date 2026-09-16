local coreGuiService = game:GetService("CoreGui")
local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local foundationModule = require(parent.Foundation)
local loading = foundationModule.Loading
local snackbar = foundationModule.Snackbar
local useTokens = foundationModule.Hooks.useTokens
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local visibilityControl = require(parent.AppNavBar).VisibilityControl
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local useCloseWithBackButton = require(parent.AppBlox).useCloseWithBackButton
local getSduiComponentWrapper = require(parent.SduiCoreSystem).getSduiComponentWrapper
local page = require(parent.AppPageShell).Page
local signal = require(parent.AppCommonLib).Signal
local useCreateClientBindingSduiContextModule = require(sduiSharedUtilities.useCreateClientBindingSduiContext)
local uiStatus = require(sduiSharedUtilities.SduiIntegrationTypes).UiStatus
local sduiPageErrorStateModule = require(sduiSharedUtilities.SduiPageErrorState)
local _ = require(sduiSharedUtilities.SduiLoadTimer)
local useLocalAnalyticsDataModule = require(sduiSharedUtilities.hooks.useLocalAnalyticsData)
local useStatefulRefModule = require(sduiSharedUtilities.hooks.useStatefulRef)
local useComponentConfigModule = require(sduiSharedUtilities.hooks.useComponentConfig)
local useUiStatusModule = require(sduiSharedUtilities.hooks.useUiStatus)
local useDataUpdatedTimestampModule = require(sduiSharedUtilities.hooks.useDataUpdatedTimestamp)
local useSduiPageContentModule = require(sduiSharedUtilities.hooks.useSduiPageContent)
local usePageEntrySnackbarModule = require(sduiSharedUtilities.usePageEntrySnackbar)
local fFlagAppPageShellScrollToTopFocus = require(parent.SharedFlags).FFlagAppPageShellScrollToTopFocus
local fFlagLuaAppsDefaultSelection = require(parent.SharedFlags).FFlagLuaAppsDefaultSelection

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), useDispatch (ref), useComponentConfigModule (ref), useUiStatusModule (ref), uiStatus (ref), useLocalAnalyticsDataModule (ref), reactModule (ref), signal (ref), useStatefulRefModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateBack (ref), reactFocusNavigationModule (ref), useCloseWithBackButton (ref), fFlagAppPageShellScrollToTopFocus (ref), usePageEntrySnackbarModule (ref), useDataUpdatedTimestampModule (ref), useCreateClientBindingSduiContextModule (ref), useSduiPageContentModule (ref), fFlagLuaAppsDefaultSelection (ref), getSduiComponentWrapper (ref), foundationModule (ref), loading (ref), sduiPageErrorStateModule (ref), visibilityControl (ref), page (ref), reactRobloxModule (ref), snackbar (ref), coreGuiService (ref)
	local appPage = p1.appPage
	local configKey = p1.configKey or appPage
	local var2 = `SduiPageWrapperEntryPoint-{configKey}`
	local var3 = useTokens()
	local var4 = useDispatch()
	local var5 = useComponentConfigModule(configKey, p1.stickyIdentifier)
	local var6 = useUiStatusModule(configKey)
	local var7 = var6 == uiStatus.Loading
	local var8 = var6 == uiStatus.Error
	local var9 = useLocalAnalyticsDataModule(configKey, appPage, p1.additionalAnalyticsData)
	local var10 = reactModule.useMemo(function()
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local refresh = p1.refresh
	local var11 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), refresh (ref)
		var10:fire()
		
		return if refresh then refresh() else nil
	end, { var10, refresh })
	local _, var12 = useStatefulRefModule(p2)
	local var13 = reactModule.useCallback(function()
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
	local _, var14 = reactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior(var12)
	local var15 = useCloseWithBackButton(var14, if fFlagAppPageShellScrollToTopFocus and p1.handleBackButton == false then nil else var13)
	local var16 = usePageEntrySnackbarModule(configKey)
	local var17, var18 = reactModule.useState(nil)
	local var19 = useCreateClientBindingSduiContextModule(appPage, var17, nil, useDataUpdatedTimestampModule(configKey, p1.contentIdentifier), configKey, nil, p1.routeName, p1.scrollAway, p1.videoPlaybackContext)
	local var20 = useSduiPageContentModule({
		configKey = configKey,
		contentIdentifier = p1.contentIdentifier,
		contentMode = p1.contentMode,
		sduiContext = var19,
		localAnalyticsData = var9,
		debugName = var2,
		pageTimer = p1.pageTimer,
		refreshSignal = var10,
		defaultFocusRef = if fFlagAppPageShellScrollToTopFocus and fFlagLuaAppsDefaultSelection then p1.defaultFocusRef else nil
	})
	local localStickyHeaderSlot = p1.localStickyHeaderSlot
	local var21 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var5 (ref), getSduiComponentWrapper (copy), reactModule (copy), var2 (ref), var19 (ref), var9 (ref), localStickyHeaderSlot (ref)
		local var22 = if not (p1.stickyIdentifier == nil or var5 == nil) then reactModule.createElement(getSduiComponentWrapper(var5), {
			debugName = `{var2}-sticky`,
			componentConfig = var5,
			sduiContext = var19,
			localAnalyticsData = var9
		}) else nil
		
		if localStickyHeaderSlot == nil and var22 == nil then
			return nil
		end
		local t = {}
		
		if localStickyHeaderSlot ~= nil then
			for i, v in localStickyHeaderSlot do
				table.insert(t, v)
			end
		end
		if var22 ~= nil then
			table.insert(t, var22)
		end
		return t
	end, {
		p1.stickyIdentifier, var5, var19, var9, var2, localStickyHeaderSlot
	})
	local var23 = nil
	
	if var7 then
		var23 = p1.loadingSlot or reactModule.createElement(foundationModule.View, { tag = "size-full", ZIndex = 2 }, reactModule.createElement(loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}))
	elseif var8 then
		var23 = p1.errorSlot or reactModule.createElement(sduiPageErrorStateModule, { refresh = p1.refresh })
	end
	local var24 = var21 ~= nil and next(var21) ~= nil
	local feedTopMargin = p1.feedTopMargin
	local var25 = if var24 then p1.stickyTopPadding or feedTopMargin else nil
	local var26 = if var24 then p1.stickyBottomPadding else feedTopMargin
	local scrollAway = p1.scrollAway
	local pageTopPadding = p1.pageTopPadding
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = if p1.backgroundStyle then p1.backgroundStyle.Transparency else 0,
		BackgroundColor3 = if p1.backgroundStyle then p1.backgroundStyle.Color3 else var3.Color.Surface.Surface_0.Color3,
		ref = var15
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		PageBody = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			ref = var18
		}, {
			UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			Content = reactModule.createElement(page, {
				contentConfig = var20,
				stickyHeaderSlot = var21,
				composition = p1.composition,
				chrome = reactModule.useMemo(function()
					-- upvalues: pageTopPadding (ref), scrollAway (ref), visibilityControl (copy)
					local pageTopPadding_1 = pageTopPadding or 0
					
					if pageTopPadding_1 <= 0 then
						return nil
					end
					local var27 = if scrollAway then scrollAway.headerHeightBinding else nil
					
					if var27 == nil and scrollAway and scrollAway.scrollAwayHeight then
						local scrollAwayHeight = scrollAway.scrollAwayHeight
						var27 = visibilityControl.getHeaderBinding():map(function(p3)
							-- upvalues: scrollAwayHeight (ref)
							return p3 * scrollAwayHeight
						end)
					end
					return {
						height = pageTopPadding_1,
						scrollAwayHeight = if scrollAway then scrollAway.scrollAwayHeight else nil,
						liveHeightBinding = var27
					}
				end, { pageTopPadding, scrollAway }),
				stickyBackgroundStyle = p1.backgroundStyle,
				onScrollToEnd = p1.onScrollToEnd,
				onScrollToEndThreshold = p1.onScrollToEndThreshold,
				onRefresh = if refresh then var11 else nil,
				appEventName = appPage,
				contentTopPadding = var26,
				stickyTopPadding = var25
			}),
			StateOverlay = var23
		}),
		SnackbarPortal = if var16 and var16.snackbarConfig then reactRobloxModule.createPortal({
			SduiSnackbarScreenGui = reactModule.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				DisplayOrder = p1.snackbarPortalLayoutOrder,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			}, {
				Snackbar = reactModule.createElement(snackbar, {
					title = var16.snackbarConfig.title,
					icon = var16.snackbarConfig.icon,
					Position = UDim2.new(0.5, 0, 1, -var3.Padding.XLarge),
					AnchorPoint = Vector2.new(0.5, 1),
					AutomaticSize = Enum.AutomaticSize.XY,
					onClose = var16.onDismiss
				})
			})
		}, coreGuiService) else nil
	})
end))