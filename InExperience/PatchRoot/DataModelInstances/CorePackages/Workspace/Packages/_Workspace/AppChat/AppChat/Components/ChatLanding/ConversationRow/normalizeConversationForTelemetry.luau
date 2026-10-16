local function normalizeParticipants(Participants) --[[ Line: 1 ]]
	if type(Participants) ~= "table" then
		return Participants
	end
	local t = {}
	
	for i, participant in Participants do
		t[i] = if type(participant) == "table" then participant else { id = tostring(participant) }
	end
	return t
end

return function(Tbl) --[[ Line: 18 | Named "normalizeConversationForTelemetry" ]]
	-- upvalues: normalizeParticipants (copy)
	local Copy = table.clone(Tbl)
	Copy.participants = normalizeParticipants(Tbl.participants)
	
	return Copy
end