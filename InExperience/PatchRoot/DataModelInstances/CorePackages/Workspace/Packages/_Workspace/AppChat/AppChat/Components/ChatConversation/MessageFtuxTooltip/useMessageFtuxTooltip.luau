local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local messageFtuxTooltipVariantModule = require(script.Parent.MessageFtuxTooltipVariant)
local messageFtuxTooltipDismissSignalModule = require(script.Parent.MessageFtuxTooltipDismissSignal)
local useMessageFtuxTooltipConfigModule = require(script.Parent.useMessageFtuxTooltipConfig)
local chatConversationTelemetryEventsModule = require(appChat.Components.ChatConversation.ChatConversationTelemetryEvents)
local chatConversationTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local fFlagAppChatUseSwipeForRepliesModule = require(appChat.Flags.FFlagAppChatUseSwipeForReplies)

return function(p0) --[[ line: 27 | named "useMessageFtuxTooltip" ]]
	-- upvalues: messageFtuxTooltipVariantModule (ref), useMessageFtuxTooltipConfigModule (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useLocalUserId (ref), reactModule (ref), chatConversationTelemetryEventsModule (ref), fFlagAppChatUseSwipeForRepliesModule (ref), appStorageService (ref), httpService (ref), messageFtuxTooltipDismissSignalModule (ref), useLocalization (ref)
	if p0 == messageFtuxTooltipVariantModule.None then
		return {
			text = "",
			isDismissed = true,
			handleDismiss = function() --[[ line: 32 ]] end
		}
	end
	local var11 = useMessageFtuxTooltipConfigModule(p0)
	local var12 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var13 = useLocalUserId() or ""
	local var14, var15 = reactModule.useState(true)
	local var16 = reactModule.useRef({})
	local var17 = reactModule.useCallback(function() --[[ line: 42 ]]
		-- upvalues: var12 (ref), chatConversationTelemetryEventsModule (copy), p0 (ref)
		var12.emit(chatConversationTelemetryEventsModule.ConversationMessageFtuxTooltipImpression, { tooltipVariant = p0 })
	end, { p0, var12 })
	local var18 = reactModule.useCallback(function() --[[ line: 48 ]]
		-- upvalues: var12 (ref), chatConversationTelemetryEventsModule (copy), p0 (ref)
		var12.emit(chatConversationTelemetryEventsModule.ConversationMessageFtuxTooltipDismissed, { tooltipVariant = p0 })
	end, { p0, var12 })
	local var19 = reactModule.useCallback(function() --[[ line: 54 ]]
		-- upvalues: var14 (ref), var18 (ref), var16 (ref), var13 (ref), fFlagAppChatUseSwipeForRepliesModule (copy), var11 (ref), appStorageService (copy), httpService (copy), var15 (ref)
		if var14 then
			return
		end
		var18()
		var16.current[var13] = if fFlagAppChatUseSwipeForRepliesModule then var11.textKey else true
		local ok, _ = pcall(function() --[[ line: 60 ]]
			-- upvalues: appStorageService (copy), var11 (copy), httpService (copy), var16 (copy)
			appStorageService:SetItem(var11.storageKey, httpService:JSONEncode(var16.current))
			appStorageService:Flush()
		end)
		var15(ok)
	end, { var11.storageKey, var13, var14 })
	reactModule.useEffect(function() --[[ line: 67 ]]
		-- upvalues: appStorageService (copy), var11 (ref), httpService (copy), var16 (ref), fFlagAppChatUseSwipeForRepliesModule (copy), var13 (ref), var15 (ref), var17 (ref)
		local var21
		local ok, status = pcall(function() --[[ line: 68 ]]
			-- upvalues: appStorageService (copy), var11 (copy), httpService (copy)
			return httpService:JSONDecode(appStorageService:GetItem(var11.storageKey))
		end)
		var16.current = if ok then status else {}
		
		if fFlagAppChatUseSwipeForRepliesModule then
			var21 = var16.current[var13] == var11.textKey
			var21 = nil
		else
			var21 = var16.current[var13] or false
		end
		var15(var21)
		
		if not var21 then
			var17()
		end
	end, { var11.storageKey, var13 })
	reactModule.useEffect(function() --[[ line: 82 ]]
		-- upvalues: var14 (ref), messageFtuxTooltipDismissSignalModule (copy), p0 (ref), var19 (ref)
		if var14 then
			return
		end
		local dismissedConnection = messageFtuxTooltipDismissSignalModule.dismissed:connect(function(p1) --[[ line: 86 ]]
			-- upvalues: p0 (copy), var19 (copy)
			if p1 == p0 then
				var19()
			end
		end)
		
		return function() --[[ line: 91 ]]
			-- upvalues: dismissedConnection (ref)
			dismissedConnection:disconnect()
		end
	end, { p0, var19, var14 })
	local var20 = useLocalization({ tooltipText = var11.textKey })
	
	return reactModule.useMemo(function() --[[ line: 99 ]]
		-- upvalues: var20 (ref), var14 (ref), var19 (ref)
		return {
			text = var20.tooltipText,
			isDismissed = var14,
			handleDismiss = var19
		}
	end, { var20.tooltipText, var14, var19 })
end