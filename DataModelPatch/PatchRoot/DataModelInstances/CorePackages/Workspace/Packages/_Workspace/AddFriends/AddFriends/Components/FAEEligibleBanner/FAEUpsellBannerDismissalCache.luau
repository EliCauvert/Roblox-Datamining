local AppStorageService = game:GetService("AppStorageService")
local RegisterFAEUpsellBannerDismissedStorageKeyEngineFeature = game:GetEngineFeature("RegisterFAEUpsellBannerDismissedStorageKey")

return {
	isDismissed = function(): boolean
		-- upvalues: RegisterFAEUpsellBannerDismissedStorageKeyEngineFeature (copy), AppStorageService (copy)
		if RegisterFAEUpsellBannerDismissedStorageKeyEngineFeature then
			local Success, Result = pcall(function()
				-- upvalues: AppStorageService (upval)
				return AppStorageService:GetItem("FAEUpsellBannerDismissed")
			end)
			
			return Success and Result == "true"
		else
			return true
		end
	end,
	markDismissed = function()
		-- upvalues: RegisterFAEUpsellBannerDismissedStorageKeyEngineFeature (copy), AppStorageService (copy)
		if RegisterFAEUpsellBannerDismissedStorageKeyEngineFeature then
			pcall(function()
				-- upvalues: AppStorageService (upval)
				AppStorageService:SetItem("FAEUpsellBannerDismissed", "true")
				AppStorageService:Flush()
			end)
			
			return
		end
	end
}