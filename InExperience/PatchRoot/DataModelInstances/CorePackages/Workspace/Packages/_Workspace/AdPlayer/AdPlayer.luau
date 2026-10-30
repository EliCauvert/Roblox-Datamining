local AdService = game:GetService("AdService")
local CoreGui = game:GetService("CoreGui")
local v1 = script
local Parent = v1.Parent
local AdPlayerComponentModule = require(v1.components.AdPlayerComponent)
local AdsDisplayOrder = require(Parent.AdGuiInteractivity).AdsDisplayOrder
local ReactRobloxModule = require(Parent.ReactRoblox)
local ReactModule = require(Parent.React)
local BaseComponentModule = require(v1.components.BaseComponent)

return {
	["jest.config"] = v1["jest.config"],
	init = function()
		-- upvalues: AdsDisplayOrder (copy), CoreGui (copy), ReactRobloxModule (copy), AdService (copy), ReactModule (copy), BaseComponentModule (copy), AdPlayerComponentModule (copy)
		local RewardedVideoAdPlayer = Instance.new("ScreenGui")
		RewardedVideoAdPlayer.Name = "RewardedVideoAdPlayer"
		RewardedVideoAdPlayer.DisplayOrder = AdsDisplayOrder.AdPlayer
		RewardedVideoAdPlayer.IgnoreGuiInset = true
		RewardedVideoAdPlayer.ResetOnSpawn = false
		RewardedVideoAdPlayer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		RewardedVideoAdPlayer.Parent = CoreGui
		local Root = ReactRobloxModule.createRoot(RewardedVideoAdPlayer)
		
		function AdService.onDemandVideoPlayInUI(p1)
			-- upvalues: Root (copy), AdService (upval), ReactModule (upval), BaseComponentModule (upval), AdPlayerComponentModule (upval)
			local function _(p2)
				-- upvalues: Root (upval), AdService (upval), p1 (copy)
				Root:render(nil)
				AdService:onDemandVideoCompleteFromUI(p2, p1.encryptedAdTrackingData, p1.encryptionMetadata, p1.rewardDetails)
			end
			
			local BindableEvent = Instance.new("BindableEvent")
			local v2 = nil
			Root:render(ReactModule.createElement(BaseComponentModule, {}, {
				ReactModule.createElement(AdPlayerComponentModule, {
					isEligible = p1.isEligible,
					creativeAssetUrl = p1.creativeAssetUrl,
					onVideoFrameLoaded = function(p2)
						-- upvalues: v2 (ref), BindableEvent (copy)
						v2 = p2
						
						if BindableEvent then
							BindableEvent:Fire()
						end
					end,
					onCancel = function()
						-- upvalues: Root (upval), AdService (upval), p1 (copy)
						local ShowInterrupted = Enum.ShowAdResult.ShowInterrupted
						Root:render(nil)
						AdService:onDemandVideoCompleteFromUI(ShowInterrupted, p1.encryptedAdTrackingData, p1.encryptionMetadata, p1.rewardDetails)
					end,
					onComplete = function()
						-- upvalues: Root (upval), AdService (upval), p1 (copy)
						local ShowCompleted = Enum.ShowAdResult.ShowCompleted
						Root:render(nil)
						AdService:onDemandVideoCompleteFromUI(ShowCompleted, p1.encryptedAdTrackingData, p1.encryptionMetadata, p1.rewardDetails)
					end,
					showWhyThisAd = function()
						-- upvalues: AdService (upval)
						AdService:HandleWhyThisAdClicked("advertiserName", "payerName")
					end,
					getReportAdInfo = function()
						-- upvalues: p1 (copy)
						return {
							adUnitName = "Rewarded Video Ad",
							assetId = p1.creativeAssetUrl,
							encryptionMetadata = p1.encryptionMetadata,
							encryptedAdTrackingData = p1.encryptedAdTrackingData
						}
					end
				})
			}))
			
			if not v2 then
				BindableEvent.Event:Wait()
			end
			BindableEvent:Destroy()
			
			return v2
		end
	end
}