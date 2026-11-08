local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local View = require(Parent.Foundation).View
local TopBarChipModule = require(InExperienceShop.Components.TopBarChip)
local SubmitFreeTrialTopBarChipModule = require(InExperienceShop.submitFreeTrialTopBarChip)
game:DefineFastInt("FreeTrialChipTopBarRightPadding", 100)

return function(Frame)
	-- upvalues: SignalsReactModule (copy), SubmitFreeTrialTopBarChipModule (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), TopBarChipModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(SubmitFreeTrialTopBarChipModule.isShowing)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(SubmitFreeTrialTopBarChipModule.image)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(SubmitFreeTrialTopBarChipModule.textKey)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(SubmitFreeTrialTopBarChipModule.isEmphasis)
	local UseSignalStateResult4 = if Frame.isEmphasis == nil then UseSignalStateResult3 else Frame.isEmphasis
	local UseLocalizationResult = UseLocalizationFunction({ label = UseSignalStateResult2 })
	local UseSignalStateResult1_1 = UseSignalStateResult1 or ""
	local FreeTrialChipTopBarRightPaddingFastInt: number = game:GetFastInt("FreeTrialChipTopBarRightPadding")
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
		-- upvalues: SubmitFreeTrialTopBarChipModule (upval), Frame (copy)
		if SubmitFreeTrialTopBarChipModule.promptsPurchase(false) then
			SubmitFreeTrialTopBarChipModule.promptPurchase()
			
			return
		end
		SubmitFreeTrialTopBarChipModule.reportActivated()
		
		if Frame.onActivated ~= nil then
			Frame.onActivated()
		end
	end
	
	return if UseSignalStateResult then ReactModule.createElement(View, {
		tag = "auto-xy",
		ZIndex = 100,
		LayoutOrder = Frame.LayoutOrder,
		padding = if FreeTrialChipTopBarRightPaddingFastInt > 0 then {
			right = UDim.new(0, FreeTrialChipTopBarRightPaddingFastInt)
		} else nil
	}, {
		Chip = ReactModule.createElement(TopBarChipModule, {
			testId = "FreeTrialTopBarSlot",
			text = UseLocalizationResult.label,
			image = UseSignalStateResult1_1,
			onActivated = onChipActivated,
			isEmphasis = UseSignalStateResult4
		})
	}) else nil
end