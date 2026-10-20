local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local ReactModule = require(Parent.React)
local AppNavBarModule = require(Parent.AppNavBar)
local SignalsReactModule = require(Parent.SignalsReact)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagPushNotificationsUpsellPassClientAttributesToPrompts = SharedFlagsModule.FFlagPushNotificationsUpsellPassClientAttributesToPrompts
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local SduiFeatureEntryPoint = SduiSharedUtilitiesModule.SduiFeatureEntryPoint
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local View = require(Parent.Foundation).View
local LoggerModule = require(ServerTriggeredModals.Logger)
local ReportPromptImpressionModule = require(ServerTriggeredModals.reportPromptImpression)
local SendModalImpressionEventFunction = require(Parent.ServerTriggeredModalImpressions).sendModalImpressionEvent
local FetchPromptsModule = require(ServerTriggeredModals.SduiV2.fetchPrompts)
local PromptsEntryPointModule = require(ServerTriggeredModals.SduiV2.PromptsEntryPoint)
local PromptStyleModule = require(ServerTriggeredModals.SduiV2.PromptStyle)
local UsePromptEntriesModule = require(ServerTriggeredModals.SduiV2.usePromptEntries)
local UseModalSignalStoreModule = require(ServerTriggeredModals.SignalStores.useModalSignalStore)
local FFlagPromptsActionEventLoggingModule = require(ServerTriggeredModals.Flags.FFlagPromptsActionEventLogging)
local GetEntryPointSurfaceConfigModule = require(script.Parent.getEntryPointSurfaceConfig)
local GetHomepagePromptsClientAttributesModule = require(script.Parent.Parent.getHomepagePromptsClientAttributes)
local CoachmarkRendererModule = require(script.Parent.CoachmarkRenderer)
local SurfaceBannerModule = require(script.Parent.SurfaceBanner)
local FFlagSduiAllowNoConfigsBuilt = SharedFlagsModule.FFlagSduiAllowNoConfigsBuilt
local FFlagPromptsImpressionUsesTitle = SharedFlagsModule.FFlagPromptsImpressionUsesTitle
local FFlagPromptsHandlerCoachmarkEnabled = SharedFlagsModule.FFlagPromptsHandlerCoachmarkEnabled
local FFlagEdpGameLeavePromptsHandlerEnabled = SharedFlagsModule.FFlagEdpGameLeavePromptsHandlerEnabled
local FFlagEdpOpenPromptsHandlerEnabled = SharedFlagsModule.FFlagEdpOpenPromptsHandlerEnabled
local FFlagSduiSystemBannerComponent = SharedFlagsModule.FFlagSduiSystemBannerComponent
local FFlagSduiSurfaceBannerScrollAwaySticky = SharedFlagsModule.FFlagSduiSurfaceBannerScrollAwaySticky
local FFlagSduiSurfaceBannerAlwaysMounted = SharedFlagsModule.FFlagSduiSurfaceBannerAlwaysMounted
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagSduiDismissPromptAction = SharedFlagsModule.FFlagSduiDismissPromptAction
local FFlagHomepagePromptsPaddingFix = SharedFlagsModule.FFlagHomepagePromptsPaddingFix
local FFlagHomepagePromptsHandlerPassClientAttributes = SharedFlagsModule.FFlagHomepagePromptsHandlerPassClientAttributes
local FFlagPromptsEdpOpenReplaceOnFetch = SharedFlagsModule.FFlagPromptsEdpOpenReplaceOnFetch

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), FFlagSduiDismissPromptAction (copy), UseStoreFunction (copy), UseModalSignalStoreModule (copy), FFlagEdpGameLeavePromptsHandlerEnabled (copy), FFlagEdpOpenPromptsHandlerEnabled (copy), FFlagPromptsEdpOpenReplaceOnFetch (copy), FFlagPushNotificationsUpsellPassClientAttributesToPrompts (copy), GetHomepagePromptsClientAttributesModule (copy), ReactModule (copy), GetEntryPointSurfaceConfigModule (copy), SignalsReactModule (copy), FFlagHomepagePromptsHandlerPassClientAttributes (copy), PromptsEntryPointModule (copy), FFlagSduiAllowNoConfigsBuilt (copy), SduiLoadTimer (copy), FetchPromptsModule (copy), UsePromptEntriesModule (copy), PromptStyleModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), FFlagPromptsImpressionUsesTitle (copy), ReportPromptImpressionModule (copy), LoggerModule (copy), SendModalImpressionEventFunction (copy), FFlagPromptsHandlerCoachmarkEnabled (copy), FFlagSduiSurfaceBannerScrollAwaySticky (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), FFlagSduiSurfaceBannerAlwaysMounted (copy), FFlagSduiSystemBannerComponent (copy), SurfaceBannerModule (copy), SduiFeatureEntryPoint (copy), FFlagPromptsActionEventLoggingModule (copy), FFlagHomepagePromptsPaddingFix (copy), View (copy), CoachmarkRendererModule (copy)
	local EntryPoint = p1.entryPoint
	local PromptStyle = p1.promptStyle
	local UseDispatchResult = UseDispatchFunction()
	local UseStoreResult = if FFlagSduiDismissPromptAction then UseStoreFunction() else nil
	local UseModalSignalStoreModuleResult = UseModalSignalStoreModule()
	local UniverseId = if FFlagEdpGameLeavePromptsHandlerEnabled or FFlagEdpOpenPromptsHandlerEnabled then if p1.clientAttributes == nil then nil else p1.clientAttributes.universeId else nil
	local ReplaceOnFetch = if FFlagPromptsEdpOpenReplaceOnFetch then p1.replaceOnFetch else nil
	local UseResult = if FFlagPushNotificationsUpsellPassClientAttributesToPrompts then GetHomepagePromptsClientAttributesModule.use(EntryPoint, p1.clientAttributes) else nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagEdpGameLeavePromptsHandlerEnabled (upval), FFlagEdpOpenPromptsHandlerEnabled (upval), GetEntryPointSurfaceConfigModule (upval), EntryPoint (copy), UniverseId (copy)
		return if FFlagEdpGameLeavePromptsHandlerEnabled or FFlagEdpOpenPromptsHandlerEnabled then GetEntryPointSurfaceConfigModule(EntryPoint, UniverseId) else GetEntryPointSurfaceConfigModule(EntryPoint)
	end, if FFlagEdpGameLeavePromptsHandlerEnabled or FFlagEdpOpenPromptsHandlerEnabled then { EntryPoint, UniverseId } else { EntryPoint })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseModalSignalStoreModuleResult.getHasShownGetter(EntryPoint))
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseModalSignalStoreModuleResult.getMetadataGetter(EntryPoint))
	local UseMemoResult2 = nil
	local UseMemoResult1 = nil
	
	if FFlagHomepagePromptsHandlerPassClientAttributes then
		UseMemoResult1 = ReactModule.useMemo(function()
			-- upvalues: FFlagPushNotificationsUpsellPassClientAttributesToPrompts (upval), EntryPoint (copy), PromptsEntryPointModule (upval), FFlagEdpGameLeavePromptsHandlerEnabled (upval), FFlagEdpOpenPromptsHandlerEnabled (upval), p1 (copy), UseResult (copy), GetHomepagePromptsClientAttributesModule (upval)
			return if FFlagPushNotificationsUpsellPassClientAttributesToPrompts and EntryPoint == PromptsEntryPointModule.HomepageLaunch and (not FFlagEdpGameLeavePromptsHandlerEnabled and not FFlagEdpOpenPromptsHandlerEnabled or p1.clientAttributes == nil) then UseResult elseif (FFlagEdpGameLeavePromptsHandlerEnabled or FFlagEdpOpenPromptsHandlerEnabled) and p1.clientAttributes ~= nil then p1.clientAttributes elseif EntryPoint == PromptsEntryPointModule.HomepageLaunch then GetHomepagePromptsClientAttributesModule.get() else nil
		end, { EntryPoint, UseResult, p1.clientAttributes })
		UseMemoResult2 = ReactModule.useMemo(function()
			-- upvalues: EntryPoint (copy), UseMemoResult (copy), FFlagSduiAllowNoConfigsBuilt (upval), SduiLoadTimer (upval), UseMemoResult1 (ref), FFlagPromptsEdpOpenReplaceOnFetch (upval), ReplaceOnFetch (copy)
			return {
				clearOnEmptyResponse = true,
				entryPoint = EntryPoint,
				surfaceKey = UseMemoResult.surfaceKey,
				configKey = UseMemoResult.configKey,
				allowNoConfigsBuilt = if FFlagSduiAllowNoConfigsBuilt then true else nil,
				loadTimer = SduiLoadTimer.createLoadTimer(UseMemoResult.configKey),
				clientAttributes = UseMemoResult1,
				replaceOnFetch = if FFlagPromptsEdpOpenReplaceOnFetch then ReplaceOnFetch else nil
			}
		end, {
			EntryPoint,
			UseMemoResult,
			UseMemoResult1,
			if FFlagPromptsEdpOpenReplaceOnFetch then ReplaceOnFetch else nil
		})
	else
		UseMemoResult2 = ReactModule.useMemo(function()
			-- upvalues: EntryPoint (copy), UseMemoResult (copy), FFlagSduiAllowNoConfigsBuilt (upval), SduiLoadTimer (upval), FFlagEdpGameLeavePromptsHandlerEnabled (upval), FFlagEdpOpenPromptsHandlerEnabled (upval), p1 (copy), FFlagPromptsEdpOpenReplaceOnFetch (upval), ReplaceOnFetch (copy)
			return {
				clearOnEmptyResponse = true,
				entryPoint = EntryPoint,
				surfaceKey = UseMemoResult.surfaceKey,
				configKey = UseMemoResult.configKey,
				allowNoConfigsBuilt = if FFlagSduiAllowNoConfigsBuilt then true else nil,
				loadTimer = SduiLoadTimer.createLoadTimer(UseMemoResult.configKey),
				clientAttributes = if FFlagEdpGameLeavePromptsHandlerEnabled or FFlagEdpOpenPromptsHandlerEnabled then p1.clientAttributes else nil,
				replaceOnFetch = if FFlagPromptsEdpOpenReplaceOnFetch then ReplaceOnFetch else nil
			}
		end, if FFlagEdpGameLeavePromptsHandlerEnabled or FFlagEdpOpenPromptsHandlerEnabled then {
			EntryPoint,
			UseMemoResult,
			p1.clientAttributes,
			if FFlagPromptsEdpOpenReplaceOnFetch then ReplaceOnFetch else nil
		} else {
			EntryPoint,
			UseMemoResult,
			if FFlagPromptsEdpOpenReplaceOnFetch then ReplaceOnFetch else nil
		})
	end
	if FFlagPushNotificationsUpsellPassClientAttributesToPrompts then
		ReactModule.useEffect(function()
			-- upvalues: EntryPoint (copy), PromptsEntryPointModule (upval), FFlagEdpGameLeavePromptsHandlerEnabled (upval), FFlagEdpOpenPromptsHandlerEnabled (upval), p1 (copy), UseMemoResult1 (ref), FetchPromptsModule (upval), UseMemoResult2 (ref)
			local Inverted: boolean = EntryPoint == PromptsEntryPointModule.HomepageLaunch and not (if FFlagEdpGameLeavePromptsHandlerEnabled then p1.clientAttributes ~= nil else FFlagEdpOpenPromptsHandlerEnabled and p1.clientAttributes ~= nil)
			
			if Inverted and UseMemoResult1 == nil then return end
			local Inverted1 = if FFlagEdpOpenPromptsHandlerEnabled then Inverted or EntryPoint == PromptsEntryPointModule.ExperienceDetailsPageOpen else nil
			
			if (FFlagEdpOpenPromptsHandlerEnabled or not Inverted) and (not FFlagEdpOpenPromptsHandlerEnabled or not Inverted1) then
				FetchPromptsModule(UseMemoResult2)
				
				return
			else
				FetchPromptsModule(UseMemoResult2, true)
			end
		end, {
			EntryPoint,
			UseMemoResult2,
			p1.clientAttributes,
			UseMemoResult1
		})
	else
		ReactModule.useEffect(function()
			-- upvalues: FFlagEdpOpenPromptsHandlerEnabled (upval), EntryPoint (copy), PromptsEntryPointModule (upval), FetchPromptsModule (upval), UseMemoResult2 (ref)
			local IsEntryPointMatch = if FFlagEdpOpenPromptsHandlerEnabled then EntryPoint == PromptsEntryPointModule.ExperienceDetailsPageOpen else nil
			FetchPromptsModule(UseMemoResult2, if FFlagEdpOpenPromptsHandlerEnabled and IsEntryPointMatch then true else nil)
		end, {
			UseMemoResult2,
			if FFlagEdpOpenPromptsHandlerEnabled then EntryPoint else nil
		})
	end
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
		-- upvalues: Identifier (copy), Title (copy), ReportPromptImpressionModule (upval), LoggerModule (upval), SendModalImpressionEventFunction (upval)
		if Identifier and Title then
			ReportPromptImpressionModule(Title, Identifier):catch(function()
				-- upvalues: LoggerModule (upval)
				LoggerModule:warning("Failed to report prompt impression")
			end)
			SendModalImpressionEventFunction(Identifier, Title)
		end
	end, { Identifier, Title })
	ReactModule.useEffect(function()
		-- upvalues: Identifier1 (copy), Title1 (copy), ReportPromptImpressionModule (upval), LoggerModule (upval), SendModalImpressionEventFunction (upval)
		if Identifier1 and Title1 then
			ReportPromptImpressionModule(Title1, Identifier1):catch(function()
				-- upvalues: LoggerModule (upval)
				LoggerModule:warning("Failed to report prompt impression")
			end)
			SendModalImpressionEventFunction(Identifier1, Title1)
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
	local HasUsePromptEntriesModuleResultEntry = UsePromptEntriesModuleResultEntry1 ~= nil or FFlagSduiSurfaceBannerAlwaysMounted
	local Element = nil
	
	if IsPromptStyleMatch then
		Element = if FFlagSduiSystemBannerComponent and HasUsePromptEntriesModuleResultEntry and ScrollAwayEnabled then ReactModule.createElement(SurfaceBannerModule, {
			identifier = if UsePromptEntriesModuleResultEntry1 then UsePromptEntriesModuleResultEntry1.identifier else nil,
			configKey = UseMemoResult.configKey,
			appPage = UseMemoResult.appPage,
			surfaceBannerContent = p1.surfaceBannerContent
		}) elseif FFlagSduiSystemBannerComponent and HasUsePromptEntriesModuleResultEntry then ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			SurfaceBanner = if UsePromptEntriesModuleResultEntry1 then ReactModule.createElement(SduiFeatureEntryPoint, {
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				LayoutOrder = 1,
				configKey = UseMemoResult.configKey,
				identifier = UsePromptEntriesModuleResultEntry1.identifier,
				appPage = UseMemoResult.appPage,
				additionalAnalyticsData = if FFlagPromptsActionEventLoggingModule then {
					promptInstanceId = if UsePromptEntriesModuleResultEntry1.identifier then UsePromptEntriesModuleResultEntry1.identifier else nil
				} else nil
			}) else nil,
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
			appPage = UseMemoResult.appPage,
			additionalAnalyticsData = if FFlagPromptsActionEventLoggingModule then {
				promptInstanceId = if UsePromptEntriesModuleResultEntry2.identifier then UsePromptEntriesModuleResultEntry2.identifier else nil
			} else nil
		}) else p1.inlineBannerFallback
	end
	if FFlagHomepagePromptsPaddingFix and IsPromptStyleMatch1 then
		local HasUsePromptEntriesModuleResultEntry1 = UsePromptEntriesModuleResult1[1] ~= nil
		
		if Element ~= nil then
			local HasTopPadding: boolean = HasUsePromptEntriesModuleResultEntry1 and p1.topPadding ~= nil
			local HasBottomPadding = p1.bottomPadding ~= nil
			Element = ReactModule.createElement(View, {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				padding = {
					top = if HasTopPadding then UDim.new(0, p1.topPadding) else nil,
					bottom = if HasBottomPadding then UDim.new(0, p1.bottomPadding) else nil
				}
			}, { InlineBanner = Element })
		elseif HasUsePromptEntriesModuleResultEntry1 and p1.topPadding then
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