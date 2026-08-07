local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local playtestTeleportRemoteModule = require(script.Parent.playtestTeleportRemote)
local var2 = nil

local function _() --[[ line: 10 | named "getRemote" ]]
	-- upvalues: var2 (write), robloxReplicatedStorageService (ref), playtestTeleportRemoteModule (ref)
	if var2 == nil then
		local remote_name = robloxReplicatedStorageService:WaitForChild(playtestTeleportRemoteModule.REMOTE_NAME, 1e999)
		var2 = remote_name
		
		return remote_name
	end
	return var2
end

return function(p0) --[[ line: 20 | named "teleportToPlace" ]]
	-- upvalues: var2 (write), robloxReplicatedStorageService (ref), playtestTeleportRemoteModule (ref)
	local var4
	if var2 == nil then
		local remote_name = robloxReplicatedStorageService:WaitForChild(playtestTeleportRemoteModule.REMOTE_NAME, 1e999)
		var2 = remote_name
		var4 = remote_name
	else
		var4 = var2
	end
	var4:FireServer(p0)
end