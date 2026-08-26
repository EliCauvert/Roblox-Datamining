local httpService = game:GetService("HttpService")
local appStorageService = game:GetService("AppStorageService")

return function(p1)
	-- upvalues: httpService (ref), appStorageService (ref)
	local var1 = httpService:JSONEncode({
		itemsPerRow = p1.items_per_row,
		rowsAboveFold = p1.rows_above_fold
	})
	local ok, status = pcall(function()
		-- upvalues: appStorageService (copy)
		return appStorageService:GetItem("HomePageSduiCollectionLayout")
	end)
	
	if ok and status == var1 then
		return
	end
	pcall(function()
		-- upvalues: appStorageService (copy), var1 (ref)
		appStorageService:SetItem("HomePageSduiCollectionLayout", var1)
		appStorageService:Flush()
	end)
end