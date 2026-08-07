local workspaceService = game:GetService("Workspace")

return function(p0) --[[ line: 7 ]]
	-- upvalues: workspaceService (ref)
	if p0 ~= nil and p0.Created ~= nil then
		local dateTime = DateTime.fromIsoDate(p0.Created)
		
		return dateTime and workspaceService:GetServerTimeNow() * 1000 - dateTime.UnixTimestampMillis > 604800000
	end
end