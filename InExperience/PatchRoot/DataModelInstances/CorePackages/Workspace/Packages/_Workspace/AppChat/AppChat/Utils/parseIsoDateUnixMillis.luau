return function(p1)
	if p1 == nil then
		return nil
	else
		local Success, Result = pcall(DateTime.fromIsoDate, p1)
		
		return if Success and Result ~= nil then Result.UnixTimestampMillis else nil
	end
end