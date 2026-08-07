local memStorageService = game:GetService("MemStorageService")

return function(p0, p1) --[[ line: 6 ]]
	-- upvalues: memStorageService (ref)
	if p1 == nil then return end
	if memStorageService:HasItem(p0) then
		return
	end
	memStorageService:SetItem(p0, "true")
	p1()
end