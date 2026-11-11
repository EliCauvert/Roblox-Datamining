local function _(p1): boolean
	return p1.order ~= nil and (not p1.moderated and not p1.failed)
end

return function(p1, p2): boolean
	if p1.order and p2.order then
		return p1.order < p2.order
	elseif p1.order ~= nil and (not p1.moderated and not p1.failed) or p2.order ~= nil and (not p2.moderated and not p2.failed) then
		return p2.order ~= nil and (not p2.moderated and not p2.failed)
	else
		local UnixTimestamp = p1.sent and p1.sent:GetUnixTimestamp()
		local UnixTimestamp1 = p2.sent and p2.sent:GetUnixTimestamp()
		
		return if UnixTimestamp and UnixTimestamp1 and UnixTimestamp ~= UnixTimestamp1 then UnixTimestamp < UnixTimestamp1 elseif p1.id and p2.id and p1.id ~= p2.id then p2.id < p1.id else p2.moderated == true or p2.failed == true
	end
end