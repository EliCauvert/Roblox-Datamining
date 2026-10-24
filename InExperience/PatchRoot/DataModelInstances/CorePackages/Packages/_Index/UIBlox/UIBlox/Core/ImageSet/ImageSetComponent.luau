local CreateImageSetComponentModule = require(script.Parent.createImageSetComponent)
local ImagesResolutionScale = require(script.Parent.Parent.Parent.App.ImageSet.Images).ImagesResolutionScale

return {
	Button = CreateImageSetComponentModule("ImageButton", ImagesResolutionScale),
	Label = CreateImageSetComponentModule("ImageLabel", ImagesResolutionScale)
}