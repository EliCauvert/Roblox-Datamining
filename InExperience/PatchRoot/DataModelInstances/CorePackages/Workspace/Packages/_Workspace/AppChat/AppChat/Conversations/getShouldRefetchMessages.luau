return function(p1)
	return if p1.existing then if p1.new.lastUpdated and p1.existing.lastUpdated and math.floor(p1.existing.lastUpdated:GetUnixTimestamp()) < math.floor(p1.new.lastUpdated:GetUnixTimestamp()) then true else p1.new.hasUnreadMessages and not p1.existing.hasUnreadMessages else false
end