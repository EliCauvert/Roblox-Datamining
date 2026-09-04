local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local playtestTeleportRemoteModule = require(script.Parent.playtestTeleportRemote)
local var1 = nil

local function _()
	-- upvalues: var1 (write), robloxReplicatedStorageService (ref), playtestTeleportRemoteModule (ref)
	if var1 == nil then
		local remote_name = robloxReplicatedStorageService:WaitForChild(playtestTeleportRemoteModule.REMOTE_NAME, 1e999)
		var1 = remote_name
		
		return remote_name
	end
	return var1
end

return function(p1)
	-- upvalues: var1 (write), robloxReplicatedStorageService (ref), playtestTeleportRemoteModule (ref)
	local var2
	if var1 == nil then
		local remote_name = robloxReplicatedStorageService:WaitForChild(playtestTeleportRemoteModule.REMOTE_NAME, 1e999)
		var1 = remote_name
		var2 = remote_name
	else
		var2 = var1
	end
	var2:FireServer(p1)
end