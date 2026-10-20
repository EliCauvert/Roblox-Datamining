local UIBlox = require(script:FindFirstAncestor("SocialLibraries").dependencies).UIBlox

return function(p1)
	-- upvalues: UIBlox (copy)
	local Image = UIBlox.App.ImageSet.Images[p1]
	
	return {
		Image = Image.Image,
		ImageRectSize = Image.ImageRectSize,
		ImageRectOffset = Image.ImageRectOffset
	}
end