local hasSameParticipantsModule = require(script.Parent.hasSameParticipants)

return function(p0) --[[ line: 3 ]]
	-- upvalues: hasSameParticipantsModule (ref)
	return if p0.existing then if p0.new.lastUpdated and p0.existing.lastUpdated and math.floor(p0.existing.lastUpdated:GetUnixTimestamp()) ~= math.floor(p0.new.lastUpdated:GetUnixTimestamp()) then true elseif p0.existing.title == p0.new.title then if hasSameParticipantsModule({
		existing = p0.existing.participants,
		new = p0.new.participants
	}) then p0.new.hasUnreadMessages and not p0.existing.hasUnreadMessages else true else true else true
end