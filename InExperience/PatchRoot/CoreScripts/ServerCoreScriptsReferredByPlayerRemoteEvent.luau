local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local playersService = game:GetService("Players")

if require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagEnableReferredPlayerJoinRemoteEvent() then
	local referredPlayerJoin = Instance.new("RemoteEvent")
	referredPlayerJoin.Name = "ReferredPlayerJoin"
	referredPlayerJoin.Parent = robloxReplicatedStorageService
	playersService.PlayerAdded:Connect(function(p0) --[[ line: 16 ]]
		-- upvalues: playersService (ref), referredPlayerJoin (ref)
		local joinData = p0:GetJoinData()
		local referredByPlayerId = joinData and tonumber(joinData.ReferredByPlayerId)
		
		if referredByPlayerId and referredByPlayerId ~= 0 then
			local var5 = playersService:GetPlayerByUserId(referredByPlayerId)
			
			if var5 then
				referredPlayerJoin:FireClient(var5, p0)
			end
		end
	end)
end