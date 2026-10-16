return function(p1): boolean --[[ Line: 1 ]]
	return p1.existing and (p1.new.lastUpdated and p1.existing.lastUpdated and math.floor((p1.existing.lastUpdated:GetUnixTimestamp())) < math.floor((p1.new.lastUpdated:GetUnixTimestamp())) or p1.new.hasUnreadMessages and not p1.existing.hasUnreadMessages) or false
end