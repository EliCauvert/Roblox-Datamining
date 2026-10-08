local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local authAnalyticsModule = require(parent.AuthAnalytics)
local loggingProtocolModule = require(parent.LoggingProtocol)
local accountUpgradeFlowModule = require(accountUpgrade.AccountUpgradeFlow)
local accountUpgradeSurfaceModule = require(accountUpgrade.AccountUpgradeSurface)
local eventStreamConstants = authAnalyticsModule.EventStreamConstants
local telemetryConfigs = authAnalyticsModule.TelemetryConfigs
local authButtonClick = authAnalyticsModule.Events.authButtonClick
local authModalShown = authAnalyticsModule.Events.authModalShown
local authPageload = authAnalyticsModule.Events.authPageload
local default = loggingProtocolModule.default
local context = eventStreamConstants.Context
local button = eventStreamConstants.Button
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
		-- upvalues: accountUpgradeFlowModule (ref), authPageload (ref), context (ref), t (ref), telemetryConfigs (ref), default (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			authPageload(context.AccountUpgrade, nil, nil, if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1)
			default:logRobloxTelemetryCounter(telemetryConfigs.AccountUpgradePageMountConfig, 1, { errorCode = nil, flow = p1, surface = p2 })
			
			return
		end
	end,
	reportCloseButtonClicked = function(p1, p2)
		-- upvalues: accountUpgradeFlowModule (ref), t (ref), authButtonClick (ref), context (ref), button (ref), authModalShown (ref), telemetryConfigs (ref), default (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			local var1 = if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1
			authButtonClick(context.AccountUpgrade, button.DismissCornerX, nil, nil, nil, var1)
			authModalShown(context.AccountUpgradeCloseWarning, nil, nil, var1)
			default:logRobloxTelemetryCounter(telemetryConfigs.AccountUpgradeCloseButtonClickedConfig, 1, { errorCode = nil, flow = p1, surface = p2 })
			
			return
		end
	end,
	reportCloseWarningBack = function(p1, p2)
		-- upvalues: accountUpgradeFlowModule (ref), t (ref), authButtonClick (ref), context (ref), button (ref), telemetryConfigs (ref), default (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			authButtonClick(context.AccountUpgradeCloseWarning, button.Back, nil, nil, nil, if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1)
			default:logRobloxTelemetryCounter(telemetryConfigs.AccountUpgradeCloseWarningBackButtonClickedConfig, 1, { errorCode = nil, flow = p1, surface = p2 })
			
			return
		end
	end,
	reportCloseWarningClose = function(p1, p2)
		-- upvalues: accountUpgradeFlowModule (ref), t (ref), authButtonClick (ref), context (ref), button (ref), telemetryConfigs (ref), default (ref)
		if p1 == accountUpgradeFlowModule.OAuth then
			authButtonClick(context.AccountUpgradeCloseWarning, button.Close, nil, nil, nil, if p1 == accountUpgradeFlowModule.OAuth then t[p2] else p1)
			default:logRobloxTelemetryCounter(telemetryConfigs.AccountUpgradeCloseWarningCloseButtonClickedConfig, 1, { errorCode = nil, flow = p1, surface = p2 })
			
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