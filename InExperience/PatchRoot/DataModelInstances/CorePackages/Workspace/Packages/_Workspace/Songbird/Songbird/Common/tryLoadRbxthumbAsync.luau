local contentProviderService = game:GetService("ContentProvider")

return function(p1, p2)
	-- upvalues: contentProviderService (ref)
	p2 = p2 or 5
	
	if contentProviderService:GetAssetFetchStatus(p1) == Enum.AssetFetchStatus.Success then
		return p1
	end
	contentProviderService:PreloadAsync({ p1 })
	local var1 = 0
	while contentProviderService:GetAssetFetchStatus(p1) ~= Enum.AssetFetchStatus.Success do
		var1 += task.wait()
		
		if p2 < var1 then
			error(`timed out after {p2} seconds when loading {p1}`)
		end
	end
	return p1
end