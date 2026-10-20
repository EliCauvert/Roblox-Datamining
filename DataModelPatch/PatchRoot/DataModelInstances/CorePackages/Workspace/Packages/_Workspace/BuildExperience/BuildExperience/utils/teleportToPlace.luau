local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local PlaytestTeleportRemoteModule = require(script.Parent.playtestTeleportRemote)
local v1 = nil

local function _()
	-- upvalues: v1 (ref), RobloxReplicatedStorage (copy), PlaytestTeleportRemoteModule (copy)
	if v1 == nil then
		local REMOTENAME = RobloxReplicatedStorage:WaitForChild(PlaytestTeleportRemoteModule.REMOTE_NAME, 1e999)
		v1 = REMOTENAME
		
		return REMOTENAME
	else
		return v1
	end
end

return function(p1)
	-- upvalues: v1 (ref), RobloxReplicatedStorage (copy), PlaytestTeleportRemoteModule (copy)
	local RemoteEvent = nil
	if v1 == nil then
		local REMOTENAME = RobloxReplicatedStorage:WaitForChild(PlaytestTeleportRemoteModule.REMOTE_NAME, 1e999)
		v1 = REMOTENAME
		RemoteEvent = REMOTENAME
	else
		RemoteEvent = v1
	end
	RemoteEvent:FireServer(p1)
end