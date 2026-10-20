local CreateImageSetComponentModule = require(script.Parent.createImageSetComponent)
local GuiService = game:GetService("GuiService")
local CorePackages = script:FindFirstAncestor("CorePackages")
local ImagesModule = require(script.Parent.Parent.Parent.App.ImageSet.Images)
local Success, _ = pcall(GuiService.GetResolutionScale, GuiService)

local ImagesResolutionScale = ImagesModule.ImagesResolutionScale

return {
	Button = CreateImageSetComponentModule("ImageButton", ImagesResolutionScale),
	Label = CreateImageSetComponentModule("ImageLabel", ImagesResolutionScale)
}