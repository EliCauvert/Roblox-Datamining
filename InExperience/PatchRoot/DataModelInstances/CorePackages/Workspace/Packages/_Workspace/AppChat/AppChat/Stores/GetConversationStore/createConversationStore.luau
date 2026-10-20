local Parent = script:FindFirstAncestor("AppChat").Parent
local CryoModule = require(Parent.Cryo)
local CreateProxyFunction = require(Parent.SignalsExperimental).createProxy
local config = {
	oldestConversationIsFetched = false,
	isFetchingConversations = false,
	isFetchingNextPage = false,
	hasFetchedInitialPage = false,
	isExhausted = false,
	nextCursor = nil,
	error = nil
}
local list = {
	"oldestConversationIsFetched", "isFetchingConversations", "isFetchingNextPage",
	"hasFetchedInitialPage", "isExhausted", "nextCursor", "error"
}
local t = {}

for _, value in list do
	t[value] = true
end
local function normalizeConversation(p1)
	return if p1 == nil or p1.id == nil then nil else {
		id = tostring(p1.id),
		source = p1.source,
		type = p1.type,
		createdAt = p1.createdAt,
		clientId = p1.clientId,
		initiator = p1.initiator,
		participants = p1.participants,
		conversationType = p1.conversationType,
		title = p1.title,
		titleForViewer = p1.titleForViewer,
		isDefaultTitle = p1.isDefaultTitle,
		lastUpdated = p1.lastUpdated,
		previewMessageId = p1.previewMessageId,
		previewContent = p1.previewContent,
		hasUnreadMessages = p1.hasUnreadMessages,
		hasGroupUp = p1.hasGroupUp,
		usersTyping = p1.usersTyping,
		isUserLeaving = p1.isUserLeaving,
		serverState = p1.serverState,
		pinnedGame = p1.pinnedGame,
		moderationType = p1.moderationType,
		userPendingStatus = p1.userPendingStatus,
		participantPendingStatus = p1.participantPendingStatus,
		callButtonEligibility = p1.callButtonEligibility,
		osaAcknowledgementStatus = p1.osaAcknowledgementStatus,
		userOptedIntoChatMessages = p1.userOptedIntoChatMessages,
		initialLoadingStatus = p1.initialLoadingStatus
	}
end

local function _(p1, p2)
	-- upvalues: CryoModule (copy)
	return if p1 == nil then p2 else CryoModule.Dictionary.join(p2, {
		usersTyping = p1.usersTyping,
		isUserLeaving = p1.isUserLeaving,
		pinnedGame = p1.pinnedGame
	})
end

local _ = function(Callback, p1)
	-- upvalues: list (copy)
	local t = {}
	local CallbackResult = Callback(p1)
	
	for _, value in list do
		t[value] = CallbackResult[value]
	end
	return t
end

local _ = function(List)
	for i in List do
		List[i] = nil
	end
end

return function()
	-- upvalues: CreateProxyFunction (copy), config (copy), list (copy), normalizeConversation (copy), CryoModule (copy), t (copy)
	local Proxy = CreateProxyFunction({})
	local Proxy1 = CreateProxyFunction({})
	local Proxy2 = CreateProxyFunction(table.clone(config))
	local List = {}
	
	return {
		getConversation = function(p2, p3)
			-- upvalues: Proxy (copy)
			return Proxy(p3)[p2]
		end,
		getConversations = function(p2)
			-- upvalues: Proxy (copy)
			local List = {}
			
			for _, value in Proxy(p2) do
				if value ~= nil then
					table.insert(List, value)
				end
			end
			return List
		end,
		getParticipantMetadata = function(p3, p4)
			-- upvalues: Proxy1 (copy)
			return Proxy1(p4)[p3]
		end,
		getListStatus = function(p3)
			-- upvalues: Proxy2 (copy), list (upval)
			local t = {}
			local ProxyResult = Proxy2(p3)
			
			for _, value in list do
				t[value] = ProxyResult[value]
			end
			return t
		end,
		listStatus = Proxy2,
		addClearListener = function(p4)
			-- upvalues: List (copy)
			table.insert(List, p4)
		end,
		upsertConversation = function(p4, Enabled)
			-- upvalues: normalizeConversation (upval), Proxy (copy), CryoModule (upval)
			local NormalizeConversationResult = normalizeConversation(p4)
			
			if NormalizeConversationResult == nil then return end
			local Id = NormalizeConversationResult.id
			local JoinResult = nil
			
			if Enabled == false then
				JoinResult = NormalizeConversationResult
			else
				local ProxyEntry = Proxy[Id]
				JoinResult = if ProxyEntry == nil then NormalizeConversationResult else CryoModule.Dictionary.join(NormalizeConversationResult, {
					usersTyping = ProxyEntry.usersTyping,
					isUserLeaving = ProxyEntry.isUserLeaving,
					pinnedGame = ProxyEntry.pinnedGame
				})
			end
			Proxy[Id] = JoinResult
		end,
		removeConversation = function(Key)
			-- upvalues: Proxy (copy), Proxy1 (copy)
			Proxy[Key] = nil
			Proxy1[Key] = nil
		end,
		setParticipantMetadata = function(Key, p4)
			-- upvalues: Proxy1 (copy)
			Proxy1[Key] = p4
		end,
		setUsersTyping = function(Key, UsersTyping)
			-- upvalues: Proxy (copy), CryoModule (upval)
			local ProxyEntry = Proxy[Key]
			
			if ProxyEntry ~= nil then
				Proxy[Key] = CryoModule.Dictionary.join(ProxyEntry, { usersTyping = UsersTyping })
				
				return
			end
		end,
		setListStatus = function(List)
			-- upvalues: t (upval), Proxy2 (copy), CryoModule (upval)
			for i, value in List do
				if t[i] == true then
					Proxy2[i] = if value == CryoModule.None then nil else value
				end
			end
		end,
		clear = function()
			-- upvalues: Proxy (copy), Proxy1 (copy), Proxy2 (copy), config (upval), t (upval), CryoModule (upval), List (copy)
			for i in Proxy do
				Proxy[i] = nil
			end
			for i1 in Proxy1 do
				Proxy1[i1] = nil
			end
			for i2 in Proxy2 do
				Proxy2[i2] = nil
			end
			for i3, value in config do
				if t[i3] == true then
					Proxy2[i3] = if value == CryoModule.None then nil else value
				end
			end
			for _, value1 in List do
				value1()
			end
		end
	}
end