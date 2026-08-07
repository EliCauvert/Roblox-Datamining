local UIBlox = require(script:FindFirstAncestor("SocialLibraries").dependencies).UIBlox

return function(p0) --[[ line: 5 ]]
	-- upvalues: UIBlox (ref)
	local var0 = UIBlox.App.ImageSet.Images[p0]
	
	return {
		Image = var0.Image,
		ImageRectSize = var0.ImageRectSize,
		ImageRectOffset = var0.ImageRectOffset
	}
end