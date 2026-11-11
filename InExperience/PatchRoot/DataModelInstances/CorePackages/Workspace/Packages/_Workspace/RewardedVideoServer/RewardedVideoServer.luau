local AdService = game:GetService("AdService")
local Players = game:GetService("Players")
local RewardedVideoAdShowControllerModule = require(script.RewardedVideoAdShowController)

return {
	serverStarterScript = function()
		-- upvalues: RewardedVideoAdShowControllerModule (copy), AdService (copy), Players (copy)
		local NewRewardedVideoAdShowController = RewardedVideoAdShowControllerModule.new()
		
		function AdService.OnShowRewardedVideoAd(p1, p2)
			-- upvalues: NewRewardedVideoAdShowController (copy)
			return NewRewardedVideoAdShowController:onShowRewardedVideoAd(p1, p2.productId, p2.placementId)
		end
		
		function AdService.OnRewardedVideoAdResult(p1, p2, p3, p4)
			-- upvalues: NewRewardedVideoAdShowController (copy)
			NewRewardedVideoAdShowController:onRewardedVideoAdResult(p1, p2, p3, p4)
		end
		
		Players.PlayerRemoving:Connect(function(Player)
			-- upvalues: NewRewardedVideoAdShowController (copy)
			NewRewardedVideoAdShowController:onPlayerRemoving(Player)
		end)
	end,
	["jest.config"] = script["jest.config"]
}