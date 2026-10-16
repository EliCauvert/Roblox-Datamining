local HasSameParticipantsModule = require(script.Parent.hasSameParticipants)

return function(p1): boolean --[[ Line: 3 ]]
	-- upvalues: HasSameParticipantsModule (copy)
	return not p1.existing or (p1.new.lastUpdated and p1.existing.lastUpdated and math.floor((p1.existing.lastUpdated:GetUnixTimestamp())) ~= math.floor((p1.new.lastUpdated:GetUnixTimestamp())) or (p1.existing.title ~= p1.new.title or not HasSameParticipantsModule({
		existing = p1.existing.participants,
		new = p1.new.participants
	}) or (p1.new.hasUnreadMessages and not p1.existing.hasUnreadMessages or false)))
end