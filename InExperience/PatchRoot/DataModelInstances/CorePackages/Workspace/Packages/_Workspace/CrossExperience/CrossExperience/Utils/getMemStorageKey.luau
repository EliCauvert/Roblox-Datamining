local memStorageService = game:GetService("MemStorageService")

return function(p1)
	-- upvalues: memStorageService (ref)
	local ok, status = pcall(function()
		-- upvalues: memStorageService (copy), p1 (ref)
		return memStorageService:GetItem(p1)
	end)
	
	return if ok and status and status ~= "" then status else nil
end