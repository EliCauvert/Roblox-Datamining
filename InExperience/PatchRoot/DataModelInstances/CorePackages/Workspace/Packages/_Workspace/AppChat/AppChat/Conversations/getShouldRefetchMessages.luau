return function(p0)
	return if p0.existing then if p0.new.lastUpdated and p0.existing.lastUpdated and math.floor(p0.existing.lastUpdated:GetUnixTimestamp()) < math.floor(p0.new.lastUpdated:GetUnixTimestamp()) then true else p0.new.hasUnreadMessages and not p0.existing.hasUnreadMessages else false
end