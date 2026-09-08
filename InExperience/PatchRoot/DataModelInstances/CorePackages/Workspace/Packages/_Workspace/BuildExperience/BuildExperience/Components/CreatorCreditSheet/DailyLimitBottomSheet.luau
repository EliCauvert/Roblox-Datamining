local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local foundationModule = require(parent.Foundation)
local numberLocalization = require(parent.Localization).NumberLocalization
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
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

local function _(p1)
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", math.floor(p1)), localizationService.RobloxLocaleId)
end

local function DailyLimitBottomSheetContent(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), numberLocalization (ref), localizationService (ref), reactModule (ref), chip (ref), iconName (ref), chipVariant (ref), chipSize (ref), list (ref), sheet (ref), text (ref), view (ref), iconButton (ref), buttonVariant (ref), inputSize (ref), icon (ref), iconSize (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), button (ref), fillBehavior (ref)
	local additionalUsed = p1.additionalUsed or 0
	local var1 = useLocalization({
		belowSpend = {
			localizationStringsModule.CREATOR_CREDIT_LIMIT_BELOW_SPEND,
			ALREADY_SPENT = numberLocalization.localize(string.format("%.0f", math.floor(additionalUsed)), localizationService.RobloxLocaleId)
		},
		confirm = localizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_CONFIRM,
		noLimit = localizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_NO_LIMIT,
		saveError = localizationStringsModule.CREATOR_CREDIT_SETTINGS_SAVE_ERROR,
		title = localizationStringsModule.CREATOR_CREDIT_LIMIT_SHEET_TITLE
	})
	local belowSpend = var1.belowSpend
	local confirm = var1.confirm
	local noLimit = var1.noLimit
	local saveError = var1.saveError
	local title = var1.title
	local testId = p1.testId or "creator-credit-limit-sheet"
	local var2 = p1.isSaving == true
	local var3, var4 = reactModule.useState(math.max(p1.initialValue or 500, 100))
	local var5, var6 = reactModule.useState(p1.initialIsNoLimit == true)
	local var7 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var4 (ref)
		var6(false)
		var4(function(p2)
			return math.max(p2 - 500, 100)
		end)
	end, {})
	local var8 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var4 (ref)
		var6(false)
		var4(function(p2)
			return p2 + 500
		end)
	end, {})
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref), var4 (ref)
		var6(false)
		var4(math.max(p2, 100))
	end, {})
	local var10 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		var6(true)
	end, {})
	local var11 = not var5 and var3 < additionalUsed
	local var12 = if var11 then belowSpend elseif p1.saveError then saveError else nil
	local var13 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), p1 (ref), var3 (ref), additionalUsed (ref)
		if var5 then
			p1.onConfirm(nil)
			
			return
		elseif var3 < additionalUsed then
			return
		end
		p1.onConfirm(var3)
	end, { var3, additionalUsed, var5, p1.onConfirm })
	local t = {
		NoLimit = reactModule.createElement(chip, {
			LayoutOrder = 1,
			text = noLimit,
			leading = iconName.CircleX,
			variant = chipVariant.Standard,
			size = chipSize.Medium,
			onActivated = var10,
			isDisabled = var2,
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
				-- upvalues: var9 (ref), v (ref)
				var9(v)
			end,
			isDisabled = var2,
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
				Text = title
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
						onActivated = var7,
						isDisabled = var2 or (var5 or var3 <= 100),
						testId = `{testId}-decrement`
					}),
					ValueDisplay = reactModule.createElement(view, {
						LayoutOrder = 2,
						tag = "row align-y-center gap-small auto-xy"
					}, {
						IconEl = reactModule.createElement(icon, {
							LayoutOrder = 1,
							tag = "auto-xy content-emphasis",
							name = if var5 then iconName.CircleX else iconName.Robux,
							size = iconSize.Large
						}),
						Amount = reactModule.createElement(text, {
							LayoutOrder = 2,
							tag = "auto-xy text-heading-medium content-emphasis",
							Text = if var5 then noLimit else numberLocalization.localize(string.format("%.0f", math.floor(var3)), localizationService.RobloxLocaleId),
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
						onActivated = var8,
						isDisabled = var2 or var5,
						testId = `{testId}-increment`
					})
				}),
				Chips = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row align-x-center align-y-center gap-small size-full-0 auto-y"
				}, t),
				Error = if var12 then reactModule.createElement(text, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-caption-medium text-wrap text-align-x-center content-system-alert",
					Text = var12,
					testId = if var11 then `{testId}-below-spend-error` else `{testId}-save-error`
				}) else nil
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, nil, {
			Confirm = reactModule.createElement(button, {
				text = confirm,
				size = inputSize.Large,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				onActivated = var13,
				isDisabled = var2 or var11,
				testId = `{testId}-confirm`
			})
		})
	})
end

return function(p2)
	-- upvalues: reactModule (ref), DailyLimitBottomSheetContent (ref)
	return if p2.isOpen then reactModule.createElement(DailyLimitBottomSheetContent, p2) else nil
end