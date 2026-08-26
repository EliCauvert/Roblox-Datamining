local _ = function(p1)
	return p1.order ~= nil and (not p1.moderated and not p1.failed)
end

return function(p1, p2)
	if p1.order and p2.order then
		return p1.order < p2.order
	end
	local var1 = p1.order ~= nil and (not p1.moderated and not p1.failed)
	
	if not var1 then
		var1 = p2.order ~= nil and (not p2.moderated and not p2.failed)
		
		if var1 then
			return p2.order ~= nil and (not p2.moderated and not p2.failed)
		else
			var1 = p1.sent and p1.sent:GetUnixTimestamp()
			local var2 = p2.sent and p2.sent:GetUnixTimestamp()
			
			return if var1 and var2 and var1 ~= var2 then var1 < var2 elseif p1.id and p2.id and p1.id ~= p2.id then p2.id < p1.id elseif p2.moderated ~= true then p2.failed == true else true
		end
	end
end