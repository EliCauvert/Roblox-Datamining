local MemStorageService = game:GetService("MemStorageService")

return function(Key)
	-- upvalues: MemStorageService (copy)
	local Success, Result = pcall(function()
		-- upvalues: MemStorageService (upval), Key (copy)
		return MemStorageService:GetItem(Key)
	end)
	
	return if Success and Result and Result ~= "" then Result else nil
end