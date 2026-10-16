local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local Players = game:GetService("Players")
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local DataHydrationModule = require(Parent.DataHydration)
local _ = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local NewResult = require(AppChat.Logger):new(script.Name)
local GetResponseBodyModule = require(AppChat.Stores.Ingestion.getResponseBody)
local SerializeChatTimeoutRangeModule = require(AppChat.Utils.serializeChatTimeoutRange)
local FFlagAppChatReactiveFeatureRestrictions = require(Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local config = { status = "none" }

local function _() --[[ Line: 50 | Named "getLocalPlayerUserId" ]]
	-- upvalues: Players (copy)
	local UserId = if Players.LocalPlayer then Players.LocalPlayer.UserId else nil
	
	return if UserId == nil or UserId <= 0 then nil else UserId
end

local _ = function(p1) --[[ Line: 55 | Named "toTimeoutStatus" ]]
	-- upvalues: SerializeChatTimeoutRangeModule (copy)
	local SerializeChatTimeoutRangeModuleResult = SerializeChatTimeoutRangeModule(p1)
	
	return {
		status = "active",
		endTimestamp = SerializeChatTimeoutRangeModuleResult.endTimestamp,
		decisionEventId = p1.decision_event_id,
		duration = SerializeChatTimeoutRangeModuleResult.duration or 0,
		requiresAcknowledgement = SerializeChatTimeoutRangeModuleResult.requiresAcknowledgement
	}
end

local function mapResponseToStatuses(p1, p2) --[[ Line: 66 ]]
	-- upvalues: GetResponseBodyModule (copy), SerializeChatTimeoutRangeModule (copy), config (copy)
	local ResponseBodyModule = GetResponseBodyModule(p1)
	local v1 = nil
	
	if p2.includeUser then
		if ResponseBodyModule and ResponseBodyModule.user_timeout_range then
			local UserTimeoutRange = ResponseBodyModule.user_timeout_range
			local SerializeChatTimeoutRangeModuleResult = SerializeChatTimeoutRangeModule(UserTimeoutRange)
			v1 = {
				status = "active",
				endTimestamp = SerializeChatTimeoutRangeModuleResult.endTimestamp,
				decisionEventId = UserTimeoutRange.decision_event_id,
				duration = SerializeChatTimeoutRangeModuleResult.duration or 0,
				requiresAcknowledgement = SerializeChatTimeoutRangeModuleResult.requiresAcknowledgement
			}
		else
			v1 = config
		end
	else
		v1 = nil
	end
	local t = {}
	local t1 = {}
	
	for _, conversationId in p2.conversationIds do
		t1[conversationId] = true
		t[conversationId] = config
	end
	if ResponseBodyModule and ResponseBodyModule.conversation_timeout_ranges then
		for _, conversationTimeoutRange in ResponseBodyModule.conversation_timeout_ranges do
			if t1[conversationTimeoutRange.id] then
				local Id = conversationTimeoutRange.id
				local TimeoutRange = conversationTimeoutRange.timeout_range
				local SerializeChatTimeoutRangeModuleResult = SerializeChatTimeoutRangeModule(TimeoutRange)
				t[Id] = {
					status = "active",
					endTimestamp = SerializeChatTimeoutRangeModuleResult.endTimestamp,
					decisionEventId = TimeoutRange.decision_event_id,
					duration = SerializeChatTimeoutRangeModuleResult.duration or 0,
					requiresAcknowledgement = SerializeChatTimeoutRangeModuleResult.requiresAcknowledgement
				}
			end
		end
	end
	return v1, t
end

local function createChatModerationStatusDataHydrationStore() --[[ Line: 96 ]]
	-- upvalues: DataHydrationModule (copy), NewResult (copy), AppChatNetworkingModule (copy), mapResponseToStatuses (copy), Players (copy), PromiseModule (copy), config (copy), FFlagAppChatReactiveFeatureRestrictions (copy)
	local DataCache = DataHydrationModule.createDataCache()
	local DataCache1 = DataHydrationModule.createDataCache()
	local Count = 0
	local Count1 = nil
	local Tbl = {}
	local DataResolver = DataHydrationModule.createDataResolver({
		supportsMultiGet = false,
		queueProcessDelaySec = 0,
		replaceItems = true,
		cache = DataCache,
		logError = function(p3) --[[ Line: 109 ]]
			-- upvalues: NewResult (upval)
			NewResult:warning(`Failed to fetch local-user chat moderation status: {tostring(p3)}`)
		end,
		fetchFn = function() --[[ Line: 112 ]]
			-- upvalues: AppChatNetworkingModule (upval), mapResponseToStatuses (upval)
			return AppChatNetworkingModule.http.GetChatModerationStatuses(nil, nil):andThen(function(Result) --[[ Line: 113 ]]
				-- upvalues: mapResponseToStatuses (upval)
				return (mapResponseToStatuses(Result, { includeUser = true, conversationIds = {} }))
			end)
		end
	})
	local DataResolver1 = DataHydrationModule.createDataResolver({
		queueProcessDelaySec = 0,
		replaceItems = true,
		cache = DataCache1,
		logError = function(p3) --[[ Line: 127 ]]
			-- upvalues: NewResult (upval)
			NewResult:warning(`Failed to fetch conversation chat moderation status: {tostring(p3)}`)
		end,
		fetchFn = function(List) --[[ Line: 130 ]]
			-- upvalues: AppChatNetworkingModule (upval), mapResponseToStatuses (upval)
			local ConversationIds = {}
			
			for i in List do
				table.insert(ConversationIds, i)
			end
			return AppChatNetworkingModule.http.GetChatModerationStatuses(nil, ConversationIds):andThen(function(Result) --[[ Line: 136 ]]
				-- upvalues: mapResponseToStatuses (upval), ConversationIds (copy)
				local _, MapResponseToStatusesResult2 = mapResponseToStatuses(Result, { includeUser = false, conversationIds = ConversationIds })
				
				return MapResponseToStatusesResult2
			end)
		end
	})
	
	local function _(p3, List) --[[ Line: 156 | Named "releaseRefreshOwnership" ]]
		-- upvalues: Count1 (ref), Tbl (copy)
		if Count1 == p3 then
			Count1 = nil
		end
		for _, value in List do
			if Tbl[value] == p3 then
				Tbl[value] = nil
			end
		end
	end
	
	return {
		getUserStatus = function() --[[ Line: 214 ]]
			-- upvalues: DataResolver (copy)
			return DataResolver.getAndFetchItem("__local_user__")
		end,
		getCachedUserStatus = function() --[[ Line: 217 ]]
			-- upvalues: DataCache (copy)
			return DataCache.getItem("__local_user__")
		end,
		getConversationStatus = function(p4) --[[ Line: 220 ]]
			-- upvalues: DataResolver1 (copy)
			return DataResolver1.getAndFetchItem(p4)
		end,
		getCachedConversationStatus = function(p4) --[[ Line: 223 ]]
			-- upvalues: DataCache1 (copy)
			return DataCache1.getItem(p4)
		end,
		ingestResponse = function(p4, p5) --[[ Line: 146 ]]
			-- upvalues: mapResponseToStatuses (upval), DataCache (copy), DataCache1 (copy)
			local MapResponseToStatusesResult, MapResponseToStatusesResult2 = mapResponseToStatuses(p4, p5)
			
			if MapResponseToStatusesResult then
				DataCache.replaceItem("__local_user__", MapResponseToStatusesResult)
			end
			if next(MapResponseToStatusesResult2) then
				DataCache1.replaceItems(MapResponseToStatusesResult2)
			end
		end,
		refreshStatuses = function(Tbl1) --[[ Line: 168 ]]
			-- upvalues: Count (ref), Count1 (ref), Players (upval), Tbl (copy), AppChatNetworkingModule (upval), mapResponseToStatuses (upval), DataCache (copy), DataCache1 (copy), PromiseModule (upval)
			Count += 1
			Count1 = Count
			local Count2: number = Count
			local UserId = if Players.LocalPlayer then Players.LocalPlayer.UserId else nil
			local UserId1 = if UserId == nil or UserId <= 0 then nil else UserId
			local Copy = if Tbl1 then table.clone(Tbl1) else {}
			for _, value in Copy do
				Tbl[value] = Count2
			end
			return AppChatNetworkingModule.http.GetChatModerationStatuses(nil, Tbl1):andThen(function(Result) --[[ Line: 182 ]]
				-- upvalues: UserId1 (copy), Players (upval), Copy (copy), Tbl (upval), Count2 (copy), Count1 (upval), mapResponseToStatuses (upval), DataCache (upval), DataCache1 (upval)
				local UserId = if Players.LocalPlayer then Players.LocalPlayer.UserId else nil
				
				if UserId1 == (if UserId == nil or UserId <= 0 then nil else UserId) then
					local ConversationIds = {}
					
					for _, value in Copy do
						if Tbl[value] == Count2 then
							table.insert(ConversationIds, value)
						end
					end
					local MapResponseToStatusesResult, MapResponseToStatusesResult2 = mapResponseToStatuses(Result, {
						includeUser = Count1 == Count2,
						conversationIds = ConversationIds
					})
					
					if MapResponseToStatusesResult then
						DataCache.replaceItem("__local_user__", MapResponseToStatusesResult)
					end
					if next(MapResponseToStatusesResult2) then
						DataCache1.replaceItems(MapResponseToStatusesResult2)
					end
				end
				return Result
			end):andThen(function(Result) --[[ Line: 200 | Named "onSuccess" ]]
				-- upvalues: Count2 (copy), Copy (copy), Count1 (upval), Tbl (upval)
				if Count1 == Count2 then
					Count1 = nil
				end
				for _, value in Copy do
					if Tbl[value] == Count2 then
						Tbl[value] = nil
					end
				end
				return Result
			end, function(p4) --[[ Line: 205 | Named "onFailure" ]]
				-- upvalues: Count2 (copy), Copy (copy), Count1 (upval), Tbl (upval), PromiseModule (upval)
				if Count1 == Count2 then
					Count1 = nil
				end
				for _, value in Copy do
					if Tbl[value] == Count2 then
						Tbl[value] = nil
					end
				end
				return PromiseModule.reject(p4)
			end)
		end,
		setConversationStatusNone = function(p4) --[[ Line: 228 ]]
			-- upvalues: DataCache1 (copy), config (upval)
			DataCache1.replaceItem(p4, config)
		end,
		clear = function() --[[ Line: 231 ]]
			-- upvalues: FFlagAppChatReactiveFeatureRestrictions (upval), Count1 (ref), Tbl (copy), DataResolver (copy), DataResolver1 (copy)
			if FFlagAppChatReactiveFeatureRestrictions then
				Count1 = nil
				table.clear(Tbl)
			end
			DataResolver.clear()
			DataResolver1.clear()
		end
	}
end

local v2 = nil

return function(_) --[[ Line: 244 | Named "GetChatModerationStatusDataHydration" ]]
	-- upvalues: v2 (ref), createChatModerationStatusDataHydrationStore (copy)
	local v3 = v2
	
	if v3 == nil then
		local ChatModerationStatusDataHydrationStore = createChatModerationStatusDataHydrationStore()
		v2 = ChatModerationStatusDataHydrationStore
		
		return ChatModerationStatusDataHydrationStore
	else
		return v3
	end
end