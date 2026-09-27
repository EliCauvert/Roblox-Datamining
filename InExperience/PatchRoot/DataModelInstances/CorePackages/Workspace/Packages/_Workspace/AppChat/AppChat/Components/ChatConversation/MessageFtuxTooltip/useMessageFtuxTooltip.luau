local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local _ = require(script.Parent.MessageFtuxTooltipVariant)
local messageFtuxTooltipDismissSignalModule = require(script.Parent.MessageFtuxTooltipDismissSignal)
local useMessageFtuxTooltipConfigModule = require(script.Parent.useMessageFtuxTooltipConfig)
local chatConversationTelemetryEventsModule = require(appChat.Components.ChatConversation.ChatConversationTelemetryEvents)
local chatConversationTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local t = {
	GetItem = function(_, p1)
		-- upvalues: appStorageService (ref)
		return appStorageService:GetItem(p1)
	end,
	SetItem = function(_, p1, p2)
		-- upvalues: appStorageService (ref)
		appStorageService:SetItem(p1, p2)
	end,
	Flush = function()
		-- upvalues: appStorageService (ref)
		appStorageService:Flush()
	end
}

return function(p1, p2)
	-- upvalues: t (ref), useMessageFtuxTooltipConfigModule (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), reactModule (ref), useLocalUserId (ref), chatConversationTelemetryEventsModule (ref), httpService (ref), messageFtuxTooltipDismissSignalModule (ref), useLocalization (ref)
	p2 = p2 or t
	local var1 = useMessageFtuxTooltipConfigModule(p1)
	local var2 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var3 = reactModule.useRef(var2)
	var3.current = var2
	local var4 = useLocalUserId() or ""
	local var5, var6 = reactModule.useState(true)
	local var7 = reactModule.useRef({})
	local var8 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), chatConversationTelemetryEventsModule (copy), p1 (ref)
		var3.current.emit(chatConversationTelemetryEventsModule.ConversationMessageFtuxTooltipImpression, { tooltipVariant = p1 })
	end, { p1 })
	local var9 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), chatConversationTelemetryEventsModule (copy), p1 (ref)
		var3.current.emit(chatConversationTelemetryEventsModule.ConversationMessageFtuxTooltipDismissed, { tooltipVariant = p1 })
	end, { p1 })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var9 (ref), var7 (ref), var4 (ref), var1 (ref), p2 (ref), httpService (copy), var6 (ref)
		if var5 then
			return
		end
		var9()
		var7.current[var4] = var1.textKey
		local ok, _ = pcall(function()
			-- upvalues: p2 (copy), var1 (copy), httpService (copy), var7 (copy)
			p2:SetItem(var1.storageKey, httpService:JSONEncode(var7.current))
			p2:Flush()
		end)
		var6(ok)
	end, {
		var1.storageKey, var1.textKey, var4, var5, p2, var9
	})
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), var1 (ref), httpService (copy), var7 (ref), var4 (ref), var6 (ref), var8 (ref)
		local ok, status = pcall(function()
			-- upvalues: p2 (copy), var1 (copy), httpService (copy)
			return httpService:JSONDecode(p2:GetItem(var1.storageKey))
		end)
		var7.current = if ok then status else {}
		local var11 = var7.current[var4] == var1.textKey
		var6(var11)
		
		if not var11 then
			var8()
		end
	end, {
		var1.storageKey,
		var1.textKey,
		var4,
		p2,
		var8
	})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), messageFtuxTooltipDismissSignalModule (copy), p1 (ref), var10 (ref)
		if var5 then
			return
		end
		local dismissedConnection = messageFtuxTooltipDismissSignalModule.dismissed:connect(function(p3)
			-- upvalues: p1 (copy), var10 (copy)
			if p3 == p1 then
				var10()
			end
		end)
		
		return function()
			-- upvalues: dismissedConnection (ref)
			dismissedConnection:disconnect()
		end
	end, { p1, var10, var5 })
	local var11 = useLocalization({ tooltipText = var1.textKey })
	
	return reactModule.useMemo(function()
		-- upvalues: var11 (ref), var5 (ref), var10 (ref)
		return {
			text = var11.tooltipText,
			isDismissed = var5,
			handleDismiss = var10
		}
	end, { var11.tooltipText, var5, var10 })
end