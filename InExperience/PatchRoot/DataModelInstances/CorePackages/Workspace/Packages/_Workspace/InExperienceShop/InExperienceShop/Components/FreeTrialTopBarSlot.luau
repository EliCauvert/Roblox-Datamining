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
local GetCloseButtonPositionModule = require(script.Parent.getCloseButtonPosition)
local UseFreeTrialChipDismissModule = require(script.Parent.useFreeTrialChipDismiss)
local UseFreeTrialChipRevealModule = if FFlagEnableFreeTrialChipRevealModule then require(script.Parent.useFreeTrialChipReveal) else nil
game:DefineFastInt("FreeTrialChipTopBarRightPadding", 100)

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
		Size = if MaxWidth == nil then UDim2.fromScale(0, 0) else UDim2.fromOffset(MaxWidth, 0)
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
					maxWidth = p1.maxWidth
				})
			}, p1.revealLayer)
		})
	})
end

return function(Frame)
	-- upvalues: SignalsReactModule (copy), SubmitFreeTrialTopBarChipModule (copy), UseLocalizationFunction (copy), ReactModule (copy), FFlagEnableFreeTrialChipRevealModule (copy), UseFreeTrialChipRevealModule (copy), UseFreeTrialChipDismissModule (copy), TopBarChipModule (copy), View (copy), GetCloseButtonPositionModule (copy), Icon (copy), IconSize (copy), FreeTrialChipRevealPortal (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(SubmitFreeTrialTopBarChipModule.isShowing)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(SubmitFreeTrialTopBarChipModule.image)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(SubmitFreeTrialTopBarChipModule.textKey)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(SubmitFreeTrialTopBarChipModule.isEmphasis)
	local UseSignalStateResult4 = if Frame.isEmphasis == nil then UseSignalStateResult3 else Frame.isEmphasis
	local UseLocalizationResult = UseLocalizationFunction({ label = UseSignalStateResult2 })
	local UseRefResult = ReactModule.useRef(nil)
	local UseFreeTrialChipRevealModuleResult = if FFlagEnableFreeTrialChipRevealModule then UseFreeTrialChipRevealModule(UseSignalStateResult) else nil
	local UseFreeTrialChipDismissModuleResult = UseFreeTrialChipDismissModule({
		isVisible = UseSignalStateResult,
		isSettled = not FFlagEnableFreeTrialChipRevealModule or UseFreeTrialChipRevealModuleResult == nil or UseFreeTrialChipRevealModuleResult.isSettled,
		revealLayer = if FFlagEnableFreeTrialChipRevealModule and UseFreeTrialChipRevealModuleResult ~= nil then UseFreeTrialChipRevealModuleResult.revealLayer else nil,
		chipRef = UseRefResult
	})
	local UseSignalStateResult1_1 = UseSignalStateResult1 or ""
	local FreeTrialChipTopBarRightPaddingFastInt: number = game:GetFastInt("FreeTrialChipTopBarRightPadding")
	local MaxWidth = Frame.maxWidth
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseRefResult2 = ReactModule.useRef(UseSignalStateResult2)
	local UseRefResult3 = ReactModule.useRef(FreeTrialChipTopBarRightPaddingFastInt)
	
	if UseRefResult2.current ~= UseSignalStateResult2 or UseRefResult3.current ~= FreeTrialChipTopBarRightPaddingFastInt then
		UseRefResult2.current = UseSignalStateResult2
		UseRefResult3.current = FreeTrialChipTopBarRightPaddingFastInt
		
		if UseRefResult1.current ~= 0 then
			UseRefResult1.current = 0
			UseStateResult2(0)
		end
	end
	local function onSlotAbsoluteSizeChanged(Frame)
		-- upvalues: MaxWidth (copy), UseFreeTrialChipRevealModuleResult (copy), UseRefResult1 (copy), UseStateResult2 (copy)
		if MaxWidth == nil then return end
		if UseFreeTrialChipRevealModuleResult ~= nil then
			local Current = UseFreeTrialChipRevealModuleResult.placeholderRef.current
			local AbsoluteSize = if Current == nil then nil else Current.AbsoluteSize
			
			if AbsoluteSize ~= nil and (AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0) then return end
		end
		local X: number = Frame.AbsoluteSize.X
		local Current: number = UseRefResult1.current
		
		if X <= 0 or X == Current then return end
		if Current <= 0 or X >= Current or X > MaxWidth then
			UseRefResult1.current = X
			UseStateResult2(X)
			
			return
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: SubmitFreeTrialTopBarChipModule (upval)
		SubmitFreeTrialTopBarChipModule()
	end, { SubmitFreeTrialTopBarChipModule })
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), SubmitFreeTrialTopBarChipModule (upval)
		if UseSignalStateResult then
			SubmitFreeTrialTopBarChipModule.reportMounted()
			SubmitFreeTrialTopBarChipModule.reportViewed()
			
			return
		end
	end, { UseSignalStateResult, UseSignalStateResult2 })
	
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
	local IsMaxWidthBelow: boolean = MaxWidth ~= nil and (UseStateResult > 0 and MaxWidth < UseStateResult)
	local Offset = if IsMaxWidthBelow then 0 else FreeTrialChipTopBarRightPaddingFastInt
	local Largest: number = if IsMaxWidthBelow then math.max(0, UseStateResult - FreeTrialChipTopBarRightPaddingFastInt) else UseStateResult
	local IsMaxWidthBelow1: boolean = MaxWidth ~= nil and MaxWidth < Largest
	local MaxWidth1 = if IsMaxWidthBelow1 then MaxWidth else nil
	local Element = ReactModule.createElement(TopBarChipModule, {
		testId = "FreeTrialTopBarSlot",
		text = UseLocalizationResult.label,
		image = UseSignalStateResult1_1,
		chipRef = UseRefResult,
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
				maxWidth = MaxWidth1
			}),
			Close = Frame1
		})
	else
		return ReactModule.createElement(View, config, { Chip = Element, Close = Frame1 })
	end
end