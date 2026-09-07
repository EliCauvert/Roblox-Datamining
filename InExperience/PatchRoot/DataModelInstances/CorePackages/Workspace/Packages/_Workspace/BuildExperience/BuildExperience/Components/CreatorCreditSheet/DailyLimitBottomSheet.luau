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

local function formatNumber(p1)
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", math.floor(p1)), localizationService.RobloxLocaleId)
end

local function DailyLimitBottomSheetContent(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), numberLocalization (ref), localizationService (ref), formatNumber (ref), reactModule (ref), chip (ref), iconName (ref), chipVariant (ref), chipSize (ref), list (ref), sheet (ref), text (ref), view (ref), iconButton (ref), buttonVariant (ref), inputSize (ref), icon (ref), iconSize (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), button (ref), fillBehavior (ref)
	local var1, CREATOR_CREDIT_LIMIT_SHEET_CONFIRM, CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT, CREATOR_CREDIT_SETTINGS_SAVE_ERROR, CREATOR_CREDIT_LIMIT_SHEET_TITLE
	local additionalUsed = p1.additionalUsed or 0
	local var2 = if fFlagBuildLocalization then useLocalization({
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
		var1 = var2.belowSpend
		CREATOR_CREDIT_LIMIT_SHEET_CONFIRM = var2.confirm
		CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT = var2.noLimit
		CREATOR_CREDIT_SETTINGS_SAVE_ERROR = var2.saveError
		CREATOR_CREDIT_LIMIT_SHEET_TITLE = var2.title
	else
		var1 = localizationStringsModule.formatCreatorCreditLimitBelowSpend(formatNumber(additionalUsed))
		CREATOR_CREDIT_LIMIT_SHEET_CONFIRM = localizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_CONFIRM
		CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT = localizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT
		CREATOR_CREDIT_SETTINGS_SAVE_ERROR = localizationStringsModule.CREATOR_CREDIT_SETTINGS_SAVE_ERROR
		CREATOR_CREDIT_LIMIT_SHEET_TITLE = localizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_TITLE
	end
	local testId = p1.testId or "creator-credit-limit-sheet"
	local var3 = p1.isSaving == true
	local var4, var5 = reactModule.useState(math.max(p1.initialValue or 500, 100))
	local var6, var7 = reactModule.useState(p1.initialIsNoLimit == true)
	local var8 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var5 (ref)
		var7(false)
		var5(function(p2)
			return math.max(p2 - 500, 100)
		end)
	end, {})
	local var9 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var5 (ref)
		var7(false)
		var5(function(p2)
			return p2 + 500
		end)
	end, {})
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref), var5 (ref)
		var7(false)
		var5(math.max(p2, 100))
	end, {})
	local var11 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		var7(true)
	end, {})
	local var12 = not var6 and var4 < additionalUsed
	local var13 = if var12 then var1 elseif p1.saveError then CREATOR_CREDIT_SETTINGS_SAVE_ERROR else nil
	local var14 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), p1 (ref), var4 (ref), additionalUsed (ref)
		if var6 then
			p1.onConfirm(nil)
			
			return
		elseif var4 < additionalUsed then
			return
		end
		p1.onConfirm(var4)
	end, { var4, additionalUsed, var6, p1.onConfirm })
	local t = {
		NoLimit = reactModule.createElement(chip, {
			LayoutOrder = 1,
			text = CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT,
			leading = iconName.CircleX,
			variant = chipVariant.Standard,
			size = chipSize.Medium,
			onActivated = var11,
			isDisabled = var3,
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
			onActivated = function()
				-- upvalues: var10 (ref), v (ref)
				var10(v)
			end,
			isDisabled = var3,
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
						onActivated = var8,
						isDisabled = var3 or (var6 or var4 <= 100),
						testId = `{testId}-decrement`
					}),
					ValueDisplay = reactModule.createElement(view, {
						LayoutOrder = 2,
						tag = "row align-y-center gap-small auto-xy"
					}, {
						IconEl = reactModule.createElement(icon, {
							LayoutOrder = 1,
							tag = "auto-xy content-emphasis",
							name = if var6 then iconName.CircleX else iconName.Robux,
							size = iconSize.Large
						}),
						Amount = reactModule.createElement(text, {
							LayoutOrder = 2,
							tag = "auto-xy text-heading-medium content-emphasis",
							Text = if var6 then CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT else numberLocalization.localize(string.format("%.0f", math.floor(var4)), localizationService.RobloxLocaleId),
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
						onActivated = var9,
						isDisabled = var3 or var6,
						testId = `{testId}-increment`
					})
				}),
				Chips = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row align-x-center align-y-center gap-small size-full-0 auto-y"
				}, t),
				Error = if var13 then reactModule.createElement(text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-caption-medium text-wrap text-align-x-center content-system-alert",
					Text = var13,
					testId = if var12 then `{testId}-below-spend-error` else `{testId}-save-error`
				}) else nil
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, nil, {
			Confirm = reactModule.createElement(button, {
				text = CREATOR_CREDIT_LIMIT_SHEET_CONFIRM,
				size = inputSize.Large,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				onActivated = var14,
				isDisabled = var3 or var12,
				testId = `{testId}-confirm`
			})
		})
	})
end

return function(p2)
	-- upvalues: reactModule (ref), DailyLimitBottomSheetContent (ref)
	return if p2.isOpen then reactModule.createElement(DailyLimitBottomSheetContent, p2) else nil
end