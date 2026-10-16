local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationService = game:GetService("LocalizationService")
local FoundationModule = require(Parent.Foundation)
local NumberLocalization = require(Parent.Localization).NumberLocalization
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local GetFFlagLuaAppEnableOpenTypeSupportFunction = require(Parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local Button = FoundationModule.Button
local Chip = FoundationModule.Chip
local Icon = FoundationModule.Icon
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local View = FoundationModule.View
local Sheet = FoundationModule.Sheet
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ChipSize = FoundationModule.Enums.ChipSize
local ChipVariant = FoundationModule.Enums.ChipVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local list = { 2000, 5000 }

local function _(Value: number) --[[ Line: 85 | Named "formatNumber" ]]
	-- upvalues: NumberLocalization (copy), LocalizationService (copy)
	return NumberLocalization.localize(string.format("%.0f", (math.floor(Value))), LocalizationService.RobloxLocaleId)
end

local function DailyLimitBottomSheetContent(p1) --[[ Line: 89 ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), NumberLocalization (copy), LocalizationService (copy), ReactModule (copy), Chip (copy), IconName (copy), ChipVariant (copy), ChipSize (copy), list (copy), Sheet (copy), Text (copy), View (copy), IconButton (copy), ButtonVariant (copy), InputSize (copy), Icon (copy), IconSize (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), Button (copy), FillBehavior (copy)
	local AdditionalUsed = p1.additionalUsed or 0
	local UseLocalizationResult = UseLocalizationFunction({
		belowSpend = {
			LocalizationStringsModule.CREATOR_CREDIT_LIMIT_BELOW_SPEND,
			ALREADY_SPENT = NumberLocalization.localize(string.format("%.0f", (math.floor(AdditionalUsed))), LocalizationService.RobloxLocaleId)
		},
		confirm = LocalizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_CONFIRM,
		noLimit = LocalizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT,
		saveError = LocalizationStringsModule.CREATOR_CREDIT_SETTINGS_SAVE_ERROR,
		title = LocalizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_TITLE
	})
	local BelowSpend = UseLocalizationResult.belowSpend
	local Confirm = UseLocalizationResult.confirm
	local NoLimit = UseLocalizationResult.noLimit
	local SaveError = UseLocalizationResult.saveError
	local Title = UseLocalizationResult.title
	local TestId = p1.testId or "creator-credit-limit-sheet"
	local IsIsSaving = p1.isSaving == true
	local UseStateResult, UseStateResult2 = ReactModule.useState((math.max(p1.initialValue or 500, 100)))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(p1.initialIsNoLimit == true)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 114 ]]
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2 (copy)
		UseStateResult2_1(false)
		UseStateResult2(function(p2: number): number --[[ Line: 116 ]]
			return (math.max(p2 - 500, 100))
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 121 ]]
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2 (copy)
		UseStateResult2_1(false)
		UseStateResult2(function(p2: number): number --[[ Line: 123 ]]
			return p2 + 500
		end)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p2: number) --[[ Line: 128 ]]
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2 (copy)
		UseStateResult2_1(false)
		UseStateResult2((math.max(p2, 100)))
	end, {})
	local IsUseStateResultBelow: boolean = not UseStateResult1 and UseStateResult < AdditionalUsed
	local BelowSpend1 = if IsUseStateResultBelow then BelowSpend elseif p1.saveError then SaveError else nil
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 142 ]]
		-- upvalues: UseStateResult1 (copy), p1 (copy), UseStateResult (copy), AdditionalUsed (copy)
		if UseStateResult1 then
			p1.onConfirm(nil)
			
			return
		end
		if UseStateResult >= AdditionalUsed then
			p1.onConfirm(UseStateResult)
			
			return
		end
	end, {
		UseStateResult,
		AdditionalUsed,
		UseStateResult1,
		p1.onConfirm
	})
	local config = {
		NoLimit = ReactModule.createElement(Chip, {
			LayoutOrder = 1,
			text = NoLimit,
			leading = IconName.CircleX,
			variant = ChipVariant.Standard,
			size = ChipSize.Medium,
			onActivated = ReactModule.useCallback(function() --[[ Line: 133 ]]
				-- upvalues: UseStateResult2_1 (copy)
				UseStateResult2_1(true)
			end, {}),
			isDisabled = IsIsSaving,
			testId = `{TestId}-preset-no-limit`
		})
	}
	
	for i, value in list do
		config[`Preset{value}`] = ReactModule.createElement(Chip, {
			LayoutOrder = 1 + i,
			text = NumberLocalization.localize(string.format("%.0f", (math.floor(value))), LocalizationService.RobloxLocaleId),
			leading = IconName.Robux,
			variant = ChipVariant.Standard,
			size = ChipSize.Medium,
			onActivated = function() --[[ Line: 182 ]]
				-- upvalues: UseResult2 (copy), value (copy)
				UseResult2(value)
			end,
			isDisabled = IsIsSaving,
			testId = `{TestId}-preset-{value}`
		})
	end
	return ReactModule.createElement(Sheet.Root, {
		isOpen = true,
		preferCenterSheet = true,
		onClose = p1.onCancel
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
			Title = ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-small content-emphasis",
				Text = Title
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, {
			Body = ReactModule.createElement(View, { tag = "col gap-large size-full-0 auto-y" }, {
				Stepper = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "row align-x-center align-y-center gap-large size-full-0 auto-y padding-y-medium"
				}, {
					Minus = ReactModule.createElement(IconButton, {
						LayoutOrder = 1,
						isCircular = true,
						icon = IconName.MinusSmall,
						variant = ButtonVariant.Utility,
						size = InputSize.Medium,
						onActivated = UseResult,
						isDisabled = IsIsSaving or (UseStateResult1 or UseStateResult <= 100),
						testId = `{TestId}-decrement`
					}),
					ValueDisplay = ReactModule.createElement(View, {
						LayoutOrder = 2,
						tag = "row align-y-center gap-small auto-xy"
					}, {
						IconEl = ReactModule.createElement(Icon, {
							LayoutOrder = 1,
							tag = "auto-xy content-emphasis",
							name = if UseStateResult1 then IconName.CircleX else IconName.Robux,
							size = IconSize.Large
						}),
						Amount = ReactModule.createElement(Text, {
							LayoutOrder = 2,
							tag = "auto-xy text-heading-medium content-emphasis",
							Text = if UseStateResult1 then NoLimit else NumberLocalization.localize(string.format("%.0f", (math.floor(UseStateResult))), LocalizationService.RobloxLocaleId),
							OpenTypeFeatures = if GetFFlagLuaAppEnableOpenTypeSupportFunction() then "tnum" else nil,
							testId = `{TestId}-value`
						})
					}),
					Plus = ReactModule.createElement(IconButton, {
						LayoutOrder = 3,
						isCircular = true,
						icon = IconName.PlusSmall,
						variant = ButtonVariant.Utility,
						size = InputSize.Medium,
						onActivated = UseResult1,
						isDisabled = IsIsSaving or UseStateResult1,
						testId = `{TestId}-increment`
					})
				}),
				Chips = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "row align-x-center align-y-center gap-small size-full-0 auto-y"
				}, config),
				Error = if BelowSpend1 then ReactModule.createElement(Text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-caption-medium text-wrap text-align-x-center content-system-alert",
					Text = BelowSpend1,
					testId = if IsUseStateResultBelow then `{TestId}-below-spend-error` else `{TestId}-save-error`
				}) else nil
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, nil, {
			Confirm = ReactModule.createElement(Button, {
				text = Confirm,
				size = InputSize.Large,
				variant = ButtonVariant.Emphasis,
				fillBehavior = FillBehavior.Fill,
				onActivated = UseResult3,
				isDisabled = IsIsSaving or IsUseStateResultBelow,
				testId = `{TestId}-confirm`
			})
		})
	})
end

return function(p2) --[[ Line: 294 | Named "DailyLimitBottomSheet" ]]
	-- upvalues: ReactModule (copy), DailyLimitBottomSheetContent (copy)
	return if p2.isOpen then ReactModule.createElement(DailyLimitBottomSheetContent, p2) else nil
end