local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local playersService = game:GetService("Players")
local appChatNetworkingModule = require(parent.AppChatNetworking)
local dataHydrationModule = require(parent.DataHydration)
local _ = require(parent.LuauPolyfill)
local promiseModule = require(parent.Promise)
local name = require(appChat.Logger):new(script.Name)
local getResponseBodyModule = require(appChat.Stores.Ingestion.getResponseBody)
local serializeChatTimeoutRangeModule = require(appChat.Utils.serializeChatTimeoutRange)
local fFlagAppChatReactiveFeatureRestrictions = require(parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local t = { status = "none" }

local function _()
	-- upvalues: playersService (ref)
	local var1 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
	
	return if var1 == nil or var1 <= 0 then nil else var1
end

local _ = function(p1)
	-- upvalues: serializeChatTimeoutRangeModule (ref)
	local var1 = serializeChatTimeoutRangeModule(p1)
	
	return {
		status = "active",
		endTimestamp = var1.endTimestamp,
		decisionEventId = p1.decision_event_id,
		duration = var1.duration or 0,
		requiresAcknowledgement = var1.requiresAcknowledgement
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
			duration = var3.duration or 0,
			requiresAcknowledgement = var3.requiresAcknowledgement
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
					duration = var4.duration or 0,
					requiresAcknowledgement = var4.requiresAcknowledgement
				}
			end
		end
	end
	return var1, t_1
end

local function createChatModerationStatusDataHydrationStore()
	-- upvalues: dataHydrationModule (ref), name (ref), appChatNetworkingModule (ref), mapResponseToStatuses (ref), playersService (ref), promiseModule (ref), t (ref), fFlagAppChatReactiveFeatureRestrictions (ref)
	local var5 = dataHydrationModule.createDataCache()
	local var6 = dataHydrationModule.createDataCache()
	local var7 = 0
	local var8 = nil
	local t_1 = {}
	local var9 = dataHydrationModule.createDataResolver({
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
	local var10 = dataHydrationModule.createDataResolver({
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
				local _, var11 = mapResponseToStatuses(p3, { includeUser = false, conversationIds = t })
				
				return var11
			end)
		end
	})
	
	local function _(p3, p4)
		-- upvalues: var8 (write), t_1 (ref)
		if var8 == p3 then
			var8 = nil
		end
		for i, v in p4 do
			if t_1[v] == p3 then
				t_1[v] = nil
			end
		end
	end
	
	return {
		getUserStatus = function()
			-- upvalues: var9 (ref)
			return var9.getAndFetchItem("__local_user__")
		end,
		getCachedUserStatus = function()
			-- upvalues: var5 (ref)
			return var5.getItem("__local_user__")
		end,
		getConversationStatus = function(p5)
			-- upvalues: var10 (ref)
			return var10.getAndFetchItem(p5)
		end,
		getCachedConversationStatus = function(p5)
			-- upvalues: var6 (ref)
			return var6.getItem(p5)
		end,
		ingestResponse = function(p5, p6)
			-- upvalues: mapResponseToStatuses (copy), var5 (ref), var6 (ref)
			local var11, var12 = mapResponseToStatuses(p5, p6)
			
			if var11 then
				var5.replaceItem("__local_user__", var11)
			end
			if next(var12) then
				var6.replaceItems(var12)
			end
		end,
		refreshStatuses = function(p5)
			-- upvalues: var7 (write), var8 (write), playersService (copy), t_1 (ref), appChatNetworkingModule (copy), mapResponseToStatuses (copy), var5 (ref), var6 (ref), promiseModule (copy)
			var7 += 1
			var8 = var7
			local var11 = var7
			local var12 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
			local var13 = if var12 == nil or var12 <= 0 then nil else var12
			var12 = if p5 then table.clone(p5) else {}
			
			for i, v in var12 do
				t_1[v] = var11
			end
			return appChatNetworkingModule.http.GetChatModerationStatuses(nil, p5):andThen(function(p6)
				-- upvalues: var13 (ref), playersService (copy), var12 (ref), t_1 (copy), var11 (ref), var8 (copy), mapResponseToStatuses (copy), var5 (copy), var6 (copy)
				local var14 = var13
				local var15 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
				
				if var14 == (if var15 == nil or var15 <= 0 then nil else var15) then
					var14 = {}
					
					for i, v in var12 do
						if t_1[v] == var11 then
							table.insert(var14, v)
						end
					end
					var15, var36 = mapResponseToStatuses(p6, { includeUser = var8 == var11, conversationIds = var14 })
					
					if var15 then
						var5.replaceItem("__local_user__", var15)
					end
					if next(var36) then
						var6.replaceItems(var36)
					end
				end
				return p6
			end):andThen(function(p7)
				-- upvalues: var11 (ref), var12 (ref), var8 (copy), t_1 (copy)
				if var8 == var11 then
					var8 = nil
				end
				for i, v in var12 do
					if t_1[v] == var11 then
						t_1[v] = nil
					end
				end
				return p7
			end, function(p8)
				-- upvalues: var11 (ref), var12 (ref), var8 (copy), t_1 (copy), promiseModule (copy)
				if var8 == var11 then
					var8 = nil
				end
				for i, v in var12 do
					if t_1[v] == var11 then
						t_1[v] = nil
					end
				end
				return promiseModule.reject(p8)
			end)
		end,
		setConversationStatusNone = function(value)
			-- upvalues: var6 (ref), t (copy)
			var6.replaceItem(value, t)
		end,
		clear = function()
			-- upvalues: fFlagAppChatReactiveFeatureRestrictions (copy), var8 (write), t_1 (ref), var9 (ref), var10 (ref)
			if fFlagAppChatReactiveFeatureRestrictions then
				var8 = nil
				table.clear(t_1)
			end
			var9.clear()
			var10.clear()
		end
	}
end

local var16 = nil

return function(_)
	-- upvalues: var16 (write), createChatModerationStatusDataHydrationStore (ref)
	if var16 == nil then
		local var17 = createChatModerationStatusDataHydrationStore()
		var16 = var17
		
		return var17
	end
	return var16
end