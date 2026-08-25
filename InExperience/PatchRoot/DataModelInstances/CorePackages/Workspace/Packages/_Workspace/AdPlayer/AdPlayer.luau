local adService = game:GetService("AdService")
local coreGuiService = game:GetService("CoreGui")
local _script = script
local parent = _script.Parent
local flagsModule = require(_script.Flags)
local adPlayerComponentModule = require(_script.components.AdPlayerComponent)
local adsDisplayOrder = require(parent.AdGuiInteractivity).AdsDisplayOrder
local reactRobloxModule = require(parent.ReactRoblox)
local reactModule = require(parent.React)
local baseComponentModule = require(_script.components.BaseComponent)

return {
	["jest.config"] = _script["jest.config"],
	init = function()
		-- upvalues: adsDisplayOrder (ref), coreGuiService (ref), reactRobloxModule (ref), adService (ref), flagsModule (ref), reactModule (ref), baseComponentModule (ref), adPlayerComponentModule (ref)
		local rewardedVideoAdPlayer = Instance.new("ScreenGui")
		rewardedVideoAdPlayer.Name = "RewardedVideoAdPlayer"
		rewardedVideoAdPlayer.DisplayOrder = adsDisplayOrder.AdPlayer
		rewardedVideoAdPlayer.IgnoreGuiInset = true
		rewardedVideoAdPlayer.ResetOnSpawn = false
		rewardedVideoAdPlayer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		rewardedVideoAdPlayer.Parent = coreGuiService
		local var9 = reactRobloxModule.createRoot(rewardedVideoAdPlayer)
		
		function adService.onDemandVideoPlayInUI(p0)
			-- upvalues: var9 (ref), adService (copy), flagsModule (copy), reactModule (copy), baseComponentModule (copy), adPlayerComponentModule (copy)
			local function _(p1)
				-- upvalues: var9 (copy), adService (copy), p0 (ref)
				var9:render(nil)
				adService:onDemandVideoCompleteFromUI(p1, p0.encryptedAdTrackingData, p0.encryptionMetadata, p0.rewardDetails)
			end
			
			local var10 = if flagsModule.GetEnableLuaRewardTimerUI() and p0.durationNeededForRewardMs and p0.durationNeededEnum == "Variable" then p0.durationNeededForRewardMs / 1000 else nil
			local bindableEvent = Instance.new("BindableEvent")
			local var12 = nil
			var9:render(reactModule.createElement(baseComponentModule, {}, {
				reactModule.createElement(adPlayerComponentModule, {
					isEligible = p0.isEligible,
					creativeAssetUrl = p0.creativeAssetUrl,
					durationNeededForReward = if flagsModule.GetEnableLuaRewardTimerUI() then var10 else nil,
					onVideoFrameLoaded = function(p2)
						-- upvalues: var12 (write), bindableEvent (ref)
						var12 = p2
						
						if bindableEvent then
							bindableEvent:Fire()
						end
					end,
					onCancel = function()
						-- upvalues: var9 (copy), adService (copy), p0 (ref)
						local showInterrupted = Enum.ShowAdResult.ShowInterrupted
						var9:render(nil)
						adService:onDemandVideoCompleteFromUI(showInterrupted, p0.encryptedAdTrackingData, p0.encryptionMetadata, p0.rewardDetails)
					end,
					onComplete = function()
						-- upvalues: var9 (copy), adService (copy), p0 (ref)
						local showCompleted = Enum.ShowAdResult.ShowCompleted
						var9:render(nil)
						adService:onDemandVideoCompleteFromUI(showCompleted, p0.encryptedAdTrackingData, p0.encryptionMetadata, p0.rewardDetails)
					end,
					showWhyThisAd = function()
						-- upvalues: adService (copy)
						adService:HandleWhyThisAdClicked("advertiserName", "payerName")
					end,
					getReportAdInfo = function()
						-- upvalues: p0 (ref)
						return {
							adUnitName = "Rewarded Video Ad",
							assetId = p0.creativeAssetUrl,
							encryptionMetadata = p0.encryptionMetadata,
							encryptedAdTrackingData = p0.encryptedAdTrackingData
						}
					end
				})
			}))
			bindableEvent.Event:Wait()
			bindableEvent:Destroy()
			
			return var12
		end
	end
}