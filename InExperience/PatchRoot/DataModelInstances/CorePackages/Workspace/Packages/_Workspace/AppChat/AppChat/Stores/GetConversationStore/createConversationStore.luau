local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local createProxy = require(parent.SignalsExperimental).createProxy
local t = {
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
local t_1 = {}

for i, v in list do
	t_1[v] = true
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
		osaAcknowledgementStatus = p1.osaAcknowledgementStatus,
		userOptedIntoChatMessages = p1.userOptedIntoChatMessages,
		initialLoadingStatus = p1.initialLoadingStatus
	}
end

local function _(p1, p2)
	-- upvalues: cryoModule (ref)
	return if p1 == nil then p2 else cryoModule.Dictionary.join(p2, {
		usersTyping = p1.usersTyping,
		isUserLeaving = p1.isUserLeaving,
		pinnedGame = p1.pinnedGame
	})
end

local _ = function(p1, p2)
	-- upvalues: list (ref)
	local t = {}
	local var1 = p1(p2)
	
	for i, v in list do
		t[v] = var1[v]
	end
	return t
end

i = function(p3)
	for i in p3 do
		p3[i] = nil
	end
end

return function()
	-- upvalues: createProxy (ref), t (ref), list (ref), normalizeConversation (ref), cryoModule (ref), t_1 (ref)
	local var2 = createProxy({})
	local var3 = createProxy({})
	local var4 = createProxy(table.clone(t))
	local t_2 = {}
	
	return {
		getConversation = function(p4, p5)
			-- upvalues: var2 (ref)
			return var2(p5)[p4]
		end,
		getConversations = function(p4)
			-- upvalues: var2 (ref)
			local t = {}
			
			for i, v in var2(p4) do
				if v ~= nil then
					table.insert(t, v)
				end
			end
			return t
		end,
		getParticipantMetadata = function(p5, p6)
			-- upvalues: var3 (ref)
			return var3(p6)[p5]
		end,
		getListStatus = function(p5)
			-- upvalues: var4 (ref), list (copy)
			local t = {}
			local var5 = var4(p5)
			
			for i, v in list do
				t[v] = var5[v]
			end
			return t
		end,
		listStatus = var4,
		addClearListener = function(p6)
			-- upvalues: t_2 (ref)
			table.insert(t_2, p6)
		end,
		upsertConversation = function(p6, p7)
			-- upvalues: normalizeConversation (copy), var2 (ref), cryoModule (copy)
			local var6 = normalizeConversation(p6)
			
			if var6 == nil then return end
			local var7
			local id = var6.id
			
			if p7 == false then
				var7 = var6
			else
				local var8 = var2[id]
				var7 = if var8 == nil then var6 else cryoModule.Dictionary.join(var6, {
					usersTyping = var8.usersTyping,
					isUserLeaving = var8.isUserLeaving,
					pinnedGame = var8.pinnedGame
				})
			end
			var2[id] = var7
		end,
		removeConversation = function(p6)
			-- upvalues: var2 (ref), var3 (ref)
			var2[p6] = nil
			var3[p6] = nil
		end,
		setParticipantMetadata = function(value, p6)
			-- upvalues: var3 (ref)
			var3[value] = p6
		end,
		setUsersTyping = function(value, p6)
			-- upvalues: var2 (ref), cryoModule (copy)
			local var6 = var2[value]
			
			if var6 == nil then
				return
			end
			var2[value] = cryoModule.Dictionary.join(var6, { usersTyping = p6 })
		end,
		setListStatus = function(value)
			-- upvalues: t_1 (copy), var4 (ref), cryoModule (copy)
			for i, v in value do
				if t_1[i] == true then
					var4[i] = if v == cryoModule.None then nil else v
				end
			end
		end,
		clear = function()
			-- upvalues: var2 (ref), var3 (ref), var4 (ref), t (copy), t_1 (copy), cryoModule (copy), t_2 (ref)
			for i in var2 do
				var2[i] = nil
			end
			for i_1 in var3 do
				var3[i_1] = nil
			end
			for i_2 in var4 do
				var4[i_2] = nil
			end
			for i_3, v in t do
				if t_1[i_3] == true then
					var4[i_3] = if v == cryoModule.None then nil else v
				end
			end
			for i_4, v_1 in t_2 do
				v_1()
			end
		end
	}
end