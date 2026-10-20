local Constants = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsCommon).Constants
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local GetJoinDataRemoteFunctionEnabled = game:DefineFastFlag("GetJoinDataRemoteFunctionEnabled", false)
local GetServerType = Instance.new("RemoteFunction")
GetServerType.Name = "GetServerType"
GetServerType.Parent = RobloxReplicatedStorage

function GetServerType.OnServerInvoke()
	-- upvalues: Constants (copy)
	return if game.PrivateServerId == "" then Constants.STANDARD_SERVER elseif game.PrivateServerOwnerId == 0 then Constants.RESERVED_SERVER else Constants.VIP_SERVER
end

if GetJoinDataRemoteFunctionEnabled then
	local GetJoinData = Instance.new("RemoteFunction")
	GetJoinData.Name = "GetJoinData"
	GetJoinData.Parent = RobloxReplicatedStorage
	
	function GetJoinData.OnServerInvoke(Player: Player)
		return Player:GetJoinData()
	end
end