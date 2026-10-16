local GuiService = game:GetService("GuiService")
local Parent = script:FindFirstAncestor("SplitPane").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ResponsiveModule = require(Parent.Responsive)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local SplitPaneEducationalTourStepsModule = require(script.Parent.SplitPaneEducationalTourSteps)
local GetSplitPaneEducationalTourPresentationModule = require(script.Parent.getSplitPaneEducationalTourPresentation)
local UseTrackedRectModule = require(script.Parent.useTrackedRect)
local GetSplitPaneEducationalTourTooltipModelModule = require(script.Parent.getSplitPaneEducationalTourTooltipModel)
local UseSplitPaneEducationalTourLifecycleModule = require(script.Parent.useSplitPaneEducationalTourLifecycle)
local SplitPaneEducationalTourViewModule = require(script.Parent.SplitPaneEducationalTourView)
local FFlagDebugSplitPaneEducationalTourAutoStartModule = require(script.Parent.Parent.Flags.FFlagDebugSplitPaneEducationalTourAutoStart)
local FFlagSplitPaneEducationalTourPreloadVideosModule = require(script.Parent.Parent.Flags.FFlagSplitPaneEducationalTourPreloadVideos)
local UseSplitPaneEducationalTourVideoPreloadModule = if FFlagSplitPaneEducationalTourPreloadVideosModule then require(script.Parent.useSplitPaneEducationalTourVideoPreload) else nil
local FFlagSplitPaneEducationalTourSkipOnDeepLinkModule = require(script.Parent.Parent.Flags.FFlagSplitPaneEducationalTourSkipOnDeepLink)
local DeepLinkLuaReceiverStatusStore = if FFlagSplitPaneEducationalTourSkipOnDeepLinkModule then require(Parent.DeepLink).DeepLinkLuaReceiverStatusStore else nil
local IsSplitPaneEducationalTourGuiObjectVisibleModule = require(script.Parent.isSplitPaneEducationalTourGuiObjectVisible)
local GetSplitPaneEducationalTourStoreModule = require(script.Parent.Parent.Stores.getSplitPaneEducationalTourStore)
local SplitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local Flags = FoundationModule.Utility.Flags
local UseOverlayFunction = FoundationModule.Hooks.useOverlay
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseFocusOnMountFunction = FocusNavigationUtilsModule.useFocusOnMount
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local Input = ResponsiveModule.Input
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseDefaultFocusBehaviorFunction = ReactFocusNavigationModule.useDefaultFocusBehavior
local SupportPaneMode = require(Parent.AppSplitView).Enums.SupportPaneMode
local CountSplitPaneEducationalTourStepsModule = #SplitPaneEducationalTourStepsModule
local Smallest = math.min(require(script.Parent.Parent.Flags.FIntSplitPaneEducationalTourStartDelayMs), 3000)
local IsSmallestAbove = Smallest > 0

local function selectStatusBarHeight(p1) --[[ Line: 75 ]]
	return if p1.TopBar == nil then 0 else p1.TopBar.statusBarHeight
end

local function selectIsCentralOverlayOpen(p1): boolean --[[ Line: 79 ]]
	return p1.CentralOverlay ~= nil and p1.CentralOverlay.OverlayType ~= nil
end

local function _(Current) --[[ Line: 83 | Named "useAnchorRef" ]]
	-- upvalues: ReactModule (copy)
	return ReactModule.useMemo(function() --[[ Line: 84 ]]
		-- upvalues: Current (copy)
		return if Current == nil then nil else { current = Current }
	end, { Current })
end

local function SplitPaneEducationalTourBody(p1) --[[ Line: 100 ]]
	-- upvalues: SupportPaneMode (copy), SplitPaneStoreModule (copy), UseSignalStateFunction (copy), ReactModule (copy), UseSelectorFunction (copy), selectStatusBarHeight (copy), UseTrackedRectModule (copy), UseOverlayFunction (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), UseScaledValueFunction (copy), Flags (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), UseDefaultFocusBehaviorFunction (copy), ReactFocusNavigationModule (copy), UsePreferredInputFunction (copy), Input (copy), UseFocusOnMountFunction (copy), IsSplitPaneEducationalTourGuiObjectVisibleModule (copy), GetSplitPaneEducationalTourPresentationModule (copy), UseSplitPaneEducationalTourLifecycleModule (copy), CountSplitPaneEducationalTourStepsModule (copy), IsSmallestAbove (copy), Smallest (copy), GuiService (copy), SplitPaneEducationalTourStepsModule (copy), GetSplitPaneEducationalTourTooltipModelModule (copy), SplitPaneEducationalTourViewModule (copy)
	local SupportPaneRef = p1.supportPaneRef
	local SupportPaneMode1 = p1.supportPaneMode
	local IsSupportPaneModeMatch = SupportPaneMode1 == SupportPaneMode.Collapsed
	local IsSupportSurfaceEligible = p1.isSupportSurfaceEligible
	local TourStore = p1.tourStore
	local Store = SplitPaneStoreModule.getStore()
	local StepIndex = p1.stepIndex
	local UseSignalStateResult = UseSignalStateFunction(Store.getShouldDefaultToCollapsed)
	local UseSignalStateResult1 = UseSignalStateFunction(TourStore.getCollapsedExpandButtonRect)
	local UseSignalStateResult2 = UseSignalStateFunction(TourStore.getCollapsedExpandButtonInstance)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 84 ]]
		-- upvalues: UseSignalStateResult2 (copy)
		return if UseSignalStateResult2 == nil then nil else { current = UseSignalStateResult2 }
	end, { UseSignalStateResult2 })
	local UseSelectorResult = UseSelectorFunction(selectStatusBarHeight)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(nil)
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 84 ]]
		-- upvalues: UseStateResult (copy)
		return if UseStateResult == nil then nil else { current = UseStateResult }
	end, { UseStateResult })
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 84 ]]
		-- upvalues: UseStateResult1 (copy)
		return if UseStateResult1 == nil then nil else { current = UseStateResult1 }
	end, { UseStateResult1 })
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 84 ]]
		-- upvalues: UseStateResult3 (copy)
		return if UseStateResult3 == nil then nil else { current = UseStateResult3 }
	end, { UseStateResult3 })
	local UseMemoResult4 = ReactModule.useMemo(function() --[[ Line: 84 ]]
		-- upvalues: UseStateResult4 (copy)
		return if UseStateResult4 == nil then nil else { current = UseStateResult4 }
	end, { UseStateResult4 })
	local UseMemoResult5 = ReactModule.useMemo(function() --[[ Line: 84 ]]
		-- upvalues: UseStateResult5 (copy)
		return if UseStateResult5 == nil then nil else { current = UseStateResult5 }
	end, { UseStateResult5 })
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(nil)
	ReactModule.useLayoutEffect(function() --[[ Line: 131 ]]
		-- upvalues: UseStateResult2_5 (copy), SupportPaneRef (copy)
		UseStateResult2_5(if SupportPaneRef == nil then nil else SupportPaneRef.current)
	end, { SupportPaneRef })
	local UseTrackedRectModuleResult = UseTrackedRectModule(UseStateResult6)
	local UseOverlayResult = UseOverlayFunction()
	local UseTrackedRectModuleResult1 = UseTrackedRectModule(if UseOverlayResult and UseOverlayResult:IsA("GuiObject") then UseOverlayResult else nil)
	local Min = if UseTrackedRectModuleResult1 == nil then nil else UseTrackedRectModuleResult1.Min
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		continueButton = "Feature.SplitPane.Tour.Button.Continue",
		finishTourButton = "Feature.SplitPane.Tour.Button.FinishTour",
		skipTourButton = "Feature.SplitPane.Tour.Button.SkipTour",
		stepOneCollapsedDescription = "Feature.SplitPane.Tour.Step1.Description.Collapsed",
		stepOneExpandedDescription = "Feature.SplitPane.Tour.Step1.Description.Expanded",
		stepOneTitle = "Feature.SplitPane.Tour.Step1.Title",
		stepTwoDescription = "Feature.SplitPane.Tour.Step2.Description",
		stepTwoTitle = "Feature.SplitPane.Tour.Step2.Title",
		stepThreeDescription = "Feature.SplitPane.Tour.Step3.Description",
		stepThreeTitle = "Feature.SplitPane.Tour.Step3.Title"
	})
	local UseScaledValueResult = UseScaledValueFunction(if Flags.FoundationEducationalTooltipRefresh then 280 else 320)
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = UseDefaultFocusBehaviorFunction((UseFocusRootFunction({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
	})))
	local UseResult = ReactModule.useCallback(function(Current) --[[ Line: 162 ]]
		-- upvalues: UseDefaultFocusBehaviorResult2 (copy)
		if typeof(UseDefaultFocusBehaviorResult2) == "function" then
			UseDefaultFocusBehaviorResult2(Current)
			
			return
		end
		if UseDefaultFocusBehaviorResult2 ~= nil then
			UseDefaultFocusBehaviorResult2.current = Current
		end
	end, { UseDefaultFocusBehaviorResult2 })
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UsePreferredInputResult = UsePreferredInputFunction()
	local IsUsePreferredInputResultMatch = UsePreferredInputResult == Input.Directional
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(nil)
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(false)
	local UseFocusOnMountResult = UseFocusOnMountFunction(UseDefaultFocusBehaviorResult)
	local UseResult1 = ReactModule.useCallback(function(Current) --[[ Line: 176 ]]
		-- upvalues: UseRefResult (copy), UseFocusOnMountResult (copy)
		UseRefResult.current = Current
		UseFocusOnMountResult(Current)
	end, { UseFocusOnMountResult })
	local UseResult2 = ReactModule.useCallback(function(p2) --[[ Line: 180 ]]
		-- upvalues: UseStateResult2_6 (copy), UseResult (copy)
		UseStateResult2_6(p2)
		UseResult(p2)
	end, { UseResult })
	ReactModule.useLayoutEffect(function() --[[ Line: 184 ]]
		-- upvalues: UseStateResult7 (copy), UseStateResult2_7 (copy), IsSplitPaneEducationalTourGuiObjectVisibleModule (upval)
		if UseStateResult7 == nil then
			UseStateResult2_7(false)
			
			return
		end
		local function updateVisibility() --[[ Line: 189 ]]
			-- upvalues: UseStateResult2_7 (upval), IsSplitPaneEducationalTourGuiObjectVisibleModule (upval), UseStateResult7 (upval)
			UseStateResult2_7(IsSplitPaneEducationalTourGuiObjectVisibleModule(UseStateResult7))
		end
		
		UseStateResult2_7(IsSplitPaneEducationalTourGuiObjectVisibleModule(UseStateResult7))
		local Connections = {}
		
		local function observeVisibleAncestors() --[[ Line: 194 ]]
			-- upvalues: Connections (ref), UseStateResult7 (upval), updateVisibility (copy), UseStateResult2_7 (upval), IsSplitPaneEducationalTourGuiObjectVisibleModule (upval)
			for _, connection in Connections do
				connection:Disconnect()
			end
			Connections = {}
			local Gui = UseStateResult7
			while Gui ~= nil do
				if Gui:IsA("GuiObject") then
					table.insert(Connections, Gui:GetPropertyChangedSignal("Visible"):Connect(updateVisibility))
				end
				Gui = Gui.Parent
			end
			UseStateResult2_7(IsSplitPaneEducationalTourGuiObjectVisibleModule(UseStateResult7))
		end
		
		observeVisibleAncestors()
		local AncestryChangedConnection = UseStateResult7.AncestryChanged:Connect(observeVisibleAncestors)
		
		return function() --[[ Line: 210 ]]
			-- upvalues: AncestryChangedConnection (copy), Connections (ref)
			AncestryChangedConnection:Disconnect()
			
			for _, connection in Connections do
				connection:Disconnect()
			end
		end
	end, { UseStateResult7 })
	local Min1 = Min or Vector2.zero
	local SplitPaneEducationalTourPresentationModule = GetSplitPaneEducationalTourPresentationModule({
		collapsedSpotlightPadding = 4,
		stepIndex = StepIndex,
		isSupportPaneCollapsed = IsSupportPaneModeMatch,
		isDirectionalInput = IsUsePreferredInputResultMatch,
		collapsedExpandButtonRect = UseSignalStateResult1,
		supportPaneRect = UseTrackedRectModuleResult,
		anchors = {
			gamepadCollapsedStepOne = UseMemoResult2,
			collapsedExpandButton = UseMemoResult,
			gamepadStepTwo = UseMemoResult3,
			bottomPane = UseMemoResult1,
			gamepadFinal = UseMemoResult4,
			topRightControl = UseMemoResult5,
			supportPane = SupportPaneRef
		}
	})
	local UseSplitPaneEducationalTourLifecycleModuleResult = UseSplitPaneEducationalTourLifecycleModule({
		isSupportSurfaceEligible = IsSupportSurfaceEligible,
		stepIndex = StepIndex,
		totalSteps = CountSplitPaneEducationalTourStepsModule,
		supportPaneMode = SupportPaneMode1,
		shouldDefaultToCollapsed = UseSignalStateResult,
		isSupportPaneCollapsed = IsSupportPaneModeMatch,
		tourStore = TourStore,
		splitPaneStore = Store
	})
	local UseStateResult9, UseStateResult2_8 = ReactModule.useState(not IsSmallestAbove)
	ReactModule.useEffect(function() --[[ Line: 249 ]]
		-- upvalues: IsSmallestAbove (upval), Smallest (upval), UseStateResult2_8 (copy)
		if not IsSmallestAbove then return end
		local Flag = false
		task.delay(Smallest / 1000, function() --[[ Line: 254 ]]
			-- upvalues: Flag (ref), UseStateResult2_8 (upval)
			if not Flag then
				UseStateResult2_8(true)
			end
		end)
		
		return function() --[[ Line: 259 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 265 ]]
		-- upvalues: UseStateResult8 (copy), UseStateResult9 (copy), UseSplitPaneEducationalTourLifecycleModuleResult (copy)
		if UseStateResult8 or not UseStateResult9 then return end
		local Flag = false
		task.delay(5, function() --[[ Line: 270 ]]
			-- upvalues: Flag (ref), UseSplitPaneEducationalTourLifecycleModuleResult (upval)
			if not Flag then
				UseSplitPaneEducationalTourLifecycleModuleResult.endTour()
			end
		end)
		
		return function() --[[ Line: 275 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {
		UseStateResult8,
		UseStateResult9,
		UseSplitPaneEducationalTourLifecycleModuleResult.endTour
	})
	ReactModule.useEffect(function() --[[ Line: 279 ]]
		-- upvalues: UseRefResult (copy), UsePreferredInputResult (copy), Input (upval), GuiService (upval), UseFocusGuiObjectResult (copy)
		if UseRefResult.current ~= nil and (UsePreferredInputResult == Input.Directional or GuiService.SelectedCoreObject ~= nil) then
			UseFocusGuiObjectResult(UseRefResult.current)
		end
	end, {
		StepIndex,
		UsePreferredInputResult,
		UseFocusGuiObjectResult,
		UseStateResult9
	})
	local SplitPaneEducationalTourStepsModuleEntry = SplitPaneEducationalTourStepsModule[StepIndex]
	local SplitPaneEducationalTourTooltipModelModule = if UseStateResult9 then GetSplitPaneEducationalTourTooltipModelModule({
		stepIndex = StepIndex,
		totalSteps = CountSplitPaneEducationalTourStepsModule,
		step = SplitPaneEducationalTourStepsModuleEntry,
		isCollapsedStepOne = SplitPaneEducationalTourPresentationModule.isCollapsedStepOne,
		isDirectionalInput = IsUsePreferredInputResultMatch,
		localized = UseLocalizationResult
	}) else nil
	local UseStateResult10, UseStateResult2_9 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 303 ]]
		-- upvalues: UseStateResult8 (copy), UseStateResult2_9 (copy)
		if UseStateResult8 then
			UseStateResult2_9(true)
		end
	end, { UseStateResult8 })
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 310 ]]
		-- upvalues: UseRefResult1 (copy), SplitPaneEducationalTourStepsModuleEntry (copy), UseStateResult7 (copy), UseStateResult8 (copy), TourStore (copy)
		if not UseRefResult1.current and SplitPaneEducationalTourStepsModuleEntry ~= nil and UseStateResult7 ~= nil and UseStateResult8 then
			UseRefResult1.current = true
			TourStore.notifyTourVisible()
		end
	end, {
		SplitPaneEducationalTourStepsModuleEntry,
		UseStateResult7,
		UseStateResult8,
		TourStore.notifyTourVisible
	})
	
	return ReactModule.createElement(SplitPaneEducationalTourViewModule, {
		videoAspectRatio = 1.5,
		isTooltipContentVisible = UseStateResult8,
		hasPresentedTooltip = UseStateResult10,
		holdsInputBeforeTooltip = IsSmallestAbove,
		supportPaneRect = UseTrackedRectModuleResult,
		overlayOrigin = Min1,
		overlayInstance = UseOverlayResult,
		supportOverlayTopInset = UseSelectorResult,
		presentation = SplitPaneEducationalTourPresentationModule,
		tooltipModel = SplitPaneEducationalTourTooltipModelModule,
		tokens = UseTokensResult,
		mediaWidth = UseScaledValueResult,
		setPrimaryActionRef = UseResult1,
		setTooltipContentRef = UseResult2,
		setFocusSurfaceRef = UseResult,
		setGamepadCollapsedTooltipAnchorInstance = UseStateResult2_1,
		setBottomPaneTooltipAnchorInstance = UseStateResult2,
		setGamepadStepTwoTooltipAnchorInstance = UseStateResult2_2,
		setGamepadFinalTooltipAnchorInstance = UseStateResult2_3,
		setTopRightControlInstance = UseStateResult2_4,
		onNext = UseSplitPaneEducationalTourLifecycleModuleResult.handleNext,
		onEnd = UseSplitPaneEducationalTourLifecycleModuleResult.endTour
	})
end

local List = {}

for _, value in string.split(require(script.Parent.Parent.Flags.FStringSplitPaneEducationalTourKeepOnDeepLinkPatterns), ",") do
	local Match: string? = string.match(value, "^%s*(.-)%s*$")
	
	if Match ~= nil and Match ~= "" then
		table.insert(List, Match)
	end
end
local function isKeepOnDeepLink(Text: string): boolean --[[ Line: 355 ]]
	-- upvalues: List (copy)
	local Part = string.split(string.lower(Text), "?")[1]
	
	for _, value in List do
		local Success, Result = pcall(string.find, Part, value)
		
		if Success and Result ~= nil then
			return true
		end
	end
	return false
end

return function(p2) --[[ Line: 367 | Named "SplitPaneEducationalTour" ]]
	-- upvalues: GetSplitPaneEducationalTourStoreModule (copy), UseSignalStateFunction (copy), LocalUserIdStore (copy), UseSelectorFunction (copy), selectIsCentralOverlayOpen (copy), FFlagSplitPaneEducationalTourPreloadVideosModule (copy), UseSplitPaneEducationalTourVideoPreloadModule (copy), FFlagDebugSplitPaneEducationalTourAutoStartModule (copy), FFlagSplitPaneEducationalTourSkipOnDeepLinkModule (copy), DeepLinkLuaReceiverStatusStore (copy), isKeepOnDeepLink (copy), ReactModule (copy), SplitPaneEducationalTourBody (copy)
	local SplitPaneEducationalTourStoreModule = GetSplitPaneEducationalTourStoreModule(false)
	local UseSignalStateResult = UseSignalStateFunction(SplitPaneEducationalTourStoreModule.getStepIndex)
	local UseSignalStateResult1 = UseSignalStateFunction(SplitPaneEducationalTourStoreModule.getIsOpen)
	local UseSignalStateResult2 = UseSignalStateFunction(SplitPaneEducationalTourStoreModule.getPendingUserId)
	local UseSignalStateResult3 = UseSignalStateFunction(LocalUserIdStore.getCurrentUserId)
	local UseSelectorResult = UseSelectorFunction(selectIsCentralOverlayOpen)
	local NoUseSelectorResult: boolean = p2.isSupportSurfaceEligible and not UseSelectorResult
	
	if FFlagSplitPaneEducationalTourPreloadVideosModule then
		UseSplitPaneEducationalTourVideoPreloadModule(UseSignalStateResult1 or FFlagDebugSplitPaneEducationalTourAutoStartModule)
	end
	local UseSignalStateResult4 = if FFlagSplitPaneEducationalTourSkipOnDeepLinkModule then UseSignalStateFunction(DeepLinkLuaReceiverStatusStore(false).getLastDetectedPostAuthUrl) else nil
	local Inverted: boolean = UseSignalStateResult4 ~= nil and (UseSignalStateResult4 ~= "" and not isKeepOnDeepLink(UseSignalStateResult4))
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 390 ]]
		-- upvalues: UseSignalStateResult1 (copy), UseSignalStateResult2 (copy), UseSignalStateResult3 (copy), SplitPaneEducationalTourStoreModule (copy), Inverted (copy), UseSignalStateResult (copy), UseRefResult (copy), NoUseSelectorResult (copy)
		if UseSignalStateResult1 and UseSignalStateResult2 ~= UseSignalStateResult3 then
			SplitPaneEducationalTourStoreModule.discardPendingTour()
			
			return
		end
		if Inverted and not SplitPaneEducationalTourStoreModule.getHasShownTour(false) and (UseSignalStateResult1 or UseSignalStateResult > 0) then
			SplitPaneEducationalTourStoreModule.discardPendingTour()
			
			return
		end
		if UseSignalStateResult1 and UseSignalStateResult == 0 then
			UseRefResult.current = false
		end
		if UseSignalStateResult1 and NoUseSelectorResult and not UseRefResult.current then
			UseRefResult.current = true
			SplitPaneEducationalTourStoreModule.setStepIndex(1)
		end
		if not UseSignalStateResult1 then
			UseRefResult.current = false
		end
	end, {
		UseSignalStateResult1, UseSignalStateResult2, UseSignalStateResult3,
		UseSignalStateResult, NoUseSelectorResult, Inverted,
		SplitPaneEducationalTourStoreModule.getHasShownTour,
		SplitPaneEducationalTourStoreModule.setStepIndex,
		SplitPaneEducationalTourStoreModule.discardPendingTour
	})
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 425 ]]
		-- upvalues: FFlagDebugSplitPaneEducationalTourAutoStartModule (upval), NoUseSelectorResult (copy), Inverted (copy), UseRefResult1 (copy), SplitPaneEducationalTourStoreModule (copy)
		if FFlagDebugSplitPaneEducationalTourAutoStartModule and NoUseSelectorResult and not Inverted and not UseRefResult1.current then
			UseRefResult1.current = true
			SplitPaneEducationalTourStoreModule.setStepIndex(1)
		end
	end, {
		NoUseSelectorResult,
		Inverted,
		SplitPaneEducationalTourStoreModule.setStepIndex
	})
	ReactModule.useEffect(function() --[[ Line: 440 ]]
		-- upvalues: SplitPaneEducationalTourStoreModule (copy)
		return function() --[[ Line: 441 ]]
			-- upvalues: SplitPaneEducationalTourStoreModule (upval)
			SplitPaneEducationalTourStoreModule.discardPendingTour()
		end
	end, { SplitPaneEducationalTourStoreModule.discardPendingTour })
	
	return if UseSignalStateResult == 0 then nil else ReactModule.createElement(SplitPaneEducationalTourBody, {
		supportPaneRef = p2.supportPaneRef,
		supportPaneMode = p2.supportPaneMode,
		isSupportSurfaceEligible = NoUseSelectorResult,
		tourStore = SplitPaneEducationalTourStoreModule,
		stepIndex = UseSignalStateResult
	})
end