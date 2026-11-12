local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local Parent = VirtualEvents.Parent
local ReactModule = require(Parent.React)
local Default = require(Parent.LoggingProtocol).default
local NotificationsUpsellModule = require(Parent.NotificationsUpsell)
local PermissionsProtocol = require(Parent.PermissionsProtocol).PermissionsProtocol
local MouseIconOverrideService = require(Parent.CoreScriptsCommon).MouseIconOverrideService
local UseScreenSizeFunction = require(Parent.CoreScriptsRoactCommon).useScreenSize
local FetchInGameRsvpPushUpsellModule = require(VirtualEvents.Common.fetchInGameRsvpPushUpsell)
local _ = require(VirtualEvents.Common.InGameRsvpPushUpsellTypes)
local _ = require(script.Parent.PushUpsellPromptView)
local ModalEventConstants = NotificationsUpsellModule.ModalEventConstants
local PushUpsellEventConfig = NotificationsUpsellModule.PushUpsellEventConfig
local RequestPushNotificationPermissionFunction = NotificationsUpsellModule.requestPushNotificationPermission
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: UseScreenSizeFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), ModalEventConstants (copy), Default (copy), PushUpsellEventConfig (copy), MouseIconOverrideService (copy), FetchInGameRsvpPushUpsellModule (copy), PermissionsProtocol (copy), RequestPushNotificationPermissionFunction (copy)
	local PromptData = p1.promptData
	local ClosePromptFunction = p1.closePrompt
	local IsSettings = PromptData.path == "Settings"
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseLocalizationResult = UseLocalizationFunction({ notNowButton = "Feature.VirtualEvents.NotNowButton" })
	local UseResult = ReactModule.useCallback(function(Tbl, p2)
		-- upvalues: ModalEventConstants (upval), PromptData (copy), Default (upval), PushUpsellEventConfig (upval)
		local Copy = table.clone(Tbl)
		Copy[ModalEventConstants.EntryPoint] = ModalEventConstants.EntryPointInGameRsvp
		Copy[ModalEventConstants.UniverseId] = tostring(game.GameId)
		Copy[ModalEventConstants.EventId] = PromptData.eventId
		Default:logRobloxTelemetryEvent(PushUpsellEventConfig, {}, Copy, p2)
	end, { PromptData.eventId })
	ReactModule.useEffect(function()
		-- upvalues: MouseIconOverrideService (upval)
		MouseIconOverrideService.push("PushUpsellPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow)
		
		return function()
			-- upvalues: MouseIconOverrideService (upval)
			MouseIconOverrideService.pop("PushUpsellPromptOverride")
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: FetchInGameRsvpPushUpsellModule (upval), PromptData (copy), UseResult (copy), ModalEventConstants (upval)
		FetchInGameRsvpPushUpsellModule.reportImpression(PromptData.promptType)
		UseResult({
			[ModalEventConstants.ActionType] = ModalEventConstants.Opened
		}, ModalEventConstants.ModalContextPushEduUpsell)
	end, {})
	local Translations = PromptData.translations
	
	return {
		title = Translations.title,
		bodyText = Translations.body,
		confirmText = Translations.confirm,
		cancelText = Translations.cancel or UseLocalizationResult.notNowButton,
		screenSize = UseScreenSizeResult,
		onConfirm = ReactModule.useCallback(function()
			-- upvalues: ClosePromptFunction (copy), UseResult (copy), ModalEventConstants (upval), IsSettings (copy), PermissionsProtocol (upval), RequestPushNotificationPermissionFunction (upval)
			ClosePromptFunction()
			UseResult({
				[ModalEventConstants.ActionType] = ModalEventConstants.Clicked,
				[ModalEventConstants.Button] = ModalEventConstants.Confirm
			}, ModalEventConstants.ModalContextPushEduUpsell)
			
			if IsSettings then
				PermissionsProtocol.default:openNotificationSettings():andThen(function(Result)
					-- upvalues: UseResult (upval), ModalEventConstants (upval), PermissionsProtocol (upval)
					local Status = if typeof(Result) == "table" then Result.status else nil
					UseResult({
						[ModalEventConstants.ActionType] = ModalEventConstants.SettingsOpened,
						[ModalEventConstants.SettingsResult] = if typeof(Status) == "string" then Status else PermissionsProtocol.OpenSettingsStatus.FAILED
					}, ModalEventConstants.ModalContextSettingsUpsell)
				end, function()
					-- upvalues: UseResult (upval), ModalEventConstants (upval), PermissionsProtocol (upval)
					UseResult({
						[ModalEventConstants.ActionType] = ModalEventConstants.SettingsOpened,
						[ModalEventConstants.SettingsResult] = PermissionsProtocol.OpenSettingsStatus.FAILED
					}, ModalEventConstants.ModalContextSettingsUpsell)
				end)
				
				return
			else
				local function logRequestResult(RequestFailed, p2)
					-- upvalues: UseResult (upval), ModalEventConstants (upval)
					local OpenSettingsStatus = if typeof(p2) == "table" then p2.openSettingsStatus else nil
					
					if typeof(OpenSettingsStatus) == "string" then
						UseResult({
							[ModalEventConstants.ActionType] = ModalEventConstants.SettingsOpened,
							[ModalEventConstants.SettingsResult] = OpenSettingsStatus
						}, ModalEventConstants.ModalContextSettingsUpsell)
						
						return
					else
						UseResult({ [ModalEventConstants.ActionType] = RequestFailed }, ModalEventConstants.ModalContextSysUpsell)
					end
				end
				
				UseResult({
					[ModalEventConstants.ActionType] = ModalEventConstants.Opened
				}, ModalEventConstants.ModalContextSysUpsell)
				RequestPushNotificationPermissionFunction({ allowOpenSettings = true }):andThen(function(Result)
					-- upvalues: logRequestResult (copy), ModalEventConstants (upval)
					logRequestResult(ModalEventConstants.RequestSuccess, Result)
				end, function(p2)
					-- upvalues: logRequestResult (copy), ModalEventConstants (upval)
					logRequestResult(ModalEventConstants.RequestFailed, p2)
				end)
			end
		end, { ClosePromptFunction, UseResult, IsSettings }),
		onCancel = ReactModule.useCallback(function()
			-- upvalues: ClosePromptFunction (copy), FetchInGameRsvpPushUpsellModule (upval), PromptData (copy), UseResult (copy), ModalEventConstants (upval)
			ClosePromptFunction()
			FetchInGameRsvpPushUpsellModule.reportDismiss(PromptData.promptType)
			UseResult({
				[ModalEventConstants.ActionType] = ModalEventConstants.Clicked,
				[ModalEventConstants.Button] = ModalEventConstants.Cancel
			}, ModalEventConstants.ModalContextPushEduUpsell)
		end, { ClosePromptFunction, UseResult, PromptData.promptType })
	}
end