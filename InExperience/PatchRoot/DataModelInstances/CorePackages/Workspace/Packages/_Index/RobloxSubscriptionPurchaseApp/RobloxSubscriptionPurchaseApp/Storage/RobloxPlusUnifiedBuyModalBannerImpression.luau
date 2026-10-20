local AppStorageService = game:GetService("AppStorageService")
local RobloxPlusUnifiedBuyModalBannerImpressionModule = {
	canUseAppStorage = function()
		return game:GetEngineFeature("RobloxPlusImpressionStorageKey")
	end
}

function RobloxPlusUnifiedBuyModalBannerImpressionModule.getImpressionCount(): number
	-- upvalues: RobloxPlusUnifiedBuyModalBannerImpressionModule (copy), AppStorageService (copy)
	if RobloxPlusUnifiedBuyModalBannerImpressionModule.canUseAppStorage() then
		local Success, Result = pcall(function()
			-- upvalues: AppStorageService (upval)
			return AppStorageService:GetItem("RobloxPlusUpsellBannerUnifiedBuyModalImpressionCount")
		end)
		
		return Success and typeof(Result) == "string" and Result ~= "" and tonumber(Result) or 0
	else
		return 1e999
	end
end

function RobloxPlusUnifiedBuyModalBannerImpressionModule.incrementImpressionCount()
	-- upvalues: RobloxPlusUnifiedBuyModalBannerImpressionModule (copy), AppStorageService (copy)
	if RobloxPlusUnifiedBuyModalBannerImpressionModule.canUseAppStorage() then
		pcall(function()
			-- upvalues: RobloxPlusUnifiedBuyModalBannerImpressionModule (upval), AppStorageService (upval)
			AppStorageService:SetItem("RobloxPlusUpsellBannerUnifiedBuyModalImpressionCount", (tostring(RobloxPlusUnifiedBuyModalBannerImpressionModule.getImpressionCount() + 1)))
			AppStorageService:Flush()
		end)
		
		return
	end
end

return RobloxPlusUnifiedBuyModalBannerImpressionModule