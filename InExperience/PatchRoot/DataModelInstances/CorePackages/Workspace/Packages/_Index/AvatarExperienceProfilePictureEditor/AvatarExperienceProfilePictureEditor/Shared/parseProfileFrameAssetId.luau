return function(p1)
	if typeof(p1) == "table" then
		local FrameAssetId = p1.FrameAssetId
		
		return if typeof(FrameAssetId) == "number" and FrameAssetId ~= 0 then tostring(FrameAssetId) else nil
	else
		return nil
	end
end