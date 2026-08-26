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
		local var1 = reactRobloxModule.createRoot(rewardedVideoAdPlayer)
		
		function adService.onDemandVideoPlayInUI(p1)
			-- upvalues: var1 (ref), adService (copy), flagsModule (copy), reactModule (copy), baseComponentModule (copy), adPlayerComponentModule (copy)
			local function _(p2)
				-- upvalues: var1 (copy), adService (copy), p1 (ref)
				var1:render(nil)
				adService:onDemandVideoCompleteFromUI(p2, p1.encryptedAdTrackingData, p1.encryptionMetadata, p1.rewardDetails)
			end
			
			local var2 = if flagsModule.GetEnableLuaRewardTimerUI() and p1.durationNeededForRewardMs and p1.durationNeededEnum == "Variable" then p1.durationNeededForRewardMs / 1000 else nil
			local bindableEvent = Instance.new("BindableEvent")
			local var3 = nil
			var1:render(reactModule.createElement(baseComponentModule, {}, {
				reactModule.createElement(adPlayerComponentModule, {
					isEligible = p1.isEligible,
					creativeAssetUrl = p1.creativeAssetUrl,
					durationNeededForReward = if flagsModule.GetEnableLuaRewardTimerUI() then var2 else nil,
					onVideoFrameLoaded = function(p2)
						-- upvalues: var3 (write), bindableEvent (ref)
						var3 = p2
						
						if bindableEvent then
							bindableEvent:Fire()
						end
					end,
					onCancel = function()
						-- upvalues: var1 (copy), adService (copy), p1 (ref)
						local showInterrupted = Enum.ShowAdResult.ShowInterrupted
						var1:render(nil)
						adService:onDemandVideoCompleteFromUI(showInterrupted, p1.encryptedAdTrackingData, p1.encryptionMetadata, p1.rewardDetails)
					end,
					onComplete = function()
						-- upvalues: var1 (copy), adService (copy), p1 (ref)
						local showCompleted = Enum.ShowAdResult.ShowCompleted
						var1:render(nil)
						adService:onDemandVideoCompleteFromUI(showCompleted, p1.encryptedAdTrackingData, p1.encryptionMetadata, p1.rewardDetails)
					end,
					showWhyThisAd = function()
						-- upvalues: adService (copy)
						adService:HandleWhyThisAdClicked("advertiserName", "payerName")
					end,
					getReportAdInfo = function()
						-- upvalues: p1 (ref)
						return {
							adUnitName = "Rewarded Video Ad",
							assetId = p1.creativeAssetUrl,
							encryptionMetadata = p1.encryptionMetadata,
							encryptedAdTrackingData = p1.encryptedAdTrackingData
						}
					end
				})
			}))
			bindableEvent.Event:Wait()
			bindableEvent:Destroy()
			
			return var3
		end
	end
}