-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:02 2026 Pacific Standard Time.

local createImageSetComponentModule = require(script.Parent.createImageSetComponent)
local guiService = game:GetService("GuiService")
local corePackages = script:FindFirstAncestor("CorePackages")
local imagesModule = require(script.Parent.Parent.Parent.App.ImageSet.Images)
local ok, _ = pcall(guiService.GetResolutionScale, guiService)

if not ok or not corePackages then
	local _ = 1
end
local imagesResolutionScale = imagesModule.ImagesResolutionScale

return {
	Button = createImageSetComponentModule("ImageButton", imagesResolutionScale),
	Label = createImageSetComponentModule("ImageLabel", imagesResolutionScale)
}