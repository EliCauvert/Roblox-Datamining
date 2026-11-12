local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local FoundationModule = require(Parent.Foundation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local View = FoundationModule.View
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local Provider = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider
local TopBarChipModule = require(InExperienceShop.Components.TopBarChip)
local SubmitFreeTrialTopBarChipModule = require(InExperienceShop.submitFreeTrialTopBarChip)
local FFlagEnableFreeTrialChipRevealModule = require(InExperienceShop.Flags.FFlagEnableFreeTrialChipReveal)
local FFlagFreeTrialChipBuyAnimationModule = require(InExperienceShop.Flags.FFlagFreeTrialChipBuyAnimation)
local GetCloseButtonPositionModule = require(script.Parent.getCloseButtonPosition)
local UseFreeTrialChipDismissModule = require(script.Parent.useFreeTrialChipDismiss)
local UseFreeTrialChipRevealModule = if FFlagEnableFreeTrialChipRevealModule then require(script.Parent.useFreeTrialChipReveal) else nil
game:DefineFastInt("FreeTrialChipTopBarRightPadding", 100)

local function readHostShown(HostVisible)
	return if typeof(HostVisible) == "boolean" then HostVisible else HostVisible == nil or HostVisible:getValue()
end

local function _(Callback: (any) -> (), Current)
	if type(Callback) == "function" then
		Callback(Current)
		
		return
	end
	if Callback ~= nil then
		Callback.current = Current
	end
end

local function FreeTrialChipRevealFrame(p1)
	-- upvalues: UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), ReactModule (copy)
	local UseFocusRootResult = UseFocusRootFunction({
		isAutoFocusRoot = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
	})
	local MaxWidth = p1.maxWidth
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 100,
		AutomaticSize = if MaxWidth == nil then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y,
		ClipsDescendants = MaxWidth ~= nil,
		Position = UDim2.fromScale(1, 0),
		ref = ReactModule.useCallback(function(Current)
			-- upvalues: p1 (copy), UseFocusRootResult (copy)
			p1.revealRef.current = Current
			
			if type(UseFocusRootResult) == "function" then
				UseFocusRootResult(Current)
				
				return
			end
			if UseFocusRootResult ~= nil then
				UseFocusRootResult.current = Current
			end
		end, { p1.revealRef, UseFocusRootResult }),
		Size = if MaxWidth == nil then UDim2.fromScale(0, 0) else UDim2.fromOffset(MaxWidth, 0),
		Visible = p1.hostShown
	}, { Chip = p1.chip })
end

local function FreeTrialChipRevealPortal(p1)
	-- upvalues: ReactModule (copy), ReactFocusNavigationModule (copy), Provider (copy), ReactRobloxModule (copy), FreeTrialChipRevealFrame (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ReactFocusNavigationModule (upval)
		return ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult:teardown()
		end
	end, { UseMemoResult })
	
	return ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = UseMemoResult }, {
		Registry = ReactModule.createElement(Provider, nil, {
			Reveal = ReactRobloxModule.createPortal({
				FreeTrialChipReveal = ReactModule.createElement(FreeTrialChipRevealFrame, {
					revealRef = p1.revealRef,
					chip = p1.chip,
					maxWidth = p1.maxWidth,
					hostShown = p1.hostShown
				})
			}, p1.revealLayer)
		})
	})
end

return function(Frame)
	-- upvalues: SignalsReactModule (copy), FFlagFreeTrialChipBuyAnimationModule (copy), SubmitFreeTrialTopBarChipModule (copy), UseLocalizationFunction (copy), ReactModule (copy), readHostShown (copy), FFlagEnableFreeTrialChipRevealModule (copy), UseFreeTrialChipRevealModule (copy), UseFreeTrialChipDismissModule (copy), TopBarChipModule (copy), View (copy), GetCloseButtonPositionModule (copy), Icon (copy), IconSize (copy), FreeTrialChipRevealPortal (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(if FFlagFreeTrialChipBuyAnimationModule then SubmitFreeTrialTopBarChipModule.isPresented else SubmitFreeTrialTopBarChipModule.isShowing)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(SubmitFreeTrialTopBarChipModule.image)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(SubmitFreeTrialTopBarChipModule.textKey)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(SubmitFreeTrialTopBarChipModule.isEmphasis)
	local UseSignalStateResult4 = if Frame.isEmphasis == nil then UseSignalStateResult3 else Frame.isEmphasis
	local UseLocalizationResult = UseLocalizationFunction({ label = UseSignalStateResult2 })
	local HostVisible = Frame.hostVisible
	local UseStateResult, UseStateResult2 = ReactModule.useState(readHostShown(HostVisible))
	local UseRefResult = ReactModule.useRef(HostVisible)
	UseRefResult.current = HostVisible
	ReactModule.useEffect(function()
		-- upvalues: HostVisible (copy), UseStateResult2 (copy), readHostShown (upval), ReactModule (upval)
		if typeof(HostVisible) == "boolean" or HostVisible == nil then
			UseStateResult2(readHostShown(HostVisible))
			
			return function() end
		else
			local function applyVisible(p1)
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(p1)
			end
			
			UseStateResult2((HostVisible:getValue()))
			
			return ReactModule.__subscribeToBinding(HostVisible, applyVisible)
		end
	end, { HostVisible })
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseSignalStateResult5 = if FFlagFreeTrialChipBuyAnimationModule then SignalsReactModule.useSignalState(SubmitFreeTrialTopBarChipModule.handle) else nil
	local UseFreeTrialChipRevealModuleResult = if FFlagEnableFreeTrialChipRevealModule then UseFreeTrialChipRevealModule(UseSignalStateResult, if FFlagFreeTrialChipBuyAnimationModule then UseSignalStateResult5 else nil) else nil
	local UseFreeTrialChipDismissModuleResult = UseFreeTrialChipDismissModule({
		isVisible = UseSignalStateResult,
		isSettled = not FFlagEnableFreeTrialChipRevealModule or UseFreeTrialChipRevealModuleResult == nil or UseFreeTrialChipRevealModuleResult.isSettled,
		revealLayer = if FFlagEnableFreeTrialChipRevealModule and UseFreeTrialChipRevealModuleResult ~= nil then UseFreeTrialChipRevealModuleResult.revealLayer else nil,
		chipRef = UseRefResult1
	})
	local UseSignalStateResult1_1 = UseSignalStateResult1 or ""
	local FreeTrialChipTopBarRightPaddingFastInt: number = game:GetFastInt("FreeTrialChipTopBarRightPadding")
	local MaxWidth = Frame.maxWidth
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseRefResult2 = ReactModule.useRef(0)
	local UseRefResult3 = ReactModule.useRef(UseSignalStateResult2)
	local UseRefResult4 = ReactModule.useRef(FreeTrialChipTopBarRightPaddingFastInt)
	
	if UseRefResult3.current ~= UseSignalStateResult2 or UseRefResult4.current ~= FreeTrialChipTopBarRightPaddingFastInt then
		UseRefResult3.current = UseSignalStateResult2
		UseRefResult4.current = FreeTrialChipTopBarRightPaddingFastInt
		
		if UseRefResult2.current ~= 0 then
			UseRefResult2.current = 0
			UseStateResult2_1(0)
		end
	end
	local function onSlotAbsoluteSizeChanged(Frame)
		-- upvalues: MaxWidth (copy), UseFreeTrialChipRevealModuleResult (copy), FFlagFreeTrialChipBuyAnimationModule (upval), UseRefResult2 (copy), UseStateResult2_1 (copy)
		if MaxWidth == nil then return end
		if UseFreeTrialChipRevealModuleResult ~= nil then
			if FFlagFreeTrialChipBuyAnimationModule and not UseFreeTrialChipRevealModuleResult.revealSizeIsOwnRef.current then return end
			local Current1 = UseFreeTrialChipRevealModuleResult.placeholderRef.current
			local AbsoluteSize = if Current1 == nil then nil else Current1.AbsoluteSize
			
			if AbsoluteSize ~= nil and (AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0) then return end
		end
		local X: number = Frame.AbsoluteSize.X
		local Current: number = UseRefResult2.current
		
		if X <= 0 or X == Current then return end
		if Current <= 0 or X >= Current or X > MaxWidth then
			UseRefResult2.current = X
			UseStateResult2_1(X)
			
			return
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: SubmitFreeTrialTopBarChipModule (upval)
		SubmitFreeTrialTopBarChipModule()
	end, { SubmitFreeTrialTopBarChipModule })
	
	local function reportMountedAndViewed()
		-- upvalues: UseSignalStateResult (copy), SubmitFreeTrialTopBarChipModule (upval), UseStateResult (copy), UseRefResult (copy)
		if not UseSignalStateResult then return end
		SubmitFreeTrialTopBarChipModule.reportMounted()
		
		if UseStateResult then
			local Current = UseRefResult.current
			
			if if typeof(Current) == "boolean" then Current else Current == nil or Current:getValue() then
				SubmitFreeTrialTopBarChipModule.reportViewed()
			end
		end
	end
	
	if FFlagFreeTrialChipBuyAnimationModule then
		ReactModule.useEffect(reportMountedAndViewed, {
			UseSignalStateResult,
			UseSignalStateResult2,
			UseSignalStateResult5,
			UseStateResult
		})
	else
		ReactModule.useEffect(reportMountedAndViewed, {
			UseSignalStateResult,
			UseSignalStateResult2,
			UseStateResult
		})
	end
	if FFlagFreeTrialChipBuyAnimationModule then
		local IsSettled = if FFlagEnableFreeTrialChipRevealModule and UseFreeTrialChipRevealModuleResult ~= nil then UseFreeTrialChipRevealModuleResult.isSettled else false
		local SampleOnSettleRef = if UseFreeTrialChipRevealModuleResult == nil then nil else UseFreeTrialChipRevealModuleResult.sampleOnSettleRef
		local SlotRef = if UseFreeTrialChipRevealModuleResult == nil then nil else UseFreeTrialChipRevealModuleResult.slotRef
		ReactModule.useLayoutEffect(function()
			-- upvalues: IsSettled (copy), MaxWidth (copy), SampleOnSettleRef (copy), UseRefResult2 (copy), SlotRef (copy), onSlotAbsoluteSizeChanged (copy)
			if not IsSettled or MaxWidth == nil or SampleOnSettleRef == nil or not SampleOnSettleRef.current then return end
			SampleOnSettleRef.current = false
			
			if UseRefResult2.current ~= 0 or SlotRef == nil then return end
			local Current = SlotRef.current
			
			if Current ~= nil then
				onSlotAbsoluteSizeChanged(Current)
			end
		end, { IsSettled, MaxWidth, SampleOnSettleRef, SlotRef })
	end
	local function onChipActivated()
		-- upvalues: UseFreeTrialChipDismissModuleResult (copy), SubmitFreeTrialTopBarChipModule (upval), Frame (copy)
		if UseFreeTrialChipDismissModuleResult.consumeSuppressedActivation() then return end
		if SubmitFreeTrialTopBarChipModule.promptsPurchase(false) then
			SubmitFreeTrialTopBarChipModule.promptPurchase()
			
			return
		end
		SubmitFreeTrialTopBarChipModule.reportActivated()
		
		if Frame.onActivated ~= nil then
			Frame.onActivated()
		end
	end
	
	if not UseSignalStateResult then
		return nil
	end
	local IsMaxWidthBelow: boolean = MaxWidth ~= nil and (UseStateResult1 > 0 and MaxWidth < UseStateResult1)
	local Offset = if IsMaxWidthBelow then 0 else FreeTrialChipTopBarRightPaddingFastInt
	local Largest: number = if IsMaxWidthBelow then math.max(0, UseStateResult1 - FreeTrialChipTopBarRightPaddingFastInt) else UseStateResult1
	local IsMaxWidthBelow1: boolean = MaxWidth ~= nil and MaxWidth < Largest
	local MaxWidth1 = if IsMaxWidthBelow1 then MaxWidth else nil
	local Element = ReactModule.createElement(TopBarChipModule, {
		testId = "FreeTrialTopBarSlot",
		text = UseLocalizationResult.label,
		image = UseSignalStateResult1_1,
		chipRef = UseRefResult1,
		onActivated = onChipActivated,
		onStateChanged = if UseFreeTrialChipDismissModuleResult.pointerDismiss then UseFreeTrialChipDismissModuleResult.onChipStateChanged else nil,
		isEmphasis = UseSignalStateResult4,
		maxWidth = MaxWidth1
	})
	local Hovered = UseFreeTrialChipDismissModuleResult.pointerDismiss and UseFreeTrialChipDismissModuleResult.hovered
	
	if FFlagEnableFreeTrialChipRevealModule and UseFreeTrialChipRevealModuleResult ~= nil then
		Hovered = Hovered and UseFreeTrialChipRevealModuleResult.isSettled
	end
	local Frame1 = if Hovered then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 2,
		Size = UDim2.new(1, -Offset, 1, 0)
	}, {
		Button = ReactModule.createElement(View, {
			tag = "align-x-center align-y-center anchor-top-right size-500 radius-circle bg-surface-0",
			testId = "FreeTrialTopBarSlot--close",
			Position = GetCloseButtonPositionModule(),
			onActivated = UseFreeTrialChipDismissModuleResult.onCloseActivated,
			onStateChanged = UseFreeTrialChipDismissModuleResult.onCloseStateChanged
		}, {
			Icon = ReactModule.createElement(Icon, { name = "x", size = IconSize.XSmall })
		})
	}) else nil
	local config = {
		ZIndex = 100,
		ref = nil,
		testId = nil,
		tag = {
			["auto-y clip"] = IsMaxWidthBelow1,
			["auto-xy"] = not IsMaxWidthBelow1
		},
		LayoutOrder = Frame.LayoutOrder,
		padding = if Offset > 0 then { right = UDim.new(0, Offset) } else nil,
		onAbsoluteSizeChanged = if MaxWidth == nil then nil else onSlotAbsoluteSizeChanged,
		Size = if IsMaxWidthBelow1 then UDim2.fromOffset(MaxWidth, 0) else nil,
		sizeConstraint = if IsMaxWidthBelow1 then { MaxSize = Vector2.new(MaxWidth, 1e999) } else nil
	}
	
	if FFlagEnableFreeTrialChipRevealModule and UseFreeTrialChipRevealModuleResult ~= nil then
		config.ref = UseFreeTrialChipRevealModuleResult.slotRef
		config.testId = "FreeTrialTopBarSlot--slot"
		
		return ReactModule.createElement(View, config, {
			SlideContainer = if UseFreeTrialChipRevealModuleResult.isSettled then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.fromScale(0, 0)
			}, {
				Slide = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Size = UDim2.fromScale(0, 0)
				}, { Chip = Element })
			}) else ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ref = UseFreeTrialChipRevealModuleResult.placeholderRef,
				Size = if UseFreeTrialChipRevealModuleResult.revealChipSize == nil then UDim2.fromScale(0, 0) else UDim2.fromOffset(UseFreeTrialChipRevealModuleResult.revealChipSize.X, UseFreeTrialChipRevealModuleResult.revealChipSize.Y)
			}),
			Reveal = if UseFreeTrialChipRevealModuleResult.isSettled or UseFreeTrialChipRevealModuleResult.revealLayer == nil then nil else ReactModule.createElement(FreeTrialChipRevealPortal, {
				revealLayer = UseFreeTrialChipRevealModuleResult.revealLayer,
				revealRef = UseFreeTrialChipRevealModuleResult.revealRef,
				chip = Element,
				maxWidth = MaxWidth1,
				hostShown = Frame.hostVisible == nil or Frame.hostVisible
			}),
			Close = Frame1
		})
	else
		return ReactModule.createElement(View, config, { Chip = Element, Close = Frame1 })
	end
end