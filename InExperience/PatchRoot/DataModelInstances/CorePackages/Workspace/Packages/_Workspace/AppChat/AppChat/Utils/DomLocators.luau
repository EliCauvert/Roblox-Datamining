local t = {
	sanitizeSegment = function(p0)
		return (if p0 == nil then "" else tostring(p0)):gsub("%s+", "_"):gsub("[^%w_]", "")
	end
}

local function _(p1)
	return if p1 == nil then "" else tostring(p1)
end

function t.build(p2)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in p2 do
		local var2 = t.sanitizeSegment(v)
		
		if var2 ~= "" then
			table.insert(t_1, var2)
		end
	end
	return table.concat(t_1, "-")
end

function t.chatLandingTopBarIconButton(p3)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"chatLanding",
		"topBar",
		"button",
		p3
	})
end

function t.appChatLoadingOverlayBackButton()
	-- upvalues: t (ref)
	return t.build({ "chat", "loadingOverlay", "button", "back" })
end

function t.chatLandingConversationListHeader(p4)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"chatLanding",
		"conversationList",
		"conversationListHeader",
		p4
	})
end

function t.chatLandingConversationEntry(p5)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"chatLanding",
		"conversationList",
		"conversationEntry",
		p5
	})
end

function t.chatLandingConversationEntrySquadButton(p6)
	-- upvalues: t (ref)
	return t.build({
		"chat", "chatLanding", "conversationList", "conversationEntry", "button",
		`squad_{p6}`
	})
end

function t.chatDetailsTopBarActionButton(p7)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"chatDetails",
		"topBar",
		"button",
		p7
	})
end

function t.chatDetailsListActionButton(p8)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"chatDetails",
		"detailsList",
		"button",
		p8
	})
end

function t.chatDetailsParticipantMoreButton(p9)
	-- upvalues: t (ref)
	return t.build({
		"chat", "chatDetails", "detailsList", "participantList", "participantEntry",
		"button", `{p9}_moreDetails`
	})
end

function t.chatConversationTopBarButton(p10)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"chatConversation",
		"topBar",
		"button",
		p10
	})
end

function t.chatConversationSystemMessageCard(p11)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"chatConversation",
		"messageList",
		"systemMessageCard",
		if type(p11) == "table" then table.concat(p11, "_") else p11
	})
end

function t.chatConversationSystemMessage(p12)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"chatConversation",
		"messageList",
		"systemMessageText",
		p12
	})
end

function t.selectChatMembersUserCellWithCheckbox(p13, p14)
	-- upvalues: t (ref)
	return t.build({
		"chat", "selectChatMembers", "friendsList", "userCellWithCheckbox", "checkbox",
		`{p13}_{if p14 then "checked" else "unchecked"}`
	})
end

function t.selectChatMembersSearchInput(p15)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"selectChatMembers",
		"searchBar",
		"textInput",
		p15
	})
end

function t.selectChatMembersTopBarActionButton(p16)
	-- upvalues: t (ref)
	return t.build({
		"chat",
		"selectChatMembers",
		"topBar",
		"button",
		p16
	})
end

return t