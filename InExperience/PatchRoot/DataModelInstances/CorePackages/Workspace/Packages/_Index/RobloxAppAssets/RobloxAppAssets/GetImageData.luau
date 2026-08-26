local getImageSetDataModule = require(script.Parent.GetImageSetData)
local getImageSetPathPatternModule = require(script.Parent.GetImageSetPathPattern)
local images = require(script.Parent.Parent.FoundationImages).Images
local _ = require(script.Parent.types)

return function(p1, p2)
	-- upvalues: getImageSetDataModule (ref), images (ref), getImageSetPathPatternModule (ref)
	local var1 = getImageSetDataModule(p2 or images.ImagesResolutionScale)[p1]
	
	return if var1 == nil then nil else {
		Image = getImageSetPathPatternModule(var1.ImageSet),
		ImageRectSize = var1.ImageRectSize,
		ImageRectOffset = var1.ImageRectOffset
	}
end