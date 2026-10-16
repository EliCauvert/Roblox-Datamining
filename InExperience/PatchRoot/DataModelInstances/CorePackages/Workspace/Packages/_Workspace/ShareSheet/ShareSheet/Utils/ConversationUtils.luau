local _ = require(script:FindFirstAncestor("ShareSheet").Types)

return {
	getDisplayName = function(p1) --[[ Line: 9 ]]
		local TitleForViewer = p1.titleForViewer
		
		return if TitleForViewer and TitleForViewer ~= "" then TitleForViewer else p1.title or ""
	end,
	getParticipantUserIds = function(p1, p2) --[[ Line: 14 ]]
		local List = {}
		local Participants = p1.participants
		
		if Participants then
			for _, participant in Participants do
				if participant ~= p2 then
					table.insert(List, participant)
				end
			end
		end
		local Entry = List[1] or p2
		
		if #List >= 2 then
			return Entry, List[2]
		else
			return Entry, nil
		end
	end
}