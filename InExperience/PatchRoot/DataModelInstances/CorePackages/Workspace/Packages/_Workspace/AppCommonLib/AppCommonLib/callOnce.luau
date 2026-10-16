local MemStorageService = game:GetService("MemStorageService")

return function(Key, Callback: () -> ()) --[[ Line: 6 ]]
	-- upvalues: MemStorageService (copy)
	if Callback == nil then return end
	if not MemStorageService:HasItem(Key) then
		MemStorageService:SetItem(Key, "true")
		Callback()
		
		return
	end
end