local BlackbirdUpsellBannerMaxSessionImpressions = game:DefineFastInt("BlackbirdUpsellBannerMaxSessionImpressions", 50)
local MemStorageService = game:GetService("MemStorageService")
local BlackbirdUpsellImpressionTrackerModule = {
	getImpressionCount = function(): number --[[ Line: 10 ]]
		-- upvalues: MemStorageService (copy)
		local Success, Result = pcall(function() --[[ Line: 11 ]]
			-- upvalues: MemStorageService (upval)
			return MemStorageService:GetItem("BlackbirdUpsellBannerImpressionCount")
		end)
		
		return Success and Result and Result ~= "" and tonumber(Result) or 0
	end
}

function BlackbirdUpsellImpressionTrackerModule.incrementImpressionCount() --[[ Line: 20 ]]
	-- upvalues: BlackbirdUpsellImpressionTrackerModule (copy), MemStorageService (copy)
	local ImpressionCount = BlackbirdUpsellImpressionTrackerModule.getImpressionCount()
	pcall(function() --[[ Line: 22 ]]
		-- upvalues: MemStorageService (upval), ImpressionCount (copy)
		MemStorageService:SetItem("BlackbirdUpsellBannerImpressionCount", (tostring(ImpressionCount + 1)))
	end)
end

function BlackbirdUpsellImpressionTrackerModule.hasReachedMaxImpressions(): boolean --[[ Line: 27 ]]
	-- upvalues: BlackbirdUpsellBannerMaxSessionImpressions (copy), BlackbirdUpsellImpressionTrackerModule (copy)
	return BlackbirdUpsellBannerMaxSessionImpressions ~= 0 and BlackbirdUpsellBannerMaxSessionImpressions <= BlackbirdUpsellImpressionTrackerModule.getImpressionCount()
end

return BlackbirdUpsellImpressionTrackerModule