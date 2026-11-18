local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.AppChatNetworking)
local ReactionsModule = require(Parent.Reactions)
local _ = require(Parent.ReactionsUserList)

return function(List, p1, Callback)
	-- upvalues: ReactionsModule (copy)
	local t = {}
	
	for _, value in List do
		local CallbackResult = Callback(value.emote_id)
		local NoCallbackResult = CallbackResult == nil
		local ReactionsPage = nil
		local Entry = nil
		
		if not NoCallbackResult then
			Entry = t[CallbackResult] or {}
			t[CallbackResult] = Entry
			ReactionsPage = value.reactions_page
			NoCallbackResult = ReactionsPage == nil
		end
		if not NoCallbackResult then
			table.move(ReactionsPage.reactors, 1, #ReactionsPage.reactors, #Entry + 1, Entry)
		end
	end
	local List1 = {}
	
	for _, reaction in ReactionsModule.Utils.getTopReactions(p1, 1e999).reactions do
		local Entry = t[reaction] or {}
		for i = #Entry, 1, -1 do
			table.insert(List1, {
				userId = tostring(Entry[i].user_id),
				reactionType = reaction
			})
		end
	end
	return List1
end