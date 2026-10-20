local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local _ = require(script.Parent.MessageFtuxTooltipVariant)
local MessageFtuxTooltipDismissSignalModule = require(script.Parent.MessageFtuxTooltipDismissSignal)
local UseMessageFtuxTooltipConfigModule = require(script.Parent.useMessageFtuxTooltipConfig)
local ChatConversationTelemetryEventsModule = require(AppChat.Components.ChatConversation.ChatConversationTelemetryEvents)
local ChatConversationTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local config = {
	GetItem = function(_, Key)
		-- upvalues: AppStorageService (copy)
		return AppStorageService:GetItem(Key)
	end,
	SetItem = function(_, Key, Json)
		-- upvalues: AppStorageService (copy)
		AppStorageService:SetItem(Key, Json)
	end,
	Flush = function()
		-- upvalues: AppStorageService (copy)
		AppStorageService:Flush()
	end
}

return function(TooltipVariant, p1)
	-- upvalues: config (copy), UseMessageFtuxTooltipConfigModule (copy), UseTelemetryModule (copy), ChatConversationTelemetryLayerModule (copy), ReactModule (copy), UseLocalUserIdFunction (copy), ChatConversationTelemetryEventsModule (copy), HttpService (copy), MessageFtuxTooltipDismissSignalModule (copy), UseLocalizationFunction (copy)
	local P6 = p1 or config
	local UseMessageFtuxTooltipConfigModuleResult = UseMessageFtuxTooltipConfigModule(TooltipVariant)
	local UseTelemetryModuleResult = UseTelemetryModule(ChatConversationTelemetryLayerModule.Context)
	local UseRefResult = ReactModule.useRef(UseTelemetryModuleResult)
	UseRefResult.current = UseTelemetryModuleResult
	local UseLocalUserIdResult = UseLocalUserIdFunction() or ""
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseRefResult1 = ReactModule.useRef({})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), ChatConversationTelemetryEventsModule (upval), TooltipVariant (copy)
		UseRefResult.current.emit(ChatConversationTelemetryEventsModule.ConversationMessageFtuxTooltipImpression, { tooltipVariant = TooltipVariant })
	end, { TooltipVariant })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), ChatConversationTelemetryEventsModule (upval), TooltipVariant (copy)
		UseRefResult.current.emit(ChatConversationTelemetryEventsModule.ConversationMessageFtuxTooltipDismissed, { tooltipVariant = TooltipVariant })
	end, { TooltipVariant })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), UseResult1 (copy), UseRefResult1 (copy), UseLocalUserIdResult (copy), UseMessageFtuxTooltipConfigModuleResult (copy), P6 (copy), HttpService (upval), UseStateResult2 (copy)
		if not UseStateResult then
			UseResult1()
			UseRefResult1.current[UseLocalUserIdResult] = UseMessageFtuxTooltipConfigModuleResult.textKey
			local Success, _ = pcall(function()
				-- upvalues: P6 (upval), UseMessageFtuxTooltipConfigModuleResult (upval), HttpService (upval), UseRefResult1 (upval)
				P6:SetItem(UseMessageFtuxTooltipConfigModuleResult.storageKey, HttpService:JSONEncode(UseRefResult1.current))
				P6:Flush()
			end)
			UseStateResult2(Success)
			
			return
		end
	end, {
		UseMessageFtuxTooltipConfigModuleResult.storageKey,
		UseMessageFtuxTooltipConfigModuleResult.textKey, UseLocalUserIdResult,
		UseStateResult, P6, UseResult1
	})
	ReactModule.useEffect(function()
		-- upvalues: P6 (copy), UseMessageFtuxTooltipConfigModuleResult (copy), HttpService (upval), UseRefResult1 (copy), UseLocalUserIdResult (copy), UseStateResult2 (copy), UseResult (copy)
		local Success, Result = pcall(function()
			-- upvalues: P6 (upval), UseMessageFtuxTooltipConfigModuleResult (upval), HttpService (upval)
			return HttpService:JSONDecode((P6:GetItem(UseMessageFtuxTooltipConfigModuleResult.storageKey)))
		end)
		UseRefResult1.current = if Success then Result else {}
		local IsCurrentEntryMatch = UseRefResult1.current[UseLocalUserIdResult] == UseMessageFtuxTooltipConfigModuleResult.textKey
		UseStateResult2(IsCurrentEntryMatch)
		
		if not IsCurrentEntryMatch then
			UseResult()
		end
	end, {
		UseMessageFtuxTooltipConfigModuleResult.storageKey,
		UseMessageFtuxTooltipConfigModuleResult.textKey,
		UseLocalUserIdResult,
		P6,
		UseResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), MessageFtuxTooltipDismissSignalModule (upval), TooltipVariant (copy), UseResult2 (copy)
		if UseStateResult then return end
		local DismissedConnection = MessageFtuxTooltipDismissSignalModule.dismissed:connect(function(TooltipVariant1)
			-- upvalues: TooltipVariant (upval), UseResult2 (upval)
			if TooltipVariant1 == TooltipVariant then
				UseResult2()
			end
		end)
		
		return function()
			-- upvalues: DismissedConnection (copy)
			DismissedConnection:disconnect()
		end
	end, { TooltipVariant, UseResult2, UseStateResult })
	local UseLocalizationResult = UseLocalizationFunction({
		tooltipText = UseMessageFtuxTooltipConfigModuleResult.textKey
	})
	
	return ReactModule.useMemo(function()
		-- upvalues: UseLocalizationResult (copy), UseStateResult (copy), UseResult2 (copy)
		return {
			text = UseLocalizationResult.tooltipText,
			isDismissed = UseStateResult,
			handleDismiss = UseResult2
		}
	end, {
		UseLocalizationResult.tooltipText,
		UseStateResult,
		UseResult2
	})
end