local getImageSetDataModule = require(script.Parent.GetImageSetData)
local getImageSetPathPatternModule = require(script.Parent.GetImageSetPathPattern)
local images = require(script.Parent.Parent.FoundationImages).Images
local _ = require(script.Parent.types)

return function(p0, p1) --[[ line: 9 | named "GetImageData" ]]
	-- upvalues: getImageSetDataModule (ref), images (ref), getImageSetPathPatternModule (ref)
	local var2 = getImageSetDataModule(p1 or images.ImagesResolutionScale)[p0]
	
	return if var2 == nil then nil else {
		Image = getImageSetPathPatternModule(var2.ImageSet),
		ImageRectSize = var2.ImageRectSize,
		ImageRectOffset = var2.ImageRectOffset
	}
end