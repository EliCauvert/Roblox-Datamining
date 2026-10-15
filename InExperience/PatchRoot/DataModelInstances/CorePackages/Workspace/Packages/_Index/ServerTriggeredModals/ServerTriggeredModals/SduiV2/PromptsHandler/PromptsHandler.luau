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
local fFlagPushNotificationsUpsellPassClientAttributesToPrompts = sharedFlagsModule.FFlagPushNotificationsUpsellPassClientAttributesToPrompts
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
local fFlagPromptsActionEventLoggingModule = require(serverTriggeredModals.Flags.FFlagPromptsActionEventLogging)
local getEntryPointSurfaceConfigModule = require(script.Parent.getEntryPointSurfaceConfig)
local getHomepagePromptsClientAttributesModule = require(script.Parent.Parent.getHomepagePromptsClientAttributes)
local coachmarkRendererModule = require(script.Parent.CoachmarkRenderer)
local surfaceBannerModule = require(script.Parent.SurfaceBanner)
local fFlagSduiAllowNoConfigsBuilt = sharedFlagsModule.FFlagSduiAllowNoConfigsBuilt
local fFlagPromptsImpressionUsesTitle = sharedFlagsModule.FFlagPromptsImpressionUsesTitle
local fFlagPromptsHandlerCoachmarkEnabled = sharedFlagsModule.FFlagPromptsHandlerCoachmarkEnabled
local fFlagEdpGameLeavePromptsHandlerEnabled = sharedFlagsModule.FFlagEdpGameLeavePromptsHandlerEnabled
local fFlagEdpOpenPromptsHandlerEnabled = sharedFlagsModule.FFlagEdpOpenPromptsHandlerEnabled
local fFlagSduiSystemBannerComponent = sharedFlagsModule.FFlagSduiSystemBannerComponent
local fFlagSduiSurfaceBannerScrollAwaySticky = sharedFlagsModule.FFlagSduiSurfaceBannerScrollAwaySticky
local fFlagSduiSurfaceBannerAlwaysMounted = sharedFlagsModule.FFlagSduiSurfaceBannerAlwaysMounted
local fFlagAppIaScrollAway = sharedFlagsModule.FFlagAppIaScrollAway
local fFlagSduiDismissPromptAction = sharedFlagsModule.FFlagSduiDismissPromptAction
local fFlagHomepagePromptsPaddingFix = sharedFlagsModule.FFlagHomepagePromptsPaddingFix
local fFlagHomepagePromptsHandlerPassClientAttributes = sharedFlagsModule.FFlagHomepagePromptsHandlerPassClientAttributes
local fFlagPromptsEdpOpenReplaceOnFetch = sharedFlagsModule.FFlagPromptsEdpOpenReplaceOnFetch

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), fFlagSduiDismissPromptAction (ref), useStore (ref), useModalSignalStoreModule (ref), fFlagEdpGameLeavePromptsHandlerEnabled (ref), fFlagEdpOpenPromptsHandlerEnabled (ref), fFlagPromptsEdpOpenReplaceOnFetch (ref), fFlagPushNotificationsUpsellPassClientAttributesToPrompts (ref), getHomepagePromptsClientAttributesModule (ref), reactModule (ref), getEntryPointSurfaceConfigModule (ref), signalsReactModule (ref), fFlagHomepagePromptsHandlerPassClientAttributes (ref), promptsEntryPointModule (ref), fFlagSduiAllowNoConfigsBuilt (ref), sduiLoadTimer (ref), fetchPromptsModule (ref), usePromptEntriesModule (ref), promptStyleModule (ref), setCentralOverlay (ref), centralOverlayType (ref), fFlagPromptsImpressionUsesTitle (ref), reportPromptImpressionModule (ref), loggerModule (ref), sendModalImpressionEvent (ref), fFlagPromptsHandlerCoachmarkEnabled (ref), fFlagSduiSurfaceBannerScrollAwaySticky (ref), fFlagAppIaScrollAway (ref), appNavBarModule (ref), fFlagSduiSurfaceBannerAlwaysMounted (ref), fFlagSduiSystemBannerComponent (ref), surfaceBannerModule (ref), sduiFeatureEntryPoint (ref), fFlagPromptsActionEventLoggingModule (ref), fFlagHomepagePromptsPaddingFix (ref), view (ref), coachmarkRendererModule (ref)
	local var1
	local entryPoint = p1.entryPoint
	local promptStyle = p1.promptStyle
	local var2 = useDispatch()
	local var3 = if fFlagSduiDismissPromptAction then useStore() else nil
	local var4 = useModalSignalStoreModule()
	local var5 = if (fFlagEdpGameLeavePromptsHandlerEnabled or fFlagEdpOpenPromptsHandlerEnabled) and p1.clientAttributes ~= nil then p1.clientAttributes.universeId else nil
	local var6 = if fFlagPromptsEdpOpenReplaceOnFetch then p1.replaceOnFetch else nil
	local var7 = if fFlagPushNotificationsUpsellPassClientAttributesToPrompts then getHomepagePromptsClientAttributesModule.use(entryPoint, p1.clientAttributes) else nil
	local useMemo = reactModule.useMemo
	useMemo = useMemo(function()
		-- upvalues: fFlagEdpGameLeavePromptsHandlerEnabled (copy), fFlagEdpOpenPromptsHandlerEnabled (copy), getEntryPointSurfaceConfigModule (copy), entryPoint (ref), var5 (ref)
		return if fFlagEdpGameLeavePromptsHandlerEnabled or fFlagEdpOpenPromptsHandlerEnabled then getEntryPointSurfaceConfigModule(entryPoint, var5) else getEntryPointSurfaceConfigModule(entryPoint)
	end, if fFlagEdpGameLeavePromptsHandlerEnabled or fFlagEdpOpenPromptsHandlerEnabled then { entryPoint, var5 } else { entryPoint })
	local var8 = signalsReactModule.useSignalState(var4.getHasShownGetter(entryPoint))
	local var9 = signalsReactModule.useSignalState(var4.getMetadataGetter(entryPoint))
	local _ = nil
	local var10 = nil
	
	if fFlagHomepagePromptsHandlerPassClientAttributes then
		var10 = reactModule.useMemo(function()
			-- upvalues: fFlagPushNotificationsUpsellPassClientAttributesToPrompts (copy), entryPoint (ref), promptsEntryPointModule (copy), fFlagEdpGameLeavePromptsHandlerEnabled (copy), fFlagEdpOpenPromptsHandlerEnabled (copy), p1 (ref), var7 (ref), getHomepagePromptsClientAttributesModule (copy)
			return if fFlagPushNotificationsUpsellPassClientAttributesToPrompts and entryPoint == promptsEntryPointModule.HomepageLaunch and (not fFlagEdpGameLeavePromptsHandlerEnabled and not fFlagEdpOpenPromptsHandlerEnabled or p1.clientAttributes == nil) then var7 elseif (fFlagEdpGameLeavePromptsHandlerEnabled or fFlagEdpOpenPromptsHandlerEnabled) and p1.clientAttributes ~= nil then p1.clientAttributes elseif entryPoint == promptsEntryPointModule.HomepageLaunch then getHomepagePromptsClientAttributesModule.get() else nil
		end, { entryPoint, var7, p1.clientAttributes })
		var1 = reactModule.useMemo(function()
			-- upvalues: entryPoint (ref), useMemo (ref), fFlagSduiAllowNoConfigsBuilt (copy), sduiLoadTimer (copy), var10 (write), fFlagPromptsEdpOpenReplaceOnFetch (copy), var6 (ref)
			return {
				clearOnEmptyResponse = true,
				entryPoint = entryPoint,
				surfaceKey = useMemo.surfaceKey,
				configKey = useMemo.configKey,
				allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then true else nil,
				loadTimer = sduiLoadTimer.createLoadTimer(useMemo.configKey),
				clientAttributes = var10,
				replaceOnFetch = if fFlagPromptsEdpOpenReplaceOnFetch then var6 else nil
			}
		end, {
			entryPoint,
			useMemo,
			var10,
			if fFlagPromptsEdpOpenReplaceOnFetch then var6 else nil
		})
	else
		var1 = reactModule.useMemo(function()
			-- upvalues: entryPoint (ref), useMemo (ref), fFlagSduiAllowNoConfigsBuilt (copy), sduiLoadTimer (copy), fFlagEdpGameLeavePromptsHandlerEnabled (copy), fFlagEdpOpenPromptsHandlerEnabled (copy), p1 (ref), fFlagPromptsEdpOpenReplaceOnFetch (copy), var6 (ref)
			return {
				clearOnEmptyResponse = true,
				entryPoint = entryPoint,
				surfaceKey = useMemo.surfaceKey,
				configKey = useMemo.configKey,
				allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then true else nil,
				loadTimer = sduiLoadTimer.createLoadTimer(useMemo.configKey),
				clientAttributes = if fFlagEdpGameLeavePromptsHandlerEnabled or fFlagEdpOpenPromptsHandlerEnabled then p1.clientAttributes else nil,
				replaceOnFetch = if fFlagPromptsEdpOpenReplaceOnFetch then var6 else nil
			}
		end, if fFlagEdpGameLeavePromptsHandlerEnabled or fFlagEdpOpenPromptsHandlerEnabled then {
			entryPoint,
			useMemo,
			p1.clientAttributes,
			if fFlagPromptsEdpOpenReplaceOnFetch then var6 else nil
		} else {
			entryPoint,
			useMemo,
			if fFlagPromptsEdpOpenReplaceOnFetch then var6 else nil
		})
	end
	if fFlagPushNotificationsUpsellPassClientAttributesToPrompts then
		reactModule.useEffect(function()
			-- upvalues: entryPoint (ref), promptsEntryPointModule (copy), fFlagEdpGameLeavePromptsHandlerEnabled (copy), fFlagEdpOpenPromptsHandlerEnabled (copy), p1 (ref), var10 (write), fetchPromptsModule (copy), var1 (write)
			local var11
			local var12 = false
			
			if entryPoint == promptsEntryPointModule.HomepageLaunch then
				local var13
				if not fFlagEdpGameLeavePromptsHandlerEnabled then
					var13 = fFlagEdpOpenPromptsHandlerEnabled
					
					if var13 then
						var13 = p1.clientAttributes ~= nil
					end
					var12 = not var13
				end
			end
			if var12 and var10 == nil then return end
			if fFlagEdpOpenPromptsHandlerEnabled then
				var11 = var12
				
				if not var11 then
					var11 = entryPoint == promptsEntryPointModule.ExperienceDetailsPageOpen
					var11 = nil
				end
			else
				var11 = nil
			end
			if (fFlagEdpOpenPromptsHandlerEnabled or not var12) and (not fFlagEdpOpenPromptsHandlerEnabled or not var11) then
				fetchPromptsModule(var1)
				
				return
			end
			fetchPromptsModule(var1, true)
		end, { entryPoint, var1, p1.clientAttributes, var10 })
	else
		reactModule.useEffect(function()
			-- upvalues: fFlagEdpOpenPromptsHandlerEnabled (copy), entryPoint (ref), promptsEntryPointModule (copy), fetchPromptsModule (copy), var1 (write)
			local var11
			if fFlagEdpOpenPromptsHandlerEnabled then
				var11 = entryPoint == promptsEntryPointModule.ExperienceDetailsPageOpen
				var11 = nil
			else
				var11 = nil
			end
			fetchPromptsModule(var1, if fFlagEdpOpenPromptsHandlerEnabled and var11 then true else nil)
		end, {
			var1,
			if fFlagEdpOpenPromptsHandlerEnabled then entryPoint else nil
		})
	end
	local var11 = usePromptEntriesModule(useMemo.configKey, promptStyleModule.Modal)
	local var12 = var11[1]
	local var13 = if fFlagSduiDismissPromptAction then reactModule.useRef(nil) else nil
	local var14 = if fFlagSduiDismissPromptAction then reactModule.useRef(nil) else nil
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var9 (ref), var12 (ref), var4 (ref), entryPoint (ref), var2 (ref), setCentralOverlay (copy), centralOverlayType (copy), useMemo (ref), fFlagPromptsImpressionUsesTitle (copy), fFlagSduiDismissPromptAction (copy), var13 (ref), var14 (ref)
		if var8 then return end
		if var9 then return end
		if var12 == nil or var12.config == nil or (var12.identifier == nil or var12.robloxComponentType == nil) or var12.title == nil then return end
		var4.setHasShown(entryPoint, true)
		var2(setCentralOverlay(centralOverlayType.SduiPromptModal, {
			configKey = useMemo.configKey,
			appPage = useMemo.appPage,
			modalId = var12.identifier,
			modalType = if fFlagPromptsImpressionUsesTitle then var12.title else var12.robloxComponentType
		}))
		
		if fFlagSduiDismissPromptAction then
			var13.current = var12.title
			var14.current = var12.identifier
		end
	end, {
		var8, var9, var2, var4, var12, useMemo, entryPoint
	})
	
	if fFlagSduiDismissPromptAction then
		reactModule.useEffect(function()
			-- upvalues: var13 (ref), var11 (ref), var14 (ref), var3 (ref), centralOverlayType (copy), var2 (ref), setCentralOverlay (copy)
			local current = var13.current
			
			if current == nil then return end
			for i, v in var11 do
				if v.title == current then return end
			end
			local current_1 = var14.current
			var13.current = nil
			var14.current = nil
			local centralOverlay = var3:getState().CentralOverlay
			
			if centralOverlay ~= nil and centralOverlay.OverlayType == centralOverlayType.SduiPromptModal and (centralOverlay.Arguments ~= nil and centralOverlay.Arguments.modalId == current_1) then
				var2(setCentralOverlay())
			end
		end, { var11, var2, var3 })
	end
	local var15 = promptStyle == promptStyleModule.SurfaceBanner
	local var16 = usePromptEntriesModule(useMemo.configKey, promptStyleModule.SurfaceBanner)
	local var17 = if var15 then var16[1] else nil
	local var18 = if var17 then var17.identifier else nil
	local var19 = if var17 then if fFlagPromptsImpressionUsesTitle then var17.title else var17.robloxComponentType else nil
	local var20 = promptStyle == promptStyleModule.InlineBanner
	local var21 = if var20 then usePromptEntriesModule(useMemo.configKey, promptStyleModule.InlineBanner)[1] else nil
	local var22 = if var21 then var21.identifier else nil
	local var23 = if var21 then if fFlagPromptsImpressionUsesTitle then var21.title else var21.robloxComponentType else nil
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var19 (ref), reportPromptImpressionModule (copy), loggerModule (copy), sendModalImpressionEvent (copy)
		if var18 and var19 then
			reportPromptImpressionModule(var19, var18):catch(function()
				-- upvalues: loggerModule (copy)
				loggerModule:warning("Failed to report prompt impression")
			end)
			sendModalImpressionEvent(var18, var19)
		end
	end, { var18, var19 })
	reactModule.useEffect(function()
		-- upvalues: var22 (ref), var23 (ref), reportPromptImpressionModule (copy), loggerModule (copy), sendModalImpressionEvent (copy)
		if var22 and var23 then
			reportPromptImpressionModule(var23, var22):catch(function()
				-- upvalues: loggerModule (copy)
				loggerModule:warning("Failed to report prompt impression")
			end)
			sendModalImpressionEvent(var22, var23)
		end
	end, { var22, var23 })
	local var24 = false
	
	if fFlagPromptsHandlerCoachmarkEnabled then
		for i, v in usePromptEntriesModule(useMemo.configKey, promptStyleModule.Coachmark) do
			if v.config and v.identifier and v.title then
				var24 = true
				break
			end
		end
	end
	local var25 = fFlagSduiSurfaceBannerScrollAwaySticky and (fFlagAppIaScrollAway and appNavBarModule.getScrollAwayEnabled())
	local var26 = if var17 == nil then fFlagSduiSurfaceBannerAlwaysMounted else true
	local frame = nil
	
	if var15 then
		frame = if fFlagSduiSystemBannerComponent and var26 and var25 then reactModule.createElement(surfaceBannerModule, {
			identifier = if var17 then var17.identifier else nil,
			configKey = useMemo.configKey,
			appPage = useMemo.appPage,
			surfaceBannerContent = p1.surfaceBannerContent
		}) elseif fFlagSduiSystemBannerComponent and var26 then reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			SurfaceBanner = if var17 then reactModule.createElement(sduiFeatureEntryPoint, {
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				LayoutOrder = 1,
				configKey = useMemo.configKey,
				identifier = var17.identifier,
				appPage = useMemo.appPage,
				additionalAnalyticsData = if fFlagPromptsActionEventLoggingModule then {
					promptInstanceId = if var17.identifier then var17.identifier else nil
				} else nil
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
	elseif var20 then
		frame = if var21 then reactModule.createElement(sduiFeatureEntryPoint, {
			shouldDisplayLoading = false,
			shouldDisplayError = false,
			configKey = useMemo.configKey,
			identifier = var21.identifier,
			appPage = useMemo.appPage,
			additionalAnalyticsData = if fFlagPromptsActionEventLoggingModule then {
				promptInstanceId = if var21.identifier then var21.identifier else nil
			} else nil
		}) else p1.inlineBannerFallback
	end
	if fFlagHomepagePromptsPaddingFix and var20 then
		local var27 = var16[1] ~= nil
		
		if frame ~= nil then
			frame = reactModule.createElement(view, {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				padding = {
					top = if var27 and p1.topPadding ~= nil then UDim.new(0, p1.topPadding) else nil,
					bottom = if p1.bottomPadding ~= nil then UDim.new(0, p1.bottomPadding) else nil
				}
			}, { InlineBanner = frame })
		elseif var27 and p1.topPadding then
			frame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, p1.topPadding)
			})
		end
	end
	return if fFlagPromptsHandlerCoachmarkEnabled and var24 then reactModule.createElement(reactModule.Fragment, nil, {
		Slot = frame,
		Coachmarks = reactModule.createElement(coachmarkRendererModule, { surfaceConfig = useMemo, hasShownKey = entryPoint })
	}) else frame
end)