local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dataHydrationModule = require(parent.DataHydration)
local luauPolyfillModule = require(parent.LuauPolyfill)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local createCurrentTimeSignal = require(parent.SignalsUtils).createCurrentTimeSignal
local clearTimeout = luauPolyfillModule.clearTimeout
local setTimeout = luauPolyfillModule.setTimeout
local _ = require(appChat.Models.ConversationChannels)
local getChatModerationStatusDataHydrationModule = require(appChat.Stores.GetChatModerationStatusDataHydration)
local getEffectiveChatTimeoutDetailsModule = require(appChat.Utils.getEffectiveChatTimeoutDetails)
local _ = require(appChat.Utils.serializeChatTimeoutRange)
local fFlagAppChatReactiveFeatureRestrictions = require(parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local name = require(appChat.Logger):new(script.Name)

local function areChatTimeoutDetailsEqual(p1, p2)
	-- upvalues: fFlagAppChatReactiveFeatureRestrictions (ref)
	return p1.isTimedOut == p2.isTimedOut and (p1.timeoutEndTimestamp == p2.timeoutEndTimestamp and (p1.decisionEventId == p2.decisionEventId and (p1.duration == p2.duration and (not fFlagAppChatReactiveFeatureRestrictions or p1.requiresAcknowledgement == p2.requiresAcknowledgement))))
end

local function _(p1)
	return if p1 == nil or p1.status ~= "active" then nil else {
		endTimestamp = p1.endTimestamp,
		decisionEventId = p1.decisionEventId,
		duration = p1.duration,
		requiresAcknowledgement = p1.requiresAcknowledgement
	}
end

return function(p1)
	-- upvalues: reactModule (ref), fFlagAppChatReactiveFeatureRestrictions (ref), createCurrentTimeSignal (ref), getChatModerationStatusDataHydrationModule (ref), name (ref), signalsModule (ref), getEffectiveChatTimeoutDetailsModule (ref), dataHydrationModule (ref), areChatTimeoutDetailsEqual (ref), clearTimeout (ref), setTimeout (ref)
	local var1
	local var2 = reactModule.useMemo(function()
		-- upvalues: fFlagAppChatReactiveFeatureRestrictions (copy), createCurrentTimeSignal (copy)
		return if fFlagAppChatReactiveFeatureRestrictions then function()
			return DateTime.now().UnixTimestamp
		end else createCurrentTimeSignal(1)
	end, {})
	local var3 = getChatModerationStatusDataHydrationModule(false)
	local _ = nil
	local var4 = false
	
	if fFlagAppChatReactiveFeatureRestrictions then
		local cachedUserStatus, cachedUserStatus_1 = var3.getCachedUserStatus()
		var1 = cachedUserStatus
		var4 = cachedUserStatus_1
	else
		var1 = var3.getUserStatus()
	end
	local conversationId = p1.conversationId
	local var5 = var1
	local var6 = false
	
	if conversationId then
		if fFlagAppChatReactiveFeatureRestrictions then
			local cachedConversationStatus, cachedConversationStatus_1 = var3.getCachedConversationStatus(conversationId)
			var5 = cachedConversationStatus
			var6 = cachedConversationStatus_1
		else
			var5 = var3.getConversationStatus(conversationId)
		end
	end
	reactModule.useEffect(function()
		-- upvalues: fFlagAppChatReactiveFeatureRestrictions (copy), var4 (write), var6 (write), var3 (ref), conversationId (ref), name (copy)
		if fFlagAppChatReactiveFeatureRestrictions and (var4 or var6) then
			var3.refreshStatuses(if conversationId then { conversationId } else nil):catch(function()
				-- upvalues: name (copy)
				name:warning("Failed to fetch Party Chat moderation status")
			end)
		end
	end, { conversationId, var6, var3, var4 })
	local var7 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (write), var5 (write), getEffectiveChatTimeoutDetailsModule (copy), dataHydrationModule (copy), conversationId (ref), p1 (ref), var2 (ref), areChatTimeoutDetailsEqual (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var1 (copy), var5 (copy), getEffectiveChatTimeoutDetailsModule (copy), dataHydrationModule (copy), conversationId (copy), p1 (copy), var2 (copy)
			local var8 = var1.data(p2)
			local var9 = var5.data(p2)
			
			return getEffectiveChatTimeoutDetailsModule(if var1.status(p2) == dataHydrationModule.DataStatus.Failed then nil elseif var8 == nil or var8.status ~= "active" then nil else {
				endTimestamp = var8.endTimestamp,
				decisionEventId = var8.decisionEventId,
				duration = var8.duration,
				requiresAcknowledgement = var8.requiresAcknowledgement
			}, if not conversationId or var5.status(p2) == dataHydrationModule.DataStatus.Failed then if var9 == nil or var9.status ~= "active" then nil else {
				endTimestamp = var9.endTimestamp,
				decisionEventId = var9.decisionEventId,
				duration = var9.duration,
				requiresAcknowledgement = var9.requiresAcknowledgement
			} else nil, p1.conversationModerationType, var2(p2))
		end, areChatTimeoutDetailsEqual)
	end, {
		conversationId, var5.data, var5.status, var2, p1.conversationModerationType,
		var1.data, var1.status
	})
	
	if fFlagAppChatReactiveFeatureRestrictions then
		reactModule.useEffect(function()
			-- upvalues: signalsModule (copy), clearTimeout (copy), var7 (ref), setTimeout (copy), var3 (ref), conversationId (ref), name (copy)
			local var8 = nil
			local var9 = signalsModule.createEffect(function(p2)
				-- upvalues: var8 (write), clearTimeout (copy), var7 (copy), setTimeout (copy), var3 (copy), conversationId (copy), name (copy)
				if var8 then
					clearTimeout(var8)
					var8 = nil
				end
				local var10 = var7(p2)
				local unixTimestamp = DateTime.now().UnixTimestamp
				
				if var10.isTimedOut and unixTimestamp < var10.timeoutEndTimestamp then
					var8 = setTimeout(function()
						-- upvalues: var8 (copy), var3 (copy), conversationId (copy), name (copy)
						var8 = nil
						var3.refreshStatuses(if conversationId then { conversationId } else nil):catch(function()
							-- upvalues: name (copy)
							name:warning("Failed to refresh expired Party Chat restriction")
						end)
					end, (var10.timeoutEndTimestamp - unixTimestamp + 1) * 1000)
				end
			end)
			
			return function()
				-- upvalues: var8 (write), clearTimeout (copy), var9 (ref)
				if var8 then
					clearTimeout(var8)
				end
				var9()
			end
		end, { conversationId, var7, var3 })
	end
	return var7
end