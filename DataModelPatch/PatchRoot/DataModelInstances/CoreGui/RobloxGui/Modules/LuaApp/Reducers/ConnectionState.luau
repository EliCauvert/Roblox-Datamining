local SetConnectionStateModule = require(game:GetService("CorePackages").Workspace.Packages.AppChat.SetConnectionState)

return function(p1, p2)
	-- upvalues: SetConnectionStateModule (copy)
	local P0 = p1 or Enum.ConnectionState.Connected
	
	return if p2.type == SetConnectionStateModule.name then p2.connectionState else P0
end