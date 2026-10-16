local _ = require(script:FindFirstAncestor("InGameAssetReporting").Analysis.SceneAnalysis)

function getPreselectedSurfaceValue(p1) --[[ Line: 14 ]]
	if p1 == nil then
		return nil
	else
		local ExtractedAssets = p1.extractedAssets
		
		return if #p1.extractedPlayers > 0 then "avatar" elseif #ExtractedAssets.Image > 0 or #ExtractedAssets.Mesh > 0 or #ExtractedAssets.Model > 0 or #ExtractedAssets.Package > 0 or #ExtractedAssets.Video > 0 then "item" elseif #ExtractedAssets.Text > 0 then "text" else nil
	end
end

return getPreselectedSurfaceValue