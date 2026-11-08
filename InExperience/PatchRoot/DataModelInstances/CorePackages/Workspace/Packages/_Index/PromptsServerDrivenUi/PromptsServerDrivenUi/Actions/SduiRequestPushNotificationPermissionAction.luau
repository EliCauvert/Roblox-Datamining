local Parent = script:FindFirstAncestor("PromptsServerDrivenUi").Parent
local RequestPushNotificationPermissionFunction = require(Parent.NotificationsUpsell).requestPushNotificationPermission
local Default = require(Parent.LoggingProtocol).default
local SduiErrorType = require(Parent.SduiCoreSystem).SduiErrors.SduiErrorType
local ModalEventConstants = require(Parent.NotificationsUpsell).ModalEventConstants
local PushUpsellEventConfig = require(Parent.NotificationsUpsell).PushUpsellEventConfig
local FFlagPushPermissionRequestOpensAndroidSettings = require(Parent.SharedFlags).FFlagPushPermissionRequestOpensAndroidSettings

local function _(p1)
	return if typeof(p1) == "table" and typeof(p1.openSettingsStatus) == "string" then p1.openSettingsStatus else nil
end

local function logRequestResult(p1, RequestFailed, p2)
	-- upvalues: Default (copy), PushUpsellEventConfig (copy), ModalEventConstants (copy)
	local OpenSettingsStatus = if typeof(p2) == "table" and typeof(p2.openSettingsStatus) == "string" then p2.openSettingsStatus else nil
	
	if OpenSettingsStatus == nil then
		Default:logRobloxTelemetryEvent(PushUpsellEventConfig, {}, {
			[ModalEventConstants.ActionType] = RequestFailed,
			[ModalEventConstants.EntryPoint] = p1
		}, ModalEventConstants.ModalContextSysUpsell)
		
		return
	else
		Default:logRobloxTelemetryEvent(PushUpsellEventConfig, {}, {
			[ModalEventConstants.ActionType] = ModalEventConstants.SettingsOpened,
			[ModalEventConstants.EntryPoint] = p1,
			[ModalEventConstants.SettingsResult] = OpenSettingsStatus
		}, ModalEventConstants.ModalContextSettingsUpsell)
	end
end

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), Default (copy), PushUpsellEventConfig (copy), ModalEventConstants (copy), FFlagPushPermissionRequestOpensAndroidSettings (copy), RequestPushNotificationPermissionFunction (copy), logRequestResult (copy)
	local Source = (p1 and p1.actionParams or {}).source
	
	if Source ~= nil and type(Source) ~= "string" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "RequestPushNotificationPermission",
			message = "Invalid source",
			propName = "source"
		}, p2.appPage)
		
		return
	end
	local Source1 = Source or "SDUI"
	Default:logRobloxTelemetryEvent(PushUpsellEventConfig, {}, {
		[ModalEventConstants.ActionType] = ModalEventConstants.Opened,
		[ModalEventConstants.EntryPoint] = Source1
	}, ModalEventConstants.ModalContextSysUpsell)
	
	if FFlagPushPermissionRequestOpensAndroidSettings then
		RequestPushNotificationPermissionFunction({ allowOpenSettings = true }):andThen(function(Result)
			-- upvalues: logRequestResult (upval), Source1 (copy), ModalEventConstants (upval)
			logRequestResult(Source1, ModalEventConstants.RequestSuccess, Result)
		end, function(p3)
			-- upvalues: logRequestResult (upval), Source1 (copy), ModalEventConstants (upval)
			logRequestResult(Source1, ModalEventConstants.RequestFailed, p3)
		end)
		
		return
	else
		RequestPushNotificationPermissionFunction():andThen(function()
			-- upvalues: Default (upval), PushUpsellEventConfig (upval), ModalEventConstants (upval)
			Default:logRobloxTelemetryEvent(PushUpsellEventConfig, {}, {
				[ModalEventConstants.ActionType] = ModalEventConstants.RequestSuccess
			}, ModalEventConstants.ModalContextSysUpsell)
		end, function()
			-- upvalues: Default (upval), PushUpsellEventConfig (upval), ModalEventConstants (upval)
			Default:logRobloxTelemetryEvent(PushUpsellEventConfig, {}, {
				[ModalEventConstants.ActionType] = ModalEventConstants.RequestFailed
			}, ModalEventConstants.ModalContextSysUpsell)
		end)
	end
end