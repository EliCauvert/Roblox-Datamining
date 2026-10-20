local function isPartySystemMessage(p1): boolean
	local Cards = p1.cards
	
	if type(Cards) ~= "table" then
		return false
	end
	for _, card in Cards do
		if type(card) == "table" and type(card.components) == "table" then
			for _, component in card.components do
				if type(component) == "table" then
					local Type = component.type
					
					if Type == "group_up" or Type == "scheduled_group_up" then
						return true
					end
				end
			end
		end
	end
	return false
end

local function _(p2)
	local Cards = p2.cards
	local Card = if type(Cards) == "table" then Cards[1] else nil
	
	return if type(Card) == "table" and type(Card.alt_text) == "string" and Card.alt_text ~= "" then Card.alt_text else p2.content or ""
end

local _ = function(p2)
	-- upvalues: isPartySystemMessage (copy)
	local Cards = p2.cards
	local Card = if type(Cards) == "table" then Cards[1] else nil
	
	return {
		kind = "systemMessage",
		body = if type(Card) == "table" and type(Card.alt_text) == "string" and Card.alt_text ~= "" then Card.alt_text else p2.content or "",
		variant = if isPartySystemMessage(p2) then "party" else "default"
	}
end

return function(p2)
	-- upvalues: isPartySystemMessage (copy)
	if p2.type == "system" or p2.sender_user_id == nil then
		local Cards = p2.cards
		local Card = if type(Cards) == "table" then Cards[1] else nil
		
		return {
			{
				kind = "systemMessage",
				body = if type(Card) == "table" and type(Card.alt_text) == "string" and Card.alt_text ~= "" then Card.alt_text else p2.content or "",
				variant = if isPartySystemMessage(p2) then "party" else "default"
			}
		}
	end
	local SenderUserId = p2.sender_user_id
	local List = {}
	local RepliesTo = p2.replies_to
	
	if type(RepliesTo) == "table" and RepliesTo.sender_user_id ~= nil then
		table.insert(List, {
			kind = "replyHeader",
			senderUserId = SenderUserId,
			repliedToUserId = RepliesTo.sender_user_id
		})
	end
	local Status = p2.status
	local IsModerated: boolean = Status == "Moderated" or Status == "Failed"
	
	if p2.visibility == "hidden" then
		table.insert(List, { kind = "hiddenUser", senderUserId = SenderUserId })
	else
		table.insert(List, {
			kind = "userText",
			senderUserId = SenderUserId,
			body = p2.content or "",
			moderated = IsModerated,
			messageId = p2.id
		})
	end
	if IsModerated then
		table.insert(List, { kind = "moderationNotice" })
	end
	return List
end