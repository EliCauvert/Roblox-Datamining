local _ = function(p0)
	return p0.order ~= nil and (not p0.moderated and not p0.failed)
end

return function(p1, p2)
	if p1.order and p2.order then
		return p1.order < p2.order
	end
	local var0 = p1.order ~= nil and (not p1.moderated and not p1.failed)
	
	if not var0 then
		var0 = p2.order ~= nil and (not p2.moderated and not p2.failed)
		
		if var0 then
			return p2.order ~= nil and (not p2.moderated and not p2.failed)
		else
			var0 = p1.sent and p1.sent:GetUnixTimestamp()
			local var1 = p2.sent and p2.sent:GetUnixTimestamp()
			
			return if var0 and var1 and var0 ~= var1 then var0 < var1 elseif p1.id and p2.id and p1.id ~= p2.id then p2.id < p1.id elseif p2.moderated ~= true then p2.failed == true else true
		end
	end
end