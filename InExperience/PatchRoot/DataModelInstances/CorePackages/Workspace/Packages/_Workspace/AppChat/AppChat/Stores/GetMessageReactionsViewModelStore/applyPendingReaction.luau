local _ = require(script:FindFirstAncestor("AppChat").Parent.AppChatNetworking)
local _ = require(script.Parent.Parent.GetMessageReactionsStore.createMessageReactionsStore)

local function removeViewer(Tbl, UserId)
	local Copy = table.clone(Tbl)
	Copy.count = Tbl.count - 1
	Copy.has_user_reacted = false
	local ReactionsPage = Tbl.reactions_page
	
	if ReactionsPage ~= nil then
		local Reactors = {}
		
		for _, reactor in ReactionsPage.reactors do
			if reactor.user_id ~= UserId then
				table.insert(Reactors, reactor)
			end
		end
		local Copy1 = table.clone(ReactionsPage)
		Copy1.reactors = Reactors
		Copy.reactions_page = Copy1
	end
	return Copy
end

local function addViewer(Tbl, User_id)
	local Copy = table.clone(Tbl)
	Copy.count = Tbl.count + 1
	Copy.has_user_reacted = true
	
	if User_id ~= nil then
		local ReactionsPage = Tbl.reactions_page
		local Reactors = { { user_id = User_id } }
		
		if ReactionsPage == nil then
			Copy.reactions_page = { reactors = Reactors }
		else
			for _, reactor in ReactionsPage.reactors do
				table.insert(Reactors, reactor)
			end
			local Copy1 = table.clone(ReactionsPage)
			Copy1.reactors = Reactors
			Copy.reactions_page = Copy1
			
			return Copy
		end
	end
	return Copy
end

return function(p1, User_id)
	-- upvalues: removeViewer (copy), addViewer (copy)
	local Pending = p1.pending
	
	if Pending == nil then
		return p1.reactions
	end
	local EmoteId = Pending.emoteId
	local Flag = false
	local List = {}
	
	for _, reaction in p1.reactions do
		local IsEmoteIdMatch = reaction.emote_id == EmoteId
		
		if IsEmoteIdMatch then
			Flag = true
		end
		if reaction.has_user_reacted and not IsEmoteIdMatch then
			if reaction.count > 1 then
				table.insert(List, (removeViewer(reaction, User_id)))
			end
		elseif IsEmoteIdMatch and not reaction.has_user_reacted then
			table.insert(List, (addViewer(reaction, User_id)))
		else
			table.insert(List, reaction)
		end
	end
	if EmoteId ~= nil and not Flag then
		table.insert(List, (addViewer({ count = 0, emote_id = EmoteId }, User_id)))
	end
	return List
end