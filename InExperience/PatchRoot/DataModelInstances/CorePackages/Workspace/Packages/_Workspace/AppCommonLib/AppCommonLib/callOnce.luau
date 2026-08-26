local memStorageService = game:GetService("MemStorageService")

return function(p1, p2)
	-- upvalues: memStorageService (ref)
	if p2 == nil then return end
	if memStorageService:HasItem(p1) then
		return
	end
	memStorageService:SetItem(p1, "true")
	p2()
end