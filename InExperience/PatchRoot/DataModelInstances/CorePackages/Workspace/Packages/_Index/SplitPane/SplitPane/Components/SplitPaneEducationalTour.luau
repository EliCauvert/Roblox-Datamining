local guiService = game:GetService("GuiService")
local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local responsiveModule = require(parent.Responsive)
local appSplitViewModule = require(parent.AppSplitView)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSignalState = require(parent.SignalsReact).useSignalState
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local localUserIdStore = require(parent.LocalUserIdStore).LocalUserIdStore
local splitPaneEducationalTourStepsModule = require(script.Parent.SplitPaneEducationalTourSteps)
local getSplitPaneEducationalTourPresentationModule = require(script.Parent.getSplitPaneEducationalTourPresentation)
local useTrackedRectModule = require(script.Parent.useTrackedRect)
local getSplitPaneEducationalTourTooltipModelModule = require(script.Parent.getSplitPaneEducationalTourTooltipModel)
local useSplitPaneEducationalTourLifecycleModule = require(script.Parent.useSplitPaneEducationalTourLifecycle)
local splitPaneEducationalTourViewModule = require(script.Parent.SplitPaneEducationalTourView)
local fFlagDebugSplitPaneEducationalTourAutoStartModule = require(script.Parent.Parent.Flags.FFlagDebugSplitPaneEducationalTourAutoStart)
local fIntSplitPaneEducationalTourStartDelayMsModule = require(script.Parent.Parent.Flags.FIntSplitPaneEducationalTourStartDelayMs)
local fFlagSplitPaneEducationalTourPreloadVideosModule = require(script.Parent.Parent.Flags.FFlagSplitPaneEducationalTourPreloadVideos)
local var1 = if fFlagSplitPaneEducationalTourPreloadVideosModule then require(script.Parent.useSplitPaneEducationalTourVideoPreload) else nil
local fFlagSplitPaneEducationalTourSkipOnDeepLinkModule = require(script.Parent.Parent.Flags.FFlagSplitPaneEducationalTourSkipOnDeepLink)
local var2 = if fFlagSplitPaneEducationalTourSkipOnDeepLinkModule then require(parent.DeepLink).DeepLinkLuaReceiverStatusStore else nil
local fStringSplitPaneEducationalTourKeepOnDeepLinkPatternsModule = require(script.Parent.Parent.Flags.FStringSplitPaneEducationalTourKeepOnDeepLinkPatterns)
local isSplitPaneEducationalTourGuiObjectVisibleModule = require(script.Parent.isSplitPaneEducationalTourGuiObjectVisible)
local getSplitPaneEducationalTourStoreModule = require(script.Parent.Parent.Stores.getSplitPaneEducationalTourStore)
local splitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local flags = foundationModule.Utility.Flags
local useOverlay = foundationModule.Hooks.useOverlay
local useScaledValue = foundationModule.Hooks.useScaledValue
local useTokens = foundationModule.Hooks.useTokens
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useFocusOnMount = focusNavigationUtilsModule.useFocusOnMount
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local input = responsiveModule.Input
local usePreferredInput = responsiveModule.usePreferredInput
local useDefaultFocusBehavior = reactFocusNavigationModule.useDefaultFocusBehavior
local supportPaneMode = appSplitViewModule.Enums.SupportPaneMode
local splitPaneEducationalTourStepsModuleCount = #splitPaneEducationalTourStepsModule
local minValue = math.min(fIntSplitPaneEducationalTourStartDelayMsModule, 3000)
local var3 = minValue > 0

local function selectStatusBarHeight(p1)
	return if p1.TopBar == nil then 0 else p1.TopBar.statusBarHeight
end

local function selectIsCentralOverlayOpen(p1)
	return p1.CentralOverlay ~= nil and p1.CentralOverlay.OverlayType ~= nil
end

local function _(p1)
	-- upvalues: reactModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return if p1 == nil then nil else { current = p1 }
	end, { p1 })
end

local function SplitPaneEducationalTourBody(p1)
	-- upvalues: supportPaneMode (ref), splitPaneStoreModule (ref), useSignalState (ref), reactModule (ref), useSelector (ref), selectStatusBarHeight (ref), useTrackedRectModule (ref), useOverlay (ref), useTokens (ref), useLocalization (ref), useScaledValue (ref), flags (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), useDefaultFocusBehavior (ref), reactFocusNavigationModule (ref), usePreferredInput (ref), input (ref), useFocusOnMount (ref), isSplitPaneEducationalTourGuiObjectVisibleModule (ref), getSplitPaneEducationalTourPresentationModule (ref), useSplitPaneEducationalTourLifecycleModule (ref), splitPaneEducationalTourStepsModuleCount (ref), var3 (ref), minValue (ref), guiService (ref), splitPaneEducationalTourStepsModule (ref), getSplitPaneEducationalTourTooltipModelModule (ref), splitPaneEducationalTourViewModule (ref)
	local supportPaneRef = p1.supportPaneRef
	local supportPaneMode_1 = p1.supportPaneMode
	local var4 = supportPaneMode_1 == supportPaneMode.Collapsed
	local isSupportSurfaceEligible = p1.isSupportSurfaceEligible
	local tourStore = p1.tourStore
	local store = splitPaneStoreModule.getStore()
	local stepIndex = p1.stepIndex
	local var5 = useSignalState(store.getShouldDefaultToCollapsed)
	local var6 = useSignalState(tourStore.getCollapsedExpandButtonRect)
	local var7 = useSignalState(tourStore.getCollapsedExpandButtonInstance)
	local var8 = reactModule.useMemo(function()
		-- upvalues: var7 (ref)
		return if var7 == nil then nil else { current = var7 }
	end, { var7 })
	local var9 = useSelector(selectStatusBarHeight)
	local var10, var11 = reactModule.useState(nil)
	local var12, var13 = reactModule.useState(nil)
	local var14, var15 = reactModule.useState(nil)
	local var16, var17 = reactModule.useState(nil)
	local var18, var19 = reactModule.useState(nil)
	local var20 = reactModule.useMemo(function()
		-- upvalues: var10 (ref)
		return if var10 == nil then nil else { current = var10 }
	end, { var10 })
	local var21 = reactModule.useMemo(function()
		-- upvalues: var12 (ref)
		return if var12 == nil then nil else { current = var12 }
	end, { var12 })
	local var22 = reactModule.useMemo(function()
		-- upvalues: var14 (ref)
		return if var14 == nil then nil else { current = var14 }
	end, { var14 })
	local var23 = reactModule.useMemo(function()
		-- upvalues: var16 (ref)
		return if var16 == nil then nil else { current = var16 }
	end, { var16 })
	local var24 = reactModule.useMemo(function()
		-- upvalues: var18 (ref)
		return if var18 == nil then nil else { current = var18 }
	end, { var18 })
	local var25, var26 = reactModule.useState(nil)
	reactModule.useLayoutEffect(function()
		-- upvalues: var26 (ref), supportPaneRef (ref)
		var26(if supportPaneRef ~= nil then nil else supportPaneRef.current)
	end, { supportPaneRef })
	local var27 = useTrackedRectModule(var25)
	local var28 = useOverlay()
	local var29 = useTrackedRectModule(if var28 and var28:IsA("GuiObject") then var28 else nil)
	local var30 = if var29 ~= nil then nil else var29.Min
	local var31 = useTokens()
	local var32 = useLocalization({
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
	local var33 = useScaledValue(if flags.FoundationEducationalTooltipRefresh then 280 else 320)
	local var34, var35 = useDefaultFocusBehavior(useFocusRoot({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}))
	local var36 = reactModule.useCallback(function(p2)
		-- upvalues: var35 (ref)
		if typeof(var35) == "function" then
			var35(p2)
			
			return
		elseif var35 ~= nil then
			var35.current = p2
		end
	end, { var35 })
	local var37 = reactFocusNavigationModule.useFocusGuiObject()
	local var38 = usePreferredInput()
	local var39 = var38 == input.Directional
	local var40 = reactModule.useRef(nil)
	local var41, var42 = reactModule.useState(nil)
	local var43, var44 = reactModule.useState(false)
	local var45 = useFocusOnMount(var34)
	local var46 = reactModule.useCallback(function(p2)
		-- upvalues: var40 (ref), var45 (ref)
		var40.current = p2
		var45(p2)
	end, { var45 })
	local var47 = reactModule.useCallback(function(p2)
		-- upvalues: var42 (ref), var36 (ref)
		var42(p2)
		var36(p2)
	end, { var36 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var41 (ref), var44 (ref), isSplitPaneEducationalTourGuiObjectVisibleModule (copy)
		if var41 == nil then
			var44(false)
			
			return
		end
		local function updateVisibility()
			-- upvalues: var44 (copy), isSplitPaneEducationalTourGuiObjectVisibleModule (copy), var41 (copy)
			var44(isSplitPaneEducationalTourGuiObjectVisibleModule(var41))
		end
		
		var44(isSplitPaneEducationalTourGuiObjectVisibleModule(var41))
		local t = {}
		
		local function observeVisibleAncestors()
			-- upvalues: t (write), var41 (copy), updateVisibility (ref), var44 (copy), isSplitPaneEducationalTourGuiObjectVisibleModule (copy)
			for i, v in t do
				v:Disconnect()
			end
			t = {}
			local var48 = var41
			while var48 ~= nil do
				if var48:IsA("GuiObject") then
					table.insert(t, var48:GetPropertyChangedSignal("Visible"):Connect(updateVisibility))
				end
				var48 = var48.Parent
			end
			var44(isSplitPaneEducationalTourGuiObjectVisibleModule(var41))
		end
		
		observeVisibleAncestors()
		local ancestryChangedConnection = var41.AncestryChanged:Connect(observeVisibleAncestors)
		
		return function()
			-- upvalues: ancestryChangedConnection (ref), t (write)
			ancestryChangedConnection:Disconnect()
			
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { var41 })
	local var49 = var30 or Vector2.zero
	local var50 = getSplitPaneEducationalTourPresentationModule({
		collapsedSpotlightPadding = 4,
		stepIndex = stepIndex,
		isSupportPaneCollapsed = var4,
		isDirectionalInput = var39,
		collapsedExpandButtonRect = var6,
		supportPaneRect = var27,
		anchors = {
			gamepadCollapsedStepOne = var21,
			collapsedExpandButton = var8,
			gamepadStepTwo = var22,
			bottomPane = var20,
			gamepadFinal = var23,
			topRightControl = var24,
			supportPane = supportPaneRef
		}
	})
	local var51 = useSplitPaneEducationalTourLifecycleModule({
		isSupportSurfaceEligible = isSupportSurfaceEligible,
		stepIndex = stepIndex,
		totalSteps = splitPaneEducationalTourStepsModuleCount,
		supportPaneMode = supportPaneMode_1,
		shouldDefaultToCollapsed = var5,
		isSupportPaneCollapsed = var4,
		tourStore = tourStore,
		splitPaneStore = store
	})
	local var52, var53 = reactModule.useState(not var3)
	reactModule.useEffect(function()
		-- upvalues: var3 (copy), minValue (copy), var53 (ref)
		if var3 then
			local var54 = false
			task.delay(minValue / 1000, function()
				-- upvalues: var54 (write), var53 (copy)
				if not var54 then
					var53(true)
				end
			end)
			
			return function()
				-- upvalues: var54 (write)
				var54 = true
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var43 (ref), var52 (ref), var51 (ref)
		if var43 or not var52 then
			return
		end
		local var54 = false
		task.delay(5, function()
			-- upvalues: var54 (write), var51 (copy)
			if not var54 then
				var51.endTour()
			end
		end)
		
		return function()
			-- upvalues: var54 (write)
			var54 = true
		end
	end, { var43, var52, var51.endTour })
	reactModule.useEffect(function()
		-- upvalues: var40 (ref), var38 (ref), input (copy), guiService (copy), var37 (ref)
		if var40.current ~= nil and (var38 == input.Directional or guiService.SelectedCoreObject ~= nil) then
			var37(var40.current)
		end
	end, { stepIndex, var38, var37, var52 })
	local var54 = splitPaneEducationalTourStepsModule[stepIndex]
	local var55 = if var52 then getSplitPaneEducationalTourTooltipModelModule({
		stepIndex = stepIndex,
		totalSteps = splitPaneEducationalTourStepsModuleCount,
		step = var54,
		isCollapsedStepOne = var50.isCollapsedStepOne,
		isDirectionalInput = var39,
		localized = var32
	}) else nil
	local var56, var57 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var43 (ref), var57 (ref)
		if var43 then
			var57(true)
		end
	end, { var43 })
	local var58 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var58 (ref), var54 (ref), var41 (ref), var43 (ref), tourStore (ref)
		if not var58.current and var54 ~= nil and (var41 ~= nil and var43) then
			var58.current = true
			tourStore.notifyTourVisible()
		end
	end, { var54, var41, var43, tourStore.notifyTourVisible })
	
	return reactModule.createElement(splitPaneEducationalTourViewModule, {
		videoAspectRatio = 1.5,
		isTooltipContentVisible = var43,
		hasPresentedTooltip = var56,
		holdsInputBeforeTooltip = var3,
		supportPaneRect = var27,
		overlayOrigin = var49,
		overlayInstance = var28,
		supportOverlayTopInset = var9,
		presentation = var50,
		tooltipModel = var55,
		tokens = var31,
		mediaWidth = var33,
		setPrimaryActionRef = var46,
		setTooltipContentRef = var47,
		setFocusSurfaceRef = var36,
		setGamepadCollapsedTooltipAnchorInstance = var13,
		setBottomPaneTooltipAnchorInstance = var11,
		setGamepadStepTwoTooltipAnchorInstance = var15,
		setGamepadFinalTooltipAnchorInstance = var17,
		setTopRightControlInstance = var19,
		onNext = var51.handleNext,
		onEnd = var51.endTour
	})
end

local t = {}

for i, v in string.split(fStringSplitPaneEducationalTourKeepOnDeepLinkPatternsModule, ",") do
	local match = string.match(v, "^%s*(.-)%s*$")
	
	if match ~= nil and match ~= "" then
		table.insert(t, match)
	end
end
local function isKeepOnDeepLink(p2)
	-- upvalues: t (ref)
	local var59 = string.split(string.lower(p2), "?")[1]
	
	for i, v in t do
		local ok, status = pcall(string.find, var59, v)
		
		if ok and status ~= nil then
			return true
		end
	end
	return false
end

return function(p3)
	-- upvalues: getSplitPaneEducationalTourStoreModule (ref), useSignalState (ref), localUserIdStore (ref), useSelector (ref), selectIsCentralOverlayOpen (ref), fFlagSplitPaneEducationalTourPreloadVideosModule (ref), var1 (ref), fFlagDebugSplitPaneEducationalTourAutoStartModule (ref), fFlagSplitPaneEducationalTourSkipOnDeepLinkModule (ref), var2 (ref), isKeepOnDeepLink (ref), reactModule (ref), SplitPaneEducationalTourBody (ref)
	local var60 = getSplitPaneEducationalTourStoreModule(false)
	local var61 = useSignalState(var60.getStepIndex)
	local var62 = useSignalState(var60.getIsOpen)
	local var63 = useSignalState(var60.getPendingUserId)
	local var64 = useSignalState(localUserIdStore.getCurrentUserId)
	local var65 = p3.isSupportSurfaceEligible and not useSelector(selectIsCentralOverlayOpen)
	
	if fFlagSplitPaneEducationalTourPreloadVideosModule then
		var1(var62 or fFlagDebugSplitPaneEducationalTourAutoStartModule)
	end
	local var66 = if fFlagSplitPaneEducationalTourSkipOnDeepLinkModule then useSignalState(var2(false).getLastDetectedPostAuthUrl) else nil
	local var67 = var66 ~= nil and (var66 ~= "" and not isKeepOnDeepLink(var66))
	local var68 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var62 (ref), var63 (ref), var64 (ref), var60 (ref), var67 (ref), var61 (ref), var68 (ref), var65 (ref)
		if var62 and var63 ~= var64 then
			var60.discardPendingTour()
			
			return
		elseif var67 and not var60.getHasShownTour(false) and (var62 or var61 > 0) then
			var60.discardPendingTour()
			
			return
		elseif var62 and var61 == 0 then
			var68.current = false
		end
		if var62 and var65 and not var68.current then
			var68.current = true
			var60.setStepIndex(1)
		end
		if not var62 then
			var68.current = false
		end
	end, {
		var62, var63, var64, var61, var65, var67, var60.getHasShownTour,
		var60.setStepIndex, var60.discardPendingTour
	})
	local var69 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: fFlagDebugSplitPaneEducationalTourAutoStartModule (copy), var65 (ref), var67 (ref), var69 (ref), var60 (ref)
		if fFlagDebugSplitPaneEducationalTourAutoStartModule and var65 and (not var67 and not var69.current) then
			var69.current = true
			var60.setStepIndex(1)
		end
	end, { var65, var67, var60.setStepIndex })
	reactModule.useEffect(function()
		-- upvalues: var60 (ref)
		return function()
			-- upvalues: var60 (copy)
			var60.discardPendingTour()
		end
	end, { var60.discardPendingTour })
	
	return if var61 == 0 then nil else reactModule.createElement(SplitPaneEducationalTourBody, {
		supportPaneRef = p3.supportPaneRef,
		supportPaneMode = p3.supportPaneMode,
		isSupportSurfaceEligible = var65,
		tourStore = var60,
		stepIndex = var61
	})
end