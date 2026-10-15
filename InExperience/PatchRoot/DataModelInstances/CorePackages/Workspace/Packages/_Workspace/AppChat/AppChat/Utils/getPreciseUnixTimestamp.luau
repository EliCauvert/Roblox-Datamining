return function(p1)
	if typeof(p1) == "DateTime" then
		return p1.UnixTimestampMillis / 1000
	elseif type(p1) == "string" then
		local ok, status = pcall(DateTime.fromIsoDate, p1)
		
		return if ok and status ~= nil then status.UnixTimestampMillis / 1000 else nil
	end
	return if type(p1) == "table" and p1.GetUnixTimestamp ~= nil then p1:GetUnixTimestamp() else nil
end