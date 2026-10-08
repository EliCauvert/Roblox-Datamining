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
	-- upvalues: supportPaneMode (ref), splitPaneStoreModule (ref), useSignalState (ref), reactModule (ref), useSelector (ref), selectStatusBarHeight (ref), useTrackedRectModule (ref), useOverlay (ref), useTokens (ref), useLocalization (ref), useScaledValue (ref), flags (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), useDefaultFocusBehavior (ref), reactFocusNavigationModule (ref), usePreferredInput (ref), input (ref), useFocusOnMount (ref), isSplitPaneEducationalTourGuiObjectVisibleModule (ref), getSplitPaneEducationalTourPresentationModule (ref), useSplitPaneEducationalTourLifecycleModule (ref), splitPaneEducationalTourStepsModuleCount (ref), guiService (ref), splitPaneEducationalTourStepsModule (ref), getSplitPaneEducationalTourTooltipModelModule (ref), splitPaneEducationalTourViewModule (ref)
	local supportPaneRef = p1.supportPaneRef
	local supportPaneMode_1 = p1.supportPaneMode
	local var1 = supportPaneMode_1 == supportPaneMode.Collapsed
	local isSupportSurfaceEligible = p1.isSupportSurfaceEligible
	local tourStore = p1.tourStore
	local store = splitPaneStoreModule.getStore()
	local stepIndex = p1.stepIndex
	local var2 = useSignalState(store.getShouldDefaultToCollapsed)
	local var3 = useSignalState(tourStore.getCollapsedExpandButtonRect)
	local var4 = useSignalState(tourStore.getCollapsedExpandButtonInstance)
	local var5 = reactModule.useMemo(function()
		-- upvalues: var4 (ref)
		return if var4 == nil then nil else { current = var4 }
	end, { var4 })
	local var6 = useSelector(selectStatusBarHeight)
	local var7, var8 = reactModule.useState(nil)
	local var9, var10 = reactModule.useState(nil)
	local var11, var12 = reactModule.useState(nil)
	local var13, var14 = reactModule.useState(nil)
	local var15, var16 = reactModule.useState(nil)
	local var17 = reactModule.useMemo(function()
		-- upvalues: var7 (ref)
		return if var7 == nil then nil else { current = var7 }
	end, { var7 })
	local var18 = reactModule.useMemo(function()
		-- upvalues: var9 (ref)
		return if var9 == nil then nil else { current = var9 }
	end, { var9 })
	local var19 = reactModule.useMemo(function()
		-- upvalues: var11 (ref)
		return if var11 == nil then nil else { current = var11 }
	end, { var11 })
	local var20 = reactModule.useMemo(function()
		-- upvalues: var13 (ref)
		return if var13 == nil then nil else { current = var13 }
	end, { var13 })
	local var21 = reactModule.useMemo(function()
		-- upvalues: var15 (ref)
		return if var15 == nil then nil else { current = var15 }
	end, { var15 })
	local var22, var23 = reactModule.useState(nil)
	reactModule.useLayoutEffect(function()
		-- upvalues: var23 (ref), supportPaneRef (ref)
		var23(if supportPaneRef ~= nil then nil else supportPaneRef.current)
	end, { supportPaneRef })
	local var24 = useTrackedRectModule(var22)
	local var25 = useOverlay()
	local var26 = useTrackedRectModule(if var25 and var25:IsA("GuiObject") then var25 else nil)
	local var27 = if var26 ~= nil then nil else var26.Min
	local var28 = useTokens()
	local var29 = useLocalization({
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
	local var30 = useScaledValue(if flags.FoundationEducationalTooltipRefresh then 280 else 320)
	local var31, var32 = useDefaultFocusBehavior(useFocusRoot({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}))
	local var33 = reactModule.useCallback(function(p2)
		-- upvalues: var32 (ref)
		if typeof(var32) == "function" then
			var32(p2)
			
			return
		elseif var32 ~= nil then
			var32.current = p2
		end
	end, { var32 })
	local var34 = reactFocusNavigationModule.useFocusGuiObject()
	local var35 = usePreferredInput()
	local var36 = var35 == input.Directional
	local var37 = reactModule.useRef(nil)
	local var38, var39 = reactModule.useState(nil)
	local var40, var41 = reactModule.useState(false)
	local var42 = useFocusOnMount(var31)
	local var43 = reactModule.useCallback(function(p2)
		-- upvalues: var37 (ref), var42 (ref)
		var37.current = p2
		var42(p2)
	end, { var42 })
	local var44 = reactModule.useCallback(function(p2)
		-- upvalues: var39 (ref), var33 (ref)
		var39(p2)
		var33(p2)
	end, { var33 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var38 (ref), var41 (ref), isSplitPaneEducationalTourGuiObjectVisibleModule (copy)
		if var38 == nil then
			var41(false)
			
			return
		end
		local function updateVisibility()
			-- upvalues: var41 (copy), isSplitPaneEducationalTourGuiObjectVisibleModule (copy), var38 (copy)
			var41(isSplitPaneEducationalTourGuiObjectVisibleModule(var38))
		end
		
		var41(isSplitPaneEducationalTourGuiObjectVisibleModule(var38))
		local t = {}
		
		local function observeVisibleAncestors()
			-- upvalues: t (write), var38 (copy), updateVisibility (ref), var41 (copy), isSplitPaneEducationalTourGuiObjectVisibleModule (copy)
			for i, v in t do
				v:Disconnect()
			end
			t = {}
			local var45 = var38
			while var45 ~= nil do
				if var45:IsA("GuiObject") then
					table.insert(t, var45:GetPropertyChangedSignal("Visible"):Connect(updateVisibility))
				end
				var45 = var45.Parent
			end
			var41(isSplitPaneEducationalTourGuiObjectVisibleModule(var38))
		end
		
		observeVisibleAncestors()
		local ancestryChangedConnection = var38.AncestryChanged:Connect(observeVisibleAncestors)
		
		return function()
			-- upvalues: ancestryChangedConnection (ref), t (write)
			ancestryChangedConnection:Disconnect()
			
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { var38 })
	local var46 = var27 or Vector2.zero
	local var47 = getSplitPaneEducationalTourPresentationModule({
		collapsedSpotlightPadding = 4,
		stepIndex = stepIndex,
		isSupportPaneCollapsed = var1,
		isDirectionalInput = var36,
		collapsedExpandButtonRect = var3,
		supportPaneRect = var24,
		anchors = {
			gamepadCollapsedStepOne = var18,
			collapsedExpandButton = var5,
			gamepadStepTwo = var19,
			bottomPane = var17,
			gamepadFinal = var20,
			topRightControl = var21,
			supportPane = supportPaneRef
		}
	})
	local var48 = useSplitPaneEducationalTourLifecycleModule({
		isSupportSurfaceEligible = isSupportSurfaceEligible,
		stepIndex = stepIndex,
		totalSteps = splitPaneEducationalTourStepsModuleCount,
		supportPaneMode = supportPaneMode_1,
		shouldDefaultToCollapsed = var2,
		isSupportPaneCollapsed = var1,
		tourStore = tourStore,
		splitPaneStore = store
	})
	reactModule.useEffect(function()
		-- upvalues: var40 (ref), var48 (ref)
		if var40 then
			return
		end
		local var49 = false
		task.delay(5, function()
			-- upvalues: var49 (write), var48 (copy)
			if not var49 then
				var48.endTour()
			end
		end)
		
		return function()
			-- upvalues: var49 (write)
			var49 = true
		end
	end, { var40, var48.endTour })
	reactModule.useEffect(function()
		-- upvalues: var37 (ref), var35 (ref), input (copy), guiService (copy), var34 (ref)
		if var37.current ~= nil and (var35 == input.Directional or guiService.SelectedCoreObject ~= nil) then
			var34(var37.current)
		end
	end, { stepIndex, var35, var34 })
	local var49 = splitPaneEducationalTourStepsModule[stepIndex]
	local var50 = getSplitPaneEducationalTourTooltipModelModule({
		stepIndex = stepIndex,
		totalSteps = splitPaneEducationalTourStepsModuleCount,
		step = var49,
		isCollapsedStepOne = var47.isCollapsedStepOne,
		isDirectionalInput = var36,
		localized = var29
	})
	local var51, var52 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var40 (ref), var52 (ref)
		if var40 then
			var52(true)
		end
	end, { var40 })
	local var53 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var53 (ref), var49 (ref), var38 (ref), var40 (ref), tourStore (ref)
		if not var53.current and var49 ~= nil and (var38 ~= nil and var40) then
			var53.current = true
			tourStore.notifyTourVisible()
		end
	end, { var49, var38, var40, tourStore.notifyTourVisible })
	
	return reactModule.createElement(splitPaneEducationalTourViewModule, {
		videoAspectRatio = 1.5,
		isTooltipContentVisible = var40,
		hasPresentedTooltip = var51,
		supportPaneRect = var24,
		overlayOrigin = var46,
		overlayInstance = var25,
		supportOverlayTopInset = var6,
		presentation = var47,
		tooltipModel = var50,
		tokens = var28,
		mediaWidth = var30,
		setPrimaryActionRef = var43,
		setTooltipContentRef = var44,
		setGamepadCollapsedTooltipAnchorInstance = var10,
		setBottomPaneTooltipAnchorInstance = var8,
		setGamepadStepTwoTooltipAnchorInstance = var12,
		setGamepadFinalTooltipAnchorInstance = var14,
		setTopRightControlInstance = var16,
		onNext = var48.handleNext,
		onEnd = var48.endTour
	})
end

return function(p2)
	-- upvalues: getSplitPaneEducationalTourStoreModule (ref), useSignalState (ref), localUserIdStore (ref), useSelector (ref), selectIsCentralOverlayOpen (ref), reactModule (ref), fFlagDebugSplitPaneEducationalTourAutoStartModule (ref), SplitPaneEducationalTourBody (ref)
	local var54 = getSplitPaneEducationalTourStoreModule(false)
	local var55 = useSignalState(var54.getStepIndex)
	local var56 = useSignalState(var54.getIsOpen)
	local var57 = useSignalState(var54.getPendingUserId)
	local var58 = useSignalState(localUserIdStore.getCurrentUserId)
	local var59 = p2.isSupportSurfaceEligible and not useSelector(selectIsCentralOverlayOpen)
	local var60 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var56 (ref), var57 (ref), var58 (ref), var54 (ref), var55 (ref), var60 (ref), var59 (ref)
		if var56 and var57 ~= var58 then
			var54.discardPendingTour()
			
			return
		elseif var56 and var55 == 0 then
			var60.current = false
		end
		if var56 and var59 and not var60.current then
			var60.current = true
			var54.setStepIndex(1)
		end
		if not var56 then
			var60.current = false
		end
	end, {
		var56, var57, var58, var55, var59, var54.setStepIndex, var54.discardPendingTour
	})
	local var61 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: fFlagDebugSplitPaneEducationalTourAutoStartModule (copy), var59 (ref), var61 (ref), var54 (ref)
		if fFlagDebugSplitPaneEducationalTourAutoStartModule and var59 and not var61.current then
			var61.current = true
			var54.setStepIndex(1)
		end
	end, { var59, var54.setStepIndex })
	reactModule.useEffect(function()
		-- upvalues: var54 (ref)
		return function()
			-- upvalues: var54 (copy)
			var54.discardPendingTour()
		end
	end, { var54.discardPendingTour })
	
	return if var55 == 0 then nil else reactModule.createElement(SplitPaneEducationalTourBody, {
		supportPaneRef = p2.supportPaneRef,
		supportPaneMode = p2.supportPaneMode,
		isSupportSurfaceEligible = var59,
		tourStore = var54,
		stepIndex = var55
	})
end