local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local reactModule = require(parent.React)
local appNavBarModule = require(parent.AppNavBar)
local foundationModule = require(parent.Foundation)
local centralOverlayModule = require(parent.CentralOverlay)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local signalsReactModule = require(parent.SignalsReact)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sharedFlagsModule = require(parent.SharedFlags)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local sduiFeatureEntryPoint = sduiSharedUtilitiesModule.SduiFeatureEntryPoint
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local view = foundationModule.View
local loggerModule = require(serverTriggeredModals.Logger)
local reportPromptImpressionModule = require(serverTriggeredModals.reportPromptImpression)
local sendModalImpressionEvent = require(parent.ServerTriggeredModalImpressions).sendModalImpressionEvent
local fetchPromptsModule = require(serverTriggeredModals.SduiV2.fetchPrompts)
local _ = require(serverTriggeredModals.SduiV2.PromptsEntryPoint)
local promptStyleModule = require(serverTriggeredModals.SduiV2.PromptStyle)
local usePromptEntriesModule = require(serverTriggeredModals.SduiV2.usePromptEntries)
local useModalSignalStoreModule = require(serverTriggeredModals.SignalStores.useModalSignalStore)
local getEntryPointSurfaceConfigModule = require(script.Parent.getEntryPointSurfaceConfig)
local coachmarkRendererModule = require(script.Parent.CoachmarkRenderer)
local surfaceBannerModule = require(script.Parent.SurfaceBanner)
local fFlagSduiAllowNoConfigsBuilt = sharedFlagsModule.FFlagSduiAllowNoConfigsBuilt
local fFlagPromptsImpressionUsesTitle = sharedFlagsModule.FFlagPromptsImpressionUsesTitle
local fFlagPromptsHandlerCoachmarkEnabled = sharedFlagsModule.FFlagPromptsHandlerCoachmarkEnabled
local fFlagEdpGameLeavePromptsHandlerEnabled = sharedFlagsModule.FFlagEdpGameLeavePromptsHandlerEnabled
local fFlagSduiSystemBannerComponent = sharedFlagsModule.FFlagSduiSystemBannerComponent
local fFlagSduiSurfaceBannerScrollAwaySticky = sharedFlagsModule.FFlagSduiSurfaceBannerScrollAwaySticky
local fFlagSduiSurfaceBannerAlwaysMounted = sharedFlagsModule.FFlagSduiSurfaceBannerAlwaysMounted
local fFlagAppIaScrollAway = sharedFlagsModule.FFlagAppIaScrollAway
local fFlagSduiDismissPromptAction = sharedFlagsModule.FFlagSduiDismissPromptAction
local fFlagHomepagePromptsPaddingFix = sharedFlagsModule.FFlagHomepagePromptsPaddingFix

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), fFlagSduiDismissPromptAction (ref), useStore (ref), useModalSignalStoreModule (ref), fFlagEdpGameLeavePromptsHandlerEnabled (ref), reactModule (ref), getEntryPointSurfaceConfigModule (ref), signalsReactModule (ref), fFlagSduiAllowNoConfigsBuilt (ref), sduiLoadTimer (ref), fetchPromptsModule (ref), usePromptEntriesModule (ref), promptStyleModule (ref), setCentralOverlay (ref), centralOverlayType (ref), fFlagPromptsImpressionUsesTitle (ref), reportPromptImpressionModule (ref), loggerModule (ref), sendModalImpressionEvent (ref), fFlagPromptsHandlerCoachmarkEnabled (ref), fFlagSduiSurfaceBannerScrollAwaySticky (ref), fFlagAppIaScrollAway (ref), appNavBarModule (ref), fFlagSduiSurfaceBannerAlwaysMounted (ref), fFlagSduiSystemBannerComponent (ref), surfaceBannerModule (ref), sduiFeatureEntryPoint (ref), fFlagHomepagePromptsPaddingFix (ref), view (ref), coachmarkRendererModule (ref)
	local entryPoint = p1.entryPoint
	local promptStyle = p1.promptStyle
	local var1 = useDispatch()
	local var2 = if fFlagSduiDismissPromptAction then useStore() else nil
	local var3 = useModalSignalStoreModule()
	local var4 = if fFlagEdpGameLeavePromptsHandlerEnabled and p1.clientAttributes ~= nil then p1.clientAttributes.universeId else nil
	local var5 = reactModule.useMemo(function()
		-- upvalues: fFlagEdpGameLeavePromptsHandlerEnabled (copy), getEntryPointSurfaceConfigModule (copy), entryPoint (ref), var4 (ref)
		return if fFlagEdpGameLeavePromptsHandlerEnabled then getEntryPointSurfaceConfigModule(entryPoint, var4) else getEntryPointSurfaceConfigModule(entryPoint)
	end, if fFlagEdpGameLeavePromptsHandlerEnabled then { entryPoint, var4 } else { entryPoint })
	local var6 = signalsReactModule.useSignalState(var3.getHasShownGetter(entryPoint))
	local var7 = signalsReactModule.useSignalState(var3.getMetadataGetter(entryPoint))
	local var8 = reactModule.useMemo(function()
		-- upvalues: entryPoint (ref), var5 (ref), fFlagSduiAllowNoConfigsBuilt (copy), sduiLoadTimer (copy), fFlagEdpGameLeavePromptsHandlerEnabled (copy), p1 (ref)
		return {
			clearOnEmptyResponse = true,
			entryPoint = entryPoint,
			surfaceKey = var5.surfaceKey,
			configKey = var5.configKey,
			allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then true else nil,
			loadTimer = sduiLoadTimer.createLoadTimer(var5.configKey),
			clientAttributes = if fFlagEdpGameLeavePromptsHandlerEnabled then p1.clientAttributes else nil
		}
	end, if fFlagEdpGameLeavePromptsHandlerEnabled then { entryPoint, var5, p1.clientAttributes } else { entryPoint, var5 })
	reactModule.useEffect(function()
		-- upvalues: fetchPromptsModule (copy), var8 (ref)
		fetchPromptsModule(var8)
	end, { var8 })
	local var9 = usePromptEntriesModule(var5.configKey, promptStyleModule.Modal)
	local var10 = var9[1]
	local var11 = if fFlagSduiDismissPromptAction then reactModule.useRef(nil) else nil
	local var12 = if fFlagSduiDismissPromptAction then reactModule.useRef(nil) else nil
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var7 (ref), var10 (ref), var3 (ref), entryPoint (ref), var1 (ref), setCentralOverlay (copy), centralOverlayType (copy), var5 (ref), fFlagPromptsImpressionUsesTitle (copy), fFlagSduiDismissPromptAction (copy), var11 (ref), var12 (ref)
		if var6 then return end
		if var7 then return end
		if var10 == nil or var10.config == nil or (var10.identifier == nil or var10.robloxComponentType == nil) or var10.title == nil then return end
		var3.setHasShown(entryPoint, true)
		var1(setCentralOverlay(centralOverlayType.SduiPromptModal, {
			configKey = var5.configKey,
			appPage = var5.appPage,
			modalId = var10.identifier,
			modalType = if fFlagPromptsImpressionUsesTitle then var10.title else var10.robloxComponentType
		}))
		
		if fFlagSduiDismissPromptAction then
			var11.current = var10.title
			var12.current = var10.identifier
		end
	end, {
		var6, var7, var1, var3, var10, var5, entryPoint
	})
	
	if fFlagSduiDismissPromptAction then
		reactModule.useEffect(function()
			-- upvalues: var11 (ref), var9 (ref), var12 (ref), var2 (ref), centralOverlayType (copy), var1 (ref), setCentralOverlay (copy)
			local current = var11.current
			
			if current == nil then return end
			for i, v in var9 do
				if v.title == current then return end
			end
			local current_1 = var12.current
			var11.current = nil
			var12.current = nil
			local centralOverlay = var2:getState().CentralOverlay
			
			if centralOverlay ~= nil and centralOverlay.OverlayType == centralOverlayType.SduiPromptModal and (centralOverlay.Arguments ~= nil and centralOverlay.Arguments.modalId == current_1) then
				var1(setCentralOverlay())
			end
		end, { var9, var1, var2 })
	end
	local var13 = promptStyle == promptStyleModule.SurfaceBanner
	local var14 = usePromptEntriesModule(var5.configKey, promptStyleModule.SurfaceBanner)
	local var15 = if var13 then var14[1] else nil
	local var16 = if var15 then var15.identifier else nil
	local var17 = if var15 then if fFlagPromptsImpressionUsesTitle then var15.title else var15.robloxComponentType else nil
	local var18 = promptStyle == promptStyleModule.InlineBanner
	local var19 = if var18 then usePromptEntriesModule(var5.configKey, promptStyleModule.InlineBanner)[1] else nil
	local var20 = if var19 then var19.identifier else nil
	local var21 = if var19 then if fFlagPromptsImpressionUsesTitle then var19.title else var19.robloxComponentType else nil
	reactModule.useEffect(function()
		-- upvalues: var16 (ref), var17 (ref), reportPromptImpressionModule (copy), loggerModule (copy), sendModalImpressionEvent (copy)
		if var16 and var17 then
			reportPromptImpressionModule(var17, var16):catch(function()
				-- upvalues: loggerModule (copy)
				loggerModule:warning("Failed to report prompt impression")
			end)
			sendModalImpressionEvent(var16, var17)
		end
	end, { var16, var17 })
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), var21 (ref), reportPromptImpressionModule (copy), loggerModule (copy), sendModalImpressionEvent (copy)
		if var20 and var21 then
			reportPromptImpressionModule(var21, var20):catch(function()
				-- upvalues: loggerModule (copy)
				loggerModule:warning("Failed to report prompt impression")
			end)
			sendModalImpressionEvent(var20, var21)
		end
	end, { var20, var21 })
	local var22 = false
	
	if fFlagPromptsHandlerCoachmarkEnabled then
		for i, v in usePromptEntriesModule(var5.configKey, promptStyleModule.Coachmark) do
			if v.config and v.identifier and v.title then
				var22 = true
				break
			end
		end
	end
	local var23 = fFlagSduiSurfaceBannerScrollAwaySticky and (fFlagAppIaScrollAway and appNavBarModule.getScrollAwayEnabled())
	local var24 = if var15 == nil then fFlagSduiSurfaceBannerAlwaysMounted else true
	local frame = nil
	
	if var13 then
		frame = if fFlagSduiSystemBannerComponent and var24 and var23 then reactModule.createElement(surfaceBannerModule, {
			identifier = if var15 then var15.identifier else nil,
			configKey = var5.configKey,
			appPage = var5.appPage,
			surfaceBannerContent = p1.surfaceBannerContent
		}) elseif fFlagSduiSystemBannerComponent and var24 then reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			SurfaceBanner = if var15 then reactModule.createElement(sduiFeatureEntryPoint, {
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				LayoutOrder = 1,
				configKey = var5.configKey,
				identifier = var15.identifier,
				appPage = var5.appPage
			}) else nil,
			ContentContainer = reactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
				Content = p1.surfaceBannerContent
			})
		}) else p1.surfaceBannerContent
	elseif var18 then
		frame = if var19 then reactModule.createElement(sduiFeatureEntryPoint, {
			shouldDisplayLoading = false,
			shouldDisplayError = false,
			configKey = var5.configKey,
			identifier = var19.identifier,
			appPage = var5.appPage
		}) else p1.inlineBannerFallback
	end
	if fFlagHomepagePromptsPaddingFix and var18 then
		local var25 = var14[1] ~= nil
		
		if frame ~= nil then
			frame = reactModule.createElement(view, {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				padding = {
					top = if var25 and p1.topPadding ~= nil then UDim.new(0, p1.topPadding) else nil,
					bottom = if p1.bottomPadding ~= nil then UDim.new(0, p1.bottomPadding) else nil
				}
			}, { InlineBanner = frame })
		elseif var25 and p1.topPadding then
			frame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, p1.topPadding)
			})
		end
	end
	return if fFlagPromptsHandlerCoachmarkEnabled and var22 then reactModule.createElement(reactModule.Fragment, nil, {
		Slot = frame,
		Coachmarks = reactModule.createElement(coachmarkRendererModule, { surfaceConfig = var5, hasShownKey = entryPoint })
	}) else frame
end)