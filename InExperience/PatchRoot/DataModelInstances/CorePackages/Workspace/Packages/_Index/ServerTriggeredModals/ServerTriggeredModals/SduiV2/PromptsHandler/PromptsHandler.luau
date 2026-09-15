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
local promptsEntryPointModule = require(serverTriggeredModals.SduiV2.PromptsEntryPoint)
local promptStyleModule = require(serverTriggeredModals.SduiV2.PromptStyle)
local usePromptEntriesModule = require(serverTriggeredModals.SduiV2.usePromptEntries)
local useModalSignalStoreModule = require(serverTriggeredModals.SignalStores.useModalSignalStore)
local getEntryPointSurfaceConfigModule = require(script.Parent.getEntryPointSurfaceConfig)
local getHomepagePromptsClientAttributesModule = require(script.Parent.Parent.getHomepagePromptsClientAttributes)
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
local fFlagHomepagePromptsHandlerPassClientAttributes = sharedFlagsModule.FFlagHomepagePromptsHandlerPassClientAttributes

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), fFlagSduiDismissPromptAction (ref), useStore (ref), useModalSignalStoreModule (ref), fFlagEdpGameLeavePromptsHandlerEnabled (ref), reactModule (ref), getEntryPointSurfaceConfigModule (ref), signalsReactModule (ref), fFlagHomepagePromptsHandlerPassClientAttributes (ref), promptsEntryPointModule (ref), getHomepagePromptsClientAttributesModule (ref), fFlagSduiAllowNoConfigsBuilt (ref), sduiLoadTimer (ref), fetchPromptsModule (ref), usePromptEntriesModule (ref), promptStyleModule (ref), setCentralOverlay (ref), centralOverlayType (ref), fFlagPromptsImpressionUsesTitle (ref), reportPromptImpressionModule (ref), loggerModule (ref), sendModalImpressionEvent (ref), fFlagPromptsHandlerCoachmarkEnabled (ref), fFlagSduiSurfaceBannerScrollAwaySticky (ref), fFlagAppIaScrollAway (ref), appNavBarModule (ref), fFlagSduiSurfaceBannerAlwaysMounted (ref), fFlagSduiSystemBannerComponent (ref), surfaceBannerModule (ref), sduiFeatureEntryPoint (ref), fFlagHomepagePromptsPaddingFix (ref), view (ref), coachmarkRendererModule (ref)
	local var1
	local entryPoint = p1.entryPoint
	local promptStyle = p1.promptStyle
	local var2 = useDispatch()
	local var3 = if fFlagSduiDismissPromptAction then useStore() else nil
	local var4 = useModalSignalStoreModule()
	local var5 = if fFlagEdpGameLeavePromptsHandlerEnabled and p1.clientAttributes ~= nil then p1.clientAttributes.universeId else nil
	local var6 = reactModule.useMemo(function()
		-- upvalues: fFlagEdpGameLeavePromptsHandlerEnabled (copy), getEntryPointSurfaceConfigModule (copy), entryPoint (ref), var5 (ref)
		return if fFlagEdpGameLeavePromptsHandlerEnabled then getEntryPointSurfaceConfigModule(entryPoint, var5) else getEntryPointSurfaceConfigModule(entryPoint)
	end, if fFlagEdpGameLeavePromptsHandlerEnabled then { entryPoint, var5 } else { entryPoint })
	local var7 = signalsReactModule.useSignalState(var4.getHasShownGetter(entryPoint))
	local var8 = signalsReactModule.useSignalState(var4.getMetadataGetter(entryPoint))
	local _ = nil
	
	if fFlagHomepagePromptsHandlerPassClientAttributes then
		local var9 = reactModule.useMemo(function()
			-- upvalues: fFlagEdpGameLeavePromptsHandlerEnabled (copy), p1 (ref), entryPoint (ref), promptsEntryPointModule (copy), getHomepagePromptsClientAttributesModule (copy)
			return if fFlagEdpGameLeavePromptsHandlerEnabled and p1.clientAttributes ~= nil then p1.clientAttributes elseif entryPoint == promptsEntryPointModule.HomepageLaunch then getHomepagePromptsClientAttributesModule() else nil
		end, { entryPoint, p1.clientAttributes })
		var1 = reactModule.useMemo(function()
			-- upvalues: entryPoint (ref), var6 (ref), fFlagSduiAllowNoConfigsBuilt (copy), sduiLoadTimer (copy), var9 (ref)
			return {
				clearOnEmptyResponse = true,
				entryPoint = entryPoint,
				surfaceKey = var6.surfaceKey,
				configKey = var6.configKey,
				allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then true else nil,
				loadTimer = sduiLoadTimer.createLoadTimer(var6.configKey),
				clientAttributes = var9
			}
		end, { entryPoint, var6, var9 })
	else
		var1 = reactModule.useMemo(function()
			-- upvalues: entryPoint (ref), var6 (ref), fFlagSduiAllowNoConfigsBuilt (copy), sduiLoadTimer (copy), fFlagEdpGameLeavePromptsHandlerEnabled (copy), p1 (ref)
			return {
				clearOnEmptyResponse = true,
				entryPoint = entryPoint,
				surfaceKey = var6.surfaceKey,
				configKey = var6.configKey,
				allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then true else nil,
				loadTimer = sduiLoadTimer.createLoadTimer(var6.configKey),
				clientAttributes = if fFlagEdpGameLeavePromptsHandlerEnabled then p1.clientAttributes else nil
			}
		end, if fFlagEdpGameLeavePromptsHandlerEnabled then { entryPoint, var6, p1.clientAttributes } else { entryPoint, var6 })
	end
	reactModule.useEffect(function()
		-- upvalues: fetchPromptsModule (copy), var1 (write)
		fetchPromptsModule(var1)
	end, { var1 })
	local var10 = usePromptEntriesModule(var6.configKey, promptStyleModule.Modal)
	local var11 = var10[1]
	local var12 = if fFlagSduiDismissPromptAction then reactModule.useRef(nil) else nil
	local var13 = if fFlagSduiDismissPromptAction then reactModule.useRef(nil) else nil
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var8 (ref), var11 (ref), var4 (ref), entryPoint (ref), var2 (ref), setCentralOverlay (copy), centralOverlayType (copy), var6 (ref), fFlagPromptsImpressionUsesTitle (copy), fFlagSduiDismissPromptAction (copy), var12 (ref), var13 (ref)
		if var7 then return end
		if var8 then return end
		if var11 == nil or var11.config == nil or (var11.identifier == nil or var11.robloxComponentType == nil) or var11.title == nil then return end
		var4.setHasShown(entryPoint, true)
		var2(setCentralOverlay(centralOverlayType.SduiPromptModal, {
			configKey = var6.configKey,
			appPage = var6.appPage,
			modalId = var11.identifier,
			modalType = if fFlagPromptsImpressionUsesTitle then var11.title else var11.robloxComponentType
		}))
		
		if fFlagSduiDismissPromptAction then
			var12.current = var11.title
			var13.current = var11.identifier
		end
	end, {
		var7, var8, var2, var4, var11, var6, entryPoint
	})
	
	if fFlagSduiDismissPromptAction then
		reactModule.useEffect(function()
			-- upvalues: var12 (ref), var10 (ref), var13 (ref), var3 (ref), centralOverlayType (copy), var2 (ref), setCentralOverlay (copy)
			local current = var12.current
			
			if current == nil then return end
			for i, v in var10 do
				if v.title == current then return end
			end
			local current_1 = var13.current
			var12.current = nil
			var13.current = nil
			local centralOverlay = var3:getState().CentralOverlay
			
			if centralOverlay ~= nil and centralOverlay.OverlayType == centralOverlayType.SduiPromptModal and (centralOverlay.Arguments ~= nil and centralOverlay.Arguments.modalId == current_1) then
				var2(setCentralOverlay())
			end
		end, { var10, var2, var3 })
	end
	local var14 = promptStyle == promptStyleModule.SurfaceBanner
	local var15 = usePromptEntriesModule(var6.configKey, promptStyleModule.SurfaceBanner)
	local var16 = if var14 then var15[1] else nil
	local var17 = if var16 then var16.identifier else nil
	local var18 = if var16 then if fFlagPromptsImpressionUsesTitle then var16.title else var16.robloxComponentType else nil
	local var19 = promptStyle == promptStyleModule.InlineBanner
	local var20 = if var19 then usePromptEntriesModule(var6.configKey, promptStyleModule.InlineBanner)[1] else nil
	local var21 = if var20 then var20.identifier else nil
	local var22 = if var20 then if fFlagPromptsImpressionUsesTitle then var20.title else var20.robloxComponentType else nil
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var18 (ref), reportPromptImpressionModule (copy), loggerModule (copy), sendModalImpressionEvent (copy)
		if var17 and var18 then
			reportPromptImpressionModule(var18, var17):catch(function()
				-- upvalues: loggerModule (copy)
				loggerModule:warning("Failed to report prompt impression")
			end)
			sendModalImpressionEvent(var17, var18)
		end
	end, { var17, var18 })
	reactModule.useEffect(function()
		-- upvalues: var21 (ref), var22 (ref), reportPromptImpressionModule (copy), loggerModule (copy), sendModalImpressionEvent (copy)
		if var21 and var22 then
			reportPromptImpressionModule(var22, var21):catch(function()
				-- upvalues: loggerModule (copy)
				loggerModule:warning("Failed to report prompt impression")
			end)
			sendModalImpressionEvent(var21, var22)
		end
	end, { var21, var22 })
	local var23 = false
	
	if fFlagPromptsHandlerCoachmarkEnabled then
		for i, v in usePromptEntriesModule(var6.configKey, promptStyleModule.Coachmark) do
			if v.config and v.identifier and v.title then
				var23 = true
				break
			end
		end
	end
	local var24 = fFlagSduiSurfaceBannerScrollAwaySticky and (fFlagAppIaScrollAway and appNavBarModule.getScrollAwayEnabled())
	local var25 = if var16 == nil then fFlagSduiSurfaceBannerAlwaysMounted else true
	local frame = nil
	
	if var14 then
		frame = if fFlagSduiSystemBannerComponent and var25 and var24 then reactModule.createElement(surfaceBannerModule, {
			identifier = if var16 then var16.identifier else nil,
			configKey = var6.configKey,
			appPage = var6.appPage,
			surfaceBannerContent = p1.surfaceBannerContent
		}) elseif fFlagSduiSystemBannerComponent and var25 then reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			SurfaceBanner = if var16 then reactModule.createElement(sduiFeatureEntryPoint, {
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				LayoutOrder = 1,
				configKey = var6.configKey,
				identifier = var16.identifier,
				appPage = var6.appPage
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
	elseif var19 then
		frame = if var20 then reactModule.createElement(sduiFeatureEntryPoint, {
			shouldDisplayLoading = false,
			shouldDisplayError = false,
			configKey = var6.configKey,
			identifier = var20.identifier,
			appPage = var6.appPage
		}) else p1.inlineBannerFallback
	end
	if fFlagHomepagePromptsPaddingFix and var19 then
		local var26 = var15[1] ~= nil
		
		if frame ~= nil then
			frame = reactModule.createElement(view, {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				padding = {
					top = if var26 and p1.topPadding ~= nil then UDim.new(0, p1.topPadding) else nil,
					bottom = if p1.bottomPadding ~= nil then UDim.new(0, p1.bottomPadding) else nil
				}
			}, { InlineBanner = frame })
		elseif var26 and p1.topPadding then
			frame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, p1.topPadding)
			})
		end
	end
	return if fFlagPromptsHandlerCoachmarkEnabled and var23 then reactModule.createElement(reactModule.Fragment, nil, {
		Slot = frame,
		Coachmarks = reactModule.createElement(coachmarkRendererModule, { surfaceConfig = var6, hasShownKey = entryPoint })
	}) else frame
end)