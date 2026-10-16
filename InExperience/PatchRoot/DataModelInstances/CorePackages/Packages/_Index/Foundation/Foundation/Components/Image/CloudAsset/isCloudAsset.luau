local Assets = require(script:FindFirstAncestor("Foundation").Parent.FoundationCloudAssets).Assets

return function(p1): boolean --[[ Line: 6 ]]
	-- upvalues: Assets (copy)
	return Assets[p1] ~= nil
end