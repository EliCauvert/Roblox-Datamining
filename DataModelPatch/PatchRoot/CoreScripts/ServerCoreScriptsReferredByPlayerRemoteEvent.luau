local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local Players = game:GetService("Players")

if require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagEnableReferredPlayerJoinRemoteEvent() then
	local ReferredPlayerJoin = Instance.new("RemoteEvent")
	ReferredPlayerJoin.Name = "ReferredPlayerJoin"
	ReferredPlayerJoin.Parent = RobloxReplicatedStorage
	Players.PlayerAdded:Connect(function(Player: Player)
		-- upvalues: Players (copy), ReferredPlayerJoin (copy)
		local JoinData = Player:GetJoinData()
		local Number = JoinData and tonumber(JoinData.ReferredByPlayerId)
		
		if Number and Number ~= 0 then
			local Player1 = Players:GetPlayerByUserId(Number)
			
			if Player1 then
				ReferredPlayerJoin:FireClient(Player1, Player)
			end
		end
	end)
end