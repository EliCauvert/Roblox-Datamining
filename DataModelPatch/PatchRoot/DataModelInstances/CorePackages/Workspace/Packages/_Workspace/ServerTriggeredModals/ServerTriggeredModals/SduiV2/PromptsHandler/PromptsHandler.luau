local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local ReactModule = require(Parent.React)
local AppNavBarModule = require(Parent.AppNavBar)
local SignalsReactModule = require(Parent.SignalsReact)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SharedFlagsModule = require(Parent.SharedFlags)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local SduiFeatureEntryPoint = SduiSharedUtilitiesModule.SduiFeatureEntryPoint
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local View = require(Parent.Foundation).View
local LoggerModule = require(ServerTriggeredModals.Logger)
local ReportPromptImpressionModule = require(ServerTriggeredModals.reportPromptImpression)
local SendModalImpressionEventModule = require(ServerTriggeredModals.sendModalImpressionEvent)
local FetchPromptsModule = require(ServerTriggeredModals.SduiV2.fetchPrompts)
local _ = require(ServerTriggeredModals.SduiV2.PromptsEntryPoint)
local PromptStyleModule = require(ServerTriggeredModals.SduiV2.PromptStyle)
local UsePromptEntriesModule = require(ServerTriggeredModals.SduiV2.usePromptEntries)
local UseModalSignalStoreModule = require(ServerTriggeredModals.SignalStores.useModalSignalStore)
local GetEntryPointSurfaceConfigModule = require(script.Parent.getEntryPointSurfaceConfig)
local CoachmarkRendererModule = require(script.Parent.CoachmarkRenderer)
local SurfaceBannerModule = require(script.Parent.SurfaceBanner)
local FFlagSduiAllowNoConfigsBuilt = SharedFlagsModule.FFlagSduiAllowNoConfigsBuilt
local FFlagPromptsImpressionUsesTitle = SharedFlagsModule.FFlagPromptsImpressionUsesTitle
local FFlagPromptsHandlerCoachmarkEnabled = SharedFlagsModule.FFlagPromptsHandlerCoachmarkEnabled
local FFlagSduiSystemBannerComponent = SharedFlagsModule.FFlagSduiSystemBannerComponent
local FFlagSduiSurfaceBannerScrollAwaySticky = SharedFlagsModule.FFlagSduiSurfaceBannerScrollAwaySticky
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagSduiDismissPromptAction = SharedFlagsModule.FFlagSduiDismissPromptAction
local FFlagHomepagePromptsPaddingFix = SharedFlagsModule.FFlagHomepagePromptsPaddingFix

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), FFlagSduiDismissPromptAction (copy), UseStoreFunction (copy), UseModalSignalStoreModule (copy), ReactModule (copy), GetEntryPointSurfaceConfigModule (copy), SignalsReactModule (copy), FFlagSduiAllowNoConfigsBuilt (copy), SduiLoadTimer (copy), FetchPromptsModule (copy), UsePromptEntriesModule (copy), PromptStyleModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), FFlagPromptsImpressionUsesTitle (copy), ReportPromptImpressionModule (copy), LoggerModule (copy), SendModalImpressionEventModule (copy), FFlagPromptsHandlerCoachmarkEnabled (copy), FFlagSduiSurfaceBannerScrollAwaySticky (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), FFlagSduiSystemBannerComponent (copy), SurfaceBannerModule (copy), SduiFeatureEntryPoint (copy), FFlagHomepagePromptsPaddingFix (copy), View (copy), CoachmarkRendererModule (copy)
	local EntryPoint = p1.entryPoint
	local PromptStyle = p1.promptStyle
	local UseDispatchResult = UseDispatchFunction()
	local UseStoreResult = if FFlagSduiDismissPromptAction then UseStoreFunction() else nil
	local UseModalSignalStoreModuleResult = UseModalSignalStoreModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetEntryPointSurfaceConfigModule (upval), EntryPoint (copy)
		return GetEntryPointSurfaceConfigModule(EntryPoint)
	end, { EntryPoint })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseModalSignalStoreModuleResult.getHasShownGetter(EntryPoint))
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseModalSignalStoreModuleResult.getMetadataGetter(EntryPoint))
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: EntryPoint (copy), UseMemoResult (copy), FFlagSduiAllowNoConfigsBuilt (upval), SduiLoadTimer (upval)
		return {
			clearOnEmptyResponse = true,
			entryPoint = EntryPoint,
			surfaceKey = UseMemoResult.surfaceKey,
			configKey = UseMemoResult.configKey,
			allowNoConfigsBuilt = if FFlagSduiAllowNoConfigsBuilt then true else nil,
			loadTimer = SduiLoadTimer.createLoadTimer(UseMemoResult.configKey)
		}
	end, { EntryPoint, UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: FetchPromptsModule (upval), UseMemoResult1 (copy)
		FetchPromptsModule(UseMemoResult1)
	end, { UseMemoResult1 })
	local UsePromptEntriesModuleResult = UsePromptEntriesModule(UseMemoResult.configKey, PromptStyleModule.Modal)
	local UsePromptEntriesModuleResultEntry = UsePromptEntriesModuleResult[1]
	local UseRefResult = if FFlagSduiDismissPromptAction then ReactModule.useRef(nil) else nil
	local UseRefResult1 = if FFlagSduiDismissPromptAction then ReactModule.useRef(nil) else nil
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), UseSignalStateResult1 (copy), UsePromptEntriesModuleResultEntry (copy), UseModalSignalStoreModuleResult (copy), EntryPoint (copy), UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), UseMemoResult (copy), FFlagPromptsImpressionUsesTitle (upval), FFlagSduiDismissPromptAction (upval), UseRefResult (copy), UseRefResult1 (copy)
		if UseSignalStateResult then return end
		if UseSignalStateResult1 then return end
		if UsePromptEntriesModuleResultEntry == nil or UsePromptEntriesModuleResultEntry.config == nil or UsePromptEntriesModuleResultEntry.identifier == nil or UsePromptEntriesModuleResultEntry.robloxComponentType == nil or UsePromptEntriesModuleResultEntry.title == nil then return end
		UseModalSignalStoreModuleResult.setHasShown(EntryPoint, true)
		UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.SduiPromptModal, {
			configKey = UseMemoResult.configKey,
			appPage = UseMemoResult.appPage,
			modalId = UsePromptEntriesModuleResultEntry.identifier,
			modalType = if FFlagPromptsImpressionUsesTitle then UsePromptEntriesModuleResultEntry.title else UsePromptEntriesModuleResultEntry.robloxComponentType
		}))
		
		if FFlagSduiDismissPromptAction then
			UseRefResult.current = UsePromptEntriesModuleResultEntry.title
			UseRefResult1.current = UsePromptEntriesModuleResultEntry.identifier
		end
	end, {
		UseSignalStateResult, UseSignalStateResult1, UseDispatchResult,
		UseModalSignalStoreModuleResult, UsePromptEntriesModuleResultEntry,
		UseMemoResult, EntryPoint
	})
	
	if FFlagSduiDismissPromptAction then
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult (copy), UsePromptEntriesModuleResult (copy), UseRefResult1 (copy), UseStoreResult (copy), CentralOverlayType (upval), UseDispatchResult (copy), SetCentralOverlayFunction (upval)
			local Current = UseRefResult.current
			
			if Current == nil then return end
			for _, value in UsePromptEntriesModuleResult do
				if value.title == Current then return end
			end
			local Current1 = UseRefResult1.current
			UseRefResult.current = nil
			UseRefResult1.current = nil
			local CentralOverlay = UseStoreResult:getState().CentralOverlay
			
			if CentralOverlay ~= nil and CentralOverlay.OverlayType == CentralOverlayType.SduiPromptModal and CentralOverlay.Arguments ~= nil and CentralOverlay.Arguments.modalId == Current1 then
				UseDispatchResult(SetCentralOverlayFunction())
			end
		end, {
			UsePromptEntriesModuleResult,
			UseDispatchResult,
			UseStoreResult
		})
	end
	local IsPromptStyleMatch = PromptStyle == PromptStyleModule.SurfaceBanner
	local UsePromptEntriesModuleResult1 = UsePromptEntriesModule(UseMemoResult.configKey, PromptStyleModule.SurfaceBanner)
	local UsePromptEntriesModuleResultEntry1 = if IsPromptStyleMatch then UsePromptEntriesModuleResult1[1] else nil
	local Identifier = UsePromptEntriesModuleResultEntry1 and UsePromptEntriesModuleResultEntry1.identifier or nil
	local Title = if UsePromptEntriesModuleResultEntry1 then if FFlagPromptsImpressionUsesTitle then UsePromptEntriesModuleResultEntry1.title else UsePromptEntriesModuleResultEntry1.robloxComponentType else nil
	local IsPromptStyleMatch1 = PromptStyle == PromptStyleModule.InlineBanner
	local UsePromptEntriesModuleResult2 = UsePromptEntriesModule(UseMemoResult.configKey, PromptStyleModule.InlineBanner)
	local UsePromptEntriesModuleResultEntry2 = if IsPromptStyleMatch1 then UsePromptEntriesModuleResult2[1] else nil
	local Identifier1 = UsePromptEntriesModuleResultEntry2 and UsePromptEntriesModuleResultEntry2.identifier or nil
	local Title1 = if UsePromptEntriesModuleResultEntry2 then if FFlagPromptsImpressionUsesTitle then UsePromptEntriesModuleResultEntry2.title else UsePromptEntriesModuleResultEntry2.robloxComponentType else nil
	ReactModule.useEffect(function()
		-- upvalues: Identifier (copy), Title (copy), ReportPromptImpressionModule (upval), LoggerModule (upval), SendModalImpressionEventModule (upval)
		if Identifier and Title then
			ReportPromptImpressionModule(Title, Identifier):catch(function()
				-- upvalues: LoggerModule (upval)
				LoggerModule:warning("Failed to report prompt impression")
			end)
			SendModalImpressionEventModule(Identifier, Title)
		end
	end, { Identifier, Title })
	ReactModule.useEffect(function()
		-- upvalues: Identifier1 (copy), Title1 (copy), ReportPromptImpressionModule (upval), LoggerModule (upval), SendModalImpressionEventModule (upval)
		if Identifier1 and Title1 then
			ReportPromptImpressionModule(Title1, Identifier1):catch(function()
				-- upvalues: LoggerModule (upval)
				LoggerModule:warning("Failed to report prompt impression")
			end)
			SendModalImpressionEventModule(Identifier1, Title1)
		end
	end, { Identifier1, Title1 })
	local Flag = false
	
	if FFlagPromptsHandlerCoachmarkEnabled then
		for _, value in UsePromptEntriesModule(UseMemoResult.configKey, PromptStyleModule.Coachmark) do
			if value.config and value.identifier and value.title then
				Flag = true
				break
			end
		end
	end
	local ScrollAwayEnabled = FFlagSduiSurfaceBannerScrollAwaySticky and (FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled())
	local Element = nil
	
	if IsPromptStyleMatch then
		Element = if FFlagSduiSystemBannerComponent and UsePromptEntriesModuleResultEntry1 and ScrollAwayEnabled then ReactModule.createElement(SurfaceBannerModule, {
			identifier = UsePromptEntriesModuleResultEntry1.identifier,
			configKey = UseMemoResult.configKey,
			appPage = UseMemoResult.appPage,
			surfaceBannerContent = p1.surfaceBannerContent
		}) elseif FFlagSduiSystemBannerComponent and UsePromptEntriesModuleResultEntry1 then ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			SurfaceBanner = ReactModule.createElement(SduiFeatureEntryPoint, {
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				LayoutOrder = 1,
				configKey = UseMemoResult.configKey,
				identifier = UsePromptEntriesModuleResultEntry1.identifier,
				appPage = UseMemoResult.appPage
			}),
			ContentContainer = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UIFlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
				Content = p1.surfaceBannerContent
			})
		}) else p1.surfaceBannerContent
	elseif IsPromptStyleMatch1 then
		Element = if UsePromptEntriesModuleResultEntry2 then ReactModule.createElement(SduiFeatureEntryPoint, {
			shouldDisplayLoading = false,
			shouldDisplayError = false,
			configKey = UseMemoResult.configKey,
			identifier = UsePromptEntriesModuleResultEntry2.identifier,
			appPage = UseMemoResult.appPage
		}) else p1.inlineBannerFallback
	end
	if FFlagHomepagePromptsPaddingFix and IsPromptStyleMatch1 then
		local HasUsePromptEntriesModuleResultEntry = UsePromptEntriesModuleResult1[1] ~= nil
		
		if Element ~= nil then
			local HasTopPadding: boolean = HasUsePromptEntriesModuleResultEntry and p1.topPadding ~= nil
			local HasBottomPadding = p1.bottomPadding ~= nil
			Element = ReactModule.createElement(View, {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				padding = {
					top = if HasTopPadding then UDim.new(0, p1.topPadding) else nil,
					bottom = if HasBottomPadding then UDim.new(0, p1.bottomPadding) else nil
				}
			}, { InlineBanner = Element })
		elseif HasUsePromptEntriesModuleResultEntry and p1.topPadding then
			Element = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, p1.topPadding)
			})
		end
	end
	return if FFlagPromptsHandlerCoachmarkEnabled and Flag then ReactModule.createElement(ReactModule.Fragment, nil, {
		Slot = Element,
		Coachmarks = ReactModule.createElement(CoachmarkRendererModule, { surfaceConfig = UseMemoResult, hasShownKey = EntryPoint })
	}) else Element
end)