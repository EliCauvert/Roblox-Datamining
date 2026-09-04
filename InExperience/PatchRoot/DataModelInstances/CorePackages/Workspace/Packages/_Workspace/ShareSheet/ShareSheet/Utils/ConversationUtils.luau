local _ = require(script:FindFirstAncestor("ShareSheet").Parent.AppChat.GetConversationListStore)

return {
	getDisplayName = function(p1)
		local titleForViewer = p1.titleForViewer
		
		return if titleForViewer and titleForViewer ~= "" then titleForViewer else p1.title or ""
	end,
	getParticipantUserIds = function(p1, p2)
		local t = {}
		local participants = p1.participants
		
		if participants then
			for i, v in participants do
				if v ~= p2 then
					table.insert(t, v)
				end
			end
		end
		local var1 = t[1] or p2
		
		if #t >= 2 then
			return var1, t[2]
		end
		return var1, nil
	end
}