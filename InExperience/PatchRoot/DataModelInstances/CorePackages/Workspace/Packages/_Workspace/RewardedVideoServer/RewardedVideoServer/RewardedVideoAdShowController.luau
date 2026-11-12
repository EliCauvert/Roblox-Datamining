local AdService = game:GetService("AdService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local PromiseModule = require(script.Parent.Parent.Promise)
local AdsRewardServiceApiModule = require(script.Parent.AdsRewardServiceApi)
local RewardedVideoAdShowController = {}
RewardedVideoAdShowController.__index = RewardedVideoAdShowController

function RewardedVideoAdShowController.new()
	-- upvalues: RewardedVideoAdShowController (copy)
	local config = { adShowsByPlayer = {} }
	setmetatable(config, RewardedVideoAdShowController)
	
	return config
end

function RewardedVideoAdShowController:abandonAdShow(p1, Message, p2)
	self.adShowsByPlayer[p1] = nil
	
	if p2 then
		error(Message, 0)
	end
	return Enum.ShowAdResult.InternalError, Message
end

function RewardedVideoAdShowController:onShowRewardedVideoAd(p1, ProductId, p2)
	-- upvalues: AdsRewardServiceApiModule (copy), Players (copy), AdService (copy), PromiseModule (copy)
	if self.adShowsByPlayer[p1] then
		return Enum.ShowAdResult.AdAlreadyShowing
	end
	local config = { resolvePlayback = nil, productId = ProductId }
	self.adShowsByPlayer[p1] = config
	local ValidateRewardAndPlacementResult, ValidateRewardAndPlacementResult2 = AdsRewardServiceApiModule.validateRewardAndPlacement(ProductId, p2)
	
	if not ValidateRewardAndPlacementResult then
		return self:abandonAdShow(p1, `Reward validation failed - {ValidateRewardAndPlacementResult2}`, false)
	elseif not ValidateRewardAndPlacementResult.isValidReward then
		return self:abandonAdShow(p1, `Reward is invalid for product id {ProductId}`, true)
	elseif p1.Parent ~= Players then
		return self:abandonAdShow(p1, "Player instance is null in validation callback", false)
	elseif p2 == nil or ValidateRewardAndPlacementResult.isValidPlacement then
		local Success, Result = pcall(function()
			-- upvalues: AdService (upval), p1 (copy), ProductId (copy), ValidateRewardAndPlacementResult (copy), p2 (copy)
			AdService:PlayRewardedVideoAdOnClient(p1, {
				productId = ProductId,
				productName = ValidateRewardAndPlacementResult.productName,
				imageAssetIdString = ValidateRewardAndPlacementResult.imageAssetIdString
			}, p2 or ValidateRewardAndPlacementResult.defaultPlacementId)
		end)
		
		return if Success then PromiseModule.new(function(ResolvePlayback)
			-- upvalues: config (copy)
			config.resolvePlayback = ResolvePlayback
		end):expect() else self:abandonAdShow(p1, `Failed to start playback - {Result}`, false)
	else
		return self:abandonAdShow(p1, `AdService:ShowRewardedVideoAdAsync - Invalid placementId '{p7}'`, true)
	end
end

function RewardedVideoAdShowController:onRewardedVideoAdResult(Player: Player, ShowAdResult, p3, p4)
	-- upvalues: RunService (copy), AdsRewardServiceApiModule (copy), AdService (copy)
	local AdShowsByPlayerEntry = self.adShowsByPlayer[Player]
	
	if not AdShowsByPlayerEntry or not AdShowsByPlayerEntry.resolvePlayback then return end
	self.adShowsByPlayer[Player] = nil
	AdShowsByPlayerEntry.resolvePlayback(ShowAdResult)
	
	if ShowAdResult == Enum.ShowAdResult.ShowCompleted then
		task.spawn(function()
			-- upvalues: RunService (upval), AdsRewardServiceApiModule (upval), Player (copy), AdShowsByPlayerEntry (copy), p3 (copy), p4 (copy), AdService (upval)
			if not RunService:IsStudio() then
				local GrantAdRewardResult, GrantAdRewardResult2 = AdsRewardServiceApiModule.grantAdReward(Player.UserId, AdShowsByPlayerEntry.productId, p3, p4)
				
				if not GrantAdRewardResult then
					warn(`Failed to grant ad reward: {GrantAdRewardResult2}`)
					
					return
				end
			end
			AdService:CompleteRewardedVideoGrant(Player.UserId, AdShowsByPlayerEntry.productId)
		end)
	end
end

function RewardedVideoAdShowController:onPlayerRemoving(p3)
	local AdShowsByPlayerEntry = self.adShowsByPlayer[p3]
	self.adShowsByPlayer[p3] = nil
	
	if AdShowsByPlayerEntry and AdShowsByPlayerEntry.resolvePlayback then
		AdShowsByPlayerEntry.resolvePlayback(Enum.ShowAdResult.ShowInterrupted)
	end
end

return RewardedVideoAdShowController