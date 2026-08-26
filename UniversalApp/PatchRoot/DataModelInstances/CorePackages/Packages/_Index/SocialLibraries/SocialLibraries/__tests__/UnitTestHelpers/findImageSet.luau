local UIBlox = require(script:FindFirstAncestor("SocialLibraries").dependencies).UIBlox

return function(p1)
	-- upvalues: UIBlox (ref)
	local var1 = UIBlox.App.ImageSet.Images[p1]
	
	return {
		Image = var1.Image,
		ImageRectSize = var1.ImageRectSize,
		ImageRectOffset = var1.ImageRectOffset
	}
end