local _ = require(script:FindFirstAncestor("InGameAssetReporting").Analysis.SceneAnalysis)

function getPreselectedSurfaceValue(p1)
	if p1 == nil then
		return nil
	end
	local extractedAssets = p1.extractedAssets
	
	return if #p1.extractedPlayers > 0 then "avatar" elseif #extractedAssets.Image > 0 or #extractedAssets.Mesh > 0 or (#extractedAssets.Model > 0 or #extractedAssets.Package > 0) or #extractedAssets.Video > 0 then "item" elseif #extractedAssets.Text > 0 then "text" else nil
end

return getPreselectedSurfaceValue