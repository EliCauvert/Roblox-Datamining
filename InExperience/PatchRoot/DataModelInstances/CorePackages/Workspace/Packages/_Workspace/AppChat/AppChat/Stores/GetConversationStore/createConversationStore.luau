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
local function normalizeConversation(p0)
	return if p0 == nil or p0.id == nil then nil else {
		id = tostring(p0.id),
		source = p0.source,
		type = p0.type,
		createdAt = p0.createdAt,
		clientId = p0.clientId,
		initiator = p0.initiator,
		participants = p0.participants,
		conversationType = p0.conversationType,
		title = p0.title,
		titleForViewer = p0.titleForViewer,
		isDefaultTitle = p0.isDefaultTitle,
		lastUpdated = p0.lastUpdated,
		previewMessageId = p0.previewMessageId,
		previewContent = p0.previewContent,
		hasUnreadMessages = p0.hasUnreadMessages,
		hasGroupUp = p0.hasGroupUp,
		usersTyping = p0.usersTyping,
		isUserLeaving = p0.isUserLeaving,
		serverState = p0.serverState,
		pinnedGame = p0.pinnedGame,
		moderationType = p0.moderationType,
		userPendingStatus = p0.userPendingStatus,
		participantPendingStatus = p0.participantPendingStatus,
		osaAcknowledgementStatus = p0.osaAcknowledgementStatus,
		userOptedIntoChatMessages = p0.userOptedIntoChatMessages,
		initialLoadingStatus = p0.initialLoadingStatus
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

local _ = function(p3, p4)
	-- upvalues: list (ref)
	local t = {}
	local var6 = p3(p4)
	
	for i, v in list do
		t[v] = var6[v]
	end
	return t
end

i = function(p5)
	for i in p5 do
		p5[i] = nil
	end
end

return function()
	-- upvalues: createProxy (ref), t (ref), list (ref), normalizeConversation (ref), cryoModule (ref), t_1 (ref)
	local var7 = createProxy({})
	local var8 = createProxy({})
	local var9 = createProxy(table.clone(t))
	local t_2 = {}
	
	return {
		getConversation = function(p6, p7)
			-- upvalues: var7 (ref)
			return var7(p7)[p6]
		end,
		getConversations = function(p8)
			-- upvalues: var7 (ref)
			local t = {}
			
			for i, v in var7(p8) do
				if v ~= nil then
					table.insert(t, v)
				end
			end
			return t
		end,
		getParticipantMetadata = function(p9, p10)
			-- upvalues: var8 (ref)
			return var8(p10)[p9]
		end,
		getListStatus = function(p11)
			-- upvalues: var9 (ref), list (copy)
			local t = {}
			local var13 = var9(p11)
			
			for i, v in list do
				t[v] = var13[v]
			end
			return t
		end,
		listStatus = var9,
		addClearListener = function(p12)
			-- upvalues: t_2 (ref)
			table.insert(t_2, p12)
		end,
		upsertConversation = function(p13, p14)
			-- upvalues: normalizeConversation (copy), var7 (ref), cryoModule (copy)
			local var14 = normalizeConversation(p13)
			
			if var14 == nil then return end
			local var15
			local id = var14.id
			
			if p14 == false then
				var15 = var14
			else
				local var16 = var7[id]
				var15 = if var16 == nil then var14 else cryoModule.Dictionary.join(var14, {
					usersTyping = var16.usersTyping,
					isUserLeaving = var16.isUserLeaving,
					pinnedGame = var16.pinnedGame
				})
			end
			var7[id] = var15
		end,
		removeConversation = function(p15)
			-- upvalues: var7 (ref), var8 (ref)
			var7[p15] = nil
			var8[p15] = nil
		end,
		setParticipantMetadata = function(value, p16)
			-- upvalues: var8 (ref)
			var8[value] = p16
		end,
		setUsersTyping = function(value, p17)
			-- upvalues: var7 (ref), cryoModule (copy)
			local var17 = var7[value]
			
			if var17 == nil then
				return
			end
			var7[value] = cryoModule.Dictionary.join(var17, { usersTyping = p17 })
		end,
		setListStatus = function(value)
			-- upvalues: t_1 (copy), var9 (ref), cryoModule (copy)
			for i, v in value do
				if t_1[i] == true then
					var9[i] = if v == cryoModule.None then nil else v
				end
			end
		end,
		clear = function()
			-- upvalues: var7 (ref), var8 (ref), var9 (ref), t (copy), t_1 (copy), cryoModule (copy), t_2 (ref)
			for i in var7 do
				var7[i] = nil
			end
			for i_1 in var8 do
				var8[i_1] = nil
			end
			for i_2 in var9 do
				var9[i_2] = nil
			end
			for i_3, v in t do
				if t_1[i_3] == true then
					var9[i_3] = if v == cryoModule.None then nil else v
				end
			end
			for i_4, v_1 in t_2 do
				v_1()
			end
		end
	}
end