local memStorageService = game:GetService("MemStorageService")

return function(p0) --[[ line: 3 ]]
	-- upvalues: memStorageService (ref)
	local ok, status = pcall(function() --[[ line: 4 ]]
		-- upvalues: memStorageService (copy), p0 (ref)
		return memStorageService:GetItem(p0)
	end)
	
	return if ok and status and status ~= "" then status else nil
end