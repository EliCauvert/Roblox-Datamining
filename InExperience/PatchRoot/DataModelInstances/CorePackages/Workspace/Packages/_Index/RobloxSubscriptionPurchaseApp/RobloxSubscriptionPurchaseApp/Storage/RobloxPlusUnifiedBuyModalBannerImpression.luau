local appStorageService = game:GetService("AppStorageService")
local t = {
	canUseAppStorage = function()
		return game:GetEngineFeature("RobloxPlusImpressionStorageKey")
	end
}

function t.getImpressionCount()
	-- upvalues: t (ref), appStorageService (ref)
	if not t.canUseAppStorage() then
		return 1e999
	end
	local ok, status = pcall(function()
		-- upvalues: appStorageService (copy)
		return appStorageService:GetItem("RobloxPlusUpsellBannerUnifiedBuyModalImpressionCount")
	end)
	
	return if ok and typeof(status) == "string" and status ~= "" then tonumber(status) or 0 else 0
end

function t.incrementImpressionCount()
	-- upvalues: t (ref), appStorageService (ref)
	if t.canUseAppStorage() then
		pcall(function()
			-- upvalues: t (copy), appStorageService (copy)
			appStorageService:SetItem("RobloxPlusUpsellBannerUnifiedBuyModalImpressionCount", tostring(t.getImpressionCount() + 1))
			appStorageService:Flush()
		end)
		
		return
	end
end

return t