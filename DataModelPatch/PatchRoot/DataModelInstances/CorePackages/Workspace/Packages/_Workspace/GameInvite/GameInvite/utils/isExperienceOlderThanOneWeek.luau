local Workspace = game:GetService("Workspace")

return function(p1): boolean
	-- upvalues: Workspace (copy)
	if p1 ~= nil and p1.Created ~= nil then
		local _DateTime = DateTime.fromIsoDate(p1.Created)
		
		if _DateTime and Workspace:GetServerTimeNow() * 1000 - _DateTime.UnixTimestampMillis > 604800000 then
			return true
		end
	end
	return false
end