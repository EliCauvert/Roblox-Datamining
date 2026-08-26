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

return function(p1)
	-- upvalues: messageFtuxTooltipVariantModule (ref), useMessageFtuxTooltipConfigModule (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useLocalUserId (ref), reactModule (ref), chatConversationTelemetryEventsModule (ref), fFlagAppChatUseSwipeForRepliesModule (ref), appStorageService (ref), httpService (ref), messageFtuxTooltipDismissSignalModule (ref), useLocalization (ref)
	if p1 == messageFtuxTooltipVariantModule.None then
		return {
			text = "",
			isDismissed = true,
			handleDismiss = function() end
		}
	end
	local var1 = useMessageFtuxTooltipConfigModule(p1)
	local var2 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var3 = useLocalUserId() or ""
	local var4, var5 = reactModule.useState(true)
	local var6 = reactModule.useRef({})
	local var7 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), chatConversationTelemetryEventsModule (copy), p1 (ref)
		var2.emit(chatConversationTelemetryEventsModule.ConversationMessageFtuxTooltipImpression, { tooltipVariant = p1 })
	end, { p1, var2 })
	local var8 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), chatConversationTelemetryEventsModule (copy), p1 (ref)
		var2.emit(chatConversationTelemetryEventsModule.ConversationMessageFtuxTooltipDismissed, { tooltipVariant = p1 })
	end, { p1, var2 })
	local var9 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var8 (ref), var6 (ref), var3 (ref), fFlagAppChatUseSwipeForRepliesModule (copy), var1 (ref), appStorageService (copy), httpService (copy), var5 (ref)
		if var4 then
			return
		end
		var8()
		var6.current[var3] = if fFlagAppChatUseSwipeForRepliesModule then var1.textKey else true
		local ok, _ = pcall(function()
			-- upvalues: appStorageService (copy), var1 (copy), httpService (copy), var6 (copy)
			appStorageService:SetItem(var1.storageKey, httpService:JSONEncode(var6.current))
			appStorageService:Flush()
		end)
		var5(ok)
	end, { var1.storageKey, var3, var4 })
	reactModule.useEffect(function()
		-- upvalues: appStorageService (copy), var1 (ref), httpService (copy), var6 (ref), fFlagAppChatUseSwipeForRepliesModule (copy), var3 (ref), var5 (ref), var7 (ref)
		local var10
		local ok, status = pcall(function()
			-- upvalues: appStorageService (copy), var1 (copy), httpService (copy)
			return httpService:JSONDecode(appStorageService:GetItem(var1.storageKey))
		end)
		var6.current = if ok then status else {}
		
		if fFlagAppChatUseSwipeForRepliesModule then
			var10 = var6.current[var3] == var1.textKey
			var10 = nil
		else
			var10 = var6.current[var3] or false
		end
		var5(var10)
		
		if not var10 then
			var7()
		end
	end, { var1.storageKey, var3 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), messageFtuxTooltipDismissSignalModule (copy), p1 (ref), var9 (ref)
		if var4 then
			return
		end
		local dismissedConnection = messageFtuxTooltipDismissSignalModule.dismissed:connect(function(p2)
			-- upvalues: p1 (copy), var9 (copy)
			if p2 == p1 then
				var9()
			end
		end)
		
		return function()
			-- upvalues: dismissedConnection (ref)
			dismissedConnection:disconnect()
		end
	end, { p1, var9, var4 })
	local var10 = useLocalization({ tooltipText = var1.textKey })
	
	return reactModule.useMemo(function()
		-- upvalues: var10 (ref), var4 (ref), var9 (ref)
		return {
			text = var10.tooltipText,
			isDismissed = var4,
			handleDismiss = var9
		}
	end, { var10.tooltipText, var4, var9 })
end