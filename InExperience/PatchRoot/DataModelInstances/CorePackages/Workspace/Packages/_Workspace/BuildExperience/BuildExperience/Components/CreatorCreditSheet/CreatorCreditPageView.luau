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

local function noop() end

local function _(value)
	return if value < 0 then 0 elseif value > 100 then 100 else value
end

local _ = function(p1)
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", math.floor(p1)), localizationService.RobloxLocaleId)
end

local function FreeUsageCard(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), text (ref), progress (ref), progressShape (ref), progressSize (ref)
	local CREATOR_CREDIT_FREE_USAGE_LABEL, var1, var2
	local pctUsed = p1.pctUsed
	local var3 = if pctUsed < 0 then 0 elseif pctUsed > 100 then 100 else pctUsed
	local var4 = if fFlagBuildLocalization then useLocalization({
		caption = localizationStringsModule.CREATOR_CREDIT_FREE_USAGE_CAPTION,
		label = localizationStringsModule.CREATOR_CREDIT_FREE_USAGE_LABEL,
		percentUsed = {
			localizationStringsModule.CREATOR_CREDIT_PERCENT_USED,
			PERCENT = math.floor(var3 + 0.5)
		},
		resetHours = if p1.resetHours == 1 then localizationStringsModule.CREATOR_CREDIT_RESET_ONE_HOUR elseif p1.resetHours ~= nil then nil else {
			localizationStringsModule.CREATOR_CREDIT_RESET_HOURS,
			HOURS = p1.resetHours
		}
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		local caption = var4.caption
		CREATOR_CREDIT_FREE_USAGE_LABEL = var4.label
		var1 = var4.percentUsed
		var2 = if math.floor(var3 + 0.5) > 0 and p1.resetHours ~= nil then var4.resetHours else caption
	else
		local CREATOR_CREDIT_FREE_USAGE_CAPTION = localizationStringsModule.CREATOR_CREDIT_FREE_USAGE_CAPTION
		CREATOR_CREDIT_FREE_USAGE_LABEL = localizationStringsModule.CREATOR_CREDIT_FREE_USAGE_LABEL
		var1 = localizationStringsModule.formatCreatorCreditPercentUsed(var3)
		var2 = if math.floor(var3 + 0.5) > 0 and p1.resetHours ~= nil then localizationStringsModule.formatCreatorCreditResetHours(p1.resetHours) else CREATOR_CREDIT_FREE_USAGE_CAPTION
	end
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
			Text = var1
		}),
		Bar = reactModule.createElement(progress, {
			LayoutOrder = 3,
			testId = "creator-credit-page-daily-progress",
			shape = progressShape.Bar,
			size = progressSize.Medium,
			value = var3,
			width = UDim.new(1, 0)
		}),
		Caption = reactModule.createElement(text, {
			LayoutOrder = 4,
			tag = "size-full-0 auto-y padding-top-medium text-body-small text-align-x-left content-muted",
			testId = "creator-credit-page-free-usage-reset",
			Text = var2
		})
	})
end

local function RobuxLine(p1)
	-- upvalues: numberLocalization (ref), localizationService (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local var1 = numberLocalization.localize(string.format("%.0f", math.floor(p1.amount)), localizationService.RobloxLocaleId)
	local usedOf = p1.usedOf
	
	if p1.kind == "used" then
		assert(usedOf ~= nil, "usedOf required when kind == 'used'")
	end
	local var2 = if usedOf ~= nil then "" else numberLocalization.localize(string.format("%.0f", math.floor(usedOf)), localizationService.RobloxLocaleId)
	local var3 = if fFlagBuildLocalization then useLocalization({
		available = if p1.kind == "available" then {
			localizationStringsModule.CREATOR_CREDIT_AMOUNT_AVAILABLE,
			AMOUNT = var1
		} else nil,
		used = if p1.kind == "used" then {
			localizationStringsModule.CREATOR_CREDIT_ADDITIONAL_USED,
			USED = var1,
			LIMIT = var2
		} elseif p1.kind == "usedNoLimit" then {
			localizationStringsModule.CREATOR_CREDIT_UNLIMITED_USED,
			USED = var1
		} else nil
	}) else nil
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-xsmall size-full-0 auto-y padding-bottom-medium",
		LayoutOrder = p1.LayoutOrder
	}, {
		IconEl = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = iconName.Robux,
			size = iconSize.Medium,
			tag = {
				["auto-xy"] = true,
				["content-muted"] = not p1.isEnabled,
				["content-emphasis"] = p1.isEnabled
			}
		}),
		Amount = reactModule.createElement(text, {
			LayoutOrder = 2,
			testId = "creator-credit-page-robux-line",
			Text = if fFlagBuildLocalization then if p1.kind == "available" then var3.available else var3.used elseif p1.kind == "used" then localizationStringsModule.formatCreatorCreditAdditionalUsed(var1, var2) elseif p1.kind == "usedNoLimit" then localizationStringsModule.formatCreatorCreditAdditionalUsedNoLimit(var1) else `{var1} {localizationStringsModule.CREATOR_CREDIT_AVAILABLE_SUFFIX}`,
			tag = {
				["auto-xy text-heading-small"] = true,
				["content-muted"] = not p1.isEnabled,
				["content-emphasis"] = p1.isEnabled
			}
		})
	})
end

local function AdditionalUsageCard(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), text (ref), toggle (ref), inputSize (ref), RobuxLine (ref), button (ref), buttonVariant (ref), noop (ref)
	local CREATOR_CREDIT_ADDITIONAL_DAILY_USAGE_LABEL, CREATOR_CREDIT_ADDITIONAL_USAGE_LABEL, CREATOR_CREDIT_ADDITIONAL_USAGE_DESCRIPTION, CREATOR_CREDIT_SET_DAILY_LIMIT, CREATOR_CREDIT_MANAGE_LIMIT, CREATOR_CREDIT_SETTINGS_SAVE_ERROR, CREATOR_CREDIT_BUY_ROBUX_BUTTON
	local var1 = if fFlagBuildLocalization then useLocalization({
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
		CREATOR_CREDIT_ADDITIONAL_DAILY_USAGE_LABEL = var1.additionalDailyUsage
		CREATOR_CREDIT_ADDITIONAL_USAGE_LABEL = var1.additionalUsage
		CREATOR_CREDIT_ADDITIONAL_USAGE_DESCRIPTION = var1.description
		CREATOR_CREDIT_SET_DAILY_LIMIT = var1.setDailyLimit
		CREATOR_CREDIT_MANAGE_LIMIT = var1.manageLimit
		CREATOR_CREDIT_SETTINGS_SAVE_ERROR = var1.settingsSaveError
		CREATOR_CREDIT_BUY_ROBUX_BUTTON = var1.buyRobux
	else
		CREATOR_CREDIT_ADDITIONAL_DAILY_USAGE_LABEL = localizationStringsModule.CREATOR_CREDIT_ADDITIONAL_DAILY_USAGE_LABEL
		CREATOR_CREDIT_ADDITIONAL_USAGE_LABEL = localizationStringsModule.CREATOR_CREDIT_ADDITIONAL_USAGE_LABEL
		CREATOR_CREDIT_ADDITIONAL_USAGE_DESCRIPTION = localizationStringsModule.CREATOR_CREDIT_ADDITIONAL_USAGE_DESCRIPTION
		CREATOR_CREDIT_SET_DAILY_LIMIT = localizationStringsModule.CREATOR_CREDIT_SET_DAILY_LIMIT
		CREATOR_CREDIT_MANAGE_LIMIT = localizationStringsModule.CREATOR_CREDIT_MANAGE_LIMIT
		CREATOR_CREDIT_SETTINGS_SAVE_ERROR = localizationStringsModule.CREATOR_CREDIT_SETTINGS_SAVE_ERROR
		CREATOR_CREDIT_BUY_ROBUX_BUTTON = localizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_BUTTON
	end
	local var2 = p1.additionalEnabled and p1.dailyLimit ~= nil
	local var3 = var2 or p1.additionalEnabled and p1.hasLimitConfigured == true
	local var4 = var3 and not var2
	local t = {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center size-full-0 auto-y"
		}, {
			Label = reactModule.createElement(text, {
				LayoutOrder = 1,
				testId = "creator-credit-page-additional-usage-label",
				Text = if p1.additionalEnabled then CREATOR_CREDIT_ADDITIONAL_DAILY_USAGE_LABEL else CREATOR_CREDIT_ADDITIONAL_USAGE_LABEL,
				tag = {
					["fill auto-y text-title-medium text-align-x-left"] = true,
					["content-default"] = not p1.additionalEnabled,
					["content-emphasis"] = p1.additionalEnabled
				}
			}),
			ToggleSwitch = reactModule.createElement(toggle, {
				LayoutOrder = 2,
				label = "",
				testId = "creator-credit-page-additional-toggle",
				size = inputSize.Medium,
				isChecked = p1.additionalEnabled,
				isDisabled = p1.settingsDisabled == true,
				onActivated = function(p2)
					-- upvalues: p1 (ref)
					if not p1.settingsDisabled then
						p1.onToggleAdditional(p2)
					end
				end
			})
		})
	}
	
	if var2 then
		assert(p1.dailyLimit ~= nil, "dailyLimit must be provided when a numeric limit is configured")
		t.UsageLine = reactModule.createElement(RobuxLine, {
			LayoutOrder = 2,
			kind = "used",
			amount = p1.additionalUsed,
			usedOf = p1.dailyLimit,
			isEnabled = p1.additionalEnabled
		})
	elseif var4 then
		t.UsageLine = reactModule.createElement(RobuxLine, {
			LayoutOrder = 2,
			kind = "usedNoLimit",
			amount = p1.additionalUsed,
			isEnabled = p1.additionalEnabled
		})
	else
		t.AvailableLine = reactModule.createElement(RobuxLine, {
			LayoutOrder = 2,
			kind = "available",
			amount = p1.robuxAvailable,
			isEnabled = p1.additionalEnabled
		})
	end
	if p1.additionalEnabled then
		t.ActionsRow = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "row align-x-left align-y-center gap-small size-full-0 auto-y"
		}, {
			BuyRobuxButton = if p1.showBuyRobux then reactModule.createElement(button, {
				LayoutOrder = 1,
				testId = "creator-credit-page-buy-robux",
				text = CREATOR_CREDIT_BUY_ROBUX_BUTTON,
				variant = buttonVariant.Emphasis,
				size = inputSize.Medium,
				onActivated = p1.onOpenBuyRobux or noop,
				isDisabled = p1.onOpenBuyRobux == nil
			}) else nil,
			LimitButton = reactModule.createElement(button, {
				LayoutOrder = 2,
				text = if var3 then CREATOR_CREDIT_MANAGE_LIMIT else CREATOR_CREDIT_SET_DAILY_LIMIT,
				variant = buttonVariant.Standard,
				size = inputSize.Medium,
				onActivated = p1.onOpenLimitSheet or noop,
				isDisabled = if p1.settingsDisabled ~= true then p1.onOpenLimitSheet == nil else true,
				testId = if var3 then "creator-credit-page-manage-limit" else "creator-credit-page-set-daily-limit"
			})
		})
	else
		t.Description = reactModule.createElement(text, {
			LayoutOrder = 3,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
			Text = CREATOR_CREDIT_ADDITIONAL_USAGE_DESCRIPTION
		})
	end
	if p1.settingsError then
		t.SettingsError = reactModule.createElement(text, {
			LayoutOrder = 4,
			tag = "size-full-0 auto-y text-caption-medium text-wrap text-align-x-left content-system-alert",
			testId = "creator-credit-page-settings-error",
			Text = CREATOR_CREDIT_SETTINGS_SAVE_ERROR
		})
	end
	return reactModule.createElement(view, {
		testId = "creator-credit-page-additional-usage-card",
		LayoutOrder = p1.LayoutOrder,
		tag = {
			["col gap-small size-full-0 auto-y padding-large radius-large"] = true,
			["bg-shift-100"] = p1.additionalEnabled,
			["stroke-standard stroke-default"] = not p1.additionalEnabled
		}
	}, t)
end

return function(p1)
	-- upvalues: reactModule (ref), view (ref), FreeUsageCard (ref), AdditionalUsageCard (ref)
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-y-xlarge",
		testId = p1.testId or "creator-credit-page"
	}, {
		FreeUsage = reactModule.createElement(FreeUsageCard, {
			LayoutOrder = 1,
			pctUsed = p1.dailyPctUsed,
			resetHours = p1.resetHours
		}),
		AdditionalUsage = reactModule.createElement(AdditionalUsageCard, {
			LayoutOrder = 2,
			additionalEnabled = p1.additionalEnabled,
			dailyLimit = p1.dailyLimit,
			hasLimitConfigured = p1.hasLimitConfigured,
			additionalUsed = p1.additionalUsed,
			robuxAvailable = p1.robuxAvailable,
			settingsDisabled = p1.settingsDisabled,
			settingsError = p1.settingsError,
			showBuyRobux = p1.showBuyRobux,
			onToggleAdditional = p1.onToggleAdditional,
			onOpenLimitSheet = p1.onOpenLimitSheet,
			onOpenBuyRobux = p1.onOpenBuyRobux
		})
	})
end