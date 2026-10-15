local _ = require(script.Parent.SplitPaneEducationalTourSteps)

return function(value, p1, p2)
	if p2 then
		return if p1 and value.collapsedGamepadVideoAssetId ~= nil then value.collapsedGamepadVideoAssetId elseif value.collapsedVideoAssetId == nil then if p1 and value.gamepadVideoAssetId ~= nil then value.gamepadVideoAssetId else value.videoAssetId else value.collapsedVideoAssetId
	end
end