local ContentProvider = game:GetService("ContentProvider")

return function(ContentId, p1)
	-- upvalues: ContentProvider (copy)
	local P1 = p1 or 5
	
	if ContentProvider:GetAssetFetchStatus(ContentId) == Enum.AssetFetchStatus.Success then
		return ContentId
	end
	ContentProvider:PreloadAsync({ ContentId })
	local NewElapsed = 0
	while ContentProvider:GetAssetFetchStatus(ContentId) ~= Enum.AssetFetchStatus.Success do
		NewElapsed += task.wait()
		
		if P1 < NewElapsed then
			error(`timed out after {P1} seconds when loading {ContentId}`)
		end
	end
	return ContentId
end