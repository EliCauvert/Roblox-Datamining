local AppStorageService = game:GetService("AppStorageService")
local RobloxPlusUnifiedBuyModalBannerImpressionModule = {
	canUseAppStorage = function() --[[ Line: 16 ]]
		return game:GetEngineFeature("RobloxPlusImpressionStorageKey")
	end
}

function RobloxPlusUnifiedBuyModalBannerImpressionModule.getImpressionCount(): number --[[ Line: 20 ]]
	-- upvalues: RobloxPlusUnifiedBuyModalBannerImpressionModule (copy), AppStorageService (copy)
	if RobloxPlusUnifiedBuyModalBannerImpressionModule.canUseAppStorage() then
		local Success, Result = pcall(function() --[[ Line: 24 ]]
			-- upvalues: AppStorageService (upval)
			return AppStorageService:GetItem("RobloxPlusUpsellBannerUnifiedBuyModalImpressionCount")
		end)
		
		return Success and typeof(Result) == "string" and Result ~= "" and tonumber(Result) or 0
	else
		return 1e999
	end
end

function RobloxPlusUnifiedBuyModalBannerImpressionModule.incrementImpressionCount() --[[ Line: 33 ]]
	-- upvalues: RobloxPlusUnifiedBuyModalBannerImpressionModule (copy), AppStorageService (copy)
	if RobloxPlusUnifiedBuyModalBannerImpressionModule.canUseAppStorage() then
		pcall(function() --[[ Line: 37 ]]
			-- upvalues: RobloxPlusUnifiedBuyModalBannerImpressionModule (upval), AppStorageService (upval)
			AppStorageService:SetItem("RobloxPlusUpsellBannerUnifiedBuyModalImpressionCount", (tostring(RobloxPlusUnifiedBuyModalBannerImpressionModule.getImpressionCount() + 1)))
			AppStorageService:Flush()
		end)
		
		return
	end
end

return RobloxPlusUnifiedBuyModalBannerImpressionModule