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

local function noop() --[[ line: 30 ]] end

local function _(value) --[[ line: 50 | named "clampPct" ]]
	return if value < 0 then 0 elseif value > 100 then 100 else value
end

local function formatNumber(p0) --[[ line: 59 ]]
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", math.floor(p0)), localizationService.RobloxLocaleId)
end

local function FreeUsageCard(p1) --[[ line: 63 ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), text (ref), progress (ref), progressShape (ref), progressSize (ref)
	local CREATOR_CREDIT_FREE_USAGE_CAPTION, CREATOR_CREDIT_FREE_USAGE_LABEL
	local var11 = if fFlagBuildLocalization then useLocalization({
		caption = localizationStringsModule.CREATOR_CREDIT_FREE_USAGE_CAPTION,
		label = localizationStringsModule.CREATOR_CREDIT_FREE_USAGE_LABEL
	}) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		CREATOR_CREDIT_FREE_USAGE_CAPTION = var11.caption
		CREATOR_CREDIT_FREE_USAGE_LABEL = var11.label
	else
		CREATOR_CREDIT_FREE_USAGE_CAPTION = localizationStringsModule.CREATOR_CREDIT_FREE_USAGE_CAPTION
		CREATOR_CREDIT_FREE_USAGE_LABEL = localizationStringsModule.CREATOR_CREDIT_FREE_USAGE_LABEL
	end
	local pctUsed = p1.pctUsed
	local var12 = if pctUsed < 0 then 0 elseif pctUsed > 100 then 100 else pctUsed
	
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y padding-large radius-large bg-shift-100",
		testId = "creator-credit-page-free-usage-card",
		LayoutOrder = p1.LayoutOrder
	}, {
		Label = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-align-x-left content-emphasis",
			testId = "creator-credit-page-free-usage-label",
			Text = CREATOR_CREDIT_FREE_USAGE_LABEL
		}),
		Value = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-heading-small text-align-x-left content-emphasis",
			testId = "creator-credit-page-free-usage-value",
			Text = localizationStringsModule.formatCreatorCreditPercentUsed(var12)
		}),
		Bar = reactModule.createElement(progress, {
			LayoutOrder = 3,
			testId = "creator-credit-page-daily-progress",
			shape = progressShape.Bar,
			size = progressSize.Medium,
			value = var12,
			width = UDim.new(1, 0)
		}),
		Caption = reactModule.createElement(text, {
			LayoutOrder = 4,
			tag = "size-full-0 auto-y padding-top-medium text-body-small text-align-x-left content-muted",
			testId = "creator-credit-page-free-usage-reset",
			Text = if math.floor(var12 + 0.5) > 0 and p1.resetHours ~= nil then localizationStringsModule.formatCreatorCreditResetHours(p1.resetHours) else CREATOR_CREDIT_FREE_USAGE_CAPTION
		})
	})
end

local function RobuxLine(p2) --[[ line: 122 ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), numberLocalization (ref), localizationService (ref), formatNumber (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local var14
	local var13 = if fFlagBuildLocalization then useLocalization({
		available = localizationStringsModule.CREATOR_CREDIT_AVAILABLE_SUFFIX
	}) else nil
	local _ = nil
	
	if p2.kind == "used" then
		assert(p2.usedOf ~= nil, "usedOf required when kind == 'used'")
		var14 = localizationStringsModule.formatCreatorCreditAdditionalUsed(numberLocalization.localize(string.format("%.0f", math.floor(p2.amount)), localizationService.RobloxLocaleId), formatNumber(p2.usedOf))
	else
		var14 = if p2.kind == "usedNoLimit" then localizationStringsModule.formatCreatorCreditAdditionalUsedNoLimit(formatNumber(p2.amount)) else `{numberLocalization.localize(string.format("%.0f", math.floor(p2.amount)), localizationService.RobloxLocaleId)} {if fFlagBuildLocalization then var13.available else localizationStringsModule.CREATOR_CREDIT_AVAILABLE_SUFFIX}`
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
			Text = var14,
			tag = {
				["auto-xy text-heading-small"] = true,
				["content-muted"] = not p2.isEnabled,
				["content-emphasis"] = p2.isEnabled
			}
		})
	})
end

local function AdditionalUsageCard(p3) --[[ line: 177 ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), text (ref), toggle (ref), inputSize (ref), RobuxLine (ref), button (ref), buttonVariant (ref), noop (ref)
	local CREATOR_CREDIT_ADDITIONAL_DAILY_USAGE_LABEL, CREATOR_CREDIT_ADDITIONAL_USAGE_LABEL, CREATOR_CREDIT_ADDITIONAL_USAGE_DESCRIPTION, CREATOR_CREDIT_SET_DAILY_LIMIT, CREATOR_CREDIT_MANAGE_LIMIT, CREATOR_CREDIT_SETTINGS_SAVE_ERROR, CREATOR_CREDIT_BUY_ROBUX_BUTTON
	local var15 = if fFlagBuildLocalization then useLocalization({
		additionalDailyUsage = localizationStringsModule.CREATOR_CREDIT_ADDITIONAL_DAILY_USAGE_LABEL,
		additionalUsage = localizationStringsModule.CREATOR_CREDIT_ADDITIONAL_USAGE_LABEL,
		description = localizationStringsModule.CREATOR_CREDIT_ADDITIONAL_USAGE_DESCRIPTION,
		setDailyLimit = localizationStringsModule.CREATOR_CREDIT_SET_DAILY_LIMIT,
		manageLimit = localizationStringsModule.CREATOR_CREDIT_MANAGE_LIMIT,
		settingsSaveError = localizationStringsModule.CREATOR_CREDIT_SETTINGS_SAVE_ERROR,
		buyRobux = localizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_BUTTON
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		CREATOR_CREDIT_ADDITIONAL_DAILY_USAGE_LABEL = var15.additionalDailyUsage
		CREATOR_CREDIT_ADDITIONAL_USAGE_LABEL = var15.additionalUsage
		CREATOR_CREDIT_ADDITIONAL_USAGE_DESCRIPTION = var15.description
		CREATOR_CREDIT_SET_DAILY_LIMIT = var15.setDailyLimit
		CREATOR_CREDIT_MANAGE_LIMIT = var15.manageLimit
		CREATOR_CREDIT_SETTINGS_SAVE_ERROR = var15.settingsSaveError
		CREATOR_CREDIT_BUY_ROBUX_BUTTON = var15.buyRobux
	else
		CREATOR_CREDIT_ADDITIONAL_DAILY_USAGE_LABEL = localizationStringsModule.CREATOR_CREDIT_ADDITIONAL_DAILY_USAGE_LABEL
		CREATOR_CREDIT_ADDITIONAL_USAGE_LABEL = localizationStringsModule.CREATOR_CREDIT_ADDITIONAL_USAGE_LABEL
		CREATOR_CREDIT_ADDITIONAL_USAGE_DESCRIPTION = localizationStringsModule.CREATOR_CREDIT_ADDITIONAL_USAGE_DESCRIPTION
		CREATOR_CREDIT_SET_DAILY_LIMIT = localizationStringsModule.CREATOR_CREDIT_SET_DAILY_LIMIT
		CREATOR_CREDIT_MANAGE_LIMIT = localizationStringsModule.CREATOR_CREDIT_MANAGE_LIMIT
		CREATOR_CREDIT_SETTINGS_SAVE_ERROR = localizationStringsModule.CREATOR_CREDIT_SETTINGS_SAVE_ERROR
		CREATOR_CREDIT_BUY_ROBUX_BUTTON = localizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_BUTTON
	end
	local var16 = p3.additionalEnabled and p3.dailyLimit ~= nil
	local var16_1 = var16 or p3.additionalEnabled and p3.hasLimitConfigured == true
	local var18 = var16_1 and not var16
	local t = {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center size-full-0 auto-y"
		}, {
			Label = reactModule.createElement(text, {
				LayoutOrder = 1,
				testId = "creator-credit-page-additional-usage-label",
				Text = if p3.additionalEnabled then CREATOR_CREDIT_ADDITIONAL_DAILY_USAGE_LABEL else CREATOR_CREDIT_ADDITIONAL_USAGE_LABEL,
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
				onActivated = function(p4) --[[ line: 253 ]]
					-- upvalues: p3 (ref)
					if not p3.settingsDisabled then
						p3.onToggleAdditional(p4)
					end
				end
			})
		})
	}
	
	if var16 then
		assert(p3.dailyLimit ~= nil, "dailyLimit must be provided when a numeric limit is configured")
		t.UsageLine = reactModule.createElement(RobuxLine, {
			LayoutOrder = 2,
			kind = "used",
			amount = p3.additionalUsed,
			usedOf = p3.dailyLimit,
			isEnabled = p3.additionalEnabled
		})
	elseif var18 then
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
				text = CREATOR_CREDIT_BUY_ROBUX_BUTTON,
				variant = buttonVariant.Emphasis,
				size = inputSize.Medium,
				onActivated = p3.onOpenBuyRobux or noop,
				isDisabled = p3.onOpenBuyRobux == nil
			}) else nil,
			LimitButton = reactModule.createElement(button, {
				LayoutOrder = 2,
				text = if var16_1 then CREATOR_CREDIT_MANAGE_LIMIT else CREATOR_CREDIT_SET_DAILY_LIMIT,
				variant = buttonVariant.Standard,
				size = inputSize.Medium,
				onActivated = p3.onOpenLimitSheet or noop,
				isDisabled = if p3.settingsDisabled ~= true then p3.onOpenLimitSheet == nil else true,
				testId = if var16_1 then "creator-credit-page-manage-limit" else "creator-credit-page-set-daily-limit"
			})
		})
	else
		t.Description = reactModule.createElement(text, {
			LayoutOrder = 3,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
			Text = CREATOR_CREDIT_ADDITIONAL_USAGE_DESCRIPTION
		})
	end
	if p3.settingsError then
		t.SettingsError = reactModule.createElement(text, {
			LayoutOrder = 4,
			tag = "size-full-0 auto-y text-caption-medium text-wrap text-align-x-left content-system-alert",
			testId = "creator-credit-page-settings-error",
			Text = CREATOR_CREDIT_SETTINGS_SAVE_ERROR
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

return function(p5) --[[ line: 346 | named "CreatorCreditPageView" ]]
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