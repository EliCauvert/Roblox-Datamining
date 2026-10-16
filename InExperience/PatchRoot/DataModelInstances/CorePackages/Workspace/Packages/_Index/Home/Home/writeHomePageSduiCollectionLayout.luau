local HttpService = game:GetService("HttpService")
local AppStorageService = game:GetService("AppStorageService")

return function(p1) --[[ Line: 10 | Named "writeHomePageSduiCollectionLayout" ]]
	-- upvalues: HttpService (copy), AppStorageService (copy)
	local Json = HttpService:JSONEncode({
		itemsPerRow = p1.items_per_row,
		rowsAboveFold = p1.rows_above_fold
	})
	local Success, Result = pcall(function() --[[ Line: 19 ]]
		-- upvalues: AppStorageService (upval)
		return AppStorageService:GetItem("HomePageSduiCollectionLayout")
	end)
	
	if not Success or Result ~= Json then
		pcall(function() --[[ Line: 27 ]]
			-- upvalues: AppStorageService (upval), Json (copy)
			AppStorageService:SetItem("HomePageSduiCollectionLayout", Json)
			AppStorageService:Flush()
		end)
		
		return
	end
end