local FFlagEnableExperienceInviteCard = require(script:FindFirstAncestor("FriendsChat").Parent.SharedFlags).FFlagEnableExperienceInviteCard

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

local function hasExperienceInviteComponent(p2): boolean
	local Cards = p2.cards
	
	if type(Cards) ~= "table" then
		return false
	end
	for _, card in Cards do
		if type(card) == "table" and type(card.components) == "table" then
			for _, component in card.components do
				if type(component) == "table" and component.type == "experience_invite" then
					return true
				end
			end
		end
	end
	return false
end

local function _(p3)
	local Cards = p3.cards
	local Card = if type(Cards) == "table" then Cards[1] else nil
	
	return if type(Card) == "table" and type(Card.alt_text) == "string" and Card.alt_text ~= "" then Card.alt_text else p3.content or ""
end

local function classifySystemMessage(p3)
	-- upvalues: isPartySystemMessage (copy), FFlagEnableExperienceInviteCard (copy), hasExperienceInviteComponent (copy)
	local Cards = p3.cards
	local Card = if type(Cards) == "table" then Cards[1] else nil
	
	return {
		kind = "systemMessage",
		body = if type(Card) == "table" and type(Card.alt_text) == "string" and Card.alt_text ~= "" then Card.alt_text else p3.content or "",
		variant = if isPartySystemMessage(p3) then "party" elseif FFlagEnableExperienceInviteCard and hasExperienceInviteComponent(p3) then "experienceInvite" else "default"
	}
end

return function(p3)
	-- upvalues: classifySystemMessage (copy)
	if p3.type == "system" or p3.sender_user_id == nil then
		return { (classifySystemMessage(p3)) }
	end
	local SenderUserId = p3.sender_user_id
	local List = {}
	local RepliesTo = p3.replies_to
	
	if type(RepliesTo) == "table" and RepliesTo.sender_user_id ~= nil then
		table.insert(List, {
			kind = "replyHeader",
			senderUserId = SenderUserId,
			repliedToUserId = RepliesTo.sender_user_id
		})
	end
	local Status = p3.status
	local IsModerated: boolean = Status == "Moderated" or Status == "Failed"
	
	if p3.visibility == "hidden" then
		table.insert(List, { kind = "hiddenUser", senderUserId = SenderUserId })
	else
		table.insert(List, {
			kind = "userText",
			senderUserId = SenderUserId,
			body = p3.content or "",
			moderated = IsModerated,
			messageId = p3.id
		})
	end
	if IsModerated then
		table.insert(List, { kind = "moderationNotice" })
	end
	return List
end