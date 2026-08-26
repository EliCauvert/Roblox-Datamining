local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local playersService = game:GetService("Players")

if require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagEnableReferredPlayerJoinRemoteEvent() then
	local referredPlayerJoin = Instance.new("RemoteEvent")
	referredPlayerJoin.Name = "ReferredPlayerJoin"
	referredPlayerJoin.Parent = robloxReplicatedStorageService
	playersService.PlayerAdded:Connect(function(p1)
		-- upvalues: playersService (ref), referredPlayerJoin (ref)
		local joinData = p1:GetJoinData()
		local referredByPlayerId = joinData and tonumber(joinData.ReferredByPlayerId)
		
		if referredByPlayerId and referredByPlayerId ~= 0 then
			local var1 = playersService:GetPlayerByUserId(referredByPlayerId)
			
			if var1 then
				referredPlayerJoin:FireClient(var1, p1)
			end
		end
	end)
end