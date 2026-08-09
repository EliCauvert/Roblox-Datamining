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
local sendModalImpressionEventModule = require(serverTriggeredModals.sendModalImpressionEvent)
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
local fFlagSduiSystemBannerComponent = sharedFlagsModule.FFlagSduiSystemBannerComponent
local fFlagSduiSurfaceBannerScrollAwaySticky = sharedFlagsModule.FFlagSduiSurfaceBannerScrollAwaySticky
local fFlagAppIaScrollAway = sharedFlagsModule.FFlagAppIaScrollAway
local fFlagSduiDismissPromptAction = sharedFlagsModule.FFlagSduiDismissPromptAction
local fFlagHomepagePromptsPaddingFix = sharedFlagsModule.FFlagHomepagePromptsPaddingFix

return reactModule.memo(function(p0) --[[ line: 82 | named "PromptsHandler" ]]
	-- upvalues: useDispatch (ref), fFlagSduiDismissPromptAction (ref), useStore (ref), useModalSignalStoreModule (ref), reactModule (ref), getEntryPointSurfaceConfigModule (ref), signalsReactModule (ref), fFlagSduiAllowNoConfigsBuilt (ref), sduiLoadTimer (ref), fetchPromptsModule (ref), usePromptEntriesModule (ref), promptStyleModule (ref), setCentralOverlay (ref), centralOverlayType (ref), fFlagPromptsImpressionUsesTitle (ref), reportPromptImpressionModule (ref), loggerModule (ref), sendModalImpressionEventModule (ref), fFlagPromptsHandlerCoachmarkEnabled (ref), fFlagSduiSurfaceBannerScrollAwaySticky (ref), fFlagAppIaScrollAway (ref), appNavBarModule (ref), fFlagSduiSystemBannerComponent (ref), surfaceBannerModule (ref), sduiFeatureEntryPoint (ref), fFlagHomepagePromptsPaddingFix (ref), view (ref), coachmarkRendererModule (ref)
	local entryPoint = p0.entryPoint
	local promptStyle = p0.promptStyle
	local var19 = useDispatch()
	local var20 = if fFlagSduiDismissPromptAction then useStore() else nil
	local var21 = useModalSignalStoreModule()
	local var22 = reactModule.useMemo(function() --[[ line: 89 ]]
		-- upvalues: getEntryPointSurfaceConfigModule (copy), entryPoint (ref)
		return getEntryPointSurfaceConfigModule(entryPoint)
	end, { entryPoint })
	local var23 = signalsReactModule.useSignalState(var21.getHasShownGetter(entryPoint))
	local var24 = signalsReactModule.useSignalState(var21.getMetadataGetter(entryPoint))
	local var25 = reactModule.useMemo(function() --[[ line: 101 ]]
		-- upvalues: entryPoint (ref), var22 (ref), fFlagSduiAllowNoConfigsBuilt (copy), sduiLoadTimer (copy)
		return {
			clearOnEmptyResponse = true,
			entryPoint = entryPoint,
			surfaceKey = var22.surfaceKey,
			configKey = var22.configKey,
			allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then true else nil,
			loadTimer = sduiLoadTimer.createLoadTimer(var22.configKey)
		}
	end, { entryPoint, var22 })
	reactModule.useEffect(function() --[[ line: 112 ]]
		-- upvalues: fetchPromptsModule (copy), var25 (ref)
		fetchPromptsModule(var25)
	end, { var25 })
	local var26 = usePromptEntriesModule(var22.configKey, promptStyleModule.Modal)
	local var27 = var26[1]
	local var28 = if fFlagSduiDismissPromptAction then reactModule.useRef(nil) else nil
	local var29 = if fFlagSduiDismissPromptAction then reactModule.useRef(nil) else nil
	reactModule.useEffect(function() --[[ line: 135 ]]
		-- upvalues: var23 (ref), var24 (ref), var27 (ref), var21 (ref), entryPoint (ref), var19 (ref), setCentralOverlay (copy), centralOverlayType (copy), var22 (ref), fFlagPromptsImpressionUsesTitle (copy), fFlagSduiDismissPromptAction (copy), var28 (ref), var29 (ref)
		if var23 then return end
		if var24 then return end
		if var27 == nil or var27.config == nil or (var27.identifier == nil or var27.robloxComponentType == nil) or var27.title == nil then return end
		var21.setHasShown(entryPoint, true)
		var19(setCentralOverlay(centralOverlayType.SduiPromptModal, {
			configKey = var22.configKey,
			appPage = var22.appPage,
			modalId = var27.identifier,
			modalType = if fFlagPromptsImpressionUsesTitle then var27.title else var27.robloxComponentType
		}))
		
		if fFlagSduiDismissPromptAction then
			var28.current = var27.title
			var29.current = var27.identifier
		end
	end, {
		var23, var24, var19, var21, var27, var22, entryPoint
	})
	
	if fFlagSduiDismissPromptAction then
		reactModule.useEffect(function() --[[ line: 186 ]]
			-- upvalues: var28 (ref), var26 (ref), var29 (ref), var20 (ref), centralOverlayType (copy), var19 (ref), setCentralOverlay (copy)
			local current = var28.current
			
			if current == nil then return end
			for i, v in var26 do
				if v.title == current then return end
			end
			local current_1 = var29.current
			var28.current = nil
			var29.current = nil
			local centralOverlay = var20:getState().CentralOverlay
			
			if centralOverlay ~= nil and centralOverlay.OverlayType == centralOverlayType.SduiPromptModal and (centralOverlay.Arguments ~= nil and centralOverlay.Arguments.modalId == current_1) then
				var19(setCentralOverlay())
			end
		end, { var26, var19, var20 })
	end
	local var30 = promptStyle == promptStyleModule.SurfaceBanner
	local var31 = usePromptEntriesModule(var22.configKey, promptStyleModule.SurfaceBanner)
	local var32 = if var30 then var31[1] else nil
	local var33 = if var32 then var32.identifier else nil
	local var34 = if var32 then if fFlagPromptsImpressionUsesTitle then var32.title else var32.robloxComponentType else nil
	local var35 = promptStyle == promptStyleModule.InlineBanner
	local var36 = if var35 then usePromptEntriesModule(var22.configKey, promptStyleModule.InlineBanner)[1] else nil
	local var37 = if var36 then var36.identifier else nil
	local var38 = if var36 then if fFlagPromptsImpressionUsesTitle then var36.title else var36.robloxComponentType else nil
	reactModule.useEffect(function() --[[ line: 235 ]]
		-- upvalues: var33 (ref), var34 (ref), reportPromptImpressionModule (copy), loggerModule (copy), sendModalImpressionEventModule (copy)
		if var33 and var34 then
			reportPromptImpressionModule(var34, var33):catch(function() --[[ line: 237 ]]
				-- upvalues: loggerModule (copy)
				loggerModule:warning("Failed to report prompt impression")
			end)
			sendModalImpressionEventModule(var33, var34)
		end
	end, { var33, var34 })
	reactModule.useEffect(function() --[[ line: 244 ]]
		-- upvalues: var37 (ref), var38 (ref), reportPromptImpressionModule (copy), loggerModule (copy), sendModalImpressionEventModule (copy)
		if var37 and var38 then
			reportPromptImpressionModule(var38, var37):catch(function() --[[ line: 246 ]]
				-- upvalues: loggerModule (copy)
				loggerModule:warning("Failed to report prompt impression")
			end)
			sendModalImpressionEventModule(var37, var38)
		end
	end, { var37, var38 })
	local var39 = false
	
	if fFlagPromptsHandlerCoachmarkEnabled then
		for i, v in usePromptEntriesModule(var22.configKey, promptStyleModule.Coachmark) do
			if v.config and v.identifier and v.title then
				var39 = true
				break
			end
		end
	end
	local var40 = fFlagSduiSurfaceBannerScrollAwaySticky and (fFlagAppIaScrollAway and appNavBarModule.getScrollAwayEnabled())
	local frame = nil
	
	if var30 then
		frame = if fFlagSduiSystemBannerComponent and var32 and var40 then reactModule.createElement(surfaceBannerModule, {
			identifier = var32.identifier,
			configKey = var22.configKey,
			appPage = var22.appPage,
			surfaceBannerContent = p0.surfaceBannerContent
		}) elseif fFlagSduiSystemBannerComponent and var32 then reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			SurfaceBanner = reactModule.createElement(sduiFeatureEntryPoint, {
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				LayoutOrder = 1,
				configKey = var22.configKey,
				identifier = var32.identifier,
				appPage = var22.appPage
			}),
			ContentContainer = reactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
				Content = p0.surfaceBannerContent
			})
		}) else p0.surfaceBannerContent
	elseif var35 then
		frame = if var36 then reactModule.createElement(sduiFeatureEntryPoint, {
			shouldDisplayLoading = false,
			shouldDisplayError = false,
			configKey = var22.configKey,
			identifier = var36.identifier,
			appPage = var22.appPage
		}) else p0.inlineBannerFallback
	end
	if fFlagHomepagePromptsPaddingFix and var35 then
		local var42 = var31[1] ~= nil
		
		if frame ~= nil then
			frame = reactModule.createElement(view, {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				padding = {
					top = if var42 and p0.topPadding ~= nil then UDim.new(0, p0.topPadding) else nil,
					bottom = if p0.bottomPadding ~= nil then UDim.new(0, p0.bottomPadding) else nil
				}
			}, { InlineBanner = frame })
		elseif var42 and p0.topPadding then
			frame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, p0.topPadding)
			})
		end
	end
	return if fFlagPromptsHandlerCoachmarkEnabled and var39 then reactModule.createElement(reactModule.Fragment, nil, {
		Slot = frame,
		Coachmarks = reactModule.createElement(coachmarkRendererModule, { surfaceConfig = var22, hasShownKey = entryPoint })
	}) else frame
end)