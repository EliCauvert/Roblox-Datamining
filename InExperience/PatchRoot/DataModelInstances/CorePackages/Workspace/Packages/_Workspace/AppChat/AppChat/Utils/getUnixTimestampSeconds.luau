local _ = script:FindFirstAncestor("AppChat").Parent

return function(p1)
	return if typeof(p1) == "DateTime" then p1.UnixTimestamp elseif type(p1) == "table" and p1.GetUnixTimestamp ~= nil then p1:GetUnixTimestamp() else nil
end