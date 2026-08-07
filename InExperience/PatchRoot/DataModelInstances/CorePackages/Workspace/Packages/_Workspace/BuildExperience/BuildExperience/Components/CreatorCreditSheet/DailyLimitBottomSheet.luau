local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local foundationModule = require(parent.Foundation)
local numberLocalization = require(parent.Localization).NumberLocalization
local reactModule = require(parent.React)
local getFFlagLuaAppEnableOpenTypeSupport = require(parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local button = foundationModule.Button
local chip = foundationModule.Chip
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local sheet = foundationModule.Sheet
local buttonVariant = foundationModule.Enums.ButtonVariant
local chipSize = foundationModule.Enums.ChipSize
local chipVariant = foundationModule.Enums.ChipVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local list = { 2000, 5000 }

local function formatNumber(p0) --[[ line: 83 ]]
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", math.floor(p0)), localizationService.RobloxLocaleId)
end

local function DailyLimitBottomSheetContent(p1) --[[ line: 87 ]]
	-- upvalues: reactModule (ref), localizationStringsModule (ref), formatNumber (ref), chip (ref), iconName (ref), chipVariant (ref), chipSize (ref), list (ref), numberLocalization (ref), localizationService (ref), sheet (ref), text (ref), view (ref), iconButton (ref), buttonVariant (ref), inputSize (ref), icon (ref), iconSize (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), button (ref), fillBehavior (ref)
	local testId = p1.testId or "creator-credit-limit-sheet"
	local maxValue = math.max(p1.initialValue or 500, 100)
	local additionalUsed = p1.additionalUsed or 0
	local var11 = p1.isSaving == true
	local var12, var13 = reactModule.useState(maxValue)
	local var14, var15 = reactModule.useState(p1.initialIsNoLimit == true)
	local var16 = reactModule.useCallback(function() --[[ line: 97 ]]
		-- upvalues: var15 (ref), var13 (ref)
		var15(false)
		var13(function(p2) --[[ line: 99 ]]
			return math.max(p2 - 500, 100)
		end)
	end, {})
	local var17 = reactModule.useCallback(function() --[[ line: 104 ]]
		-- upvalues: var15 (ref), var13 (ref)
		var15(false)
		var13(function(p3) --[[ line: 106 ]]
			return p3 + 500
		end)
	end, {})
	local var18 = reactModule.useCallback(function(p4) --[[ line: 111 ]]
		-- upvalues: var15 (ref), var13 (ref)
		var15(false)
		var13(math.max(p4, 100))
	end, {})
	local var19 = reactModule.useCallback(function() --[[ line: 116 ]]
		-- upvalues: var15 (ref)
		var15(true)
	end, {})
	local var20 = not var14 and var12 < additionalUsed
	local var21 = if var20 then localizationStringsModule.formatCreatorCreditLimitBelowSpend(formatNumber(additionalUsed)) elseif p1.saveError then localizationStringsModule.CREATOR_CREDIT_SETTINGS_SAVE_ERROR else nil
	local var22 = reactModule.useCallback(function() --[[ line: 128 ]]
		-- upvalues: var14 (ref), p1 (ref), var12 (ref), additionalUsed (ref)
		if var14 then
			p1.onConfirm(nil)
			
			return
		elseif var12 < additionalUsed then
			return
		end
		p1.onConfirm(var12)
	end, { var12, additionalUsed, var14, p1.onConfirm })
	local t = {
		NoLimit = reactModule.createElement(chip, {
			LayoutOrder = 1,
			text = localizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT,
			leading = iconName.CircleX,
			variant = chipVariant.Standard,
			size = chipSize.Medium,
			onActivated = var19,
			isDisabled = var11,
			testId = `{testId}-preset-no-limit`
		})
	}
	
	for i, v in list do
		t[`Preset{v}`] = reactModule.createElement(chip, {
			LayoutOrder = 1 + i,
			text = numberLocalization.localize(string.format("%.0f", math.floor(v)), localizationService.RobloxLocaleId),
			leading = iconName.Robux,
			variant = chipVariant.Standard,
			size = chipSize.Medium,
			onActivated = function() --[[ line: 168 ]]
				-- upvalues: var18 (ref), v (ref)
				var18(v)
			end,
			isDisabled = var11,
			testId = `{testId}-preset-{v}`
		})
	end
	return reactModule.createElement(sheet.Root, {
		isOpen = true,
		preferCenterSheet = true,
		onClose = p1.onCancel
	}, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			Title = reactModule.createElement(text, {
				tag = "auto-xy text-heading-small content-emphasis",
				Text = localizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_TITLE
			})
		}),
		Content = reactModule.createElement(sheet.Content, nil, {
			Body = reactModule.createElement(view, { tag = "col gap-large size-full-0 auto-y" }, {
				Stepper = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "row align-x-center align-y-center gap-large size-full-0 auto-y padding-y-medium"
				}, {
					Minus = reactModule.createElement(iconButton, {
						LayoutOrder = 1,
						isCircular = true,
						icon = iconName.MinusSmall,
						variant = buttonVariant.Utility,
						size = inputSize.Medium,
						onActivated = var16,
						isDisabled = var11 or (var14 or var12 <= 100),
						testId = `{testId}-decrement`
					}),
					ValueDisplay = reactModule.createElement(view, {
						LayoutOrder = 2,
						tag = "row align-y-center gap-small auto-xy"
					}, {
						IconEl = reactModule.createElement(icon, {
							LayoutOrder = 1,
							tag = "auto-xy content-emphasis",
							name = if var14 then iconName.CircleX else iconName.Robux,
							size = iconSize.Large
						}),
						Amount = reactModule.createElement(text, {
							LayoutOrder = 2,
							tag = "auto-xy text-heading-medium content-emphasis",
							Text = if var14 then localizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT else numberLocalization.localize(string.format("%.0f", math.floor(var12)), localizationService.RobloxLocaleId),
							OpenTypeFeatures = if getFFlagLuaAppEnableOpenTypeSupport() then "tnum" else nil,
							testId = `{testId}-value`
						})
					}),
					Plus = reactModule.createElement(iconButton, {
						LayoutOrder = 3,
						isCircular = true,
						icon = iconName.PlusSmall,
						variant = buttonVariant.Utility,
						size = inputSize.Medium,
						onActivated = var17,
						isDisabled = var11 or var14,
						testId = `{testId}-increment`
					})
				}),
				Chips = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row align-x-center align-y-center gap-small size-full-0 auto-y"
				}, t),
				Error = if var21 then reactModule.createElement(text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-caption-medium text-wrap text-align-x-center content-system-alert",
					Text = var21,
					testId = if var20 then `{testId}-below-spend-error` else `{testId}-save-error`
				}) else nil
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, nil, {
			Confirm = reactModule.createElement(button, {
				text = localizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_CONFIRM,
				size = inputSize.Large,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				onActivated = var22,
				isDisabled = var11 or var20,
				testId = `{testId}-confirm`
			})
		})
	})
end

return function(p5) --[[ line: 282 | named "DailyLimitBottomSheet" ]]
	-- upvalues: reactModule (ref), DailyLimitBottomSheetContent (ref)
	return if p5.isOpen then reactModule.createElement(DailyLimitBottomSheetContent, p5) else nil
end