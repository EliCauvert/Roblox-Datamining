local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local foundationModule = require(parent.Foundation)
local numberLocalization = require(parent.Localization).NumberLocalization
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local getFFlagLuaAppEnableOpenTypeSupport = sharedFlagsModule.GetFFlagLuaAppEnableOpenTypeSupport
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

local function formatNumber(p0) --[[ line: 87 ]]
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", math.floor(p0)), localizationService.RobloxLocaleId)
end

local function DailyLimitBottomSheetContent(p1) --[[ line: 91 ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), numberLocalization (ref), localizationService (ref), formatNumber (ref), reactModule (ref), chip (ref), iconName (ref), chipVariant (ref), chipSize (ref), list (ref), sheet (ref), text (ref), view (ref), iconButton (ref), buttonVariant (ref), inputSize (ref), icon (ref), iconSize (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), button (ref), fillBehavior (ref)
	local var11, CREATOR_CREDIT_LIMIT_SHEET_CONFIRM, CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT, CREATOR_CREDIT_SETTINGS_SAVE_ERROR, CREATOR_CREDIT_LIMIT_SHEET_TITLE
	local additionalUsed = p1.additionalUsed or 0
	local var10 = if fFlagBuildLocalization then useLocalization({
		belowSpend = {
			localizationStringsModule.CREATOR_CREDIT_LIMIT_BELOW_SPEND,
			ALREADY_SPENT = numberLocalization.localize(string.format("%.0f", math.floor(additionalUsed)), localizationService.RobloxLocaleId)
		},
		confirm = localizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_CONFIRM,
		noLimit = localizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT,
		saveError = localizationStringsModule.CREATOR_CREDIT_SETTINGS_SAVE_ERROR,
		title = localizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_TITLE
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		var11 = var10.belowSpend
		CREATOR_CREDIT_LIMIT_SHEET_CONFIRM = var10.confirm
		CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT = var10.noLimit
		CREATOR_CREDIT_SETTINGS_SAVE_ERROR = var10.saveError
		CREATOR_CREDIT_LIMIT_SHEET_TITLE = var10.title
	else
		var11 = localizationStringsModule.formatCreatorCreditLimitBelowSpend(formatNumber(additionalUsed))
		CREATOR_CREDIT_LIMIT_SHEET_CONFIRM = localizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_CONFIRM
		CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT = localizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT
		CREATOR_CREDIT_SETTINGS_SAVE_ERROR = localizationStringsModule.CREATOR_CREDIT_SETTINGS_SAVE_ERROR
		CREATOR_CREDIT_LIMIT_SHEET_TITLE = localizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_TITLE
	end
	local testId = p1.testId or "creator-credit-limit-sheet"
	local var13 = p1.isSaving == true
	local var14, var15 = reactModule.useState(math.max(p1.initialValue or 500, 100))
	local var16, var17 = reactModule.useState(p1.initialIsNoLimit == true)
	local var18 = reactModule.useCallback(function() --[[ line: 131 ]]
		-- upvalues: var17 (ref), var15 (ref)
		var17(false)
		var15(function(p2) --[[ line: 133 ]]
			return math.max(p2 - 500, 100)
		end)
	end, {})
	local var19 = reactModule.useCallback(function() --[[ line: 138 ]]
		-- upvalues: var17 (ref), var15 (ref)
		var17(false)
		var15(function(p3) --[[ line: 140 ]]
			return p3 + 500
		end)
	end, {})
	local var20 = reactModule.useCallback(function(p4) --[[ line: 145 ]]
		-- upvalues: var17 (ref), var15 (ref)
		var17(false)
		var15(math.max(p4, 100))
	end, {})
	local var21 = reactModule.useCallback(function() --[[ line: 150 ]]
		-- upvalues: var17 (ref)
		var17(true)
	end, {})
	local var22 = not var16 and var14 < additionalUsed
	local var23 = if var22 then var11 elseif p1.saveError then CREATOR_CREDIT_SETTINGS_SAVE_ERROR else nil
	local var24 = reactModule.useCallback(function() --[[ line: 159 ]]
		-- upvalues: var16 (ref), p1 (ref), var14 (ref), additionalUsed (ref)
		if var16 then
			p1.onConfirm(nil)
			
			return
		elseif var14 < additionalUsed then
			return
		end
		p1.onConfirm(var14)
	end, { var14, additionalUsed, var16, p1.onConfirm })
	local t = {
		NoLimit = reactModule.createElement(chip, {
			LayoutOrder = 1,
			text = CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT,
			leading = iconName.CircleX,
			variant = chipVariant.Standard,
			size = chipSize.Medium,
			onActivated = var21,
			isDisabled = var13,
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
			onActivated = function() --[[ line: 199 ]]
				-- upvalues: var20 (ref), v (ref)
				var20(v)
			end,
			isDisabled = var13,
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
				Text = CREATOR_CREDIT_LIMIT_SHEET_TITLE
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
						onActivated = var18,
						isDisabled = var13 or (var16 or var14 <= 100),
						testId = `{testId}-decrement`
					}),
					ValueDisplay = reactModule.createElement(view, {
						LayoutOrder = 2,
						tag = "row align-y-center gap-small auto-xy"
					}, {
						IconEl = reactModule.createElement(icon, {
							LayoutOrder = 1,
							tag = "auto-xy content-emphasis",
							name = if var16 then iconName.CircleX else iconName.Robux,
							size = iconSize.Large
						}),
						Amount = reactModule.createElement(text, {
							LayoutOrder = 2,
							tag = "auto-xy text-heading-medium content-emphasis",
							Text = if var16 then CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT else numberLocalization.localize(string.format("%.0f", math.floor(var14)), localizationService.RobloxLocaleId),
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
						onActivated = var19,
						isDisabled = var13 or var16,
						testId = `{testId}-increment`
					})
				}),
				Chips = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row align-x-center align-y-center gap-small size-full-0 auto-y"
				}, t),
				Error = if var23 then reactModule.createElement(text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-caption-medium text-wrap text-align-x-center content-system-alert",
					Text = var23,
					testId = if var22 then `{testId}-below-spend-error` else `{testId}-save-error`
				}) else nil
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, nil, {
			Confirm = reactModule.createElement(button, {
				text = CREATOR_CREDIT_LIMIT_SHEET_CONFIRM,
				size = inputSize.Large,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				onActivated = var24,
				isDisabled = var13 or var22,
				testId = `{testId}-confirm`
			})
		})
	})
end

return function(p5) --[[ line: 311 | named "DailyLimitBottomSheet" ]]
	-- upvalues: reactModule (ref), DailyLimitBottomSheetContent (ref)
	return if p5.isOpen then reactModule.createElement(DailyLimitBottomSheetContent, p5) else nil
end