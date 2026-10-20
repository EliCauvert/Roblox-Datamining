local GetImageSetDataModule = require(script.Parent.GetImageSetData)
local GetImageSetPathPatternModule = require(script.Parent.GetImageSetPathPattern)
local Images = require(script.Parent.Parent.FoundationImages).Images
local _ = require(script.Parent.types)

return function(p1, p2)
	-- upvalues: GetImageSetDataModule (copy), Images (copy), GetImageSetPathPatternModule (copy)
	local ImageSetDataModuleEntry = GetImageSetDataModule(p2 or Images.ImagesResolutionScale)[p1]
	
	return if ImageSetDataModuleEntry == nil then nil else {
		Image = GetImageSetPathPatternModule(ImageSetDataModuleEntry.ImageSet),
		ImageRectSize = ImageSetDataModuleEntry.ImageRectSize,
		ImageRectOffset = ImageSetDataModuleEntry.ImageRectOffset
	}
end