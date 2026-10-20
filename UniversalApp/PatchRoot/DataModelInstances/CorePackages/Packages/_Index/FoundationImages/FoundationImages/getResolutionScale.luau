local GuiService = game:GetService("GuiService")
local Success, Result = pcall(GuiService.GetResolutionScale, GuiService)
local GetImageSetDataModule = require(script.Parent.Generated.GetImageSetData)

if not Success then
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