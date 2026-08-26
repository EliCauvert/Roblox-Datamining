local assets = require(script:FindFirstAncestor("Foundation").Parent.FoundationCloudAssets).Assets

return function(p1)
	-- upvalues: assets (ref)
	return assets[p1] ~= nil
end