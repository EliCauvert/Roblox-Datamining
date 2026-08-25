local constants = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsCommon).Constants
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local getJoinDataRemoteFunctionEnabled = game:DefineFastFlag("GetJoinDataRemoteFunctionEnabled", false)
local getServerType = Instance.new("RemoteFunction")
getServerType.Name = "GetServerType"
getServerType.Parent = robloxReplicatedStorageService

function getServerType.getServerType()
	-- upvalues: constants (ref)
	return if game.PrivateServerId == "" then constants.STANDARD_SERVER elseif game.PrivateServerOwnerId == 0 then constants.RESERVED_SERVER else constants.VIP_SERVER
end

if getJoinDataRemoteFunctionEnabled then
	local getJoinData = Instance.new("RemoteFunction")
	getJoinData.Name = "GetJoinData"
	getJoinData.Parent = robloxReplicatedStorageService
	
	function getJoinData.getJoinData(p0)
		return p0:GetJoinData()
	end
end