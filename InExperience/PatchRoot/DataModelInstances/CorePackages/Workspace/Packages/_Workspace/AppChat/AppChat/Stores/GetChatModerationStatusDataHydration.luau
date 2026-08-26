local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local dataHydrationModule = require(parent.DataHydration)
local name = require(appChat.Logger):new(script.Name)
local getResponseBodyModule = require(appChat.Stores.Ingestion.getResponseBody)
local serializeChatTimeoutRangeModule = require(appChat.Utils.serializeChatTimeoutRange)
local t = { status = "none" }

local function _(p1)
	-- upvalues: serializeChatTimeoutRangeModule (ref)
	local var1 = serializeChatTimeoutRangeModule(p1)
	
	return {
		status = "active",
		endTimestamp = var1.endTimestamp,
		decisionEventId = p1.decision_event_id,
		duration = var1.duration or 0
	}
end

local function mapResponseToStatuses(value, p1)
	-- upvalues: getResponseBodyModule (ref), serializeChatTimeoutRangeModule (ref), t (ref)
	local var1
	local var2 = getResponseBodyModule(value)
	
	if not p1.includeUser then
		var1 = nil
	elseif var2 and var2.user_timeout_range then
		local userTimeoutRange = var2.user_timeout_range
		local var3 = serializeChatTimeoutRangeModule(userTimeoutRange)
		var1 = {
			status = "active",
			endTimestamp = var3.endTimestamp,
			decisionEventId = userTimeoutRange.decision_event_id,
			duration = var3.duration or 0
		}
	else
		var1 = t
	end
	local t_1 = {}
	local t_2 = {}
	
	for i, v in p1.conversationIds do
		t_2[v] = true
		t_1[v] = t
	end
	if var2 and var2.conversation_timeout_ranges then
		for i, v_1 in var2.conversation_timeout_ranges do
			if t_2[v_1.id] then
				local id = v_1.id
				local timeoutRange = v_1.timeout_range
				local var4 = serializeChatTimeoutRangeModule(timeoutRange)
				t_1[id] = {
					status = "active",
					endTimestamp = var4.endTimestamp,
					decisionEventId = timeoutRange.decision_event_id,
					duration = var4.duration or 0
				}
			end
		end
	end
	return var1, t_1
end

local function createChatModerationStatusDataHydrationStore()
	-- upvalues: dataHydrationModule (ref), name (ref), appChatNetworkingModule (ref), mapResponseToStatuses (ref), t (ref)
	local var5 = dataHydrationModule.createDataCache()
	local var6 = dataHydrationModule.createDataCache()
	local var7 = dataHydrationModule.createDataResolver({
		supportsMultiGet = false,
		queueProcessDelaySec = 0,
		replaceItems = true,
		cache = var5,
		logError = function(p2)
			-- upvalues: name (copy)
			name:warning(`Failed to fetch local-user chat moderation status: {tostring(p2)}`)
		end,
		fetchFn = function()
			-- upvalues: appChatNetworkingModule (copy), mapResponseToStatuses (copy)
			return appChatNetworkingModule.http.GetChatModerationStatuses(nil, nil):andThen(function(p2)
				-- upvalues: mapResponseToStatuses (copy)
				return mapResponseToStatuses(p2, { includeUser = true, conversationIds = {} })
			end)
		end
	})
	local var8 = dataHydrationModule.createDataResolver({
		queueProcessDelaySec = 0,
		replaceItems = true,
		cache = var6,
		logError = function(p2)
			-- upvalues: name (copy)
			name:warning(`Failed to fetch conversation chat moderation status: {tostring(p2)}`)
		end,
		fetchFn = function(p2)
			-- upvalues: appChatNetworkingModule (copy), mapResponseToStatuses (copy)
			local t = {}
			
			for i in p2 do
				table.insert(t, i)
			end
			return appChatNetworkingModule.http.GetChatModerationStatuses(nil, t):andThen(function(p3)
				-- upvalues: mapResponseToStatuses (copy), t (ref)
				local _, var9 = mapResponseToStatuses(p3, { includeUser = false, conversationIds = t })
				
				return var9
			end)
		end
	})
	
	return {
		getUserStatus = function()
			-- upvalues: var7 (ref)
			return var7.getAndFetchItem("__local_user__")
		end,
		getConversationStatus = function(p3)
			-- upvalues: var8 (ref)
			return var8.getAndFetchItem(p3)
		end,
		ingestResponse = function(p3, p4)
			-- upvalues: mapResponseToStatuses (copy), var5 (ref), var6 (ref)
			local var9, var10 = mapResponseToStatuses(p3, p4)
			
			if var9 then
				var5.replaceItem("__local_user__", var9)
			end
			if next(var10) then
				var6.replaceItems(var10)
			end
		end,
		setConversationStatusNone = function(value)
			-- upvalues: var6 (ref), t (copy)
			var6.replaceItem(value, t)
		end,
		clear = function()
			-- upvalues: var7 (ref), var8 (ref)
			var7.clear()
			var8.clear()
		end
	}
end

local var9 = nil

return function(_)
	-- upvalues: var9 (write), createChatModerationStatusDataHydrationStore (ref)
	if var9 == nil then
		local var10 = createChatModerationStatusDataHydrationStore()
		var9 = var10
		
		return var10
	end
	return var9
end