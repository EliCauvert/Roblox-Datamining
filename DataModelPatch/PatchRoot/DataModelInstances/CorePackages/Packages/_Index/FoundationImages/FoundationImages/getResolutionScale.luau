local GuiService = game:GetService("GuiService")
local CorePackages = script:FindFirstAncestor("CorePackages")
local Success, Result = pcall(GuiService.GetResolutionScale, GuiService)
local Parent = script.Parent
local GetImageSetDataModule = require(Parent.Generated.GetImageSetData)
local FixBlurryImages = require(Parent.Flags).FixBlurryImages

if not Success or not FixBlurryImages and not CorePackages then
	Result = 1
end
if GuiService:IsTenFootInterface() then
	Result = 3
end
return function()
	-- upvalues: GetImageSetDataModule (copy), Result (ref)
	local _, ImageSetDataModule2 = GetImageSetDataModule(Result)
	
	return ImageSetDataModule2
end