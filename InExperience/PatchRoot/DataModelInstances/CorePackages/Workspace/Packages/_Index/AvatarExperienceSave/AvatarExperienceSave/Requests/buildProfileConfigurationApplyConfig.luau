return function(p0) --[[ line: 10 | named "buildProfileConfigurationApplyConfig" ]]
	if p0.BackgroundAssetId == nil and p0.FrameAssetId == nil then
		error("ProfileConfiguration apply config must include BackgroundAssetId or FrameAssetId")
	end
	local t = {}
	
	if p0.BackgroundAssetId ~= nil then
		t.BackgroundAssetId = p0.BackgroundAssetId
	end
	if p0.FrameAssetId ~= nil then
		t.FrameAssetId = p0.FrameAssetId
	end
	return t
end