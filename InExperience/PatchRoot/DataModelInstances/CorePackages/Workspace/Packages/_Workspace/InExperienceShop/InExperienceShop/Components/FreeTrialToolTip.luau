local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagEnableExperienceShopGlobalIconModule = require(InExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local FFlagFixFreeTrialTooltipLocalizationModule = require(InExperienceShop.Flags.FFlagFixFreeTrialTooltipLocalization)
local GetShopGlobalIconStoreModule = require(InExperienceShop.Stores.GetShopGlobalIconStore)
local SubmitFreeTrialTooltipsModule = require(InExperienceShop.submitFreeTrialTooltips)
local EducationalTooltip = FoundationModule.EducationalTooltip
local OverlayProvider = FoundationModule.OverlayProvider
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign

local function createShownTooltip(AnchorRef, Title, ActionText, OnActivated, Callback)
	-- upvalues: ReactModule (copy), OverlayProvider (copy), EducationalTooltip (copy), PopoverSide (copy), PopoverAlign (copy), ButtonVariant (copy)
	return ReactModule.createElement(OverlayProvider, nil, {
		Tooltip = ReactModule.createElement(EducationalTooltip, {
			isOpen = true,
			testId = "trial-available-tooltip",
			anchorRef = AnchorRef,
			title = Title .. string.rep(" ", 10),
			side = PopoverSide.Bottom,
			align = PopoverAlign.Start,
			actions = {
				{
					text = ActionText,
					variant = ButtonVariant.Emphasis,
					onActivated = OnActivated,
					width = UDim.new(1, 0)
				}
			},
			onClose = function()
				-- upvalues: Callback (copy)
				Callback("user")
			end,
			onPressedOutside = function()
				-- upvalues: Callback (copy)
				Callback("user")
			end
		})
	})
end

local function ShownFreeTrialToolTip(p1)
	-- upvalues: UseLocalizationFunction (copy), createShownTooltip (copy)
	local UseLocalizationResult = UseLocalizationFunction({ title = p1.titleKey, actionText = p1.actionTextKey })
	
	return createShownTooltip(p1.anchorRef, UseLocalizationResult.title, UseLocalizationResult.actionText, p1.onActionActivated, p1.dismiss)
end

return ReactModule.memo(function(p1)
	-- upvalues: SignalsReactModule (copy), SubmitFreeTrialTooltipsModule (copy), FFlagEnableExperienceShopGlobalIconModule (copy), GetShopGlobalIconStoreModule (copy), ReactModule (copy), InExperienceShop (copy), FFlagFixFreeTrialTooltipLocalizationModule (copy), UseLocalizationFunction (copy), ShownFreeTrialToolTip (copy), createShownTooltip (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(SubmitFreeTrialTooltipsModule.getActiveTooltip)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(function(p2)
		-- upvalues: FFlagEnableExperienceShopGlobalIconModule (upval), GetShopGlobalIconStoreModule (upval)
		return if FFlagEnableExperienceShopGlobalIconModule then GetShopGlobalIconStoreModule(p2).getIconInstance(p2) else nil
	end)
	local UseRefResult = ReactModule.useRef(UseSignalStateResult1)
	UseRefResult.current = UseSignalStateResult1
	local IsEducationTooltipOnShopIcon: boolean = UseSignalStateResult ~= nil and UseSignalStateResult.slot == "EducationTooltipOnShopIcon"
	local UseRefResult1 = if IsEducationTooltipOnShopIcon then UseRefResult else p1.anchorRef
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), UseRefResult1 (copy)
		UseStateResult2(UseRefResult1 ~= nil and UseRefResult1.current ~= nil)
	end, { UseRefResult1, UseSignalStateResult1, p1.anchorRef })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_1 (copy), SubmitFreeTrialTooltipsModule (upval)
		UseStateResult2_1(true)
		SubmitFreeTrialTooltipsModule.dismiss(p2)
	end, {})
	local Action = if UseSignalStateResult == nil then nil else UseSignalStateResult.action
	local GamePassId = if UseSignalStateResult == nil then nil else UseSignalStateResult.gamePassId
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: SubmitFreeTrialTooltipsModule (upval), UseResult (copy), Action (copy), GamePassId (copy), InExperienceShop (upval), p1 (copy)
		SubmitFreeTrialTooltipsModule.reportActivated()
		UseResult("activated")
		
		if Action == "promptGamePassPurchase" and GamePassId ~= nil then
			require(InExperienceShop.initiateShopItemPurchase)(GamePassId, "GamePass")
			
			return
		else
			p1.onOpenShop()
		end
	end, { UseResult, p1.onOpenShop, Action, GamePassId })
	local Title = ""
	local ActionText = ""
	
	if not FFlagFixFreeTrialTooltipLocalizationModule then
		local UseLocalizationResult = UseLocalizationFunction({
			title = if UseSignalStateResult == nil then "" else UseSignalStateResult.title,
			actionText = if UseSignalStateResult == nil then "" else UseSignalStateResult.actionText
		})
		Title = UseLocalizationResult.title
		ActionText = UseLocalizationResult.actionText
	end
	local HasUseSignalStateResult: boolean = UseSignalStateResult ~= nil and (UseStateResult and not UseStateResult1)
	HasUseSignalStateResult = if IsEducationTooltipOnShopIcon then HasUseSignalStateResult and UseSignalStateResult1 ~= nil else HasUseSignalStateResult and p1.visible == true
	local TooltipQueue = p1.tooltipQueue
	local IsTRIALAVAILABLETOOLTIP: boolean = TooltipQueue ~= nil and TooltipQueue.isCurrentTooltip("TRIAL_AVAILABLE_TOOLTIP") == true
	local UseRefResult2 = ReactModule.useRef(TooltipQueue)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), TooltipQueue (copy)
		UseRefResult2.current = TooltipQueue
	end, { TooltipQueue })
	local DelayMs = if UseSignalStateResult == nil then 0 else UseSignalStateResult.delayMs
	local DurationMs = if UseSignalStateResult == nil then 0 else UseSignalStateResult.durationMs
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), HasUseSignalStateResult (ref), p1 (copy), DelayMs (copy), DurationMs (copy)
		local Current = UseRefResult2.current
		
		if not HasUseSignalStateResult or Current == nil or p1.priority == nil then return end
		Current.registerTooltip("TRIAL_AVAILABLE_TOOLTIP", p1.priority, DelayMs, DurationMs)
		
		return function()
			-- upvalues: Current (copy)
			Current.unregisterTooltip("TRIAL_AVAILABLE_TOOLTIP")
		end
	end, {
		HasUseSignalStateResult,
		p1.priority,
		DelayMs,
		DurationMs
	})
	local UseRefResult21 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult21 (copy), IsTRIALAVAILABLETOOLTIP (copy), HasUseSignalStateResult (ref), UseResult (copy)
		if UseRefResult21.current and not IsTRIALAVAILABLETOOLTIP and HasUseSignalStateResult then
			UseResult("timeout")
		end
		UseRefResult21.current = IsTRIALAVAILABLETOOLTIP
	end, {
		IsTRIALAVAILABLETOOLTIP,
		HasUseSignalStateResult,
		UseResult
	})
	local IsTRIALAVAILABLETOOLTIP1: boolean = HasUseSignalStateResult == true and IsTRIALAVAILABLETOOLTIP
	ReactModule.useEffect(function()
		-- upvalues: IsTRIALAVAILABLETOOLTIP1 (copy), SubmitFreeTrialTooltipsModule (upval)
		if IsTRIALAVAILABLETOOLTIP1 then
			SubmitFreeTrialTooltipsModule.reportMounted()
			SubmitFreeTrialTooltipsModule.reportViewed()
			
			return
		end
	end, { IsTRIALAVAILABLETOOLTIP1 })
	
	return if IsTRIALAVAILABLETOOLTIP1 and UseSignalStateResult ~= nil then if FFlagFixFreeTrialTooltipLocalizationModule then if UseSignalStateResult.title == "" or UseSignalStateResult.actionText == "" then nil else ReactModule.createElement(ShownFreeTrialToolTip, {
		anchorRef = UseRefResult1,
		titleKey = UseSignalStateResult.title,
		actionTextKey = UseSignalStateResult.actionText,
		onActionActivated = UseResult1,
		dismiss = UseResult
	}) else createShownTooltip(UseRefResult1, Title, ActionText, UseResult1, UseResult) else nil
end)