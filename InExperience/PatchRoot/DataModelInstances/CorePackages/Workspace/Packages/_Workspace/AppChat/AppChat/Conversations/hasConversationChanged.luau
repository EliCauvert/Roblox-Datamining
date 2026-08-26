local hasSameParticipantsModule = require(script.Parent.hasSameParticipants)

return function(p1)
	-- upvalues: hasSameParticipantsModule (ref)
	return if p1.existing then if p1.new.lastUpdated and p1.existing.lastUpdated and math.floor(p1.existing.lastUpdated:GetUnixTimestamp()) ~= math.floor(p1.new.lastUpdated:GetUnixTimestamp()) then true elseif p1.existing.title == p1.new.title then if hasSameParticipantsModule({
		existing = p1.existing.participants,
		new = p1.new.participants
	}) then p1.new.hasUnreadMessages and not p1.existing.hasUnreadMessages else true else true else true
end