local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AccountUpgradeFlowModule = require(AccountUpgrade.AccountUpgradeFlow)
local AccountUpgradeSurfaceModule = require(AccountUpgrade.AccountUpgradeSurface)
local FFlagAccountUpgradeOAuthTelemetryModule = require(AccountUpgrade.Flags.FFlagAccountUpgradeOAuthTelemetry)
local UserGender = require(Parent.AuthCommon).Enums.UserGender
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local TelemetryConfigs = AuthAnalyticsModule.TelemetryConfigs
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local AuthFormInteractionFunction = AuthAnalyticsModule.Events.authFormInteraction
local AuthModalShownFunction = AuthAnalyticsModule.Events.authModalShown
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local Default = require(Parent.LoggingProtocol).default
local ActionType = EventStreamConstants.ActionType
local Context = EventStreamConstants.Context
local Button = EventStreamConstants.Button
local Field = EventStreamConstants.Field
local State = EventStreamConstants.State
local config = {
	[AccountUpgradeSurfaceModule.Dialog] = EventStreamConstants.Origin.AccountUpgradeOAuthDialog,
	[AccountUpgradeSurfaceModule.FullPage] = EventStreamConstants.Origin.AccountUpgradeOAuthFullPage
}

local function _(p1, Flow, Surface, ErrorCode) --[[ Line: 44 | Named "logCounter" ]]
	-- upvalues: Default (copy)
	Default:logRobloxTelemetryCounter(p1, 1, { flow = Flow, surface = Surface, errorCode = ErrorCode })
end

return {
	getEventOrigin = function(OAuth, p1) --[[ Line: 37 ]]
		-- upvalues: AccountUpgradeFlowModule (copy), config (copy)
		return if OAuth == AccountUpgradeFlowModule.OAuth then config[p1] else OAuth
	end,
	reportOpened = function(Flow, Surface) --[[ Line: 61 ]]
		-- upvalues: AccountUpgradeFlowModule (copy), FFlagAccountUpgradeOAuthTelemetryModule (copy), AuthPageloadFunction (copy), Context (copy), config (copy), TelemetryConfigs (copy), Default (copy)
		if Flow == AccountUpgradeFlowModule.OAuth then
			AuthPageloadFunction(Context.AccountUpgrade, if FFlagAccountUpgradeOAuthTelemetryModule then Flow else nil, nil, if Flow == AccountUpgradeFlowModule.OAuth then config[Surface] else Flow)
			Default:logRobloxTelemetryCounter(TelemetryConfigs.AccountUpgradePageMountConfig, 1, { errorCode = nil, flow = Flow, surface = Surface })
			
			return
		end
	end,
	reportCloseButtonClicked = function(Flow, Surface) --[[ Line: 71 ]]
		-- upvalues: AccountUpgradeFlowModule (copy), config (copy), FFlagAccountUpgradeOAuthTelemetryModule (copy), AuthButtonClickFunction (copy), Context (copy), Button (copy), AuthModalShownFunction (copy), TelemetryConfigs (copy), Default (copy)
		if Flow == AccountUpgradeFlowModule.OAuth then
			local Entry = if Flow == AccountUpgradeFlowModule.OAuth then config[Surface] else Flow
			local Flow1 = if FFlagAccountUpgradeOAuthTelemetryModule then Flow else nil
			AuthButtonClickFunction(Context.AccountUpgrade, Button.DismissCornerX, Flow1, nil, nil, Entry)
			AuthModalShownFunction(Context.AccountUpgradeCloseWarning, Flow1, nil, Entry)
			Default:logRobloxTelemetryCounter(TelemetryConfigs.AccountUpgradeCloseButtonClickedConfig, 1, { errorCode = nil, flow = Flow, surface = Surface })
			
			return
		end
	end,
	reportCloseWarningBack = function(Flow, Surface) --[[ Line: 82 ]]
		-- upvalues: AccountUpgradeFlowModule (copy), config (copy), FFlagAccountUpgradeOAuthTelemetryModule (copy), AuthButtonClickFunction (copy), Context (copy), Button (copy), TelemetryConfigs (copy), Default (copy)
		if Flow == AccountUpgradeFlowModule.OAuth then
			AuthButtonClickFunction(Context.AccountUpgradeCloseWarning, Button.Back, if FFlagAccountUpgradeOAuthTelemetryModule then Flow else nil, nil, nil, if Flow == AccountUpgradeFlowModule.OAuth then config[Surface] else Flow)
			Default:logRobloxTelemetryCounter(TelemetryConfigs.AccountUpgradeCloseWarningBackButtonClickedConfig, 1, { errorCode = nil, flow = Flow, surface = Surface })
			
			return
		end
	end,
	reportCloseWarningClose = function(Flow, Surface) --[[ Line: 92 ]]
		-- upvalues: AccountUpgradeFlowModule (copy), config (copy), FFlagAccountUpgradeOAuthTelemetryModule (copy), AuthButtonClickFunction (copy), Context (copy), Button (copy), TelemetryConfigs (copy), Default (copy)
		if Flow == AccountUpgradeFlowModule.OAuth then
			AuthButtonClickFunction(Context.AccountUpgradeCloseWarning, Button.Close, if FFlagAccountUpgradeOAuthTelemetryModule then Flow else nil, nil, nil, if Flow == AccountUpgradeFlowModule.OAuth then config[Surface] else Flow)
			Default:logRobloxTelemetryCounter(TelemetryConfigs.AccountUpgradeCloseWarningCloseButtonClickedConfig, 1, { errorCode = nil, flow = Flow, surface = Surface })
			
			return
		end
	end,
	reportBirthdayActivated = function(OAuth, p1) --[[ Line: 102 ]]
		-- upvalues: AccountUpgradeFlowModule (copy), config (copy), AuthFormInteractionFunction (copy), Context (copy), Field (copy), ActionType (copy), State (copy)
		if OAuth == AccountUpgradeFlowModule.OAuth then
			local Entry = if OAuth == AccountUpgradeFlowModule.OAuth then config[p1] else OAuth
			AuthFormInteractionFunction(Context.AccountUpgrade, Field.Birthday, ActionType.Focus, Entry)
			AuthFormInteractionFunction(Context.AccountUpgrade, Field.BirthdayPicker, State.BirthdayPickerOpened, Entry)
			
			return
		end
	end,
	reportBirthdayConfirmed = function(OAuth, p1) --[[ Line: 111 ]]
		-- upvalues: AccountUpgradeFlowModule (copy), AuthButtonClickFunction (copy), Context (copy), Button (copy), config (copy)
		if OAuth == AccountUpgradeFlowModule.OAuth then
			AuthButtonClickFunction(Context.AccountUpgrade, Button.ConfirmBirthday, OAuth, nil, nil, if OAuth == AccountUpgradeFlowModule.OAuth then config[p1] else OAuth)
			
			return
		end
	end,
	reportBirthdayPickerClosed = function(OAuth, p1) --[[ Line: 118 ]]
		-- upvalues: AccountUpgradeFlowModule (copy), AuthFormInteractionFunction (copy), Context (copy), Field (copy), State (copy), config (copy)
		if OAuth == AccountUpgradeFlowModule.OAuth then
			AuthFormInteractionFunction(Context.AccountUpgrade, Field.BirthdayPicker, State.BirthdayPickerClosedWithoutConfirm, if OAuth == AccountUpgradeFlowModule.OAuth then config[p1] else OAuth)
			
			return
		end
	end,
	reportBirthdayPickerAllPicked = function(OAuth, p1) --[[ Line: 130 ]]
		-- upvalues: AccountUpgradeFlowModule (copy), AuthFormInteractionFunction (copy), Context (copy), Field (copy), State (copy), config (copy)
		if OAuth == AccountUpgradeFlowModule.OAuth then
			AuthFormInteractionFunction(Context.AccountUpgrade, Field.BirthdayPicker, State.BirthdayPickerAllPicked, if OAuth == AccountUpgradeFlowModule.OAuth then config[p1] else OAuth)
			
			return
		end
	end,
	reportUsernameFocused = function(OAuth, p1) --[[ Line: 142 ]]
		-- upvalues: AccountUpgradeFlowModule (copy), AuthFormInteractionFunction (copy), Context (copy), Field (copy), ActionType (copy), config (copy)
		if OAuth == AccountUpgradeFlowModule.OAuth then
			AuthFormInteractionFunction(Context.AccountUpgrade, Field.Username, ActionType.Focus, if OAuth == AccountUpgradeFlowModule.OAuth then config[p1] else OAuth)
			
			return
		end
	end,
	reportUsernameSuggestionSelected = function(OAuth, p1, p2) --[[ Line: 149 ]]
		-- upvalues: AccountUpgradeFlowModule (copy), AuthButtonClickFunction (copy), Context (copy), Button (copy), config (copy)
		if OAuth == AccountUpgradeFlowModule.OAuth then
			AuthButtonClickFunction(Context.AccountUpgrade, Button.UsernameSuggestion, p2, nil, nil, if OAuth == AccountUpgradeFlowModule.OAuth then config[p1] else OAuth)
			
			return
		end
	end,
	reportGenderActivated = function(OAuth, p1, Male) --[[ Line: 167 ]]
		-- upvalues: AccountUpgradeFlowModule (copy), UserGender (copy), Button (copy), AuthButtonClickFunction (copy), Context (copy), config (copy)
		if OAuth == AccountUpgradeFlowModule.OAuth then
			AuthButtonClickFunction(Context.AccountUpgrade, if Male == UserGender.Male then Button.GenderMale else Button.GenderFemale, OAuth, nil, nil, if OAuth == AccountUpgradeFlowModule.OAuth then config[p1] else OAuth)
			
			return
		end
	end,
	reportLegalLinkActivated = function(OAuth, p1, p2) --[[ Line: 179 ]]
		-- upvalues: AccountUpgradeFlowModule (copy), Field (copy), AuthFormInteractionFunction (copy), Context (copy), config (copy)
		if OAuth == AccountUpgradeFlowModule.OAuth then
			AuthFormInteractionFunction(Context.AccountUpgrade, if p2 == "terms" then Field.TermsOfService else Field.PrivacyPolicy, OAuth, if OAuth == AccountUpgradeFlowModule.OAuth then config[p1] else OAuth)
			
			return
		end
	end,
	reportSucceeded = function(Flow, Surface) --[[ Line: 191 ]]
		-- upvalues: AccountUpgradeFlowModule (copy), AuthPageloadFunction (copy), Context (copy), State (copy), config (copy), TelemetryConfigs (copy), Default (copy)
		if Flow == AccountUpgradeFlowModule.OAuth then
			AuthPageloadFunction(Context.AccountUpgrade, State.UpgradeSuccess, nil, if Flow == AccountUpgradeFlowModule.OAuth then config[Surface] else Flow)
			Default:logRobloxTelemetryCounter(TelemetryConfigs.AccountUpgradeSuccessConfig, 1, { errorCode = nil, flow = Flow, surface = Surface })
			
			return
		end
	end,
	reportFirstFailure = function(Flow, Surface, p1) --[[ Line: 199 ]]
		-- upvalues: AccountUpgradeFlowModule (copy), AuthPageloadFunction (copy), Context (copy), State (copy), config (copy), TelemetryConfigs (copy), Default (copy)
		if Flow == AccountUpgradeFlowModule.OAuth then
			AuthPageloadFunction(Context.AccountUpgrade, State.UpgradeFailure, nil, if Flow == AccountUpgradeFlowModule.OAuth then config[Surface] else Flow)
			Default:logRobloxTelemetryCounter(TelemetryConfigs.AccountUpgradeFailureConfig, 1, {
				flow = Flow,
				surface = Surface,
				errorCode = if p1 == nil then State.Unknown else tostring(p1)
			})
			
			return
		end
	end
}