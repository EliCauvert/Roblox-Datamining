local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local MessageFtuxTooltipVariantModule = require(script.Parent.MessageFtuxTooltipVariant)
local MessageFtuxTooltipDismissSignalModule = require(script.Parent.MessageFtuxTooltipDismissSignal)
local UseMessageFtuxTooltipConfigModule = require(script.Parent.useMessageFtuxTooltipConfig)
local ChatConversationTelemetryEventsModule = require(AppChat.Components.ChatConversation.ChatConversationTelemetryEvents)
local ChatConversationTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local FFlagAppChatUseSwipeForRepliesModule = require(AppChat.Flags.FFlagAppChatUseSwipeForReplies)

return function(TooltipVariant)
	-- upvalues: MessageFtuxTooltipVariantModule (copy), UseMessageFtuxTooltipConfigModule (copy), UseTelemetryModule (copy), ChatConversationTelemetryLayerModule (copy), UseLocalUserIdFunction (copy), ReactModule (copy), ChatConversationTelemetryEventsModule (copy), FFlagAppChatUseSwipeForRepliesModule (copy), AppStorageService (copy), HttpService (copy), MessageFtuxTooltipDismissSignalModule (copy), UseLocalizationFunction (copy)
	if TooltipVariant == MessageFtuxTooltipVariantModule.None then
		return {
			text = "",
			isDismissed = true,
			handleDismiss = function() end
		}
	else
		local UseMessageFtuxTooltipConfigModuleResult = UseMessageFtuxTooltipConfigModule(TooltipVariant)
		local UseTelemetryModuleResult = UseTelemetryModule(ChatConversationTelemetryLayerModule.Context)
		local UseLocalUserIdResult = UseLocalUserIdFunction() or ""
		local UseStateResult, UseStateResult2 = ReactModule.useState(true)
		local UseRefResult = ReactModule.useRef({})
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), TooltipVariant (copy)
			UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationMessageFtuxTooltipImpression, { tooltipVariant = TooltipVariant })
		end, { TooltipVariant, UseTelemetryModuleResult })
		local UseResult1 = ReactModule.useCallback(function()
			-- upvalues: UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), TooltipVariant (copy)
			UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationMessageFtuxTooltipDismissed, { tooltipVariant = TooltipVariant })
		end, { TooltipVariant, UseTelemetryModuleResult })
		local UseResult2 = ReactModule.useCallback(function()
			-- upvalues: UseStateResult (copy), UseResult1 (copy), UseRefResult (copy), UseLocalUserIdResult (copy), FFlagAppChatUseSwipeForRepliesModule (upval), UseMessageFtuxTooltipConfigModuleResult (copy), AppStorageService (upval), HttpService (upval), UseStateResult2 (copy)
			if not UseStateResult then
				UseResult1()
				UseRefResult.current[UseLocalUserIdResult] = not FFlagAppChatUseSwipeForRepliesModule or UseMessageFtuxTooltipConfigModuleResult.textKey
				local Success, _ = pcall(function()
					-- upvalues: AppStorageService (upval), UseMessageFtuxTooltipConfigModuleResult (upval), HttpService (upval), UseRefResult (upval)
					AppStorageService:SetItem(UseMessageFtuxTooltipConfigModuleResult.storageKey, HttpService:JSONEncode(UseRefResult.current))
					AppStorageService:Flush()
				end)
				UseStateResult2(Success)
				
				return
			end
		end, {
			UseMessageFtuxTooltipConfigModuleResult.storageKey,
			UseLocalUserIdResult,
			UseStateResult
		})
		ReactModule.useEffect(function()
			-- upvalues: AppStorageService (upval), UseMessageFtuxTooltipConfigModuleResult (copy), HttpService (upval), UseRefResult (copy), FFlagAppChatUseSwipeForRepliesModule (upval), UseLocalUserIdResult (copy), UseStateResult2 (copy), UseResult (copy)
			local Success, Result = pcall(function()
				-- upvalues: AppStorageService (upval), UseMessageFtuxTooltipConfigModuleResult (upval), HttpService (upval)
				return HttpService:JSONDecode((AppStorageService:GetItem(UseMessageFtuxTooltipConfigModuleResult.storageKey)))
			end)
			UseRefResult.current = if Success then Result else {}
			local IsCurrentEntryMatch = if FFlagAppChatUseSwipeForRepliesModule then UseRefResult.current[UseLocalUserIdResult] == UseMessageFtuxTooltipConfigModuleResult.textKey else UseRefResult.current[UseLocalUserIdResult] or false
			UseStateResult2(IsCurrentEntryMatch)
			
			if not IsCurrentEntryMatch then
				UseResult()
			end
		end, {
			UseMessageFtuxTooltipConfigModuleResult.storageKey,
			UseLocalUserIdResult
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
end