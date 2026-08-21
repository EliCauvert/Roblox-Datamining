local parent = script:FindFirstAncestor("FriendsChat").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local chatAiAgentMessageTransformModule = require(parent.AppChat.ChatAiAgentMessageTransform)
local fFlagChatModeratedMaskRandomLength = sharedFlagsModule.FFlagChatModeratedMaskRandomLength
local fFlagChatAiAgentToggle = sharedFlagsModule.FFlagChatAiAgentToggle
local var2 = false

local function _(p0) --[[ line: 67 | named "logAiAgentDisplayTransformOnce" ]]
	-- upvalues: var2 (write)
	if var2 then
		return
	end
	var2 = true
	print(`[ChatAiAgent] Display transform active \226\128\148 {p0}`)
end

local function isPartySystemMessage(p1) --[[ line: 75 ]]
	local cards = p1.cards
	
	if type(cards) ~= "table" then
		return false
	end
	for i, v in cards do
		if type(v) == "table" and type(v.components) == "table" then
			for i_1, v_1 in v.components do
				if type(v_1) == "table" then
					local type = v_1.type
					
					if type == "group_up" or type == "scheduled_group_up" then
						return true
					end
				end
			end
		end
	end
	return false
end

local _ = function(p2) --[[ line: 99 | named "getSystemMessageBody" ]]
	local cards = p2.cards
	local var4 = if type(cards) == "table" then cards[1] else nil
	
	return if type(var4) == "table" and type(var4.alt_text) == "string" and var4.alt_text ~= "" then var4.alt_text else p2.content or ""
end

local _ = function(p3) --[[ line: 108 | named "classifySystemMessage" ]]
	-- upvalues: isPartySystemMessage (ref)
	local t = { kind = "systemMessage" }
	local cards = p3.cards
	local var6 = if type(cards) == "table" then cards[1] else nil
	t.body = if type(var6) == "table" and type(var6.alt_text) == "string" and var6.alt_text ~= "" then var6.alt_text else p3.content or ""
	t.variant = if isPartySystemMessage(p3) then "party" else "default"
	
	return t
end

return function(p4) --[[ line: 116 | named "classifyMessage" ]]
	-- upvalues: fFlagChatAiAgentToggle (ref), chatAiAgentMessageTransformModule (ref), var2 (write), isPartySystemMessage (ref), fFlagChatModeratedMaskRandomLength (ref)
	local var10
	if p4.type == "system" or p4.sender_user_id == nil then
		if fFlagChatAiAgentToggle then
			local content = p4.content or ""
			
			if chatAiAgentMessageTransformModule.containsAiResponseMarker(content) then
				if not var2 then
					var2 = true
					print("[ChatAiAgent] Display transform active \226\128\148 rendering @ai agent response as Assistant")
				end
				return {
					{
						kind = "userText",
						moderated = false,
						senderUserId = p4.sender_user_id or 0,
						body = chatAiAgentMessageTransformModule.stripAiResponseMarker(content),
						displayNameOverride = chatAiAgentMessageTransformModule.ASSISTANT_DISPLAY_NAME
					}
				}
			else
				local t = {}
				local t_1 = { kind = "systemMessage" }
				local cards = p4.cards
				var10 = if type(cards) == "table" then cards[1] else nil
				t_1.body = if type(var10) == "table" and type(var10.alt_text) == "string" and var10.alt_text ~= "" then var10.alt_text else p4.content or ""
				t_1.variant = if isPartySystemMessage(p4) then "party" else "default"
				-- Unknown statement at pc 6: <SetList>
				
				return t
			end
		end
	else
		local senderUserId = p4.sender_user_id
		local t = {}
		local repliesTo = p4.replies_to
		
		if type(repliesTo) == "table" and repliesTo.sender_user_id ~= nil then
			table.insert(t, {
				kind = "replyHeader",
				senderUserId = senderUserId,
				repliedToUserId = repliesTo.sender_user_id
			})
		end
		local status = p4.status
		var10 = if status ~= "Moderated" then status == "Failed" else true
		
		if p4.visibility == "hidden" then
			table.insert(t, { kind = "hiddenUser", senderUserId = senderUserId })
		else
			local content = p4.content or ""
			local ASSISTANT_DISPLAY_NAME = nil
			
			if fFlagChatAiAgentToggle then
				if chatAiAgentMessageTransformModule.containsAiResponseMarker(content) then
					if not var2 then
						var2 = true
						print("[ChatAiAgent] Display transform active \226\128\148 rendering @ai agent response as Assistant")
					end
					content = chatAiAgentMessageTransformModule.stripAiResponseMarker(content)
					ASSISTANT_DISPLAY_NAME = chatAiAgentMessageTransformModule.ASSISTANT_DISPLAY_NAME
				else
					local var13 = chatAiAgentMessageTransformModule.stripUserSendPrefixForDisplay(content)
					
					if var13 ~= content and not var2 then
						var2 = true
						print("[ChatAiAgent] Display transform active \226\128\148 hiding @roblox agent prefix from displayed user messages")
					end
					content = var13
				end
			end
			table.insert(t, {
				kind = "userText",
				senderUserId = senderUserId,
				body = content,
				moderated = var10,
				messageId = if fFlagChatModeratedMaskRandomLength then p4.id else nil,
				displayNameOverride = ASSISTANT_DISPLAY_NAME
			})
		end
		if var10 then
			table.insert(t, { kind = "moderationNotice" })
		end
		return t
	end
end