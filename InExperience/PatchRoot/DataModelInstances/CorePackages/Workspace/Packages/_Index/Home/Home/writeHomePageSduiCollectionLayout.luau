local HttpService = game:GetService("HttpService")
local AppStorageService = game:GetService("AppStorageService")

return function(p1)
	-- upvalues: HttpService (copy), AppStorageService (copy)
	local Json = HttpService:JSONEncode({
		itemsPerRow = p1.items_per_row,
		rowsAboveFold = p1.rows_above_fold
	})
	local Success, Result = pcall(function()
		-- upvalues: AppStorageService (upval)
		return AppStorageService:GetItem("HomePageSduiCollectionLayout")
	end)
	
	if not Success or Result ~= Json then
		pcall(function()
			-- upvalues: AppStorageService (upval), Json (copy)
			AppStorageService:SetItem("HomePageSduiCollectionLayout", Json)
			AppStorageService:Flush()
		end)
		
		return
	end
end