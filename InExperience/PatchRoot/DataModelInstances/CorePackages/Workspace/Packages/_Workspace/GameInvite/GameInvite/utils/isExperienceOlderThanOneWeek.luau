local workspaceService = game:GetService("Workspace")

return function(p1)
	-- upvalues: workspaceService (ref)
	if p1 ~= nil and p1.Created ~= nil then
		local dateTime = DateTime.fromIsoDate(p1.Created)
		
		return dateTime and workspaceService:GetServerTimeNow() * 1000 - dateTime.UnixTimestampMillis > 604800000
	end
end