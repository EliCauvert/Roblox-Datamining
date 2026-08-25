local assets = require(script:FindFirstAncestor("Foundation").Parent.FoundationCloudAssets).Assets

return function(p0)
	-- upvalues: assets (ref)
	return assets[p0] ~= nil
end