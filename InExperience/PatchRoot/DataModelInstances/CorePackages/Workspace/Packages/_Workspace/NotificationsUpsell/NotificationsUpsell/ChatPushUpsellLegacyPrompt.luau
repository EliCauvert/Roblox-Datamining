local Parent = script.Parent.Parent
local Default = require(Parent.LoggingProtocol).default
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsModule = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal
local ModalEventConstantsModule = require(script.Parent.Analytics.ModalEventConstants)
local PushUpsellEventNameModule = require(script.Parent.Analytics.RobloxTelemetryConfigs.PushUpsellEventName)
local NotificationsUpsellConstantsModule = require(script.Parent.NotificationsUpsellConstants)
local SetupPushNotificationsUpsellModule = require(script.Parent.setupPushNotificationsUpsell)
local config = {
	[ModalEventConstantsModule.EntryPoint] = ModalEventConstantsModule.EntryPointChat,
	[ModalEventConstantsModule.Variant] = ModalEventConstantsModule.VariantLegacy
}
local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(false)
local SessionScopedSignal1, SessionScopedSignal2_1 = CreateSessionScopedSignalFunction(false)

local function _()
	-- upvalues: NotificationsUpsellConstantsModule (copy), SetupPushNotificationsUpsellModule (copy), Default (copy), PushUpsellEventNameModule (copy), ModalEventConstantsModule (copy), config (copy)
	local PushUpsellChat = NotificationsUpsellConstantsModule.ModalKey.PushUpsellChat
	SetupPushNotificationsUpsellModule.ShouldShowUpsell(PushUpsellChat):andThen(function(Result)
		-- upvalues: Default (upval), PushUpsellEventNameModule (upval), ModalEventConstantsModule (upval), SetupPushNotificationsUpsellModule (upval), PushUpsellChat (copy), config (upval)
		if Result then
			Default:logRobloxTelemetryEvent(PushUpsellEventNameModule, {}, {
				[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.ShouldRequest,
				[ModalEventConstantsModule.EntryPoint] = ModalEventConstantsModule.EntryPointChat,
				[ModalEventConstantsModule.Variant] = ModalEventConstantsModule.VariantLegacy
			}, ModalEventConstantsModule.ModalContextPushEduUpsell)
			SetupPushNotificationsUpsellModule.OpenModal(PushUpsellChat, true, ModalEventConstantsModule.EntryPointChat, config)
			
			return
		end
	end)
end

return {
	handlePromptsResponse = function(p1)
		-- upvalues: SessionScopedSignal (copy), SharedFlagsModule (copy), SessionScopedSignal2 (copy), SessionScopedSignal2_1 (copy)
		if SessionScopedSignal(false) or type(p1) ~= "table" then return end
		local CustomPrompts = p1.custom_prompts
		
		if type(CustomPrompts) == "table" and CustomPrompts[SharedFlagsModule.FStringChatPushUpsellLegacyCustomPromptName] ~= nil then
			SessionScopedSignal2(true)
			SessionScopedSignal2_1(true)
			
			return
		end
	end,
	useOpenPendingLegacyUpsell = function()
		-- upvalues: ReactModule (copy), SignalsModule (copy), SessionScopedSignal1 (copy), SessionScopedSignal2_1 (copy), NotificationsUpsellConstantsModule (copy), SetupPushNotificationsUpsellModule (copy), Default (copy), PushUpsellEventNameModule (copy), ModalEventConstantsModule (copy), config (copy)
		ReactModule.useEffect(function()
			-- upvalues: SignalsModule (upval), SessionScopedSignal1 (upval), SessionScopedSignal2_1 (upval), NotificationsUpsellConstantsModule (upval), SetupPushNotificationsUpsellModule (upval), Default (upval), PushUpsellEventNameModule (upval), ModalEventConstantsModule (upval), config (upval)
			return SignalsModule.createEffect(function(p1)
				-- upvalues: SessionScopedSignal1 (upval), SessionScopedSignal2_1 (upval), NotificationsUpsellConstantsModule (upval), SetupPushNotificationsUpsellModule (upval), Default (upval), PushUpsellEventNameModule (upval), ModalEventConstantsModule (upval), config (upval)
				if SessionScopedSignal1(p1) then
					SessionScopedSignal2_1(false)
					local PushUpsellChat = NotificationsUpsellConstantsModule.ModalKey.PushUpsellChat
					SetupPushNotificationsUpsellModule.ShouldShowUpsell(PushUpsellChat):andThen(function(Result)
						-- upvalues: Default (upval), PushUpsellEventNameModule (upval), ModalEventConstantsModule (upval), SetupPushNotificationsUpsellModule (upval), PushUpsellChat (copy), config (upval)
						if Result then
							Default:logRobloxTelemetryEvent(PushUpsellEventNameModule, {}, {
								[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.ShouldRequest,
								[ModalEventConstantsModule.EntryPoint] = ModalEventConstantsModule.EntryPointChat,
								[ModalEventConstantsModule.Variant] = ModalEventConstantsModule.VariantLegacy
							}, ModalEventConstantsModule.ModalContextPushEduUpsell)
							SetupPushNotificationsUpsellModule.OpenModal(PushUpsellChat, true, ModalEventConstantsModule.EntryPointChat, config)
							
							return
						end
					end)
				end
			end)
		end, {})
	end
}