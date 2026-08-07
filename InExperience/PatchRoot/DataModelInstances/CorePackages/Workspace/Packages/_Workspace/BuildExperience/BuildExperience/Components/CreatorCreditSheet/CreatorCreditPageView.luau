local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationService = game:GetService("LocalizationService")
local foundationModule = require(parent.Foundation)
local numberLocalization = require(parent.Localization).NumberLocalization
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local button = foundationModule.Button
local icon = foundationModule.Icon
local progress = foundationModule.Progress
local text = foundationModule.Text
local toggle = foundationModule.Toggle
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local progressShape = foundationModule.Enums.ProgressShape
local progressSize = foundationModule.Enums.ProgressSize

local function noop() --[[ line: 26 ]] end

local function _(value) --[[ line: 46 | named "clampPct" ]]
	return if value < 0 then 0 elseif value > 100 then 100 else value
end

local function formatNumber(p0) --[[ line: 55 ]]
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", math.floor(p0)), localizationService.RobloxLocaleId)
end

local function FreeUsageCard(p1) --[[ line: 59 ]]
	-- upvalues: localizationStringsModule (ref), reactModule (ref), view (ref), text (ref), progress (ref), progressShape (ref), progressSize (ref)
	local pctUsed = p1.pctUsed
	local var10 = if pctUsed < 0 then 0 elseif pctUsed > 100 then 100 else pctUsed
	
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y padding-large radius-large bg-shift-100",
		testId = "creator-credit-page-free-usage-card",
		LayoutOrder = p1.LayoutOrder
	}, {
		Label = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-align-x-left content-emphasis",
			testId = "creator-credit-page-free-usage-label",
			Text = localizationStringsModule.CREATOR_CREDIT_FREE_USAGE_LABEL
		}),
		Value = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-heading-small text-align-x-left content-emphasis",
			testId = "creator-credit-page-free-usage-value",
			Text = localizationStringsModule.formatCreatorCreditPercentUsed(var10)
		}),
		Bar = reactModule.createElement(progress, {
			LayoutOrder = 3,
			testId = "creator-credit-page-daily-progress",
			shape = progressShape.Bar,
			size = progressSize.Medium,
			value = var10,
			width = UDim.new(1, 0)
		}),
		Caption = reactModule.createElement(text, {
			LayoutOrder = 4,
			tag = "size-full-0 auto-y padding-top-medium text-body-small text-align-x-left content-muted",
			testId = "creator-credit-page-free-usage-reset",
			Text = if math.floor(var10 + 0.5) > 0 and p1.resetHours ~= nil then localizationStringsModule.formatCreatorCreditResetHours(p1.resetHours) else localizationStringsModule.CREATOR_CREDIT_FREE_USAGE_CAPTION
		})
	})
end

local function RobuxLine(p2) --[[ line: 103 ]]
	-- upvalues: localizationStringsModule (ref), numberLocalization (ref), localizationService (ref), formatNumber (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local var11
	local _ = nil
	
	if p2.kind == "used" then
		assert(p2.usedOf ~= nil, "usedOf required when kind == 'used'")
		var11 = localizationStringsModule.formatCreatorCreditAdditionalUsed(numberLocalization.localize(string.format("%.0f", math.floor(p2.amount)), localizationService.RobloxLocaleId), formatNumber(p2.usedOf))
	else
		var11 = if p2.kind == "usedNoLimit" then localizationStringsModule.formatCreatorCreditAdditionalUsedNoLimit(formatNumber(p2.amount)) else `{numberLocalization.localize(string.format("%.0f", math.floor(p2.amount)), localizationService.RobloxLocaleId)} {localizationStringsModule.CREATOR_CREDIT_AVAILABLE_SUFFIX}`
	end
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-xsmall size-full-0 auto-y padding-bottom-medium",
		LayoutOrder = p2.LayoutOrder
	}, {
		IconEl = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = iconName.Robux,
			size = iconSize.Medium,
			tag = {
				["auto-xy"] = true,
				["content-muted"] = not p2.isEnabled,
				["content-emphasis"] = p2.isEnabled
			}
		}),
		Amount = reactModule.createElement(text, {
			LayoutOrder = 2,
			testId = "creator-credit-page-robux-line",
			Text = var11,
			tag = {
				["auto-xy text-heading-small"] = true,
				["content-muted"] = not p2.isEnabled,
				["content-emphasis"] = p2.isEnabled
			}
		})
	})
end

local function AdditionalUsageCard(p3) --[[ line: 150 ]]
	-- upvalues: localizationStringsModule (ref), reactModule (ref), view (ref), text (ref), toggle (ref), inputSize (ref), RobuxLine (ref), button (ref), buttonVariant (ref), noop (ref)
	local var12 = p3.additionalEnabled and p3.dailyLimit ~= nil
	local var12_1 = var12 or p3.additionalEnabled and p3.hasLimitConfigured == true
	local var14 = var12_1 and not var12
	local t = {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center size-full-0 auto-y"
		}, {
			Label = reactModule.createElement(text, {
				LayoutOrder = 1,
				testId = "creator-credit-page-additional-usage-label",
				Text = if p3.additionalEnabled then localizationStringsModule.CREATOR_CREDIT_ADDITIONAL_DAILY_USAGE_LABEL else localizationStringsModule.CREATOR_CREDIT_ADDITIONAL_USAGE_LABEL,
				tag = {
					["fill auto-y text-title-medium text-align-x-left"] = true,
					["content-default"] = not p3.additionalEnabled,
					["content-emphasis"] = p3.additionalEnabled
				}
			}),
			ToggleSwitch = reactModule.createElement(toggle, {
				LayoutOrder = 2,
				label = "",
				testId = "creator-credit-page-additional-toggle",
				size = inputSize.Medium,
				isChecked = p3.additionalEnabled,
				isDisabled = p3.settingsDisabled == true,
				onActivated = function(p4) --[[ line: 193 ]]
					-- upvalues: p3 (ref)
					if not p3.settingsDisabled then
						p3.onToggleAdditional(p4)
					end
				end
			})
		})
	}
	
	if var12 then
		assert(p3.dailyLimit ~= nil, "dailyLimit must be provided when a numeric limit is configured")
		t.UsageLine = reactModule.createElement(RobuxLine, {
			LayoutOrder = 2,
			kind = "used",
			amount = p3.additionalUsed,
			usedOf = p3.dailyLimit,
			isEnabled = p3.additionalEnabled
		})
	elseif var14 then
		t.UsageLine = reactModule.createElement(RobuxLine, {
			LayoutOrder = 2,
			kind = "usedNoLimit",
			amount = p3.additionalUsed,
			isEnabled = p3.additionalEnabled
		})
	else
		t.AvailableLine = reactModule.createElement(RobuxLine, {
			LayoutOrder = 2,
			kind = "available",
			amount = p3.robuxAvailable,
			isEnabled = p3.additionalEnabled
		})
	end
	if p3.additionalEnabled then
		t.ActionsRow = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "row align-x-left align-y-center gap-small size-full-0 auto-y"
		}, {
			BuyRobuxButton = if p3.showBuyRobux then reactModule.createElement(button, {
				LayoutOrder = 1,
				testId = "creator-credit-page-buy-robux",
				text = localizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_BUTTON,
				variant = buttonVariant.Emphasis,
				size = inputSize.Medium,
				onActivated = p3.onOpenBuyRobux or noop,
				isDisabled = p3.onOpenBuyRobux == nil
			}) else nil,
			LimitButton = reactModule.createElement(button, {
				LayoutOrder = 2,
				text = if var12_1 then localizationStringsModule.CREATOR_CREDIT_MANAGE_LIMIT else localizationStringsModule.CREATOR_CREDIT_SET_DAILY_LIMIT,
				variant = buttonVariant.Standard,
				size = inputSize.Medium,
				onActivated = p3.onOpenLimitSheet or noop,
				isDisabled = if p3.settingsDisabled ~= true then p3.onOpenLimitSheet == nil else true,
				testId = if var12_1 then "creator-credit-page-manage-limit" else "creator-credit-page-set-daily-limit"
			})
		})
	else
		t.Description = reactModule.createElement(text, {
			LayoutOrder = 3,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
			Text = localizationStringsModule.CREATOR_CREDIT_ADDITIONAL_USAGE_DESCRIPTION
		})
	end
	if p3.settingsError then
		t.SettingsError = reactModule.createElement(text, {
			LayoutOrder = 4,
			tag = "size-full-0 auto-y text-caption-medium text-wrap text-align-x-left content-system-alert",
			testId = "creator-credit-page-settings-error",
			Text = localizationStringsModule.CREATOR_CREDIT_SETTINGS_SAVE_ERROR
		})
	end
	return reactModule.createElement(view, {
		testId = "creator-credit-page-additional-usage-card",
		LayoutOrder = p3.LayoutOrder,
		tag = {
			["col gap-small size-full-0 auto-y padding-large radius-large"] = true,
			["bg-shift-100"] = p3.additionalEnabled,
			["stroke-standard stroke-default"] = not p3.additionalEnabled
		}
	}, t)
end

return function(p5) --[[ line: 288 | named "CreatorCreditPageView" ]]
	-- upvalues: reactModule (ref), view (ref), FreeUsageCard (ref), AdditionalUsageCard (ref)
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-y-xlarge",
		testId = p5.testId or "creator-credit-page"
	}, {
		FreeUsage = reactModule.createElement(FreeUsageCard, {
			LayoutOrder = 1,
			pctUsed = p5.dailyPctUsed,
			resetHours = p5.resetHours
		}),
		AdditionalUsage = reactModule.createElement(AdditionalUsageCard, {
			LayoutOrder = 2,
			additionalEnabled = p5.additionalEnabled,
			dailyLimit = p5.dailyLimit,
			hasLimitConfigured = p5.hasLimitConfigured,
			additionalUsed = p5.additionalUsed,
			robuxAvailable = p5.robuxAvailable,
			settingsDisabled = p5.settingsDisabled,
			settingsError = p5.settingsError,
			showBuyRobux = p5.showBuyRobux,
			onToggleAdditional = p5.onToggleAdditional,
			onOpenLimitSheet = p5.onOpenLimitSheet,
			onOpenBuyRobux = p5.onOpenBuyRobux
		})
	})
end