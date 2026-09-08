return function(value)
	if typeof(value) ~= "table" then
		return nil
	end
	local frameAssetId = value.FrameAssetId
	
	return if typeof(frameAssetId) == "number" and frameAssetId ~= 0 then tostring(frameAssetId) else nil
end