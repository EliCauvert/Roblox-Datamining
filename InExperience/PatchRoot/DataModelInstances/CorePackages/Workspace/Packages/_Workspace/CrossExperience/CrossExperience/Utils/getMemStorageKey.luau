local MemStorageService = game:GetService("MemStorageService")

return function(Key) --[[ Line: 3 ]]
	-- upvalues: MemStorageService (copy)
	local Success, Result = pcall(function() --[[ Line: 4 ]]
		-- upvalues: MemStorageService (upval), Key (copy)
		return MemStorageService:GetItem(Key)
	end)
	
	return if Success and Result and Result ~= "" then Result else nil
end