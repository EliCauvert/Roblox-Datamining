return function(p1) --[[ Line: 4 | Named "getPreciseUnixTimestamp" ]]
	if typeof(p1) == "DateTime" then
		return p1.UnixTimestampMillis / 1000
	elseif type(p1) == "string" then
		local Success, Result = pcall(DateTime.fromIsoDate, p1)
		
		return if Success and Result ~= nil then Result.UnixTimestampMillis / 1000 else nil
	else
		return if type(p1) == "table" and p1.GetUnixTimestamp ~= nil then p1:GetUnixTimestamp() else nil
	end
end