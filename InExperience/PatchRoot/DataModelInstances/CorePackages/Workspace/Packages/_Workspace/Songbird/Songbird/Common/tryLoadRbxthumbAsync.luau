local contentProviderService = game:GetService("ContentProvider")

return function(p0, p1)
	-- upvalues: contentProviderService (ref)
	p1 = p1 or 5
	
	if contentProviderService:GetAssetFetchStatus(p0) == Enum.AssetFetchStatus.Success then
		return p0
	end
	contentProviderService:PreloadAsync({ p0 })
	local var2 = 0
	while contentProviderService:GetAssetFetchStatus(p0) ~= Enum.AssetFetchStatus.Success do
		var2 += task.wait()
		
		if p1 < var2 then
			error(`timed out after {p1} seconds when loading {p0}`)
		end
	end
	return p0
end