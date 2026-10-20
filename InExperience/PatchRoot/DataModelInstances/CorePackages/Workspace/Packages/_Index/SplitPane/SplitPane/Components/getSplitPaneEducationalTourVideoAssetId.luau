local _ = require(script.Parent.SplitPaneEducationalTourSteps)

return function(p1, p2, p3)
	if p3 then
		if p2 and p1.collapsedGamepadVideoAssetId ~= nil then
			return p1.collapsedGamepadVideoAssetId
		elseif p1.collapsedVideoAssetId ~= nil then
			return p1.collapsedVideoAssetId
		end
	end
	return if p2 and p1.gamepadVideoAssetId ~= nil then p1.gamepadVideoAssetId else p1.videoAssetId
end