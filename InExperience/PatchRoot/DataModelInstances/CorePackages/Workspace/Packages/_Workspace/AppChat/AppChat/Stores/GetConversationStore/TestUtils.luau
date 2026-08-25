return {
	seedConversationStore = function(p0, p1, p2)
		p0.clear()
		
		for i, v in pairs(p1 or {}) do
			p0.upsertConversation(v)
		end
		if p2 ~= nil then
			p0.setListStatus(p2)
		end
	end
}