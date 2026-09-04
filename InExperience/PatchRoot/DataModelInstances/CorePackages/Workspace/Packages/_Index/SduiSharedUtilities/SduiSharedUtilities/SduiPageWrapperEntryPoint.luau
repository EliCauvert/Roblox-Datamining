local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local loading = foundationModule.Loading
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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), useDispatch (ref), useComponentConfigModule (ref), useUiStatusModule (ref), uiStatus (ref), useLocalAnalyticsDataModule (ref), reactModule (ref), signal (ref), useStatefulRefModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateBack (ref), reactFocusNavigationModule (ref), useCloseWithBackButton (ref), useDataUpdatedTimestampModule (ref), useCreateClientBindingSduiContextModule (ref), useSduiPageContentModule (ref), getSduiComponentWrapper (ref), foundationModule (ref), loading (ref), sduiPageErrorStateModule (ref), visibilityControl (ref), page (ref)
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
	local var15 = useCloseWithBackButton(var14, var13)
	local var16, var17 = reactModule.useState(nil)
	local var18 = useCreateClientBindingSduiContextModule(appPage, var16, nil, useDataUpdatedTimestampModule(configKey, p1.contentIdentifier), configKey, nil, p1.routeName, p1.scrollAway, p1.videoPlaybackContext)
	local var19 = useSduiPageContentModule({
		configKey = configKey,
		contentIdentifier = p1.contentIdentifier,
		contentMode = p1.contentMode,
		sduiContext = var18,
		localAnalyticsData = var9,
		debugName = var2,
		pageTimer = p1.pageTimer,
		refreshSignal = var10
	})
	local localStickyHeaderSlot = p1.localStickyHeaderSlot
	local var20 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var5 (ref), getSduiComponentWrapper (copy), reactModule (copy), var2 (ref), var18 (ref), var9 (ref), localStickyHeaderSlot (ref)
		local var21 = if not (p1.stickyIdentifier == nil or var5 == nil) then reactModule.createElement(getSduiComponentWrapper(var5), {
			debugName = `{var2}-sticky`,
			componentConfig = var5,
			sduiContext = var18,
			localAnalyticsData = var9
		}) else nil
		
		if localStickyHeaderSlot == nil and var21 == nil then
			return nil
		end
		local t = {}
		
		if localStickyHeaderSlot ~= nil then
			for i, v in localStickyHeaderSlot do
				table.insert(t, v)
			end
		end
		if var21 ~= nil then
			table.insert(t, var21)
		end
		return t
	end, {
		p1.stickyIdentifier, var5, var18, var9, var2, localStickyHeaderSlot
	})
	local var22 = nil
	
	if var7 then
		var22 = p1.loadingSlot or reactModule.createElement(foundationModule.View, { tag = "size-full", ZIndex = 2 }, reactModule.createElement(loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}))
	elseif var8 then
		var22 = p1.errorSlot or reactModule.createElement(sduiPageErrorStateModule, { refresh = p1.refresh })
	end
	local var23 = var20 ~= nil and next(var20) ~= nil
	local feedTopMargin = p1.feedTopMargin
	local var24 = if var23 then p1.stickyTopPadding or feedTopMargin else nil
	local var25 = if var23 then p1.stickyBottomPadding else feedTopMargin
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
			ref = var17
		}, {
			UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			Content = reactModule.createElement(page, {
				contentConfig = var19,
				stickyHeaderSlot = var20,
				composition = p1.composition,
				chrome = reactModule.useMemo(function()
					-- upvalues: pageTopPadding (ref), scrollAway (ref), visibilityControl (copy)
					local pageTopPadding_1 = pageTopPadding or 0
					
					if pageTopPadding_1 <= 0 then
						return nil
					end
					local var26 = if scrollAway then scrollAway.headerHeightBinding else nil
					
					if var26 == nil and scrollAway and scrollAway.scrollAwayHeight then
						local scrollAwayHeight = scrollAway.scrollAwayHeight
						var26 = visibilityControl.getHeaderBinding():map(function(p3)
							-- upvalues: scrollAwayHeight (ref)
							return p3 * scrollAwayHeight
						end)
					end
					return {
						height = pageTopPadding_1,
						scrollAwayHeight = if scrollAway then scrollAway.scrollAwayHeight else nil,
						liveHeightBinding = var26
					}
				end, { pageTopPadding, scrollAway }),
				stickyBackgroundStyle = p1.backgroundStyle,
				onScrollToEnd = p1.onScrollToEnd,
				onScrollToEndThreshold = p1.onScrollToEndThreshold,
				onRefresh = if refresh then var11 else nil,
				appEventName = appPage,
				contentTopPadding = var25,
				stickyTopPadding = var24
			}),
			StateOverlay = var22
		})
	})
end))