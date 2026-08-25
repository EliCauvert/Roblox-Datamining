local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local dataHydrationModule = require(parent.DataHydration)
local name = require(appChat.Logger):new(script.Name)
local getResponseBodyModule = require(appChat.Stores.Ingestion.getResponseBody)
local serializeChatTimeoutRangeModule = require(appChat.Utils.serializeChatTimeoutRange)
local t = { status = "none" }

local function _(p0)
	-- upvalues: serializeChatTimeoutRangeModule (ref)
	local var10 = serializeChatTimeoutRangeModule(p0)
	
	return {
		status = "active",
		endTimestamp = var10.endTimestamp,
		decisionEventId = p0.decision_event_id,
		duration = var10.duration or 0
	}
end

local function mapResponseToStatuses(value, p1)
	-- upvalues: getResponseBodyModule (ref), serializeChatTimeoutRangeModule (ref), t (ref)
	local var12
	local var11 = getResponseBodyModule(value)
	
	if not p1.includeUser then
		var12 = nil
	elseif var11 and var11.user_timeout_range then
		local userTimeoutRange = var11.user_timeout_range
		local var13 = serializeChatTimeoutRangeModule(userTimeoutRange)
		var12 = {
			status = "active",
			endTimestamp = var13.endTimestamp,
			decisionEventId = userTimeoutRange.decision_event_id,
			duration = var13.duration or 0
		}
	else
		var12 = t
	end
	local t_1 = {}
	local t_2 = {}
	
	for i, v in p1.conversationIds do
		t_2[v] = true
		t_1[v] = t
	end
	if var11 and var11.conversation_timeout_ranges then
		for i, v_1 in var11.conversation_timeout_ranges do
			if t_2[v_1.id] then
				local id = v_1.id
				local timeoutRange = v_1.timeout_range
				local var16 = serializeChatTimeoutRangeModule(timeoutRange)
				t_1[id] = {
					status = "active",
					endTimestamp = var16.endTimestamp,
					decisionEventId = timeoutRange.decision_event_id,
					duration = var16.duration or 0
				}
			end
		end
	end
	return var12, t_1
end

local function createChatModerationStatusDataHydrationStore()
	-- upvalues: dataHydrationModule (ref), name (ref), appChatNetworkingModule (ref), mapResponseToStatuses (ref), t (ref)
	local var17 = dataHydrationModule.createDataCache()
	local var18 = dataHydrationModule.createDataCache()
	local var19 = dataHydrationModule.createDataResolver({
		supportsMultiGet = false,
		queueProcessDelaySec = 0,
		replaceItems = true,
		cache = var17,
		logError = function(p2)
			-- upvalues: name (copy)
			name:warning(`Failed to fetch local-user chat moderation status: {tostring(p2)}`)
		end,
		fetchFn = function()
			-- upvalues: appChatNetworkingModule (copy), mapResponseToStatuses (copy)
			return appChatNetworkingModule.http.GetChatModerationStatuses(nil, nil):andThen(function(p3)
				-- upvalues: mapResponseToStatuses (copy)
				return mapResponseToStatuses(p3, { includeUser = true, conversationIds = {} })
			end)
		end
	})
	local var20 = dataHydrationModule.createDataResolver({
		queueProcessDelaySec = 0,
		replaceItems = true,
		cache = var18,
		logError = function(p4)
			-- upvalues: name (copy)
			name:warning(`Failed to fetch conversation chat moderation status: {tostring(p4)}`)
		end,
		fetchFn = function(p5)
			-- upvalues: appChatNetworkingModule (copy), mapResponseToStatuses (copy)
			local t = {}
			
			for i in p5 do
				table.insert(t, i)
			end
			return appChatNetworkingModule.http.GetChatModerationStatuses(nil, t):andThen(function(p6)
				-- upvalues: mapResponseToStatuses (copy), t (ref)
				local _, var22 = mapResponseToStatuses(p6, { includeUser = false, conversationIds = t })
				
				return var22
			end)
		end
	})
	
	return {
		getUserStatus = function()
			-- upvalues: var19 (ref)
			return var19.getAndFetchItem("__local_user__")
		end,
		getConversationStatus = function(p7)
			-- upvalues: var20 (ref)
			return var20.getAndFetchItem(p7)
		end,
		ingestResponse = function(p8, p9)
			-- upvalues: mapResponseToStatuses (copy), var17 (ref), var18 (ref)
			local var23, var24 = mapResponseToStatuses(p8, p9)
			
			if var23 then
				var17.replaceItem("__local_user__", var23)
			end
			if next(var24) then
				var18.replaceItems(var24)
			end
		end,
		setConversationStatusNone = function(value)
			-- upvalues: var18 (ref), t (copy)
			var18.replaceItem(value, t)
		end,
		clear = function()
			-- upvalues: var19 (ref), var20 (ref)
			var19.clear()
			var20.clear()
		end
	}
end

local var9 = nil

return function(_)
	-- upvalues: var9 (write), createChatModerationStatusDataHydrationStore (ref)
	if var9 == nil then
		local var25 = createChatModerationStatusDataHydrationStore()
		var9 = var25
		
		return var25
	end
	return var9
end