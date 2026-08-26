local var1 = function(p1, p2)
	if p1.eventDate == "" or p1.eventDate == nil or (p2.eventDate == "" or p2.eventDate == nil) then
		return true
	end
	local eventDate = DateTime.fromIsoDate(p1.eventDate) or nil
	local eventDate_1 = DateTime.fromIsoDate(p2.eventDate) or nil
	
	return eventDate == nil or eventDate_1 == nil or eventDate_1.UnixTimestampMillis < eventDate.UnixTimestampMillis
end

return function(p1)
	-- upvalues: var1 (ref)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), var1 (copy)
		local cloned = table.clone(p1)
		table.sort(cloned, var1)
		
		return cloned
	end)
	
	return if ok then status else p1
end