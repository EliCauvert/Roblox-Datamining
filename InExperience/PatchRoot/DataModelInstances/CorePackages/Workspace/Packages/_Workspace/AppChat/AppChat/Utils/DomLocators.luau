local t = {
	sanitizeSegment = function(p1)
		return (if p1 == nil then "" else tostring(p1)):gsub("%s+", "_"):gsub("[^%w_]", "")
	end
}

local function _(p1)
	return if p1 == nil then "" else tostring(p1)
end

function t.build(p1)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in p1 do
		local var1 = t.sanitizeSegment(v)
		
		if var1 ~= "" then
			table.insert(t_1, var1)
		end
	end
	return table.concat(t_1, "-")
end

function t.chatLandingTopBarIconButton(p2)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"chatLanding",
		"topBar",
		"button",
		p2
	})
end

function t.appChatLoadingOverlayBackButton()
	-- upvalues: t (ref)
	return t.build({ "chat", "loadingOverlay", "button", "back" })
end

function t.chatLandingConversationListHeader(p2)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"chatLanding",
		"conversationList",
		"conversationListHeader",
		p2
	})
end

function t.chatLandingConversationEntry(p2)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"chatLanding",
		"conversationList",
		"conversationEntry",
		p2
	})
end

function t.chatLandingConversationEntrySquadButton(p2)
	-- upvalues: t (ref)
	return t.build({
		"chat", "chatLanding", "conversationList", "conversationEntry", "button",
		`squad_{p2}`
	})
end

function t.chatDetailsTopBarActionButton(p2)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"chatDetails",
		"topBar",
		"button",
		p2
	})
end

function t.chatDetailsListActionButton(p2)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"chatDetails",
		"detailsList",
		"button",
		p2
	})
end

function t.chatDetailsParticipantMoreButton(p2)
	-- upvalues: t (ref)
	return t.build({
		"chat", "chatDetails", "detailsList", "participantList", "participantEntry",
		"button", `{p2}_moreDetails`
	})
end

function t.chatConversationTopBarButton(p2)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"chatConversation",
		"topBar",
		"button",
		p2
	})
end

function t.chatConversationSystemMessageCard(p2)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"chatConversation",
		"messageList",
		"systemMessageCard",
		if type(p2) == "table" then table.concat(p2, "_") else p2
	})
end

function t.chatConversationSystemMessage(p2)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"chatConversation",
		"messageList",
		"systemMessageText",
		p2
	})
end

function t.selectChatMembersUserCellWithCheckbox(p2, p3)
	-- upvalues: t (ref)
	return t.build({
		"chat", "selectChatMembers", "friendsList", "userCellWithCheckbox", "checkbox",
		`{p2}_{if p3 then "checked" else "unchecked"}`
	})
end

function t.selectChatMembersSearchInput(p4)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"selectChatMembers",
		"searchBar",
		"textInput",
		p4
	})
end

function t.selectChatMembersTopBarActionButton(p4)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"selectChatMembers",
		"topBar",
		"button",
		p4
	})
end

return t