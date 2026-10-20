local BlackbirdUpsellBannerMaxSessionImpressions = game:DefineFastInt("BlackbirdUpsellBannerMaxSessionImpressions", 50)
local MemStorageService = game:GetService("MemStorageService")
local BlackbirdUpsellImpressionTrackerModule = {
	getImpressionCount = function(): number
		-- upvalues: MemStorageService (copy)
		local Success, Result = pcall(function()
			-- upvalues: MemStorageService (upval)
			return MemStorageService:GetItem("BlackbirdUpsellBannerImpressionCount")
		end)
		
		return Success and Result and Result ~= "" and tonumber(Result) or 0
	end
}

function BlackbirdUpsellImpressionTrackerModule.incrementImpressionCount()
	-- upvalues: BlackbirdUpsellImpressionTrackerModule (copy), MemStorageService (copy)
	local ImpressionCount = BlackbirdUpsellImpressionTrackerModule.getImpressionCount()
	pcall(function()
		-- upvalues: MemStorageService (upval), ImpressionCount (copy)
		MemStorageService:SetItem("BlackbirdUpsellBannerImpressionCount", (tostring(ImpressionCount + 1)))
	end)
end

function BlackbirdUpsellImpressionTrackerModule.hasReachedMaxImpressions(): boolean
	-- upvalues: BlackbirdUpsellBannerMaxSessionImpressions (copy), BlackbirdUpsellImpressionTrackerModule (copy)
	return BlackbirdUpsellBannerMaxSessionImpressions ~= 0 and BlackbirdUpsellBannerMaxSessionImpressions <= BlackbirdUpsellImpressionTrackerModule.getImpressionCount()
end

return BlackbirdUpsellImpressionTrackerModule