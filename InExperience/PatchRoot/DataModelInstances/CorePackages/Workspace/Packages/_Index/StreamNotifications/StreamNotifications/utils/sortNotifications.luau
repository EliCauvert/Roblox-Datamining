local var0 = function(p0, p1)
	if p0.eventDate == "" or p0.eventDate == nil or (p1.eventDate == "" or p1.eventDate == nil) then
		return true
	end
	local eventDate = DateTime.fromIsoDate(p0.eventDate) or nil
	local eventDate_1 = DateTime.fromIsoDate(p1.eventDate) or nil
	
	return eventDate == nil or eventDate_1 == nil or eventDate_1.UnixTimestampMillis < eventDate.UnixTimestampMillis
end

return function(p2)
	-- upvalues: var0 (ref)
	local ok, status = pcall(function()
		-- upvalues: p2 (ref), var0 (copy)
		local cloned = table.clone(p2)
		table.sort(cloned, var0)
		
		return cloned
	end)
	
	return if ok then status else p2
end