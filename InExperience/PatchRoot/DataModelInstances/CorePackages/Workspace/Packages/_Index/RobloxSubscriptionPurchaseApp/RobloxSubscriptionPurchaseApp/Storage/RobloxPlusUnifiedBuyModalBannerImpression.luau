local appStorageService = game:GetService("AppStorageService")
local t = {
	canUseAppStorage = function() --[[ line: 16 ]]
		return game:GetEngineFeature("RobloxPlusImpressionStorageKey")
	end
}

function t.getImpressionCount() --[[ line: 20 ]]
	-- upvalues: t (ref), appStorageService (ref)
	if not t.canUseAppStorage() then
		return 1e999
	end
	local ok, status = pcall(function() --[[ line: 24 ]]
		-- upvalues: appStorageService (copy)
		return appStorageService:GetItem("RobloxPlusUpsellBannerUnifiedBuyModalImpressionCount")
	end)
	
	return if ok and typeof(status) == "string" and status ~= "" then tonumber(status) or 0 else 0
end

function t.incrementImpressionCount() --[[ line: 33 ]]
	-- upvalues: t (ref), appStorageService (ref)
	if t.canUseAppStorage() then
		pcall(function() --[[ line: 37 ]]
			-- upvalues: t (copy), appStorageService (copy)
			appStorageService:SetItem("RobloxPlusUpsellBannerUnifiedBuyModalImpressionCount", tostring(t.getImpressionCount() + 1))
			appStorageService:Flush()
		end)
		
		return
	end
end

return t