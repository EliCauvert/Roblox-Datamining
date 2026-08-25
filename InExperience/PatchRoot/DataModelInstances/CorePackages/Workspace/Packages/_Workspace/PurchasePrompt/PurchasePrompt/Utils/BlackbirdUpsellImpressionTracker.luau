local blackbirdUpsellBannerMaxSessionImpressions = game:DefineFastInt("BlackbirdUpsellBannerMaxSessionImpressions", 50)
local memStorageService = game:GetService("MemStorageService")
local t = {
	getImpressionCount = function()
		-- upvalues: memStorageService (ref)
		local ok, status = pcall(function()
			-- upvalues: memStorageService (copy)
			return memStorageService:GetItem("BlackbirdUpsellBannerImpressionCount")
		end)
		
		return if ok and status and status ~= "" then tonumber(status) or 0 else 0
	end
}

function t.incrementImpressionCount()
	-- upvalues: t (ref), memStorageService (ref)
	local impressionCount = t.getImpressionCount()
	pcall(function()
		-- upvalues: memStorageService (copy), impressionCount (ref)
		memStorageService:SetItem("BlackbirdUpsellBannerImpressionCount", tostring(impressionCount + 1))
	end)
end

function t.hasReachedMaxImpressions()
	-- upvalues: blackbirdUpsellBannerMaxSessionImpressions (ref), t (ref)
	return if blackbirdUpsellBannerMaxSessionImpressions == 0 then false else blackbirdUpsellBannerMaxSessionImpressions <= t.getImpressionCount()
end

return t