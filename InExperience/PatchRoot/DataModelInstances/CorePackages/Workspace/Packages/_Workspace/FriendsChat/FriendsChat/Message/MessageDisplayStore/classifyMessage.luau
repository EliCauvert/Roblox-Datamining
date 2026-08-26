local fFlagChatModeratedMaskRandomLength = require(script:FindFirstAncestor("FriendsChat").Parent.SharedFlags).FFlagChatModeratedMaskRandomLength

local function isPartySystemMessage(p1)
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

local function _(p2)
	local cards = p2.cards
	local var1 = if type(cards) == "table" then cards[1] else nil
	
	return if type(var1) == "table" and type(var1.alt_text) == "string" and var1.alt_text ~= "" then var1.alt_text else p2.content or ""
end

local _ = function(p2)
	-- upvalues: isPartySystemMessage (ref)
	local t = { kind = "systemMessage" }
	local cards = p2.cards
	local var1 = if type(cards) == "table" then cards[1] else nil
	t.body = if type(var1) == "table" and type(var1.alt_text) == "string" and var1.alt_text ~= "" then var1.alt_text else p2.content or ""
	t.variant = if isPartySystemMessage(p2) then "party" else "default"
	
	return t
end

return function(p2)
	-- upvalues: isPartySystemMessage (ref), fFlagChatModeratedMaskRandomLength (ref)
	local var1
	if p2.type == "system" or p2.sender_user_id == nil then
		local t = {}
		local t_1 = { kind = "systemMessage" }
		local cards = p2.cards
		var1 = if type(cards) == "table" then cards[1] else nil
		t_1.body = if type(var1) == "table" and type(var1.alt_text) == "string" and var1.alt_text ~= "" then var1.alt_text else p2.content or ""
		t_1.variant = if isPartySystemMessage(p2) then "party" else "default"
		-- Unknown statement at pc 6: <SetList>
		
		return t
	end
	local senderUserId = p2.sender_user_id
	local t = {}
	local repliesTo = p2.replies_to
	
	if type(repliesTo) == "table" and repliesTo.sender_user_id ~= nil then
		table.insert(t, {
			kind = "replyHeader",
			senderUserId = senderUserId,
			repliedToUserId = repliesTo.sender_user_id
		})
	end
	local status = p2.status
	var1 = if status ~= "Moderated" then status == "Failed" else true
	
	if p2.visibility == "hidden" then
		table.insert(t, { kind = "hiddenUser", senderUserId = senderUserId })
	else
		table.insert(t, {
			kind = "userText",
			senderUserId = senderUserId,
			body = p2.content or "",
			moderated = var1,
			messageId = if fFlagChatModeratedMaskRandomLength then p2.id else nil
		})
	end
	if var1 then
		table.insert(t, { kind = "moderationNotice" })
	end
	return t
end