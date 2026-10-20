local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationService = game:GetService("LocalizationService")
local FoundationModule = require(Parent.Foundation)
local NumberLocalization = require(Parent.Localization).NumberLocalization
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperienceFreeTrialResetPeriodModule = require(BuildExperience.Flags.FFlagBuildExperienceFreeTrialResetPeriod)
local Button = FoundationModule.Button
local Icon = FoundationModule.Icon
local Progress = FoundationModule.Progress
local Text = FoundationModule.Text
local Toggle = FoundationModule.Toggle
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local ProgressShape = FoundationModule.Enums.ProgressShape
local ProgressSize = FoundationModule.Enums.ProgressSize

local function noop() end

local function _(p1: number): number
	return if p1 < 0 then 0 elseif p1 > 100 then 100 else p1
end

local _ = function(Value: number)
	-- upvalues: NumberLocalization (copy), LocalizationService (copy)
	return NumberLocalization.localize(string.format("%.0f", (math.floor(Value))), LocalizationService.RobloxLocaleId)
end

local function FreeUsageCard(Frame)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildExperienceFreeTrialResetPeriodModule (copy), ReactModule (copy), View (copy), Text (copy), Progress (copy), ProgressShape (copy), ProgressSize (copy)
	local PctUsed: number = Frame.pctUsed
	local PctUsed1 = if PctUsed < 0 then 0 elseif PctUsed > 100 then 100 else PctUsed
	local UseLocalizationResult = UseLocalizationFunction({
		caption = LocalizationStringsModule.CREATOR_CREDIT_FREE_USAGE_CAPTION,
		captionWeekly = LocalizationStringsModule.CREATOR_CREDIT_FREE_USAGE_CAPTION_WEEKLY,
		captionMonthly = LocalizationStringsModule.CREATOR_CREDIT_FREE_USAGE_CAPTION_MONTHLY,
		label = LocalizationStringsModule.CREATOR_CREDIT_FREE_USAGE_LABEL,
		percentUsed = {
			LocalizationStringsModule.CREATOR_CREDIT_PERCENT_USED,
			PERCENT = math.floor(PctUsed1 + 0.5)
		},
		resetHours = if Frame.resetHours == 1 then LocalizationStringsModule.CREATOR_CREDIT_RESET_ONE_HOUR elseif Frame.resetHours == nil then nil else {
			LocalizationStringsModule.CREATOR_CREDIT_RESET_HOURS,
			HOURS = Frame.resetHours
		}
	})
	local Label = UseLocalizationResult.label
	local PercentUsed = UseLocalizationResult.percentUsed
	local ResetHours = nil
	
	if FFlagBuildExperienceFreeTrialResetPeriodModule then
		local CaptionWeekly = if Frame.resetPeriod == "Weekly" then UseLocalizationResult.captionWeekly elseif Frame.resetPeriod == "Monthly" then UseLocalizationResult.captionMonthly else UseLocalizationResult.caption
		local NoResetPeriod: boolean = Frame.resetPeriod == nil or Frame.resetPeriod == "Daily"
		ResetHours = if NoResetPeriod and math.floor(PctUsed1 + 0.5) > 0 and Frame.resetHours ~= nil then UseLocalizationResult.resetHours else CaptionWeekly
	else
		local Caption = UseLocalizationResult.caption
		ResetHours = if math.floor(PctUsed1 + 0.5) > 0 and Frame.resetHours ~= nil then UseLocalizationResult.resetHours else Caption
	end
	return ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y padding-large radius-large bg-shift-100",
		testId = "creator-credit-page-free-usage-card",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Label = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-align-x-left content-emphasis",
			testId = "creator-credit-page-free-usage-label",
			Text = Label
		}),
		Value = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-heading-small text-align-x-left content-emphasis",
			testId = "creator-credit-page-free-usage-value",
			Text = PercentUsed
		}),
		Bar = ReactModule.createElement(Progress, {
			LayoutOrder = 3,
			testId = "creator-credit-page-daily-progress",
			shape = ProgressShape.Bar,
			size = ProgressSize.Medium,
			value = PctUsed1,
			width = UDim.new(1, 0)
		}),
		Caption = ReactModule.createElement(Text, {
			LayoutOrder = 4,
			tag = "size-full-0 auto-y padding-top-medium text-body-small text-align-x-left content-muted",
			testId = "creator-credit-page-free-usage-reset",
			Text = ResetHours
		})
	})
end

local function RobuxLine(Frame)
	-- upvalues: NumberLocalization (copy), LocalizationService (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy)
	local LocalizeResult = NumberLocalization.localize(string.format("%.0f", (math.floor(Frame.amount))), LocalizationService.RobloxLocaleId)
	local UsedOf: number = Frame.usedOf
	
	if Frame.kind == "used" then
		assert(UsedOf ~= nil, "usedOf required when kind == 'used'")
	end
	local LocalizeResult1 = if UsedOf == nil then "" else NumberLocalization.localize(string.format("%.0f", (math.floor(UsedOf))), LocalizationService.RobloxLocaleId)
	local UseLocalizationResult = UseLocalizationFunction({
		available = if Frame.kind == "available" then {
			LocalizationStringsModule.CREATOR_CREDIT_AMOUNT_AVAILABLE,
			AMOUNT = LocalizeResult
		} else nil,
		used = if Frame.kind == "used" then {
			LocalizationStringsModule.CREATOR_CREDIT_ADDITIONAL_USED,
			USED = LocalizeResult,
			LIMIT = LocalizeResult1
		} elseif Frame.kind == "usedNoLimit" then {
			LocalizationStringsModule.CREATOR_CREDIT_UNLIMITED_USED,
			USED = LocalizeResult
		} else nil
	})
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-xsmall size-full-0 auto-y padding-bottom-medium",
		LayoutOrder = Frame.LayoutOrder
	}, {
		IconEl = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = IconName.Robux,
			size = IconSize.Medium,
			tag = {
				["auto-xy"] = true,
				["content-muted"] = not Frame.isEnabled,
				["content-emphasis"] = Frame.isEnabled
			}
		}),
		Amount = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			testId = "creator-credit-page-robux-line",
			Text = if Frame.kind == "available" then UseLocalizationResult.available else UseLocalizationResult.used,
			tag = {
				["auto-xy text-heading-small"] = true,
				["content-muted"] = not Frame.isEnabled,
				["content-emphasis"] = Frame.isEnabled
			}
		})
	})
end

local function AdditionalUsageCard(Frame)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), View (copy), Text (copy), Toggle (copy), InputSize (copy), RobuxLine (copy), Button (copy), ButtonVariant (copy), noop (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		additionalDailyUsage = LocalizationStringsModule.CREATOR_CREDIT_ADDITIONAL_DAILY_USAGE_LABEL,
		additionalUsage = LocalizationStringsModule.CREATOR_CREDIT_ADDITIONAL_USAGE_LABEL,
		description = LocalizationStringsModule.CREATOR_CREDIT_ADDITIONAL_USAGE_DESCRIPTION,
		setDailyLimit = LocalizationStringsModule.CREATOR_CREDIT_SET_DAILY_LIMIT,
		manageLimit = LocalizationStringsModule.CREATOR_CREDIT_MANAGE_LIMIT,
		settingsSaveError = LocalizationStringsModule.CREATOR_CREDIT_SETTINGS_SAVE_ERROR,
		buyRobux = LocalizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_BUTTON
	})
	local AdditionalDailyUsage = UseLocalizationResult.additionalDailyUsage
	local AdditionalUsage = UseLocalizationResult.additionalUsage
	local Description = UseLocalizationResult.description
	local SetDailyLimit = UseLocalizationResult.setDailyLimit
	local ManageLimit = UseLocalizationResult.manageLimit
	local SettingsSaveError = UseLocalizationResult.settingsSaveError
	local BuyRobux = UseLocalizationResult.buyRobux
	local HasDailyLimit: boolean = Frame.additionalEnabled and Frame.dailyLimit ~= nil
	local HasDailyLimit1: boolean = HasDailyLimit or Frame.additionalEnabled and Frame.hasLimitConfigured == true
	local NoHasDailyLimit: boolean = HasDailyLimit1 and not HasDailyLimit
	local config = {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-y-center size-full-0 auto-y"
		}, {
			Label = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				testId = "creator-credit-page-additional-usage-label",
				Text = if Frame.additionalEnabled then AdditionalDailyUsage else AdditionalUsage,
				tag = {
					["fill auto-y text-title-medium text-align-x-left"] = true,
					["content-default"] = not Frame.additionalEnabled,
					["content-emphasis"] = Frame.additionalEnabled
				}
			}),
			ToggleSwitch = ReactModule.createElement(Toggle, {
				LayoutOrder = 2,
				label = "",
				testId = "creator-credit-page-additional-toggle",
				size = InputSize.Medium,
				isChecked = Frame.additionalEnabled,
				isDisabled = Frame.settingsDisabled == true,
				onActivated = function(p1)
					-- upvalues: Frame (copy)
					if not Frame.settingsDisabled then
						Frame.onToggleAdditional(p1)
					end
				end
			})
		})
	}
	
	if HasDailyLimit then
		assert(Frame.dailyLimit ~= nil, "dailyLimit must be provided when a numeric limit is configured")
		config.UsageLine = ReactModule.createElement(RobuxLine, {
			LayoutOrder = 2,
			kind = "used",
			amount = Frame.additionalUsed,
			usedOf = Frame.dailyLimit,
			isEnabled = Frame.additionalEnabled
		})
	elseif NoHasDailyLimit then
		config.UsageLine = ReactModule.createElement(RobuxLine, {
			LayoutOrder = 2,
			kind = "usedNoLimit",
			amount = Frame.additionalUsed,
			isEnabled = Frame.additionalEnabled
		})
	else
		config.AvailableLine = ReactModule.createElement(RobuxLine, {
			LayoutOrder = 2,
			kind = "available",
			amount = Frame.robuxAvailable,
			isEnabled = Frame.additionalEnabled
		})
	end
	if Frame.additionalEnabled then
		config.ActionsRow = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "row align-x-left align-y-center gap-small size-full-0 auto-y"
		}, {
			BuyRobuxButton = if Frame.showBuyRobux then ReactModule.createElement(Button, {
				LayoutOrder = 1,
				testId = "creator-credit-page-buy-robux",
				text = BuyRobux,
				variant = ButtonVariant.Emphasis,
				size = InputSize.Medium,
				onActivated = Frame.onOpenBuyRobux or noop,
				isDisabled = Frame.onOpenBuyRobux == nil
			}) else nil,
			LimitButton = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				text = if HasDailyLimit1 then ManageLimit else SetDailyLimit,
				variant = ButtonVariant.Standard,
				size = InputSize.Medium,
				onActivated = Frame.onOpenLimitSheet or noop,
				isDisabled = Frame.settingsDisabled == true or Frame.onOpenLimitSheet == nil,
				testId = if HasDailyLimit1 then "creator-credit-page-manage-limit" else "creator-credit-page-set-daily-limit"
			})
		})
	else
		config.Description = ReactModule.createElement(Text, {
			LayoutOrder = 3,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
			Text = Description
		})
	end
	if Frame.settingsError then
		config.SettingsError = ReactModule.createElement(Text, {
			LayoutOrder = 4,
			tag = "size-full-0 auto-y text-caption-medium text-wrap text-align-x-left content-system-alert",
			testId = "creator-credit-page-settings-error",
			Text = SettingsSaveError
		})
	end
	return ReactModule.createElement(View, {
		testId = "creator-credit-page-additional-usage-card",
		LayoutOrder = Frame.LayoutOrder,
		tag = {
			["col gap-small size-full-0 auto-y padding-large radius-large"] = true,
			["bg-shift-100"] = Frame.additionalEnabled,
			["stroke-standard stroke-default"] = not Frame.additionalEnabled
		}
	}, config)
end

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), FreeUsageCard (copy), AdditionalUsageCard (copy)
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y padding-y-xlarge",
		testId = p1.testId or "creator-credit-page"
	}, {
		FreeUsage = ReactModule.createElement(FreeUsageCard, {
			LayoutOrder = 1,
			pctUsed = p1.dailyPctUsed,
			resetHours = p1.resetHours,
			resetPeriod = p1.resetPeriod
		}),
		AdditionalUsage = ReactModule.createElement(AdditionalUsageCard, {
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