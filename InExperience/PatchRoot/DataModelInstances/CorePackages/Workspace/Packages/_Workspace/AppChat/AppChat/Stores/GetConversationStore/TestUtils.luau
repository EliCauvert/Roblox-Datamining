return {
	seedConversationStore = function(p1, p2, p3)
		p1.clear()
		
		for i, v in pairs(p2 or {}) do
			p1.upsertConversation(v)
		end
		if p3 ~= nil then
			p1.setListStatus(p3)
		end
	end
}