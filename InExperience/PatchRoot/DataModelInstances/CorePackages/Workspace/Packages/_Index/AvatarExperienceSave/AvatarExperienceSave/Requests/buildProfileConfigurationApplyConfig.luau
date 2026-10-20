return function(p1)
	if p1.BackgroundAssetId == nil and p1.FrameAssetId == nil then
		error("ProfileConfiguration apply config must include BackgroundAssetId or FrameAssetId")
	end
	local t = {}
	
	if p1.BackgroundAssetId ~= nil then
		t.BackgroundAssetId = p1.BackgroundAssetId
	end
	if p1.FrameAssetId ~= nil then
		t.FrameAssetId = p1.FrameAssetId
	end
	return t
end