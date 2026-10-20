local function _(p1): string
	return if p1 == nil then "" else tostring(p1)
end

local DomLocatorsModule = {
	sanitizeSegment = function(p1)
		return ((if p1 == nil then "" else tostring(p1)):gsub("%s+", "_"):gsub("[^%w_]", ""))
	end
}

function DomLocatorsModule.build(List): string
	-- upvalues: DomLocatorsModule (copy)
	local List1 = {}
	
	for _, value in List do
		local SanitizeSegmentResult = DomLocatorsModule.sanitizeSegment(value)
		
		if SanitizeSegmentResult ~= "" then
			table.insert(List1, SanitizeSegmentResult)
		end
	end
	return table.concat(List1, "-")
end

function DomLocatorsModule.chatLandingTopBarIconButton(p1)
	-- upvalues: DomLocatorsModule (copy)
	return DomLocatorsModule.build({
		"chat",
		"chatLanding",
		"topBar",
		"button",
		p1
	})
end

function DomLocatorsModule.chatLandingConversationListHeader(p1)
	-- upvalues: DomLocatorsModule (copy)
	return DomLocatorsModule.build({
		"chat",
		"chatLanding",
		"conversationList",
		"conversationListHeader",
		p1
	})
end

function DomLocatorsModule.chatLandingConversationEntry(p1)
	-- upvalues: DomLocatorsModule (copy)
	return DomLocatorsModule.build({
		"chat",
		"chatLanding",
		"conversationList",
		"conversationEntry",
		p1
	})
end

function DomLocatorsModule.chatLandingConversationEntrySquadButton(p1)
	-- upvalues: DomLocatorsModule (copy)
	return DomLocatorsModule.build({
		"chat", "chatLanding", "conversationList", "conversationEntry", "button",
		`squad_{p1}`
	})
end

function DomLocatorsModule.chatDetailsTopBarActionButton(p1)
	-- upvalues: DomLocatorsModule (copy)
	return DomLocatorsModule.build({
		"chat",
		"chatDetails",
		"topBar",
		"button",
		p1
	})
end

function DomLocatorsModule.chatDetailsListActionButton(p1)
	-- upvalues: DomLocatorsModule (copy)
	return DomLocatorsModule.build({
		"chat",
		"chatDetails",
		"detailsList",
		"button",
		p1
	})
end

function DomLocatorsModule.chatDetailsParticipantMoreButton(p1)
	-- upvalues: DomLocatorsModule (copy)
	return DomLocatorsModule.build({
		"chat", "chatDetails", "detailsList", "participantList", "participantEntry",
		"button", `{p1}_moreDetails`
	})
end

function DomLocatorsModule.chatConversationTopBarButton(p1)
	-- upvalues: DomLocatorsModule (copy)
	return DomLocatorsModule.build({
		"chat",
		"chatConversation",
		"topBar",
		"button",
		p1
	})
end

function DomLocatorsModule.chatConversationSystemMessageCard(List)
	-- upvalues: DomLocatorsModule (copy)
	return DomLocatorsModule.build({
		"chat",
		"chatConversation",
		"messageList",
		"systemMessageCard",
		if type(List) == "table" then table.concat(List, "_") else List
	})
end

function DomLocatorsModule.chatConversationSystemMessage(p1)
	-- upvalues: DomLocatorsModule (copy)
	return DomLocatorsModule.build({
		"chat",
		"chatConversation",
		"messageList",
		"systemMessageText",
		p1
	})
end

function DomLocatorsModule.selectChatMembersUserCellWithCheckbox(p1, p2)
	-- upvalues: DomLocatorsModule (copy)
	return DomLocatorsModule.build({
		"chat", "selectChatMembers", "friendsList", "userCellWithCheckbox", "checkbox",
		`{p1}_{if p2 then "checked" else "unchecked"}`
	})
end

function DomLocatorsModule.selectChatMembersSearchInput(p3)
	-- upvalues: DomLocatorsModule (copy)
	return DomLocatorsModule.build({
		"chat",
		"selectChatMembers",
		"searchBar",
		"textInput",
		p3
	})
end

function DomLocatorsModule.selectChatMembersTopBarActionButton(p3)
	-- upvalues: DomLocatorsModule (copy)
	return DomLocatorsModule.build({
		"chat",
		"selectChatMembers",
		"topBar",
		"button",
		p3
	})
end

return DomLocatorsModule