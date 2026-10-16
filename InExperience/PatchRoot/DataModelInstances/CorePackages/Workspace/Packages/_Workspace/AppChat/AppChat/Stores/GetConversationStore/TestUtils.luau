return {
	seedConversationStore = function(p1, p2, p3) --[[ Line: 2 ]]
		p1.clear()
		local Iterator = pairs
		local P1 = p2 or {}
		for _, value in Iterator(P1) do
			p1.upsertConversation(value)
		end
		if p3 ~= nil then
			p1.setListStatus(p3)
		end
	end
}