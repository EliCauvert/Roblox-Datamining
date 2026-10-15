local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local authAnalyticsModule = require(parent.AuthAnalytics)
local authCommonModule = require(parent.AuthCommon)
local loggingProtocolModule = require(parent.LoggingProtocol)
local accountUpgradeFlowModule = require(accountUpgrade.AccountUpgradeFlow)
local accountUpgradeSurfaceModule = require(accountUpgrade.AccountUpgradeSurface)
local fFlagAccountUpgradeOAuthTelemetryModule = require(accountUpgrade.Flags.FFlagAccountUpgradeOAuthTelemetry)
local userGender = authCommonModule.Enums.UserGender
local eventStreamConstants = authAnalyticsModule.EventStreamConstants
local telemetryConfigs = authAnalyticsModule.TelemetryConfigs
local authButtonClick = authAnalyticsModule.Events.authButtonClick
local authFormInteraction = authAnalyticsModule.Events.authFormInteraction
local authModalShown = authAnalyticsModule.Events.authModalShown
local authPageload = authAnalyticsModule.Events.authPageload
local default = loggingProtocolModule.default
local actionType = eventStreamConstants.ActionType
local context = eventStreamConstants.Context
local button = eventStreamConstants.Button
local field = eventStreamConstants.Field
local state = eventStreamConstants.State
local t = {
	[accountUpgradeSurfaceModule.Dialog] = eventStreamConstants.Origin.AccountUpgradeOAuthDialog,
	[accountUpgradeSurfaceModule.FullPage] = eventStreamConstants.Origin.AccountUpgradeOAuthFullPage
}

local function _(p1, p2, p3, p4)
	-- upvalues: default (ref)
	default:logRobloxTelemetryCounter(p1, 1, { flow = p2, surface = p3, errorCode = p4 })
end

return {
	getEventOrigin = function(p1, p2)
		-- upvalues: accountUpgradeFlowModule (ref), t (ref)
		return if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1
	end,
	reportOpened = function(p1, p2)
		-- upvalues: accountUpgradeFlowModule (ref), fFlagAccountUpgradeOAuthTelemetryModule (ref), authPageload (ref), context (ref), t (ref), telemetryConfigs (ref), default (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			authPageload(context.AccountUpgrade, if fFlagAccountUpgradeOAuthTelemetryModule then p1 else nil, nil, if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1)
			default:logRobloxTelemetryCounter(telemetryConfigs.AccountUpgradePageMountConfig, 1, { errorCode = nil, flow = p1, surface = p2 })
			
			return
		end
	end,
	reportCloseButtonClicked = function(p1, p2)
		-- upvalues: accountUpgradeFlowModule (ref), t (ref), fFlagAccountUpgradeOAuthTelemetryModule (ref), authButtonClick (ref), context (ref), button (ref), authModalShown (ref), telemetryConfigs (ref), default (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			local var1 = if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1
			local var2 = if fFlagAccountUpgradeOAuthTelemetryModule then p1 else nil
			authButtonClick(context.AccountUpgrade, button.DismissCornerX, var2, nil, nil, var1)
			authModalShown(context.AccountUpgradeCloseWarning, var2, nil, var1)
			default:logRobloxTelemetryCounter(telemetryConfigs.AccountUpgradeCloseButtonClickedConfig, 1, { errorCode = nil, flow = p1, surface = p2 })
			
			return
		end
	end,
	reportCloseWarningBack = function(p1, p2)
		-- upvalues: accountUpgradeFlowModule (ref), t (ref), fFlagAccountUpgradeOAuthTelemetryModule (ref), authButtonClick (ref), context (ref), button (ref), telemetryConfigs (ref), default (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			authButtonClick(context.AccountUpgradeCloseWarning, button.Back, if fFlagAccountUpgradeOAuthTelemetryModule then p1 else nil, nil, nil, if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1)
			default:logRobloxTelemetryCounter(telemetryConfigs.AccountUpgradeCloseWarningBackButtonClickedConfig, 1, { errorCode = nil, flow = p1, surface = p2 })
			
			return
		end
	end,
	reportCloseWarningClose = function(p1, p2)
		-- upvalues: accountUpgradeFlowModule (ref), t (ref), fFlagAccountUpgradeOAuthTelemetryModule (ref), authButtonClick (ref), context (ref), button (ref), telemetryConfigs (ref), default (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			authButtonClick(context.AccountUpgradeCloseWarning, button.Close, if fFlagAccountUpgradeOAuthTelemetryModule then p1 else nil, nil, nil, if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1)
			default:logRobloxTelemetryCounter(telemetryConfigs.AccountUpgradeCloseWarningCloseButtonClickedConfig, 1, { errorCode = nil, flow = p1, surface = p2 })
			
			return
		end
	end,
	reportBirthdayActivated = function(p1, p2)
		-- upvalues: accountUpgradeFlowModule (ref), t (ref), authFormInteraction (ref), context (ref), field (ref), actionType (ref), state (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			local var1 = if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1
			authFormInteraction(context.AccountUpgrade, field.Birthday, actionType.Focus, var1)
			authFormInteraction(context.AccountUpgrade, field.BirthdayPicker, state.BirthdayPickerOpened, var1)
			
			return
		end
	end,
	reportBirthdayConfirmed = function(p1, p2)
		-- upvalues: accountUpgradeFlowModule (ref), authButtonClick (ref), context (ref), button (ref), t (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			authButtonClick(context.AccountUpgrade, button.ConfirmBirthday, p1, nil, nil, if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1)
			
			return
		end
	end,
	reportBirthdayPickerClosed = function(p1, p2)
		-- upvalues: accountUpgradeFlowModule (ref), authFormInteraction (ref), context (ref), field (ref), state (ref), t (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			authFormInteraction(context.AccountUpgrade, field.BirthdayPicker, state.BirthdayPickerClosedWithoutConfirm, if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1)
			
			return
		end
	end,
	reportBirthdayPickerAllPicked = function(p1, p2)
		-- upvalues: accountUpgradeFlowModule (ref), authFormInteraction (ref), context (ref), field (ref), state (ref), t (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			authFormInteraction(context.AccountUpgrade, field.BirthdayPicker, state.BirthdayPickerAllPicked, if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1)
			
			return
		end
	end,
	reportUsernameFocused = function(p1, p2)
		-- upvalues: accountUpgradeFlowModule (ref), authFormInteraction (ref), context (ref), field (ref), actionType (ref), t (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			authFormInteraction(context.AccountUpgrade, field.Username, actionType.Focus, if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1)
			
			return
		end
	end,
	reportUsernameSuggestionSelected = function(p1, p2, p3)
		-- upvalues: accountUpgradeFlowModule (ref), authButtonClick (ref), context (ref), button (ref), t (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			authButtonClick(context.AccountUpgrade, button.UsernameSuggestion, p3, nil, nil, if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1)
			
			return
		end
	end,
	reportGenderActivated = function(p1, p2, p3)
		-- upvalues: accountUpgradeFlowModule (ref), userGender (ref), button (ref), authButtonClick (ref), context (ref), t (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			authButtonClick(context.AccountUpgrade, if p3 == userGender.Male then button.GenderMale else button.GenderFemale, p1, nil, nil, if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1)
			
			return
		end
	end,
	reportLegalLinkActivated = function(p1, p2, p3)
		-- upvalues: accountUpgradeFlowModule (ref), field (ref), authFormInteraction (ref), context (ref), t (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			authFormInteraction(context.AccountUpgrade, if p3 == "terms" then field.TermsOfService else field.PrivacyPolicy, p1, if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1)
			
			return
		end
	end,
	reportSucceeded = function(p1, p2)
		-- upvalues: accountUpgradeFlowModule (ref), authPageload (ref), context (ref), state (ref), t (ref), telemetryConfigs (ref), default (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			authPageload(context.AccountUpgrade, state.UpgradeSuccess, nil, if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1)
			default:logRobloxTelemetryCounter(telemetryConfigs.AccountUpgradeSuccessConfig, 1, { errorCode = nil, flow = p1, surface = p2 })
			
			return
		end
	end,
	reportFirstFailure = function(p1, p2, p3)
		-- upvalues: accountUpgradeFlowModule (ref), authPageload (ref), context (ref), state (ref), t (ref), telemetryConfigs (ref), default (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			authPageload(context.AccountUpgrade, state.UpgradeFailure, nil, if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1)
			default:logRobloxTelemetryCounter(telemetryConfigs.AccountUpgradeFailureConfig, 1, {
				flow = p1,
				surface = p2,
				errorCode = if p3 ~= nil then state.Unknown else tostring(p3)
			})
			
			return
		end
	end
}