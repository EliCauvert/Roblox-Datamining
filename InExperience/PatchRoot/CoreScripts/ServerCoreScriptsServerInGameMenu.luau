local Constants = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsCommon).Constants
local GetServerType = Instance.new("RemoteFunction")
GetServerType.Name = "GetServerType"
GetServerType.Parent = game:GetService("RobloxReplicatedStorage")

function GetServerType.OnServerInvoke()
	-- upvalues: Constants (copy)
	return if game.PrivateServerId == "" then Constants.STANDARD_SERVER elseif game.PrivateServerOwnerId == 0 then Constants.RESERVED_SERVER else Constants.VIP_SERVER
end